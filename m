Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB82CA191
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:41:46 +0100 (CET)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk42T-0002Md-QE
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yY-0007BE-MS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:42 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yW-0000o6-Q6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:41 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-US-GbGezNwCoydBl52mYQQ-1; Tue, 01 Dec 2020 06:37:37 -0500
X-MC-Unique: US-GbGezNwCoydBl52mYQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C1A91005E45;
 Tue,  1 Dec 2020 11:37:36 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A35B60BE5;
 Tue,  1 Dec 2020 11:37:32 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 2/4] spapr: Abort if ppc_set_compat() fails for
 hot-plugged CPUs
Date: Tue,  1 Dec 2020 12:37:26 +0100
Message-Id: <20201201113728.885700-3-groug@kaod.org>
In-Reply-To: <20201201113728.885700-1-groug@kaod.org>
References: <20201201113728.885700-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a CPU is hot-plugged, we set its compat mode to match the boot
CPU, which was either set by machine reset or by CAS. This is currently
handled in the plug handler after the core got realized. Potential errors
of ppc_set_compat() are propagated to the hot-plug logic.

Handling errors this late in the hot-plug sequence is generally frown
upon. Ideally, we should do sanity checks in a pre-plug handler and pass
&error_abort to ppc_set_compat() in the plug handler.

We can filter out some error cases of ppc_set_compat() by calling
ppc_check_compat() at pre-plug. But ppc_set_compat() also sets the
compat register in KVM, and KVM doesn't provide any API that would
allow to check valid compat mode settings beforehand.

However, at this point we know that the compat mode was already
successfully set for the boot CPU. Since this all boils down to
setting a register with the very same value that was valid
for the boot CPU, it should definitely not fail for hot-plugged
CPUS.

Pass &error_abort to ppc_set_compat().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 57c6eecc56d6..3a32918dd9a9 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3787,15 +3787,13 @@ static void spapr_core_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev,
=20
     /*
      * Set compatibility mode to match the boot CPU, which was either set
-     * by the machine reset code or by CAS.
+     * by the machine reset code or by CAS. This really shouldn't fail at
+     * this point.
      */
     if (hotplugged) {
         for (i =3D 0; i < cc->nr_threads; i++) {
-            if (ppc_set_compat(core->threads[i],
-                               POWERPC_CPU(first_cpu)->compat_pvr,
-                               errp) < 0) {
-                return;
-            }
+            ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->compa=
t_pvr,
+                           &error_abort);
         }
     }
=20
--=20
2.26.2


