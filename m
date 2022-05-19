Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154452D5FC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:26:57 +0200 (CEST)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrh79-0002oi-TE
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh54-0001v4-Na
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:24:47 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:40312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh50-0005KB-Mu
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:24:45 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8AB2D2E123A
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 17:19:34 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Chup0S4Psw-JYL0GGnx; Thu, 19 May 2022 17:19:34 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1652969974; bh=OZJNUn1KKu7BGnd0vMDwGUA5jmFc+txcuG/TFI8hqXU=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=J1w4jh1SBhfVT8F/JZDeSp+ztLDT/vDMyTpKX9Lvg4t6VGnCuasna90NVFWSWqAbb
 KdjBGhOY7LiD9s5Zqg4lur9jD+XeqEaWq4su7fmL2YsHFjjD+gcGlrTcwlOB1mkZuJ
 uRGkm6EwIFFy9WUNR49iQrwGKHO0nrOnc3stuZxQ=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (unknown [2a02:6b8:b081:8819::1:2b])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 v8cUliYWpf-JYMSYQnX; Thu, 19 May 2022 17:19:34 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 4/4] vhost: forward vring errors into virtio device
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
Date: Thu, 19 May 2022 17:19:34 +0300
Message-ID: <165296997400.196133.5955682334584698742.stgit@buzz>
In-Reply-To: <165296995578.196133.16183155555450040914.stgit@buzz>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

Setup eventfd for vring error notifications.
Add eventfd for each virt-queue to detect which queue faced error.

For example vhost-net in kernel silently stop working at first error.
Now we'll see message and qmp event if guest driver did something wrong.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/vhost.c         |   37 +++++++++++++++++++++++++++++++++++++
 include/hw/virtio/vhost.h |    1 +
 2 files changed, 38 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index dd3263df56..5015e1fd81 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1274,6 +1274,19 @@ static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
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
+        virtio_error(dev->vdev, "vhost vring error in virtqueue %d",
+                     dev->vq_index + index);
+    }
+}
+
 static int vhost_virtqueue_init(struct vhost_dev *dev,
                                 struct vhost_virtqueue *vq, int n)
 {
@@ -1295,7 +1308,27 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
 
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
@@ -1304,6 +1337,10 @@ fail_call:
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
 


