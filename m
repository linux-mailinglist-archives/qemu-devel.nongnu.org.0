Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7B400D20
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:40:04 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdON-0004PL-47
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKp-0004GF-Ca
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKn-0000uC-Gy
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hCHwqKgJMHDZmaFu4SqI/1mhtVjkcBxwofkmJYkzfzI=;
 b=dJJvUsd4Sdl/PBsnw1OHHlMpXG0bHr0bD5J05MdkFZ7xhmaVdFtL6Teo/0k/c7gomivNFJ
 Jm76n+egUEUzXtN+Dhk69IqkPLns0HNQsF9cuwgmvymIlSMBt06fP52RMUYO5OfSV/k5MT
 CwkbPlvatRXKqzFf9npBqY4FBYkpDUI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-pfY5MHZtMoGjEVrg8VWOrQ-1; Sat, 04 Sep 2021 17:36:19 -0400
X-MC-Unique: pfY5MHZtMoGjEVrg8VWOrQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 g4-20020a056402180400b003c2e8da869bso1497039edy.13
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hCHwqKgJMHDZmaFu4SqI/1mhtVjkcBxwofkmJYkzfzI=;
 b=EOOISqBnVV3OO7XaTFvTiww7g9ugR5NWC3Cb/N8blHuTwGe8jNtfgXstxKY7z4i+9g
 l4SQ69zUCWrLEocoZlC91TKiMDH6E0L+ERmaB060ZKINUzZGLGH1QJRXwJjGQk47HnJ7
 iDcIy3cp1qBm4t74P4jSUpQ3hoPfj09OQDCNomHu5GilRv8sYRUpxy36M6iYt5gweroZ
 wa7ZVyoXthHoXke+v4L4MYrjDqq8NrYeE/BjbvKMQxgivP8V+6HQXFoePt/QuAMfmRjf
 D/ktMufeyRvEKSnBExHVFi6KB8moCFAHIImWSDrdPW/KCssKuTH3lQWH2HqVFTWffoa1
 tUBQ==
X-Gm-Message-State: AOAM530AqD9bZhuJcdYdDbaEVfHVMdpYnI6wzlrWAnjFIaBAYS3IL95i
 V8hLps3r9tkgrsAwXjc9GVykwBSivx3p1e8dOPDYATcZStXXklHEVQVRuPGAI2uSpHY2PEQZJpL
 AO5xXMXOhFUdatjy+VKFWoDljkXJ9lG850KTBR72mfjvAP5l3Q/oXi3XleD/J
X-Received: by 2002:a05:6402:283:: with SMTP id
 l3mr5785938edv.399.1630791377997; 
 Sat, 04 Sep 2021 14:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXdwNbyvJelmThR11+A0qztkKm57qJDrrQuMMU2Wq3j/Oq0QaNfkIV9uV78p4M3zN5smlSXg==
X-Received: by 2002:a05:6402:283:: with SMTP id
 l3mr5785927edv.399.1630791377832; 
 Sat, 04 Sep 2021 14:36:17 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id di15sm1896963edb.20.2021.09.04.14.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:17 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/35] hw/virtio: move vhost_set_backend_type() to vhost.c
Message-ID: <20210904213506.486886-8-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>

Just a small refactor patch.

vhost_set_backend_type() gets called only in vhost.c, so we can move the
function there and make it static. We can then extern the visibility of
kernel_ops, to match the other VhostOps in vhost-backend.h.
The VhostOps constants now make more sense in vhost.h

Suggested-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
Message-Id: <20210809134015.67941-1-tiberiu.georgescu@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  6 ------
 include/hw/virtio/vhost.h         |  4 ++++
 hw/virtio/vhost-backend.c         | 30 +-----------------------------
 hw/virtio/vhost.c                 | 29 +++++++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8475c5a29d..81bf3109f8 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -173,12 +173,6 @@ typedef struct VhostOps {
     vhost_force_iommu_op vhost_force_iommu;
 } VhostOps;
 
-extern const VhostOps user_ops;
-extern const VhostOps vdpa_ops;
-
-int vhost_set_backend_type(struct vhost_dev *dev,
-                           VhostBackendType backend_type);
-
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
                                              uint64_t iova, uint64_t uaddr,
                                              uint64_t len,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 045d0fd9f2..5ee306568b 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -95,6 +95,10 @@ struct vhost_dev {
     const VhostDevConfigOps *config_ops;
 };
 
+extern const VhostOps kernel_ops;
+extern const VhostOps user_ops;
+extern const VhostOps vdpa_ops;
+
 struct vhost_net {
     struct vhost_dev dev;
     struct vhost_virtqueue vqs[2];
diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 594d770b75..b65f8f7e97 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -293,7 +293,7 @@ static void vhost_kernel_set_iotlb_callback(struct vhost_dev *dev,
         qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL);
 }
 
-static const VhostOps kernel_ops = {
+const VhostOps kernel_ops = {
         .backend_type = VHOST_BACKEND_TYPE_KERNEL,
         .vhost_backend_init = vhost_kernel_init,
         .vhost_backend_cleanup = vhost_kernel_cleanup,
@@ -328,34 +328,6 @@ static const VhostOps kernel_ops = {
 };
 #endif
 
-int vhost_set_backend_type(struct vhost_dev *dev, VhostBackendType backend_type)
-{
-    int r = 0;
-
-    switch (backend_type) {
-#ifdef CONFIG_VHOST_KERNEL
-    case VHOST_BACKEND_TYPE_KERNEL:
-        dev->vhost_ops = &kernel_ops;
-        break;
-#endif
-#ifdef CONFIG_VHOST_USER
-    case VHOST_BACKEND_TYPE_USER:
-        dev->vhost_ops = &user_ops;
-        break;
-#endif
-#ifdef CONFIG_VHOST_VDPA
-    case VHOST_BACKEND_TYPE_VDPA:
-        dev->vhost_ops = &vdpa_ops;
-        break;
-#endif
-    default:
-        error_report("Unknown vhost backend type");
-        r = -1;
-    }
-
-    return r;
-}
-
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
                                              uint64_t iova, uint64_t uaddr,
                                              uint64_t len,
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 3c0b537f89..e21e144510 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -174,6 +174,35 @@ static uint64_t vhost_get_log_size(struct vhost_dev *dev)
     return log_size;
 }
 
+static int vhost_set_backend_type(struct vhost_dev *dev,
+                                  VhostBackendType backend_type)
+{
+    int r = 0;
+
+    switch (backend_type) {
+#ifdef CONFIG_VHOST_KERNEL
+    case VHOST_BACKEND_TYPE_KERNEL:
+        dev->vhost_ops = &kernel_ops;
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER
+    case VHOST_BACKEND_TYPE_USER:
+        dev->vhost_ops = &user_ops;
+        break;
+#endif
+#ifdef CONFIG_VHOST_VDPA
+    case VHOST_BACKEND_TYPE_VDPA:
+        dev->vhost_ops = &vdpa_ops;
+        break;
+#endif
+    default:
+        error_report("Unknown vhost backend type");
+        r = -1;
+    }
+
+    return r;
+}
+
 static struct vhost_log *vhost_log_alloc(uint64_t size, bool share)
 {
     Error *err = NULL;
-- 
MST


