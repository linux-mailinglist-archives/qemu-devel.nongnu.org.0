Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D03A6897
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:58:36 +0200 (CEST)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsn6p-0003PT-E0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lsn4m-0002Dy-07; Mon, 14 Jun 2021 09:56:28 -0400
Received: from tmave.modry.cz ([82.208.58.129]:55848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lsn4k-0006BS-Bm; Mon, 14 Jun 2021 09:56:27 -0400
Received: from 93-153-64-87.customers.tmcz.cz ([93.153.64.87]
 helo=octatonsil.dd1.int.kernkonzept.com)
 by tmave.modry.cz with esmtpa (Exim 4.92.3)
 (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lsn49-0006Vw-FO; Mon, 14 Jun 2021 15:56:22 +0200
From: =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/nvme: be more careful when deasserting IRQs
Date: Mon, 14 Jun 2021 15:54:30 +0200
Message-Id: <20210614135429.56475-1-jakub.jermar@kernkonzept.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.4
Received-SPF: softfail client-ip=82.208.58.129;
 envelope-from=jakub.jermar@kernkonzept.com; helo=tmave.modry.cz
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: its@irrelevant.dk, kbusch@kernel.org,
 =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An IRQ vector used by a completion queue cannot be deasserted without
first checking if the same vector does not need to stay asserted for
some other completion queue. To this end the controller structure is
extended by a counter of asserted completion queues.

To prevent incrementing the counter for completion queues that are
asserted repeatedly, each completion queue is extended by a flag which
tells whether the queue is currently asserted.

Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
---
 hw/nvme/ctrl.c | 22 ++++++++++++++++------
 hw/nvme/nvme.h |  2 ++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..97a5d768ee 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -451,9 +451,13 @@ static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
             msix_notify(&(n->parent_obj), cq->vector);
         } else {
             trace_pci_nvme_irq_pin();
-            assert(cq->vector < 32);
-            n->irq_status |= 1 << cq->vector;
-            nvme_irq_check(n);
+            if (!cq->irq_asserted) {
+                cq->irq_asserted = true;
+                assert(cq->vector < 32);
+                n->irq_asserted_cnt[cq->vector]++;
+                n->irq_status |= 1 << cq->vector;
+                nvme_irq_check(n);
+            }
         }
     } else {
         trace_pci_nvme_irq_masked();
@@ -466,9 +470,15 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
         if (msix_enabled(&(n->parent_obj))) {
             return;
         } else {
-            assert(cq->vector < 32);
-            n->irq_status &= ~(1 << cq->vector);
-            nvme_irq_check(n);
+            if (cq->irq_asserted) {
+                cq->irq_asserted = false;
+                assert(cq->vector < 32);
+                assert(n->irq_asserted_cnt[cq->vector]);
+                if (n->irq_asserted_cnt[cq->vector]-- == 1) {
+                    n->irq_status &= ~(1 << cq->vector);
+                }
+                nvme_irq_check(n);
+            }
         }
     }
 }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81a35cda14..753bf7a923 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -352,6 +352,7 @@ typedef struct NvmeCQueue {
     uint32_t    head;
     uint32_t    tail;
     uint32_t    vector;
+    bool        irq_asserted;
     uint32_t    size;
     uint64_t    dma_addr;
     QEMUTimer   *timer;
@@ -404,6 +405,7 @@ typedef struct NvmeCtrl {
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
+    uint16_t    irq_asserted_cnt[32];
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
-- 
2.31.1


