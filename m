Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712221346C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 08:46:30 +0200 (CEST)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrFSv-00072P-7E
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 02:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIG-00078m-Ec; Fri, 03 Jul 2020 02:35:28 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIC-00037z-U2; Fri, 03 Jul 2020 02:35:28 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 11344BF628;
 Fri,  3 Jul 2020 06:35:03 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 16/18] hw/block/nvme: enforce valid queue creation sequence
Date: Fri,  3 Jul 2020 08:34:18 +0200
Message-Id: <20200703063420.2241014-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703063420.2241014-1-its@irrelevant.dk>
References: <20200703063420.2241014-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Support returning Command Sequence Error if Set Features on Number of
Queues is called after queues have been created.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 12 ++++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0dac7a41ddae..8138baa6fbd8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -910,6 +910,13 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
     cq = g_malloc0(sizeof(*cq));
     nvme_init_cq(cq, n, prp1, cqid, vector, qsize + 1,
         NVME_CQ_FLAGS_IEN(qflags));
+
+    /*
+     * It is only required to set qs_created when creating a completion queue;
+     * creating a submission queue without a matching completion queue will
+     * fail.
+     */
+    n->qs_created = true;
     return NVME_SUCCESS;
 }
 
@@ -1301,6 +1308,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
         break;
     case NVME_NUMBER_OF_QUEUES:
+        if (n->qs_created) {
+            return NVME_CMD_SEQ_ERROR | NVME_DNR;
+        }
+
         /*
          * NVMe v1.3, Section 5.21.1.7: 0xffff is not an allowed value for NCQR
          * and NSQR.
@@ -1433,6 +1444,7 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
 
     n->aer_queued = 0;
     n->outstanding_aers = 0;
+    n->qs_created = false;
 
     blk_flush(n->conf.blk);
     n->bar.cc = 0;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 450e4294193a..668d2cd3df16 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -121,6 +121,7 @@ typedef struct NvmeCtrl {
     BlockConf    conf;
     NvmeParams   params;
 
+    bool        qs_created;
     uint32_t    page_size;
     uint16_t    page_bits;
     uint16_t    max_prp_ents;
-- 
2.27.0


