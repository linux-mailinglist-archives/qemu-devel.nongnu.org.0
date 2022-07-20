Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE157B373
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:05:50 +0200 (CEST)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5eO-0002fB-UE
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oE5a1-0006BG-PV
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:01:18 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:41168 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oE5Zv-0000kB-Fj
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:01:15 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-01 (Coremail) with SMTP id qwCowAC3vxdHxNdi+o_8EQ--.6693S2;
 Wed, 20 Jul 2022 17:00:59 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH] hw/nvme: Add iothread support
Date: Wed, 20 Jul 2022 17:00:53 +0800
Message-Id: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3vxdHxNdi+o_8EQ--.6693S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4DJw1kCFy7Cw47uFyfWFg_yoWfKryUpF
 WkXr9avrZ7JF47Zrs0qanrJwn5u3y8W3WUC343Kwn3Jw1xC343JFy0kFyjkFWrAFZ5XFy5
 Z3yxJFnruFZ2y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU3cTPUUUUU=
X-Originating-IP: [159.226.43.7]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Add an option "iothread=x" to do emulation in a seperate iothread.
This improves the performance because QEMU's main loop is responsible
for a lot of other work while iothread is dedicated to NVMe emulation.
Moreover, emulating in iothread brings the potential of polling on
SQ/CQ doorbells, which I will bring up in a following patch.

Iothread can be enabled by:
 -object iothread,id=nvme0 \
 -device nvme,iothread=nvme0 \

Performance comparisons (KIOPS):

QD         1   4  16  64
QEMU      41 136 242 338
iothread  53 155 245 309

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++----
 hw/nvme/ns.c   | 19 +++++++++---
 hw/nvme/nvme.h |  6 +++-
 3 files changed, 95 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a..a4efc97b33 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4257,6 +4257,7 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
 {
     NvmeCtrl *n = cq->ctrl;
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
+    bool in_iothread = !qemu_in_main_thread();
     int ret;
 
     ret = event_notifier_init(&cq->notifier, 0);
@@ -4264,10 +4265,19 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
         return ret;
     }
 
-    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
+    if (in_iothread) {
+        qemu_mutex_lock_iothread();
+    }
+
+    aio_set_event_notifier(n->ctx, &cq->notifier, true, nvme_cq_notifier,
+                           NULL, NULL);
     memory_region_add_eventfd(&n->iomem,
                               0x1000 + offset, 4, false, 0, &cq->notifier);
 
+    if (in_iothread) {
+        qemu_mutex_unlock_iothread();
+    }
+    
     return 0;
 }
 
@@ -4284,6 +4294,7 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
 {
     NvmeCtrl *n = sq->ctrl;
     uint16_t offset = sq->sqid << 3;
+    bool in_iothread = !qemu_in_main_thread();
     int ret;
 
     ret = event_notifier_init(&sq->notifier, 0);
@@ -4291,9 +4302,16 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
         return ret;
     }
 
-    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
+    if (in_iothread) {
+        qemu_mutex_lock_iothread();
+    }
+    aio_set_event_notifier(n->ctx, &sq->notifier, true, nvme_sq_notifier,
+                           NULL, NULL);
     memory_region_add_eventfd(&n->iomem,
                               0x1000 + offset, 4, false, 0, &sq->notifier);
+    if (in_iothread) {
+        qemu_mutex_unlock_iothread();
+    }
 
     return 0;
 }
@@ -4301,13 +4319,22 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
 {
     uint16_t offset = sq->sqid << 3;
+    bool in_iothread = !qemu_in_main_thread();
 
     n->sq[sq->sqid] = NULL;
     timer_free(sq->timer);
     if (sq->ioeventfd_enabled) {
+        if (in_iothread) {
+            qemu_mutex_lock_iothread();
+        }
+
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &sq->notifier);
         event_notifier_cleanup(&sq->notifier);
+
+        if (in_iothread) {
+            qemu_mutex_unlock_iothread();
+        }
     }
     g_free(sq->io_req);
     if (sq->sqid) {
@@ -4376,8 +4403,9 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
         sq->io_req[i].sq = sq;
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
-    sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
 
+    sq->timer = aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
+                              nvme_process_sq, sq);
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
         sq->ei_addr = n->dbbuf_eis + (sqid << 3);
@@ -4691,13 +4719,22 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
+    bool in_iothread = !qemu_in_main_thread();
 
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
     if (cq->ioeventfd_enabled) {
+        if (in_iothread) {
+            qemu_mutex_lock_iothread();
+        }
+        
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &cq->notifier);
         event_notifier_cleanup(&cq->notifier);
+        
+        if (in_iothread) {
+            qemu_mutex_unlock_iothread();
+        }
     }
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
@@ -4765,7 +4802,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
         }
     }
     n->cq[cqid] = cq;
-    cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+    cq->timer = aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
+                              nvme_post_cqes, cq);
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
@@ -6557,6 +6595,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
     uint32_t intms = ldl_le_p(&n->bar.intms);
     uint32_t csts = ldl_le_p(&n->bar.csts);
     uint32_t pmrsts = ldl_le_p(&n->bar.pmrsts);
+    bool in_iothread = !qemu_in_main_thread();
 
     if (unlikely(offset & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_misaligned32,
@@ -6726,10 +6765,22 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
 
         stl_le_p(&n->bar.pmrctl, data);
         if (NVME_PMRCTL_EN(data)) {
+            if (in_iothread) {
+                qemu_mutex_lock_iothread();
+            }
             memory_region_set_enabled(&n->pmr.dev->mr, true);
+            if (in_iothread) {
+                qemu_mutex_unlock_iothread();
+            }
             pmrsts = 0;
         } else {
+            if (in_iothread) {
+                qemu_mutex_lock_iothread();
+            }
             memory_region_set_enabled(&n->pmr.dev->mr, false);
+            if (in_iothread) {
+                qemu_mutex_unlock_iothread();
+            }
             NVME_PMRSTS_SET_NRDY(pmrsts, 1);
             n->pmr.cmse = false;
         }
@@ -7528,6 +7579,14 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
         stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
     }
+
+    if (n->params.iothread) {
+        n->iothread = n->params.iothread;
+        object_ref(OBJECT(n->iothread));
+        n->ctx = iothread_get_aio_context(n->iothread);
+    } else {
+        n->ctx = qemu_get_aio_context();
+    }
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -7600,7 +7659,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(ns, errp)) {
+        if (nvme_ns_setup(n, ns, errp)) {
             return;
         }
 
@@ -7631,6 +7690,15 @@ static void nvme_exit(PCIDevice *pci_dev)
     g_free(n->sq);
     g_free(n->aer_reqs);
 
+    aio_context_acquire(n->ctx);
+    blk_set_aio_context(n->namespace.blkconf.blk, qemu_get_aio_context(), NULL);
+    aio_context_release(n->ctx);
+
+    if (n->iothread) {
+        object_unref(OBJECT(n->iothread));
+        n->iothread = NULL;
+    }
+
     if (n->params.cmb_size_mb) {
         g_free(n->cmb.buf);
     }
@@ -7665,6 +7733,8 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
+    DEFINE_PROP_LINK("iothread", NvmeCtrl, params.iothread, TYPE_IOTHREAD,
+                     IOThread *),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..683d0d7a3b 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -146,8 +146,10 @@ lbaf_found:
     return 0;
 }
 
-static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
+    AioContext *old_context;
+    int ret;
     bool read_only;
 
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
@@ -170,6 +172,15 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    old_context = blk_get_aio_context(ns->blkconf.blk);
+    aio_context_acquire(old_context);
+    ret = blk_set_aio_context(ns->blkconf.blk, n->ctx, errp);
+    aio_context_release(old_context);
+
+    if (ret) {
+        error_setg(errp, "Set AioContext on BlockBackend failed");
+    }
+
     return 0;
 }
 
@@ -482,13 +493,13 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
     }
 
-    if (nvme_ns_init_blk(ns, errp)) {
+    if (nvme_ns_init_blk(n, ns, errp)) {
         return -1;
     }
 
@@ -563,7 +574,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (nvme_ns_setup(ns, errp)) {
+    if (nvme_ns_setup(n, ns, errp)) {
         return;
     }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..85e2aa7b29 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -21,6 +21,7 @@
 #include "qemu/uuid.h"
 #include "hw/pci/pci.h"
 #include "hw/block/block.h"
+#include "sysemu/iothread.h"
 
 #include "block/nvme.h"
 
@@ -275,7 +276,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
@@ -427,6 +428,7 @@ typedef struct NvmeParams {
     uint16_t sriov_vi_flexible;
     uint8_t  sriov_max_vq_per_vf;
     uint8_t  sriov_max_vi_per_vf;
+    IOThread *iothread;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
@@ -458,6 +460,8 @@ typedef struct NvmeCtrl {
     uint64_t    dbbuf_dbs;
     uint64_t    dbbuf_eis;
     bool        dbbuf_enabled;
+    IOThread    *iothread;
+    AioContext  *ctx;
 
     struct {
         MemoryRegion mem;
-- 
2.25.1


