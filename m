Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368323CD86
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 19:37:04 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3NLb-0008Cr-F5
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 13:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3NK8-0006Qk-6R
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 13:35:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41744
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3NK6-0001Sb-Fg
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 13:35:31 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-B98oybcePsek3ifEjpF33A-1; Wed, 05 Aug 2020 13:35:25 -0400
X-MC-Unique: B98oybcePsek3ifEjpF33A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6B1B184C605;
 Wed,  5 Aug 2020 17:35:24 +0000 (UTC)
Received: from bahia.lan (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A876F7B910;
 Wed,  5 Aug 2020 17:35:23 +0000 (UTC)
Subject: [PATCH for-5.2 1/5] spapr/xive: Fix xive->fd if kvm_create_device()
 fails
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 05 Aug 2020 19:35:22 +0200
Message-ID: <159664892278.638781.2910775856690967369.stgit@bahia.lan>
In-Reply-To: <159664891296.638781.18417631893299150932.stgit@bahia.lan>
References: <159664891296.638781.18417631893299150932.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.31.120; envelope-from=groug@kaod.org;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 12:04:33
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

If the creation of the KVM XIVE device fails for some reasons, the
negative errno ends up in xive->fd, but the rest of the code assumes
that xive->fd either contains an open fd, ie. positive value, or -1.

This doesn't cause any misbehavior except kvmppc_xive_disconnect()
that will try to close(xive->fd) during rollback and likely be
rewarded with an EBADF.

Only set xive->fd with a open fd.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/spapr_xive_kvm.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index edb7ee0e74f1..d55ea4670e0e 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -745,6 +745,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc,=
 uint32_t nr_servers,
     size_t esb_len =3D (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
     size_t tima_len =3D 4ull << TM_SHIFT;
     CPUState *cs;
+    int fd;
=20
     /*
      * The KVM XIVE device already in use. This is the case when
@@ -760,11 +761,12 @@ int kvmppc_xive_connect(SpaprInterruptController *int=
c, uint32_t nr_servers,
     }
=20
     /* First, create the KVM XIVE device */
-    xive->fd =3D kvm_create_device(kvm_state, KVM_DEV_TYPE_XIVE, false);
-    if (xive->fd < 0) {
-        error_setg_errno(errp, -xive->fd, "XIVE: error creating KVM device=
");
+    fd =3D kvm_create_device(kvm_state, KVM_DEV_TYPE_XIVE, false);
+    if (fd < 0) {
+        error_setg_errno(errp, -fd, "XIVE: error creating KVM device");
         return -1;
     }
+    xive->fd =3D fd;
=20
     /* Tell KVM about the # of VCPUs we may have */
     if (kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_CTRL,



