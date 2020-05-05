Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F851C622A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 22:37:59 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW4KE-0006P6-J6
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 16:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jW4Iu-0004hm-Gz; Tue, 05 May 2020 16:36:36 -0400
Received: from charlie.dont.surf ([128.199.63.193]:57576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jW4Iq-0007px-P6; Tue, 05 May 2020 16:36:36 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 2F3A2BF720;
 Tue,  5 May 2020 20:36:30 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: fix pin-based interrupt behavior
Date: Tue,  5 May 2020 22:36:02 +0200
Message-Id: <20200505203603.278339-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505203603.278339-1-its@irrelevant.dk>
References: <20200505203603.278339-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 16:36:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

First, since the device only supports MSI-X or pin-based interrupt, if
MSI-X is not enabled, it should not accept interrupt vectors different
from 0 when creating completion queues.

Secondly, the irq_status NvmeCtrl member is meant to be compared to the
INTMS register, so it should only be 32 bits wide. And it is really only
useful when used with multi-message MSI.

Third, since we do not force a 1-to-1 correspondence between cqid and
interrupt vector, the irq_status register should not have bits set
according to cqid, but according to the associated interrupt vector.

Fix these issues, but keep irq_status available so we can easily support
multi-message MSI down the line.

Fixes: 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt behaviour of NVMe")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 ++++++++----
 hw/block/nvme.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9b453423cf2c..2b072bbb21e7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -127,8 +127,8 @@ static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
             msix_notify(&(n->parent_obj), cq->vector);
         } else {
             trace_nvme_irq_pin();
-            assert(cq->cqid < 64);
-            n->irq_status |= 1 << cq->cqid;
+            assert(cq->vector < 32);
+            n->irq_status |= 1 << cq->vector;
             nvme_irq_check(n);
         }
     } else {
@@ -142,8 +142,8 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
         if (msix_enabled(&(n->parent_obj))) {
             return;
         } else {
-            assert(cq->cqid < 64);
-            n->irq_status &= ~(1 << cq->cqid);
+            assert(cq->vector < 32);
+            n->irq_status &= ~(1 << cq->vector);
             nvme_irq_check(n);
         }
     }
@@ -642,6 +642,10 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
         trace_nvme_err_invalid_create_cq_addr(prp1);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
+    if (unlikely(!msix_enabled(&n->parent_obj) && vector)) {
+        trace_nvme_err_invalid_create_cq_vector(vector);
+        return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
+    }
     if (unlikely(vector > n->num_queues)) {
         trace_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 6520a9f0bead..db62589247d7 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -78,7 +78,7 @@ typedef struct NvmeCtrl {
     uint32_t    cmbsz;
     uint32_t    cmbloc;
     uint8_t     *cmbuf;
-    uint64_t    irq_status;
+    uint32_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
 
-- 
2.26.2


