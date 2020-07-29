Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BC232765
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:11:04 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uHv-00046d-I4
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDt-0006wT-5t; Wed, 29 Jul 2020 18:06:53 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDo-0008WH-Vm; Wed, 29 Jul 2020 18:06:52 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 9358ABFB34;
 Wed, 29 Jul 2020 22:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596060405;
 bh=57sCyuglf/OarbK8HJsuiXONzBM/nfffBxijgmnU9x4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Js/sImyOra7dfajjY3Rbe7DustzA4Kb4/wwA/x1SkDDie/4Hf7wJqYf/dhc6rbJTq
 dz8A6mljEBZ+HtBxeGthyJ3MQKhZGBYwNazrzfBovtp/VSqMg+ZPux5yLHx7yNzsRk
 eYn6oIP09kDKocSHhJQXLoYqClfPr4VWmOstqYvcEN9E9bIHaBfk98SNpz3gnH8ZM5
 AG1pq48qosscVF9dpsvlcEUYV+5sD8mAoIACjlFIYGaSTX8fErPb+pFM/DxNJkXHMx
 CWGqkCvUEyM6fMFS+RmD7CTx2Osc2U9ImeYTz74CbSPWl6J0VNfmEOle+iSHFd7AQq
 LW5164oYXBZqw==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/16] hw/block/nvme: add tracing to nvme_map_prp
Date: Thu, 30 Jul 2020 00:06:29 +0200
Message-Id: <20200729220638.344477-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729220638.344477-1-its@irrelevant.dk>
References: <20200729220638.344477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add tracing to nvme_map_prp.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 2 ++
 hw/block/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 571635ebe9f9..952afbb05175 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -274,6 +274,8 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
     int num_prps = (len >> n->page_bits) + 1;
     uint16_t status;
 
+    trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
+
     if (unlikely(!prp1)) {
         trace_pci_nvme_err_invalid_prp();
         return NVME_INVALID_FIELD | NVME_DNR;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index f3b2d004e078..f20c59a4b542 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -35,6 +35,7 @@ pci_nvme_irq_masked(void) "IRQ is masked"
 pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
+pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8""
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8""
 pci_nvme_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, uint64_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
-- 
2.27.0


