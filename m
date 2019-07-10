Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104163619
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 14:43:34 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkpT3-0003K6-Bk
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 08:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60433)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hkpLi-0004FG-58
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:36:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hkpLg-0006qH-IT
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:35:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43779)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hkpLe-0006Xn-DJ; Tue, 09 Jul 2019 08:35:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E982830C1CD6;
 Tue,  9 Jul 2019 12:25:57 +0000 (UTC)
Received: from localhost (unknown [10.40.205.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A183492D3B;
 Tue,  9 Jul 2019 12:25:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  9 Jul 2019 14:25:43 +0200
Message-Id: <20190709122546.12373-2-cohuck@redhat.com>
In-Reply-To: <20190709122546.12373-1-cohuck@redhat.com>
References: <20190709122546.12373-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 09 Jul 2019 12:25:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 1/4] vfio-ccw: Test
 vfio_set_irq_signaling() return value
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Williamson <alex.williamson@redhat.com>

Coverity doesn't like that most callers of vfio_set_irq_signaling() check
the return value and doesn't understand the equivalence of testing the
error pointer instead.  Test the return value consistently.

Reported-by: Coverity (CID 1402783)
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
Message-Id: <156209642116.14915.9598593247782519613.stgit@gimli.home>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 6d0296fe4d9c..16f200e6fe6a 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -327,9 +327,8 @@ static void vfio_ccw_unregister_io_notifier(VFIOCCWDe=
vice *vcdev)
 {
     Error *err =3D NULL;
=20
-    vfio_set_irq_signaling(&vcdev->vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
-                           VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err);
-    if (err) {
+    if (vfio_set_irq_signaling(&vcdev->vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
+                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
     }
=20
--=20
2.20.1


