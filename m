Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F729FB77
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 03:38:22 +0100 (CET)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYKJ3-00047k-F7
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 22:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56530b5a8=dmitry.fomichev@wdc.com>)
 id 1kYKDr-0005iO-0j; Thu, 29 Oct 2020 22:32:59 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:10980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56530b5a8=dmitry.fomichev@wdc.com>)
 id 1kYKDo-0006bi-N5; Thu, 29 Oct 2020 22:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604025176; x=1635561176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Tn85ElkxCk8/vnAe2n/Qwxg6E+GzDZiN+lwwkagU1o=;
 b=Iqte+LRv2Tfi5aIG4AwiqLIdAEr9j6BztVKEzzLddeNlZ/6KR87UXEQk
 vjqLc/pqXWqoJK2ZoloJeKpERH2G3RI50mFhy7CMbmuaA0v4MAZSjr63o
 Lt0IRfW7TzXuH/uOIkOSo6XKzjJlBmxfePsUVzMwab64i25CjgH+PJuJP
 WXyFuSblEPnKFG1Bbnz+aQR6DEhn5T65s0GpHsLtJxaxJTAmGo38YJCxE
 5CzPFOTFjaCxdEjllXGES49YQBsAiGhSNlfMsWrPpDIevjsE7PLtllNSP
 DuZh2cdnXvEmCsaWwQV6JqAqQZJhbb0IMSWC/ZGs2CcEhtvHHfxImDR75 g==;
IronPort-SDR: rCDzD1GnvzHPrfumH5Uq32+5RJB7Th5XFRXJ9hXcyZtTCEQBx1dpD2RIgZp3JGUCklkZNKFqZz
 7FkN6tp0S7/Oc78RPg1C13in/m15N+LzPjlL7hfSS+0zTtGy87kibVWMZ/jdK2aQWO8R/R5y8x
 pIw6b6Lj+MYl2AngbGU3CZAjEsKdTqs4xF3J2nQLOt6Yy/7xQBhPuUiyjk7sjzrkpkogVzMzh/
 G4ZSvRNWwsKisIWBL+sutsQoYznwfm82rsMMlgC0buUn4v290nCytTcov4dxoFZQkUd5yTZgTj
 qYo=
X-IronPort-AV: E=Sophos;i="5.77,431,1596470400"; d="scan'208";a="155748062"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Oct 2020 10:32:54 +0800
IronPort-SDR: h33n1UKrBygRz6UxHlGdnyY2zUrssGUQjE0xmWhCDw4UagXAWuXJBdYAH2/FPUtbSgfVO+u7ck
 i8tPxUyf1kFlgBJvMldhjUq6k3ekPDLQUDHJmejVTDoOyTvUsld/fvsHwdm95Lulf1H/5odkFx
 E9GBOU+ZeQVqK7TN3OjB93WAUyHiCJELxCD3VVXMf3fHL9SogJ5XFJK0eizIxdx2A4t2e3OdAc
 EQKd70tkKg5RXOMac2VQCzL7BOFbaerI305NwOmNHYha2PNI1fFiv3LPWyd3WEbq7SGED1awTy
 CwM2LwWt6Mpp15orMz4E3m2l
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 19:17:59 -0700
IronPort-SDR: u2u6bu9W8JsAG5ATL3QlCcKHG0ymvOGinX6Lk8J5xF0zH/FCZBpTeB+kQm1TjfOwhQR4T28BBh
 fUx3WwJ4t1rd5zak1SOTnxcu0pbh04nfYwEY4PAmV3MYTpjfnXrP1T1kdYB1nKrPxSWxpDfd4+
 /5EEt6uA8uC317uCyXFiLV7hGKq1iybQiOy+zlZn5VIuOA+vconsrXC28NaUBn2nmtfQv//Tcm
 xd03QL74YPYTUcIlB//WUe83Zxb0jFPUSCruT4LocWfEFpGc1ZDV0ksngFmh55V+8GbClk0WNi
 ec0=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Oct 2020 19:32:54 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v8 03/11] hw/block/nvme: Separate read and write handlers
Date: Fri, 30 Oct 2020 11:32:34 +0900
Message-Id: <20201030023242.5204-4-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201030023242.5204-1-dmitry.fomichev@wdc.com>
References: <20201030023242.5204-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=56530b5a8=dmitry.fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 22:32:49
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With ZNS support in place, the majority of code in nvme_rw() has
become read- or write-specific. Move these parts to two separate
handlers, nvme_read() and nvme_write() to make the code more
readable and to remove multiple is_write checks that so far existed
in the i/o path.

This is a refactoring patch, no change in functionality.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Acked-by: Klaus Jensen <its@irrelevant.dk>
---
 hw/block/nvme.c       | 91 ++++++++++++++++++++++++++++++-------------
 hw/block/trace-events |  3 +-
 2 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1ec8ccb3e6..3023774484 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -963,6 +963,54 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t data_offset;
+    BlockBackend *blk = ns->blkconf.blk;
+    uint16_t status;
+
+    trace_pci_nvme_read(nvme_cid(req), nvme_nsid(ns), nlb, data_size, slba);
+
+    status = nvme_check_mdts(n, data_size);
+    if (status) {
+        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
+        goto invalid;
+    }
+
+    status = nvme_check_bounds(n, ns, slba, nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+        goto invalid;
+    }
+
+    status = nvme_map_dptr(n, data_size, req);
+    if (status) {
+        goto invalid;
+    }
+
+    data_offset = nvme_l2b(ns, slba);
+
+    block_acct_start(blk_get_stats(blk), &req->acct, data_size,
+                     BLOCK_ACCT_READ);
+    if (req->qsg.sg) {
+        req->aiocb = dma_blk_read(blk, &req->qsg, data_offset,
+                                  BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+    } else {
+        req->aiocb = blk_aio_preadv(blk, data_offset, &req->iov, 0,
+                                    nvme_rw_cb, req);
+    }
+    return NVME_NO_COMPLETE;
+
+invalid:
+    block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_READ);
+    return status | NVME_DNR;
+}
+
 static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -988,22 +1036,19 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
-static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
-    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
-
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t data_size = nvme_l2b(ns, nlb);
-    uint64_t data_offset = nvme_l2b(ns, slba);
-    enum BlockAcctType acct = req->cmd.opcode == NVME_CMD_WRITE ?
-        BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
+    uint64_t data_offset;
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
 
-    trace_pci_nvme_rw(nvme_cid(req), nvme_io_opc_str(rw->opcode),
-                      nvme_nsid(ns), nlb, data_size, slba);
+    trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
+                         nvme_nsid(ns), nlb, data_size, slba);
 
     status = nvme_check_mdts(n, data_size);
     if (status) {
@@ -1022,29 +1067,22 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    block_acct_start(blk_get_stats(blk), &req->acct, data_size, acct);
+    data_offset = nvme_l2b(ns, slba);
+
+    block_acct_start(blk_get_stats(blk), &req->acct, data_size,
+                     BLOCK_ACCT_WRITE);
     if (req->qsg.sg) {
-        if (acct == BLOCK_ACCT_WRITE) {
-            req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
-                                       BDRV_SECTOR_SIZE, nvme_rw_cb, req);
-        } else {
-            req->aiocb = dma_blk_read(blk, &req->qsg, data_offset,
-                                      BDRV_SECTOR_SIZE, nvme_rw_cb, req);
-        }
+        req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
+                                   BDRV_SECTOR_SIZE, nvme_rw_cb, req);
     } else {
-        if (acct == BLOCK_ACCT_WRITE) {
-            req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
-                                         nvme_rw_cb, req);
-        } else {
-            req->aiocb = blk_aio_preadv(blk, data_offset, &req->iov, 0,
-                                        nvme_rw_cb, req);
-        }
+        req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
+                                     nvme_rw_cb, req);
     }
     return NVME_NO_COMPLETE;
 
 invalid:
-    block_acct_invalid(blk_get_stats(ns->blkconf.blk), acct);
-    return status;
+    block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_WRITE);
+    return status | NVME_DNR;
 }
 
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
@@ -1074,8 +1112,9 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
     case NVME_CMD_WRITE:
+        return nvme_write(n, req);
     case NVME_CMD_READ:
-        return nvme_rw(n, req);
+        return nvme_read(n, req);
     default:
         assert(false);
     }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 3ea6c29926..d81b1891d8 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -40,7 +40,8 @@ pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2,
 pci_nvme_map_sgl(uint16_t cid, uint8_t typ, uint64_t len) "cid %"PRIu16" type 0x%"PRIx8" len %"PRIu64""
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
-pci_nvme_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
+pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
+pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
-- 
2.21.0


