Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CCB5A2BC8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:57:17 +0200 (CEST)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbht-0002kW-0D
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0U-0006N6-IM; Fri, 26 Aug 2022 11:12:26 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40680 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0Q-0005Kr-7E; Fri, 26 Aug 2022 11:12:25 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAB3v4_J4ghjTGF5AA--.15491S5;
 Fri, 26 Aug 2022 23:12:18 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2 3/3] hw/nvme: add iothread support
Date: Fri, 26 Aug 2022 23:12:05 +0800
Message-Id: <20220826151206.3148942-4-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3v4_J4ghjTGF5AA--.15491S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4DZFyUCFWDCry3XF4kXrb_yoW3CFWUpF
 WkWrZ3uan7AF17Zan0van7Aw1ruw48W3WDG34Sywn3Jwn7Gry3AFy0kF129FWrJrZ5XFZ8
 Z3y8JF47u34Ut3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
 c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
 8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
 s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7
 CjxVAKzI0EY4vE52x082I5MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07jYbyAUUUUU=
X-Originating-IP: [159.226.43.62]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++------
 hw/nvme/ns.c   | 21 +++++++++++++---
 hw/nvme/nvme.h |  6 ++++-
 3 files changed, 82 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 396f3f0cdd..2d81f7c7f6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4458,7 +4458,13 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
         return ret;
     }
 
-    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
+    if (cq->cqid) {
+        aio_set_event_notifier(n->ctx, &cq->notifier, true, nvme_cq_notifier,
+                               NULL, NULL);
+    } else {
+        event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
+    }
+
     memory_region_add_eventfd(&n->iomem,
                               0x1000 + offset, 4, false, 0, &cq->notifier);
 
@@ -4487,7 +4493,13 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
         return ret;
     }
 
-    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
+    if (sq->sqid) {
+        aio_set_event_notifier(n->ctx, &sq->notifier, true, nvme_sq_notifier,
+                               NULL, NULL);
+    } else {
+        event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
+    }
+
     memory_region_add_eventfd(&n->iomem,
                               0x1000 + offset, 4, false, 0, &sq->notifier);
 
@@ -4503,7 +4515,12 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
     if (sq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &sq->notifier);
-        event_notifier_set_handler(&sq->notifier, NULL);
+        if (sq->sqid) {
+            aio_set_event_notifier(n->ctx, &sq->notifier, true, NULL, NULL,
+                                   NULL);
+        } else {
+            event_notifier_set_handler(&sq->notifier, NULL);
+        }
         event_notifier_cleanup(&sq->notifier);
     }
     g_free(sq->io_req);
@@ -4573,7 +4590,13 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
         sq->io_req[i].sq = sq;
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
-    sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
+
+    if (sq->sqid) {
+        sq->timer = aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
+                                  nvme_process_sq, sq);
+    } else {
+        sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
+    }
 
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
@@ -4896,7 +4919,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     if (cq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &cq->notifier);
-        event_notifier_set_handler(&cq->notifier, NULL);
+        if (cq->cqid) {
+            aio_set_event_notifier(n->ctx, &cq->notifier, true, NULL, NULL,
+                                   NULL);
+        } else {
+            event_notifier_set_handler(&cq->notifier, NULL);
+        }
         event_notifier_cleanup(&cq->notifier);
     }
     if (cq->assert_notifier.initialized) {
@@ -4979,7 +5007,13 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
         }
     }
     n->cq[cqid] = cq;
-    cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+
+    if (cq->cqid) {
+        cq->timer = aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
+                                  nvme_post_cqes, cq);
+    } else {
+        cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+    }
 
     /*
      * Only enable irq eventfd for IO queues since we always emulate admin
@@ -7759,6 +7793,14 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -7831,7 +7873,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(ns, errp)) {
+        if (nvme_ns_setup(ns, n->ctx, errp)) {
             return;
         }
 
@@ -7862,6 +7904,15 @@ static void nvme_exit(PCIDevice *pci_dev)
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
@@ -7885,6 +7936,8 @@ static Property nvme_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
+    DEFINE_PROP_LINK("iothread", NvmeCtrl, params.iothread, TYPE_IOTHREAD,
+                     IOThread *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..eb9141a67b 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -146,9 +146,11 @@ lbaf_found:
     return 0;
 }
 
-static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init_blk(NvmeNamespace *ns, AioContext *ctx, Error **errp)
 {
     bool read_only;
+    AioContext *old_context;
+    int ret;
 
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
         return -1;
@@ -170,6 +172,17 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    old_context = blk_get_aio_context(ns->blkconf.blk);
+    aio_context_acquire(old_context);
+    ret = blk_set_aio_context(ns->blkconf.blk, ctx, errp);
+    aio_context_release(old_context);
+
+    if (ret) {
+        error_setg(errp, "Set AioContext on BlockBackend failed");
+        return ret;
+    }
+
+
     return 0;
 }
 
@@ -482,13 +495,13 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeNamespace *ns, AioContext *ctx, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
     }
 
-    if (nvme_ns_init_blk(ns, errp)) {
+    if (nvme_ns_init_blk(ns, ctx, errp)) {
         return -1;
     }
 
@@ -563,7 +576,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (nvme_ns_setup(ns, errp)) {
+    if (nvme_ns_setup(ns, n->ctx, errp)) {
         return;
     }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index b0b986b024..224b73e6c4 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -22,6 +22,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/block/block.h"
+#include "sysemu/iothread.h"
 
 #include "block/nvme.h"
 
@@ -276,7 +277,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeNamespace *ns, AioContext *ctx, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
@@ -433,6 +434,7 @@ typedef struct NvmeParams {
     uint16_t sriov_vi_flexible;
     uint8_t  sriov_max_vq_per_vf;
     uint8_t  sriov_max_vi_per_vf;
+    IOThread *iothread;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
@@ -464,6 +466,8 @@ typedef struct NvmeCtrl {
     uint64_t    dbbuf_dbs;
     uint64_t    dbbuf_eis;
     bool        dbbuf_enabled;
+    IOThread    *iothread;
+    AioContext  *ctx;
 
     struct {
         MemoryRegion mem;
-- 
2.25.1


