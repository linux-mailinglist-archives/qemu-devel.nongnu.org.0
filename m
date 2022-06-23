Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C951557F9B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:18:08 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PWx-0005pc-4M
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSr-0000oU-7z
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:55 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSl-0008EL-Ps
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:52 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F15232E1BB4;
 Thu, 23 Jun 2022 19:13:39 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 5rTa6TxC9I-DdKCVc1c; Thu, 23 Jun 2022 19:13:39 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656000819; bh=u9vGmNQEMAjRbVFMYaJ92cVMyyao56Oc6+YNA5ZQ0/g=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=JfWFDMVePYi+pDXJwxezLUKxnJbfvFAPxx+PyKmAznL8mDAKqXd4ACbVvu9CvEDlM
 Sn1t2kx6Cr1UCnbUnNh8xIzFrJsNAZQmcMkIkSV9AflJ5KP06T6lU0FdHYtg+ZxOyO
 tp37Vt9y6iHY3i/3IsLhTiMPQTzgZDXGOMsPijXI=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:14::1:1e])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nZkhqFOnB8-DdNi6t3S; Thu, 23 Jun 2022 19:13:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, vsementsov@yandex-team.ru, yc-core@yandex-team.ru,
 rvkagan@yandex-team.ru, armbru@redhat.com,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: [PATCH v2 2/2] vhost: setup error eventfd and dump errors
Date: Thu, 23 Jun 2022 19:13:25 +0300
Message-Id: <20220623161325.18813-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623161325.18813-1-vsementsov@yandex-team.ru>
References: <20220623161325.18813-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Vhost has error notifications, let's log them like other errors.
For each virt-queue setup eventfd for vring error notifications.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
[vsementsov: rename patch, change commit message  and dump error like
             other errors in the file]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/virtio/vhost.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6c41fa13e3..0827d631c0 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1278,6 +1278,19 @@ static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
     return 0;
 }
 
+static void vhost_virtqueue_error_notifier(EventNotifier *n)
+{
+    struct vhost_virtqueue *vq = container_of(n, struct vhost_virtqueue,
+                                              error_notifier);
+    struct vhost_dev *dev = vq->dev;
+    int index = vq - dev->vqs;
+
+    if (event_notifier_test_and_clear(n) && dev->vdev) {
+        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d",
+                        dev->vq_index + index);
+    }
+}
+
 static int vhost_virtqueue_init(struct vhost_dev *dev,
                                 struct vhost_virtqueue *vq, int n)
 {
@@ -1299,7 +1312,27 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
 
     vq->dev = dev;
 
+    if (dev->vhost_ops->vhost_set_vring_err) {
+        r = event_notifier_init(&vq->error_notifier, 0);
+        if (r < 0) {
+            goto fail_call;
+        }
+
+        file.fd = event_notifier_get_fd(&vq->error_notifier);
+        r = dev->vhost_ops->vhost_set_vring_err(dev, &file);
+        if (r) {
+            VHOST_OPS_DEBUG(r, "vhost_set_vring_err failed");
+            goto fail_err;
+        }
+
+        event_notifier_set_handler(&vq->error_notifier,
+                                   vhost_virtqueue_error_notifier);
+    }
+
     return 0;
+
+fail_err:
+    event_notifier_cleanup(&vq->error_notifier);
 fail_call:
     event_notifier_cleanup(&vq->masked_notifier);
     return r;
@@ -1308,6 +1341,10 @@ fail_call:
 static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
 {
     event_notifier_cleanup(&vq->masked_notifier);
+    if (vq->dev->vhost_ops->vhost_set_vring_err) {
+        event_notifier_set_handler(&vq->error_notifier, NULL);
+        event_notifier_cleanup(&vq->error_notifier);
+    }
 }
 
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b291fe4e24..1e7cbd9a10 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -29,6 +29,7 @@ struct vhost_virtqueue {
     unsigned long long used_phys;
     unsigned used_size;
     EventNotifier masked_notifier;
+    EventNotifier error_notifier;
     struct vhost_dev *dev;
 };
 
-- 
2.25.1


