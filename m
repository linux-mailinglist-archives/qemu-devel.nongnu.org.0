Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBC49B634
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:27:45 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMnQ-0001Bq-Ou
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:27:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLij-0007di-N0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:49 -0500
Received: from [2607:f8b0:4864:20::633] (port=40484
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLif-0004zK-Vn
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:49 -0500
Received: by mail-pl1-x633.google.com with SMTP id y17so8903925plg.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zApYLsB1i3ZwQTH/fWStN7FoAHvHQ3HnkL85Dpu2yYE=;
 b=hbCLsaC/qyzsaqNVEMa6LCjbE9P1lbL1aI2rClsTB9qI1UAQHUPzfwCWwqU8d/qGlj
 uUXLsP6tJc98Phdf+s0Soz3grnVdp+6vtEROqdoknoaz/nl905F1ZOpDfCo1hk2YXL7Z
 WwxmbW3f1rlVHLunOlC+vWa00eB0ACmwPB+//inS9FOBYJUw9085bGsG8O6dqNkszU75
 N9381OQmPTtoSZP+aPUU4fNuOPBm4fybgAT9FdHiHzgtkUYJmdlwST066chCx46lWmFs
 1bGuYGR0ZjM3WWWB4t/8fp0wtKMlrqb4FgiITYo1TwoAsjq35bje2bBrd4GZ62Xq1mdZ
 3cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zApYLsB1i3ZwQTH/fWStN7FoAHvHQ3HnkL85Dpu2yYE=;
 b=A+yrwcoYBjBVHp7sqOXQ+rlM7ug8QNSQAcLEqzehzlsLhMu80+xsHqLJ/nLqhBLxwN
 jJa9eDA+PF9MGw3geHI1ZnKiH+dtMQOKZB/+1j8iBR+DLCdfNhEqwDa3DXZV31U+beU+
 D8MBcksDnaX39Bj8rvxHYlIurQc9znD4oDBVmwMbSzXSSxH8p5u2DfXfEU+T51feFPwM
 jYmhGIawgKML3PlzU+HAMSQZ/Yl3uJFHJDSFKPdvE8wmkwkUowQCsh6F5yBEO5+WobDS
 /cbg4iI4sP2+Re37hLxbQArh808xkZ/fyZeHsM/lKGvXtkD+u5ARBqG3BNaAvQibJE2q
 /XWQ==
X-Gm-Message-State: AOAM531Fnw6Mlaaey5ch9ho9mPQK1VMGbDedNFwGmjZfZtfePyju5y8M
 y9UYEJdyEQfWInALBPf9JECm
X-Google-Smtp-Source: ABdhPJynu8e0f6XKbxb23K8Qp2VJAaxkBbJhL4a+3sy+fA5Cq7WXxD4vUO8yrSYXVI2ZBwscqMQFJw==
X-Received: by 2002:a17:90b:1806:: with SMTP id
 lw6mr3502897pjb.82.1643116724762; 
 Tue, 25 Jan 2022 05:18:44 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id p42sm18916544pfw.71.2022.01.25.05.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:18:44 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH 5/5] libvduse: Add support for reconnecting
Date: Tue, 25 Jan 2022 21:18:00 +0800
Message-Id: <20220125131800.91-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125131800.91-1-xieyongji@bytedance.com>
References: <20220125131800.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 block/export/vduse-blk.c        |   4 +-
 subprojects/libvduse/libvduse.c | 254 +++++++++++++++++++++++++++++++-
 subprojects/libvduse/libvduse.h |   4 +-
 3 files changed, 254 insertions(+), 8 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 83845e9a9a..bc14fd798b 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -232,6 +232,8 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
 
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
                        true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+    /* Make sure we don't miss any kick afer reconnecting */
+    eventfd_write(vduse_queue_get_fd(vq), 1);
 }
 
 static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
@@ -388,7 +390,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                      features, num_queues,
                                      sizeof(struct virtio_blk_config),
                                      (char *)&config, &vduse_blk_ops,
-                                     vblk_exp);
+                                     g_get_tmp_dir(), vblk_exp);
     if (!vblk_exp->dev) {
         error_setg(errp, "failed to create vduse device");
         return -ENOMEM;
diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 7671864bca..ce2f6c7949 100644
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
@@ -96,8 +127,67 @@ struct VduseDev {
     int fd;
     int ctrl_fd;
     void *priv;
+    char *shm_log_dir;
+    void *log;
+    bool reconnect;
 };
 
+static inline size_t vduse_vq_log_size(uint16_t queue_size)
+{
+    return ALIGN_UP(sizeof(VduseDescStateSplit) * queue_size +
+                    sizeof(VduseVirtqLogInflight), LOG_ALIGNMENT);
+}
+
+static void *vduse_log_get(const char *dir, const char *name, size_t size)
+{
+    void *ptr = MAP_FAILED;
+    char *path;
+    int fd;
+
+    path = (char *)malloc(strlen(dir) + strlen(name) +
+                          strlen("/vduse-log-") + 1);
+    if (!path) {
+        return ptr;
+    }
+    sprintf(path, "%s/vduse-log-%s", dir, name);
+
+    fd = open(path, O_RDWR | O_CREAT, 0600);
+    if (fd == -1) {
+        goto out;
+    }
+
+    if (ftruncate(fd, size) == -1) {
+        goto out;
+    }
+
+    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+    if (ptr == MAP_FAILED) {
+        goto out;
+    }
+out:
+    if (fd > 0) {
+        close(fd);
+    }
+    free(path);
+
+    return ptr;
+}
+
+static void vduse_log_destroy(const char *dir, const char *name)
+{
+    char *path;
+
+    path = (char *)malloc(strlen(dir) + strlen(name) +
+                          strlen("/vduse-log-") + 1);
+    if (!path) {
+        return;
+    }
+    sprintf(path, "%s/vduse-log-%s", dir, name);
+
+    unlink(path);
+    free(path);
+}
+
 static inline bool has_feature(uint64_t features, unsigned int fbit)
 {
     assert(fbit < 64);
@@ -139,6 +229,98 @@ static int vduse_inject_irq(VduseDev *dev, int index)
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
+    vq->used_idx = vq->vring.used->idx;
+    vq->resubmit_num = 0;
+    vq->resubmit_list = NULL;
+    vq->counter = 0;
+
+    if (unlikely(vq->log->inflight.used_idx != vq->used_idx)) {
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
@@ -578,11 +760,24 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
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
@@ -610,6 +805,8 @@ void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
 
     vq->inuse++;
 
+    vduse_queue_inflight_get(vq, head);
+
     return elem;
 }
 
@@ -667,7 +864,9 @@ void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
                       unsigned int len)
 {
     vduse_queue_fill(vq, elem, len, 0);
+    vduse_queue_inflight_pre_put(vq, elem->index);
     vduse_queue_flush(vq, 1);
+    vduse_queue_inflight_post_put(vq, elem->index);
 }
 
 static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
@@ -740,12 +939,11 @@ static void vduse_queue_enable(VduseVirtq *vq)
     }
 
     vq->fd = fd;
-    vq->shadow_avail_idx = vq->last_avail_idx = vq_info.split.avail_index;
-    vq->inuse = 0;
-    vq->used_idx = 0;
     vq->signalled_used_valid = false;
     vq->ready = true;
 
+    vduse_queue_check_inflights(vq);
+
     dev->ops->enable_queue(dev, vq);
 }
 
@@ -903,13 +1101,18 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
         return -errno;
     }
 
+    if (dev->reconnect) {
+        vduse_queue_enable(vq);
+    }
+
     return 0;
 }
 
 VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
                            uint32_t vendor_id, uint64_t features,
                            uint16_t num_queues, uint32_t config_size,
-                           char *config, const VduseOps *ops, void *priv)
+                           char *config, const VduseOps *ops,
+                           const char *shm_log_dir, void *priv)
 {
     VduseDev *dev;
     int i, ret, ctrl_fd, fd = -1;
@@ -918,6 +1121,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     VduseVirtq *vqs = NULL;
     struct vduse_dev_config *dev_config = NULL;
     size_t size = offsetof(struct vduse_dev_config, config);
+    size_t log_size = num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
+    void *log = NULL;
 
     if (!name || strlen(name) > VDUSE_NAME_MAX || !config ||
         !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
@@ -932,6 +1137,15 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     }
     memset(dev, 0, sizeof(VduseDev));
 
+    if (shm_log_dir) {
+        dev->log = log = vduse_log_get(shm_log_dir, name, log_size);
+        if (!log) {
+            fprintf(stderr, "Failed to get vduse log\n");
+            goto err_ctrl;
+        }
+        dev->shm_log_dir = strdup(shm_log_dir);
+    }
+
     ctrl_fd = open("/dev/vduse/control", O_RDWR);
     if (ctrl_fd < 0) {
         fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
@@ -964,7 +1178,11 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
 
     ret = ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
     free(dev_config);
-    if (ret < 0) {
+    if (!ret && log) {
+        memset(log, 0, log_size);
+    } else if (errno == EEXIST && log) {
+        dev->reconnect = true;
+    } else {
         fprintf(stderr, "Failed to create vduse dev %s: %s\n",
                 name, strerror(errno));
         goto err_dev;
@@ -978,6 +1196,12 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err;
     }
 
+    if (dev->reconnect &&
+        ioctl(fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
+        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
+        goto err;
+    }
+
     vqs = calloc(sizeof(VduseVirtq), num_queues);
     if (!vqs) {
         fprintf(stderr, "Failed to allocate virtqueues\n");
@@ -988,6 +1212,12 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         vqs[i].index = i;
         vqs[i].dev = dev;
         vqs[i].fd = -1;
+        if (log) {
+            vqs[i].log = log;
+            vqs[i].log->inflight.desc_num = VIRTQUEUE_MAX_SIZE;
+            log = (void *)((char *)log +
+                  vduse_vq_log_size(VIRTQUEUE_MAX_SIZE));
+        }
     }
 
     dev->vqs = vqs;
@@ -1008,16 +1238,28 @@ err_dev:
     close(ctrl_fd);
 err_ctrl:
     free(dev);
+    if (log) {
+        munmap(log, log_size);
+    }
 
     return NULL;
 }
 
 void vduse_dev_destroy(VduseDev *dev)
 {
+    size_t log_size = dev->num_queues * vduse_vq_log_size(VIRTQUEUE_MAX_SIZE);
+
+    if (dev->log) {
+        munmap(dev->log, log_size);
+    }
     free(dev->vqs);
     close(dev->fd);
     dev->fd = -1;
-    ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name);
+    if (!ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name) &&
+        dev->shm_log_dir) {
+        vduse_log_destroy(dev->shm_log_dir, dev->name);
+    }
+    free(dev->shm_log_dir);
     free(dev->name);
     close(dev->ctrl_fd);
     dev->ctrl_fd = -1;
diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/libvduse.h
index f6bcb51b5a..a46e71e0c2 100644
--- a/subprojects/libvduse/libvduse.h
+++ b/subprojects/libvduse/libvduse.h
@@ -171,6 +171,7 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size);
  * @config_size: the size of the configuration space
  * @config: the buffer of the configuration space
  * @ops: the operation of VDUSE backend
+ * @shm_log_dir: directory to store the metadata file for reconnect
  * @priv: private pointer
  *
  * Create VDUSE device.
@@ -180,7 +181,8 @@ int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size);
 VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
                            uint32_t vendor_id, uint64_t features,
                            uint16_t num_queues, uint32_t config_size,
-                           char *config, const VduseOps *ops, void *priv);
+                           char *config, const VduseOps *ops,
+                           const char *shm_log_dir, void *priv);
 
 /**
  * vduse_dev_destroy:
-- 
2.20.1


