Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30EEBB49
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 00:55:00 +0100 (CET)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQKHL-0006h4-30
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 19:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iQKER-0004PK-4V
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 19:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iQKEQ-0004Gr-0j
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 19:51:59 -0400
Received: from [192.146.154.1] (port=26870 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iQKEP-0004FM-RH
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 19:51:57 -0400
Received: from localhost.corp.nutanix.com (unknown [10.40.36.164])
 by mcp01.nutanix.com (Postfix) with ESMTP id 5AB1E1009437;
 Thu, 31 Oct 2019 23:51:57 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] vhost-user-scsi: reset the device if supported
Date: Tue, 29 Oct 2019 17:38:03 -0400
Message-Id: <1572385083-5254-3-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1572385083-5254-1-git-send-email-raphael.norwitz@nutanix.com>
References: <1572385083-5254-1-git-send-email-raphael.norwitz@nutanix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.146.154.1
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Vrabel <david.vrabel@nutanix.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the vhost-user-scsi backend supports the VHOST_USER_F_RESET_DEVICE
protocol feature, then the device can be reset when requested.

If this feature is not supported, do not try a reset as this will send
a VHOST_USER_RESET_OWNER that the backend is not expecting,
potentially putting into an inoperable state.

Signed-off-by: David Vrabel <david.vrabel@nutanix.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/scsi/vhost-user-scsi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 6a6c15d..23f972d 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -39,6 +39,10 @@ static const int user_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+};
+
 static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserSCSI *s = (VHostUserSCSI *)vdev;
@@ -62,6 +66,25 @@ static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
     }
 }
 
+static void vhost_user_scsi_reset(VirtIODevice *vdev)
+{
+    VHostSCSICommon *vsc = VHOST_SCSI_COMMON(vdev);
+    struct vhost_dev *dev = &vsc->dev;
+
+    /*
+     * Historically, reset was not implemented so only reset devices
+     * that are expecting it.
+     */
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
+        return;
+    }
+
+    if (dev->vhost_ops->vhost_reset_device) {
+        dev->vhost_ops->vhost_reset_device(dev);
+    }
+}
+
 static void vhost_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
 }
@@ -182,6 +205,7 @@ static void vhost_user_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_user_scsi_set_status;
+    vdc->reset = vhost_user_scsi_reset;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
-- 
1.8.3.1


