Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B345E23DD00
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 18:59:14 +0200 (CEST)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3jEX-0005WB-P9
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 12:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3jBo-0000ZF-5H
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 12:56:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27538
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3jBm-00076L-Ra
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 12:56:23 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-ii3XWdILPlqHNTkYoBk2ww-1; Thu, 06 Aug 2020 12:56:16 -0400
X-MC-Unique: ii3XWdILPlqHNTkYoBk2ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5071DE0;
 Thu,  6 Aug 2020 16:56:14 +0000 (UTC)
Received: from bahia.lan (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD83F5DA60;
 Thu,  6 Aug 2020 16:56:13 +0000 (UTC)
Subject: [PATCH v2 for-5.2 2/5] spapr/xive: Simplify kvmppc_xive_disconnect()
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 06 Aug 2020 18:56:13 +0200
Message-ID: <159673297296.766512.14780055521619233656.stgit@bahia.lan>
In-Reply-To: <159673295739.766512.2950380687630225803.stgit@bahia.lan>
References: <159673295739.766512.2950380687630225803.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.31.81; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 05:03:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this function begins with:

    /* The KVM XIVE device is not in use */
    if (!xive || xive->fd =3D=3D -1) {
        return;
    }

we obviously don't need to check xive->fd again.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: Already applied to ppc-for-5.2 but not yet visible on github
---
 hw/intc/spapr_xive_kvm.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index d55ea4670e0e..893a1ee77e70 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -873,10 +873,8 @@ void kvmppc_xive_disconnect(SpaprInterruptController *=
intc)
      * and removed from the list of devices of the VM. The VCPU
      * presenters are also detached from the device.
      */
-    if (xive->fd !=3D -1) {
-        close(xive->fd);
-        xive->fd =3D -1;
-    }
+    close(xive->fd);
+    xive->fd =3D -1;
=20
     kvm_kernel_irqchip =3D false;
     kvm_msi_via_irqfd_allowed =3D false;



