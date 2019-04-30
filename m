Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59378F2CA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 11:28:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLP3z-0002mJ-Hl
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 05:28:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hLP2V-0002AH-2a
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hLP2U-0003OV-1i
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:27:03 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2062 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wangjie88@huawei.com>)
	id 1hLP2T-0003MU-Ns
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:27:02 -0400
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id 79E759F0EBA8A7623BB4;
	Tue, 30 Apr 2019 17:26:57 +0800 (CST)
Received: from localhost.localdomain (10.175.104.211) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 30 Apr 2019 17:26:48 +0800
From: Jie Wang <wangjie88@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 30 Apr 2019 15:15:00 +0800
Message-ID: <1556608500-12183-1-git-send-email-wangjie88@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.211]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.189
Subject: [Qemu-devel] [PATCH] vhost: fix memory leak in
 vhost_user_scsi_realize
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wangjie88@huawei.com, wu.wubin@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fix memory leak in vhost_user_scsi_realize

Signed-off-by: Jie Wang <wangjie88@huawei.com>
---
 hw/scsi/vhost-user-scsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 8b1e6876db..a9fd8ea305 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -69,6 +69,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(dev);
     VHostUserSCSI *s = VHOST_USER_SCSI(dev);
     VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
+    struct vhost_virtqueue *vqs = NULL;
     Error *err = NULL;
     int ret;
 
@@ -93,6 +94,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.vqs = g_new(struct vhost_virtqueue, vsc->dev.nvqs);
     vsc->dev.vq_index = 0;
     vsc->dev.backend_features = 0;
+    vqs = vsc->dev.vqs;
 
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0);
@@ -100,6 +102,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "vhost-user-scsi: vhost initialization failed: %s",
                    strerror(-ret));
         vhost_user_cleanup(&s->vhost_user);
+        g_free(vqs);
         return;
     }
 
-- 
2.16.2.windows.1


