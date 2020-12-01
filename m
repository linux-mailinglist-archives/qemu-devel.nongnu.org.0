Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780432CA190
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:40:40 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk41P-000182-II
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yX-0007AO-1M
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:41 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yU-0000mo-24
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:40 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-UqDkPzuDNwqKyT-_csGFhQ-1; Tue, 01 Dec 2020 06:37:33 -0500
X-MC-Unique: UqDkPzuDNwqKyT-_csGFhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E581107B457;
 Tue,  1 Dec 2020 11:37:32 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B17660BE5;
 Tue,  1 Dec 2020 11:37:31 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 1/4] spapr: Fix pre-2.10 dummy ICP hack
Date: Tue,  1 Dec 2020 12:37:25 +0100
Message-Id: <20201201113728.885700-2-groug@kaod.org>
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
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

This hack registers dummy VMState entries of ICPs in order to
support migration of old pseries machine types that used to
create all smp.max_cpus possible ICPs at machine init.

Part of the work is to unregister the dummy entries when plugging
an actual vCPU core, and to register them back when unplugging the
core. The code that unregisters the dummy ICPs in spapr_core_plug()
is misplaced: if ppc_set_compat() fails afterwards, the hotplug
operation will be cancelled and the dummy ICPs won't be registered
back since the unplug handler isn't called.

Unregister the dummy ICPs at the end of spapr_core_plug().

Signed-off-by: Greg Kurz <groug@kaod.org>
---

The next patch makes this patch a bit useless. I post it
anyway for the records because it is a programming error.
---
 hw/ppc/spapr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e8b236a8313b..57c6eecc56d6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3785,13 +3785,6 @@ static void spapr_core_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev,
=20
     core_slot->cpu =3D OBJECT(dev);
=20
-    if (smc->pre_2_10_has_unused_icps) {
-        for (i =3D 0; i < cc->nr_threads; i++) {
-            cs =3D CPU(core->threads[i]);
-            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
-        }
-    }
-
     /*
      * Set compatibility mode to match the boot CPU, which was either set
      * by the machine reset code or by CAS.
@@ -3805,6 +3798,13 @@ static void spapr_core_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev,
             }
         }
     }
+
+    if (smc->pre_2_10_has_unused_icps) {
+        for (i =3D 0; i < cc->nr_threads; i++) {
+            cs =3D CPU(core->threads[i]);
+            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
+        }
+    }
 }
=20
 static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev,
--=20
2.26.2


