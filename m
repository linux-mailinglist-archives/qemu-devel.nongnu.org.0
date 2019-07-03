Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8F5D791
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 22:37:37 +0200 (CEST)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiPWy-0004aQ-I9
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 16:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42853)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hiOfh-0007B1-L3
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hiOfa-0004bF-3G
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:42:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hiOfW-000448-2S; Tue, 02 Jul 2019 15:42:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A0CB3086201;
 Tue,  2 Jul 2019 19:41:39 +0000 (UTC)
Received: from gimli.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 760945C28D;
 Tue,  2 Jul 2019 19:41:34 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: cohuck@redhat.com, farman@linux.ibm.com, alifm@linux.ibm.com
Date: Tue, 02 Jul 2019 13:41:34 -0600
Message-ID: <156209642116.14915.9598593247782519613.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 02 Jul 2019 19:41:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] vfio-ccw: Test vfio_set_irq_signaling() return
 value
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
Cc: eric.auger@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity doesn't like that most callers of vfio_set_irq_signaling() check
the return value and doesn't understand the equivalence of testing the
error pointer instead.  Test the return value consistently.

Reported-by: Coverity (CID 1402783)
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/ccw.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 6d0296fe4d9c..16f200e6fe6a 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -327,9 +327,8 @@ static void vfio_ccw_unregister_io_notifier(VFIOCCWDevice *vcdev)
 {
     Error *err = NULL;
 
-    vfio_set_irq_signaling(&vcdev->vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
-                           VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err);
-    if (err) {
+    if (vfio_set_irq_signaling(&vcdev->vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
+                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
     }
 


