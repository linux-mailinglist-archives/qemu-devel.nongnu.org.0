Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03D4EEC1D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:15:06 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFFA-00038p-Vk
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:15:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFCl-0001th-KO
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:12:35 -0400
Received: from smtpbg123.qq.com ([175.27.65.52]:52650 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFCj-0000hR-08
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:12:35 -0400
X-QQ-mid: bizesmtp66t1648811189trhoxor6
Received: from localhost.localdomain.localdoma ( [116.228.45.98])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 01 Apr 2022 19:06:28 +0800 (CST)
X-QQ-SSF: 01000000002000803000C00A0000000
X-QQ-FEAT: PdU/eI8FBMCoG2KWKMNq1DAve3+NzB7za+6QfTMVl6MPBQ7RK2TIZxsjX61TH
 kKIeDXoPn93ItCOnqZkXU0PUKtJPlu0wHL5JyuacElYfLR50/vgGm/zUTWatGuQLqtXp4fm
 LLZR3urV3oevQOd6WUH5P4zNCSudZ363N3kcsBJsDBU4Os85yQGkjwH/W7yyrGXo+dbADuE
 PEShZRaCWaRPho3eG/rNTVKMKRHwMYK9FNDo1Ixv8eywxdXdttBqoKqEq6JXuOPWwzGZPpA
 PnAnpBYoz0q72UqaNQa91y2PWgzhYcOA58ST5K1JQS6FtjVX2OOkApZVhN99XuDi6mXJY1t
 j9CQKtHFsvvqzgZRB9eUpQ4dRMolQ==
X-QQ-GoodBg: 0
From: Michael Qiu <qiudayu@archeros.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	si-wei.liu@oracle.com
Subject: [PATCH 2/3] vhost: add vhost_dev_reset()
Date: Fri,  1 Apr 2022 07:06:12 -0400
Message-Id: <1648811173-15293-3-git-send-email-qiudayu@archeros.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam8
Received-SPF: none client-ip=175.27.65.52; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Qiu <qiudayu@archeros.com>, eperezma@redhat.com,
 lingshan.zhu@intel.com, qemu-devel@nongnu.org, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all vhost-user backends support ops->vhost_reset_device(). Instead
of adding backend check and call backend ops directly, it's better to
implement a function in vhost framework, so that it could hide vhost_ops
details.

SIgned-off-by: Michael Qiu <qiudayu@archeros.com>
---
 hw/virtio/vhost.c         | 14 ++++++++++++++
 include/hw/virtio/vhost.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b643f42..26667ae 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1854,3 +1854,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
     return -ENOSYS;
 }
+
+int vhost_dev_reset(struct vhost_dev *hdev)
+{
+    int ret = 0;
+
+    /* should only be called after backend is connected */
+    assert(hdev->vhost_ops);
+
+    if (hdev->vhost_ops->vhost_reset_device) {
+        ret = hdev->vhost_ops->vhost_reset_device(hdev);
+    }
+
+    return ret;
+}
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7..b8b7c20 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+int vhost_dev_reset(struct vhost_dev *hdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
-- 
1.8.3.1



