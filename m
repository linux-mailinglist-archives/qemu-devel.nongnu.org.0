Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE21653172
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymi-0005Gm-24; Wed, 21 Dec 2022 08:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yme-00057j-8M
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymc-0004CO-Hn
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1SxlsbhtitE+H9xyqIHYc8i34qw6fINMqLcnKyHOV0=;
 b=LR0pvUeBUoqPg88TD4nBO2Q42UH7V9NY7AkBNK3fSJpS+Fkv+aVfxn72j8zoQy0TM33/Eh
 uabQEFYrEE2K52XMotEi0tXItUjg/ls1jjLFA1rwhn2bD6FwUgvwx2QTqsg3P4VjWW4lqw
 4vFiMQroz5GcVw4cjhdxIYYvCV00kJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-98iN4dGrNVSlKX-_QTtVPw-1; Wed, 21 Dec 2022 08:05:16 -0500
X-MC-Unique: 98iN4dGrNVSlKX-_QTtVPw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso665252wmd.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j1SxlsbhtitE+H9xyqIHYc8i34qw6fINMqLcnKyHOV0=;
 b=EGWHIxh+1C1p9DKFCzTJIz8jKxa6uVgvMmu1GGrWYEWG7TvrmwfYdAVER7Q/4x9cau
 fzdItgtZ0HoGHRBZq8p31t7yOyqCw9KB1qLHhqD6b4PRUHHqrLvbYNRHvp7IAT6rCA1r
 mTXMSLHen6pGHC0YLlrSZ6MhOWHDrQK+nNmdcaOvSY/6n/VcoAaSgQLiMu8AThh0XQsI
 Cg9rQ8/mkb3QQJ+Q8l04EvjeyMAZ0DNZf/5I5Lbr2bOazYecSi2Z5CEn90Pg0yGXQqG6
 qjFZPTokrskFpxRfsKdcK4NwJ9pGtr97fkJyMXZcp8LYx1bhKp+eXow7/GQjtsFviBQ6
 kqxg==
X-Gm-Message-State: AFqh2kpR+gitLB6GGj4X3arQa9PMRurdxY/0zXEZjk2ss2oLp8WbovVU
 49HjY9EZAUzUp+ztrbN8xmng5R3GP3gAmPuw1bwBfL4wwXpR5EsxiJDHbxTxKHbMs01/2t4jcgY
 Y88ts4nwJ82HYvvizSTNuyMVgZ7n7m+1kbd//BEeJjkytqsEm2zrTlUp6BP5N
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id
 m34-20020a05600c3b2200b003c6e63e814bmr1687744wms.2.1671627913521; 
 Wed, 21 Dec 2022 05:05:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvT/6hkOgaYvvK9MNMGGOfdqoNAAJ6zm/GUsb+Hmwp9DkSd0NVLxplBl35mCxvvXYbt3O3GiA==
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id
 m34-20020a05600c3b2200b003c6e63e814bmr1687722wms.2.1671627913168; 
 Wed, 21 Dec 2022 05:05:13 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b003c6c3fb3cf6sm2217795wmq.18.2022.12.21.05.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:12 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 14/41] vhost: allocate SVQ device file descriptors at device
 start
Message-ID: <20221221130339.1234592-15-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

The next patches will start control SVQ if possible. However, we don't
know if that will be possible at qemu boot anymore.

Delay device file descriptors until we know it at device start. This
will avoid to create them if the device does not support SVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-4-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 31 ++------------------------
 hw/virtio/vhost-vdpa.c             | 35 ++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 264ddc166d..3b05bab44d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -715,43 +715,18 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * @iova_tree: Tree to perform descriptors translations
  * @ops: SVQ owner callbacks
  * @ops_opaque: ops opaque pointer
- *
- * Returns the new virtqueue or NULL.
- *
- * In case of error, reason is reported through error_report.
  */
 VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
                                     const VhostShadowVirtqueueOps *ops,
                                     void *ops_opaque)
 {
-    g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
-    int r;
-
-    r = event_notifier_init(&svq->hdev_kick, 0);
-    if (r != 0) {
-        error_report("Couldn't create kick event notifier: %s (%d)",
-                     g_strerror(errno), errno);
-        goto err_init_hdev_kick;
-    }
-
-    r = event_notifier_init(&svq->hdev_call, 0);
-    if (r != 0) {
-        error_report("Couldn't create call event notifier: %s (%d)",
-                     g_strerror(errno), errno);
-        goto err_init_hdev_call;
-    }
+    VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     svq->iova_tree = iova_tree;
     svq->ops = ops;
     svq->ops_opaque = ops_opaque;
-    return g_steal_pointer(&svq);
-
-err_init_hdev_call:
-    event_notifier_cleanup(&svq->hdev_kick);
-
-err_init_hdev_kick:
-    return NULL;
+    return svq;
 }
 
 /**
@@ -763,7 +738,5 @@ void vhost_svq_free(gpointer pvq)
 {
     VhostShadowVirtqueue *vq = pvq;
     vhost_svq_stop(vq);
-    event_notifier_cleanup(&vq->hdev_kick);
-    event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 220a9a2e6e..65f896314b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -428,15 +428,11 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq;
+        VhostShadowVirtqueue *svq;
 
         svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
                             v->shadow_vq_ops_opaque);
-        if (unlikely(!svq)) {
-            error_setg(errp, "Cannot create svq %u", n);
-            return -1;
-        }
-        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
+        g_ptr_array_add(shadow_vqs, svq);
     }
 
     v->shadow_vqs = g_steal_pointer(&shadow_vqs);
@@ -864,11 +860,23 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
     const EventNotifier *event_notifier = &svq->hdev_kick;
     int r;
 
+    r = event_notifier_init(&svq->hdev_kick, 0);
+    if (r != 0) {
+        error_setg_errno(errp, -r, "Couldn't create kick event notifier");
+        goto err_init_hdev_kick;
+    }
+
+    r = event_notifier_init(&svq->hdev_call, 0);
+    if (r != 0) {
+        error_setg_errno(errp, -r, "Couldn't create call event notifier");
+        goto err_init_hdev_call;
+    }
+
     file.fd = event_notifier_get_fd(event_notifier);
     r = vhost_vdpa_set_vring_dev_kick(dev, &file);
     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Can't set device kick fd");
-        return r;
+        goto err_init_set_dev_fd;
     }
 
     event_notifier = &svq->hdev_call;
@@ -876,8 +884,18 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
     r = vhost_vdpa_set_vring_dev_call(dev, &file);
     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Can't set device call fd");
+        goto err_init_set_dev_fd;
     }
 
+    return 0;
+
+err_init_set_dev_fd:
+    event_notifier_set_handler(&svq->hdev_call, NULL);
+
+err_init_hdev_call:
+    event_notifier_cleanup(&svq->hdev_kick);
+
+err_init_hdev_kick:
     return r;
 }
 
@@ -1089,6 +1107,9 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
         vhost_vdpa_svq_unmap_rings(dev, svq);
+
+        event_notifier_cleanup(&svq->hdev_kick);
+        event_notifier_cleanup(&svq->hdev_call);
     }
 }
 
-- 
MST


