Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082542D349A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:01:31 +0100 (CET)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmk70-0003mV-0a
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDu-0002N6-7B; Tue, 08 Dec 2020 15:04:34 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDs-00063N-14; Tue, 08 Dec 2020 15:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458843; x=1638994843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WN9rxSJmPOaKc1IWU0IELjzAmafaEWKsmbujTqyg47I=;
 b=X2J+P6MnVp0eNWnuvRwCo9mdKWmVo0c2NUIy0ycJdVPzoUGOltYHahTz
 Aharigt9cFEkOStBWYzdEeVeaUK3D9d2gtp5v1RKBPfFfrD/okHNGV1RF
 R5Eyew5VeBgKB2aBztoPB9iexfuMIO0SRKdUuNEFwB7kT8M3Mti1Tq6s+
 jtPws/mgyDElodAC6QQa5xKtPRPNgs12Z0QpOkHU66PO7OWrMxDtxDaW4
 FTxvNHlK8ZtXA9or15ZTqi3lAxbF8KtbOfsfJWHAWhWWLHDbO9VI3uXgS
 3PFh9Y/CPb6AcXu6l+PXXTMg07pGzgjywcNpm3DfDM1MxRpnHXhTF+5mt g==;
IronPort-SDR: /JmbuVZkDfPqY9BZiNpl/bm4iFkehS895/CX0QVs7fGBghfxormqikPKPpKWzpuRxHQQrv10zf
 vdevMrUVGuYEY8y4FOM5mPiiF18H9eR2HjV8EuQ4XLFT2Lxz//dqJYCcoTWKaq8xKGCMK1dDFA
 OJAg5tkEWPrMpdOv6qxTcqR+WCHbJ+aD3QT04X2y90jA95i+ne6pJqBkE3VUgwJuxyHllsiOkT
 ep7/6l/9LqTHCoWMkKQ03Dq2ynFEH5Rq6E/fOYWp+AOJayAtyuhxIKkIZUYtOK95Het+n17p7I
 e98=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433447"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:26 +0800
IronPort-SDR: 00Mw79/fuE7TDmXyzQQTXCbCQuHUUj8IrsdoUmmwwEZg1/rHaG7FpQPVUB4wnYKnZ0X5HLhqo3
 pxMIPDixhK9LbweXhITAizfe6hetlTvVc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:20 -0800
IronPort-SDR: r2+Xz9+tdwO3jD4bmXfkCtAddc3cKwKQ7yrqdvJflNfe7FjzSUEOSGaQY4P0nQUaLF0nkjY3d4
 oHYx4rhqbozw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:19 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 03/13] hw/block/nvme: Separate read and write handlers
Date: Wed,  9 Dec 2020 05:04:00 +0900
Message-Id: <20201208200410.27900-4-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

The majority of code in nvme_rw() is becoming read- or write-specific.
Move these parts to two separate handlers, nvme_read() and nvme_write()
to make the code more readable and to remove multiple is_write checks
that has been present in the i/o path.

This is a refactoring patch, no change in functionality.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Acked-by: Klaus Jensen <its@irrelevant.dk>
---
 hw/block/nvme.c       | 107 ++++++++++++++++++++++++++++--------------
 hw/block/trace-events |   3 +-
 2 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a30fe75620..897c2d04e5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1073,6 +1073,61 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
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
+    if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+        status = nvme_check_dulbe(ns, slba, nlb);
+        if (status) {
+            goto invalid;
+        }
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
@@ -1098,22 +1153,19 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
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
@@ -1127,43 +1179,27 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    if (acct == BLOCK_ACCT_READ) {
-        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
-            status = nvme_check_dulbe(ns, slba, nlb);
-            if (status) {
-                goto invalid;
-            }
-        }
-    }
-
     status = nvme_map_dptr(n, data_size, req);
     if (status) {
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
@@ -1192,8 +1228,9 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
     case NVME_CMD_WRITE:
+        return nvme_write(n, req);
     case NVME_CMD_READ:
-        return nvme_rw(n, req);
+        return nvme_read(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
     default:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index af2d0cb28f..6233f801e1 100644
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
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
-- 
2.28.0


