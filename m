Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A0C1D2602
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 06:49:44 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ5oV-0006Tb-GF
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 00:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lW-0000WC-SH; Thu, 14 May 2020 00:46:38 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lV-0003kg-B5; Thu, 14 May 2020 00:46:38 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 2E811BFE30;
 Thu, 14 May 2020 04:46:34 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 10/20] hw/block/nvme: remove redundant cmbloc/cmbsz members
Date: Thu, 14 May 2020 06:46:01 +0200
Message-Id: <20200514044611.734782-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514044611.734782-1-its@irrelevant.dk>
References: <20200514044611.734782-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 00:46:30
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
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 7 ++-----
 hw/block/nvme.h | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 88ab5d55b8c9..e93ed729aef5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -77,7 +77,7 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 
 static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
-    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+    if (n->bar.cmbsz && nvme_addr_is_cmb(n, addr)) {
         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
         return;
     }
@@ -171,7 +171,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
     if (unlikely(!prp1)) {
         trace_pci_nvme_err_invalid_prp();
         return NVME_INVALID_FIELD | NVME_DNR;
-    } else if (n->cmbsz && prp1 >= n->ctrl_mem.addr &&
+    } else if (n->bar.cmbsz && prp1 >= n->ctrl_mem.addr &&
                prp1 < n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size)) {
         qsg->nsg = 0;
         qemu_iovec_init(iov, num_prps);
@@ -1487,9 +1487,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
         NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
 
-        n->cmbloc = n->bar.cmbloc;
-        n->cmbsz = n->bar.cmbsz;
-
         n->cmbuf = g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
         memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
                               "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 26c38bd913be..cedc8022dbb3 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -82,8 +82,6 @@ typedef struct NvmeCtrl {
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
     uint64_t    ns_size;
-    uint32_t    cmbsz;
-    uint32_t    cmbloc;
     uint8_t     *cmbuf;
     uint32_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
-- 
2.26.2


