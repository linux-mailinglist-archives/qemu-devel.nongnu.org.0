Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA494E2167
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:32:16 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCWV-0008SR-Jy
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:32:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGo-0006N9-4P
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:16:02 -0400
Received: from [2607:f8b0:4864:20::1031] (port=56043
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGl-0002Ai-VU
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:16:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e3so12281921pjm.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5XoBrfZA1Rcl3K3X1CH+cHoI3+Q6vKC9RJjT3Jdups=;
 b=6uF57wG8yPTh7dC+XjRLSzcipcR23pCu0DlkYWt5cqgw17QuhIvjLko73Xhoyrkk82
 zotPVm7yMucZH7lT/8R8RLbmdyrfEgLM4duVHPkXg1zcRWx4meIvTugveLvCGZD9pRCB
 4HSF6MW8mHm3v374740YTy2mQKvYFi69L+rKv58NTqmLqJrRjuG7RF2WKCBvWiGCc4o4
 BKQxI69/zPfWTLwEwyAvy+1zYkWLOal6/Sy9C8du6PHQiFb6bO9ox5mbAXk69WTaf9JT
 qwyktaoYZvs1Sz7Mx1cRBpMynrixHDWynBUoxof7boYxQYE/DFlBdUmxoD8WrEfep27P
 c9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5XoBrfZA1Rcl3K3X1CH+cHoI3+Q6vKC9RJjT3Jdups=;
 b=lM22zkZ8uLLPZoZH58azlUD2XzUXNb59lDt9NE9m6xfobA6oTy0jJA+QFwDIQjTBKN
 yVrT/Q2Qjl/u6e8GZb0AEaFZF+Xh7j2HmJLJqv8N/PGxomfnkU5AIzJ9tmSIF1pteyEh
 VYjVZn4gBxgeyaTs7r7ZlfYe4t2uKt8m7Ot6o1sXYHeBus/9qfBgqEzYq6gTquGvYPfD
 I/t//iwGgsLetRXHCiMDTrHR/NDOJqu+Spdhs5kWNYHUWr1DXE/Cszzm59H7pHx9jE+J
 ve5DxgSG55H5NU/UDUU+upTych+kJCEFVtDW+lVl7yXGdXI5VgkhlPeXIW7rzlaYYzzV
 FxEg==
X-Gm-Message-State: AOAM532yNiS+5vJJ3awKRasuuaEIQ8VpFnx88kc7v0fWeVFTYLBp53Za
 j/U0hbrdLTTackwjD4ky0azK
X-Google-Smtp-Source: ABdhPJyYgGmfiwXUzJIHRvIQ6iK2yOz6TAjMZ2SzySKPALvKP8GRRhiDHzGEiR2UE3FCRkgDPuA5fw==
X-Received: by 2002:a17:90a:db50:b0:1c6:99dd:c40d with SMTP id
 u16-20020a17090adb5000b001c699ddc40dmr20262613pjx.143.1647846958600; 
 Mon, 21 Mar 2022 00:15:58 -0700 (PDT)
Received: from localhost ([139.177.225.230]) by smtp.gmail.com with ESMTPSA id
 g5-20020a056a001a0500b004def10341e5sm18473407pfv.22.2022.03.21.00.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 00:15:58 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com
Subject: [PATCH v3 6/6] libvduse: Add support for reconnecting
Date: Mon, 21 Mar 2022 15:14:39 +0800
Message-Id: <20220321071439.151-7-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321071439.151-1-xieyongji@bytedance.com>
References: <20220321071439.151-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To support reconnecting after restart or crash, VDUSE backend
might need to resubmit inflight I/Os. This stores the metadata
such as the index of inflight I/O's descriptors to a shm file so
that VDUSE backend can restore them during reconnecting.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c        |  14 ++
 subprojects/libvduse/libvduse.c | 235 +++++++++++++++++++++++++++++++-
 subprojects/libvduse/libvduse.h |  12 ++
 3 files changed, 256 insertions(+), 5 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index e027b2e5ff..b24b5aeda9 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -38,6 +38,7 @@ typedef struct VduseBlkExport {
     uint16_t num_queues;
     uint32_t blk_size;
     bool writable;
+    char *recon_file;
 } VduseBlkExport;
 
 struct virtio_blk_inhdr {
@@ -233,6 +234,8 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
 
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
                        true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+    /* Make sure we don't miss any kick afer reconnecting */
+    eventfd_write(vduse_queue_get_fd(vq), 1);
 }
 
 static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
@@ -404,6 +407,15 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         return -ENOMEM;
     }
 
+    vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
+                                           g_get_tmp_dir(), exp->id);
+    if (vduse_set_reconnect_log_file(vblk_exp->dev, vblk_exp->recon_file)) {
+        error_setg(errp, "failed to set reconnect log file");
+        vduse_dev_destroy(vblk_exp->dev);
+        g_free(vblk_exp->recon_file);
+        return -EINVAL;
+    }
+
     for (i = 0; i < num_queues; i++) {
         vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
     }
@@ -427,6 +439,8 @@ static void vduse_blk_exp_delete(BlockExport *exp)
                                     vblk_exp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
+    unlink(vblk_exp->recon_file);
+    g_free(vblk_exp->recon_file);
 }
 
 static void vduse_blk_exp_request_shutdown(BlockExport *exp)
diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index ecee9c0568..b27145ceed 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -41,6 +41,8 @@
 #define VDUSE_VQ_ALIGN 4096
 #define MAX_IOVA_REGIONS 256
 
+#define LOG_ALIGNMENT 64
+
 /* Round number down to multiple */
 #define ALIGN_DOWN(n, m) ((n) / (m) * (m))
 
@@ -51,6 +53,31 @@
 #define unlikely(x)   __builtin_expect(!!(x), 0)
 #endif
 
+typedef struct VduseDescStateSplit {
+    uint8_t inflight;
+    uint8_t padding[5];
+    uint16_t next;
+    uint64_t counter;
+} VduseDescStateSplit;
+
+typedef struct VduseVirtqLogInflight {
+    uint64_t features;
+    uint16_t version;
+    uint16_t desc_num;
+    uint16_t last_batch_head;
+    uint16_t used_idx;
+    VduseDescStateSplit desc[];
+} VduseVirtqLogInflight;
+
+typedef struct VduseVirtqLog {
+    VduseVirtqLogInflight inflight;
+} VduseVirtqLog;
+
+typedef struct VduseVirtqInflightDesc {
+    uint16_t index;
+    uint64_t counter;
+} VduseVirtqInflightDesc;
+
 typedef struct VduseRing {
     unsigned int num;
     uint64_t desc_addr;
@@ -73,6 +100,10 @@ struct VduseVirtq {
     bool ready;
     int fd;
     VduseDev *dev;
+    VduseVirtqInflightDesc *resubmit_list;
+    uint16_t resubmit_num;
+    uint64_t counter;
+    VduseVirtqLog *log;
 };
 
 typedef struct VduseIovaRegion {
@@ -96,8 +127,36 @@ struct VduseDev {
     int fd;
     int ctrl_fd;
     void *priv;
+    void *log;
 };
 
+static inline size_t vduse_vq_log_size(uint16_t queue_size)
+{
+    return ALIGN_UP(sizeof(VduseDescStateSplit) * queue_size +
+                    sizeof(VduseVirtqLogInflight), LOG_ALIGNMENT);
+}
+
+static void *vduse_log_get(const char *filename, size_t size)
+{
+    void *ptr = MAP_FAILED;
+    int fd;
+
+    fd = open(filename, O_RDWR | O_CREAT, 0600);
+    if (fd == -1) {
+        return MAP_FAILED;
+    }
+
+    if (ftruncate(fd, size) == -1) {
+        goto out;
+    }
+
+    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+out:
+    close(fd);
+    return ptr;
+}
+
 static inline bool has_feature(uint64_t features, unsigned int fbit)
 {
     assert(fbit < 64);
@@ -148,6 +207,105 @@ static int vduse_inject_irq(VduseDev *dev, int index)
     return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
 }
 
+static int inflight_desc_compare(const void *a, const void *b)
+{
+    VduseVirtqInflightDesc *desc0 = (VduseVirtqInflightDesc *)a,
+                           *desc1 = (VduseVirtqInflightDesc *)b;
+
+    if (desc1->counter > desc0->counter &&
+        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
+        return 1;
+    }
+
+    return -1;
+}
+
+static int vduse_queue_check_inflights(VduseVirtq *vq)
+{
+    int i = 0;
+    VduseDev *dev = vq->dev;
+
+    vq->used_idx = le16toh(vq->vring.used->idx);
+    vq->resubmit_num = 0;
+    vq->resubmit_list = NULL;
+    vq->counter = 0;
+
+    if (unlikely(vq->log->inflight.used_idx != vq->used_idx)) {
+        if (vq->log->inflight.last_batch_head > VIRTQUEUE_MAX_SIZE) {
+            return -1;
+        }
+
+        vq->log->inflight.desc[vq->log->inflight.last_batch_head].inflight = 0;
+
+        barrier();
+
+        vq->log->inflight.used_idx = vq->used_idx;
+    }
+
+    for (i = 0; i < vq->log->inflight.desc_num; i++) {
+        if (vq->log->inflight.desc[i].inflight == 1) {
+            vq->inuse++;
+        }
+    }
+
+    vq->shadow_avail_idx = vq->last_avail_idx = vq->inuse + vq->used_idx;
+
+    if (vq->inuse) {
+        vq->resubmit_list = calloc(vq->inuse, sizeof(VduseVirtqInflightDesc));
+        if (!vq->resubmit_list) {
+            return -1;
+        }
+
+        for (i = 0; i < vq->log->inflight.desc_num; i++) {
+            if (vq->log->inflight.desc[i].inflight) {
+                vq->resubmit_list[vq->resubmit_num].index = i;
+                vq->resubmit_list[vq->resubmit_num].counter =
+                                        vq->log->inflight.desc[i].counter;
+                vq->resubmit_num++;
+            }
+        }
+
+        if (vq->resubmit_num > 1) {
+            qsort(vq->resubmit_list, vq->resubmit_num,
+                  sizeof(VduseVirtqInflightDesc), inflight_desc_compare);
+        }
+        vq->counter = vq->resubmit_list[0].counter + 1;
+    }
+
+    vduse_inject_irq(dev, vq->index);
+
+    return 0;
+}
+
+static int vduse_queue_inflight_get(VduseVirtq *vq, int desc_idx)
+{
+    vq->log->inflight.desc[desc_idx].counter = vq->counter++;
+
+    barrier();
+
+    vq->log->inflight.desc[desc_idx].inflight = 1;
+
+    return 0;
+}
+
+static int vduse_queue_inflight_pre_put(VduseVirtq *vq, int desc_idx)
+{
+    vq->log->inflight.last_batch_head = desc_idx;
+
+    return 0;
+}
+
+static int vduse_queue_inflight_post_put(VduseVirtq *vq, int desc_idx)
+{
+    vq->log->inflight.desc[desc_idx].inflight = 0;
+
+    barrier();
+
+    vq->log->inflight.used_idx = vq->used_idx;
+
+    return 0;
+}
+
 static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
                                      uint64_t last)
 {
@@ -596,11 +754,24 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
     unsigned int head;
     VduseVirtqElement *elem;
     VduseDev *dev = vq->dev;
+    int i;
 
     if (unlikely(!vq->vring.avail)) {
         return NULL;
     }
 
+    if (unlikely(vq->resubmit_list && vq->resubmit_num > 0)) {
+        i = (--vq->resubmit_num);
+        elem = vduse_queue_map_desc(vq, vq->resubmit_list[i].index, sz);
+
+        if (!vq->resubmit_num) {
+            free(vq->resubmit_list);
+            vq->resubmit_list = NULL;
+        }
+
+        return elem;
+    }
+
     if (vduse_queue_empty(vq)) {
         return NULL;
     }
@@ -628,6 +799,8 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
 
     vq->inuse++;
 
+    vduse_queue_inflight_get(vq, head);
+
     return elem;
 }
 
@@ -685,7 +858,9 @@ void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
                       unsigned int len)
 {
     vduse_queue_fill(vq, elem, len, 0);
+    vduse_queue_inflight_pre_put(vq, elem->index);
     vduse_queue_flush(vq, 1);
+    vduse_queue_inflight_post_put(vq, elem->index);
 }
 
 static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
@@ -758,12 +933,15 @@ static void vduse_queue_enable(VduseVirtq *vq)
     }
 
     vq->fd = fd;
-    vq->shadow_avail_idx = vq->last_avail_idx = vq_info.split.avail_index;
-    vq->inuse = 0;
-    vq->used_idx = 0;
     vq->signalled_used_valid = false;
     vq->ready = true;
 
+    if (vduse_queue_check_inflights(vq)) {
+        fprintf(stderr, "Failed to check inflights for vq[%d]\n", vq->index);
+        close(fd);
+        return;
+    }
+
     dev->ops->enable_queue(dev, vq);
 }
 
@@ -813,11 +991,15 @@ static void vduse_dev_start_dataplane(VduseDev *dev)
 
 static void vduse_dev_stop_dataplane(VduseDev *dev)
 {
+    size_t log_size = dev->num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
     int i;
 
     for (i = 0; i < dev->num_queues; i++) {
         vduse_queue_disable(&dev->vqs[i]);
     }
+    if (dev->log) {
+        memset(dev->log, 0, log_size);
+    }
     dev->features = 0;
     vduse_iova_remove_region(dev, 0, ULONG_MAX);
 }
@@ -926,6 +1108,30 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
         return -errno;
     }
 
+    vduse_queue_enable(vq);
+
+    return 0;
+}
+
+int vduse_set_reconnect_log_file(VduseDev *dev, const char *filename)
+{
+
+    size_t log_size = dev->num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
+    void *log;
+    int i;
+
+    dev->log = log = vduse_log_get(filename, log_size);
+    if (log == MAP_FAILED) {
+        fprintf(stderr, "Failed to get vduse log\n");
+        return -EINVAL;
+    }
+
+    for (i = 0; i < dev->num_queues; i++) {
+        dev->vqs[i].log = log;
+        dev->vqs[i].log->inflight.desc_num = VIRTQUEUE_MAX_SIZE;
+        log = (void *)((char *)log + vduse_vq_log_size(VIRTQUEUE_MAX_SIZE));
+    }
+
     return 0;
 }
 
@@ -970,6 +1176,12 @@ static int vduse_dev_init(VduseDev *dev, const char *name,
         return -errno;
     }
 
+    if (ioctl(fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
+        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
+        close(fd);
+        return -errno;
+    }
+
     dev_name = strdup(name);
     if (!dev_name) {
         close(fd);
@@ -1014,6 +1226,12 @@ VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
         return NULL;
     }
 
+    if (ioctl(fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
+        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
+        free(dev);
+        return NULL;
+    }
+
     ret = vduse_dev_init_vqs(dev, num_queues);
     if (ret) {
         fprintf(stderr, "Failed to init vqs\n");
@@ -1113,7 +1331,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
 
     ret = ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
     free(dev_config);
-    if (ret < 0) {
+    if (ret && errno != EEXIST) {
         fprintf(stderr, "Failed to create vduse device %s: %s\n",
                 name, strerror(errno));
         goto err_dev;
@@ -1140,8 +1358,15 @@ err_ctrl:
 
 int vduse_dev_destroy(VduseDev *dev)
 {
-    int ret = 0;
+    size_t log_size = dev->num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
+    int i, ret = 0;
 
+    if (dev->log) {
+        munmap(dev->log, log_size);
+    }
+    for (i = 0; i < dev->num_queues; i++) {
+        free(dev->vqs[i].resubmit_list);
+    }
     free(dev->vqs);
     if (dev->fd > 0) {
         close(dev->fd);
diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/libvduse.h
index 6c2fe98213..32f19e7b48 100644
--- a/subprojects/libvduse/libvduse.h
+++ b/subprojects/libvduse/libvduse.h
@@ -173,6 +173,18 @@ int vduse_dev_update_config(VduseDev *dev, uint32_t size,
  */
 int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size);
 
+/**
+ * vduse_set_reconnect_log_file:
+ * @dev: VDUSE device
+ * @file: filename of reconnect log
+ *
+ * Specify the file to store log for reconnecting. It should
+ * be called before vduse_dev_setup_queue().
+ *
+ * Returns: 0 on success, -errno on failure.
+ */
+int vduse_set_reconnect_log_file(VduseDev *dev, const char *filename);
+
 /**
  * vduse_dev_create_by_fd:
  * @fd: passed file descriptor
-- 
2.20.1


