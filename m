Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9054548F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:02:00 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNPr-0003b7-PT
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLro-0007so-Qx
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003gd-Of
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CeaDfYrFqx+It4fXbX5GS/IN84tNpZQFMgryQabGV0=;
 b=HAZyDvEwKj8nzYn/sii94tjy6f04NPQ8k0Ernu5BwghkIPV+G1X3I9uilw4f98c/A/SeXc
 J2Ub2jmuyXNDEnXnU0XXpXai2u+c7I5Ee6kIZ0Q0rtqEZsxf+HgPDDCeeKutQd3MLutX8E
 6+MqANweNy8aP4tObW7sHfA9djHIAXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-f63c-ntFM-2HQOeHJ5RAEQ-1; Thu, 09 Jun 2022 13:22:24 -0400
X-MC-Unique: f63c-ntFM-2HQOeHJ5RAEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE5A85A580;
 Thu,  9 Jun 2022 17:22:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E812404E4BD;
 Thu,  9 Jun 2022 17:22:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 13/18] libvduse: Add support for reconnecting
Date: Thu,  9 Jun 2022 19:21:44 +0200
Message-Id: <20220609172149.293877-14-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

To support reconnecting after restart or crash, VDUSE backend
might need to resubmit inflight I/Os. This stores the metadata
such as the index of inflight I/O's descriptors to a shm file so
that VDUSE backend can restore them during reconnecting.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Message-Id: <20220523084611.91-9-xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvduse/libvduse.h |  12 ++
 block/export/vduse-blk.c        |  14 ++
 subprojects/libvduse/libvduse.c | 235 +++++++++++++++++++++++++++++++-
 3 files changed, 256 insertions(+), 5 deletions(-)

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
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 1040130f52..3b10349173 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -30,6 +30,7 @@ typedef struct VduseBlkExport {
     VirtioBlkHandler handler;
     VduseDev *dev;
     uint16_t num_queues;
+    char *recon_file;
 } VduseBlkExport;
 
 typedef struct VduseBlkReq {
@@ -107,6 +108,8 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
 
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
                        true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+    /* Make sure we don't miss any kick afer reconnecting */
+    eventfd_write(vduse_queue_get_fd(vq), 1);
 }
 
 static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
@@ -286,6 +289,15 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
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
@@ -309,6 +321,8 @@ static void vduse_blk_exp_delete(BlockExport *exp)
                                     vblk_exp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
+    unlink(vblk_exp->recon_file);
+    g_free(vblk_exp->recon_file);
 }
 
 static void vduse_blk_exp_request_shutdown(BlockExport *exp)
diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index fa4822b9a9..78bb777402 100644
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
@@ -764,12 +939,15 @@ static void vduse_queue_enable(VduseVirtq *vq)
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
 
@@ -819,11 +997,15 @@ static void vduse_dev_start_dataplane(VduseDev *dev)
 
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
@@ -932,6 +1114,30 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
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
 
@@ -976,6 +1182,12 @@ static int vduse_dev_init(VduseDev *dev, const char *name,
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
@@ -1020,6 +1232,12 @@ VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
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
@@ -1119,7 +1337,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
 
     ret = ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
     free(dev_config);
-    if (ret < 0) {
+    if (ret && errno != EEXIST) {
         fprintf(stderr, "Failed to create vduse device %s: %s\n",
                 name, strerror(errno));
         goto err_dev;
@@ -1146,8 +1364,15 @@ err_ctrl:
 
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
-- 
2.35.3


