Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77004399223
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:04:46 +0200 (CEST)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVET-0006Fm-G3
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAj-00089h-MC
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:53 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAd-0006aQ-GL
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:53 -0400
Received: by mail-qk1-x729.google.com with SMTP id h20so3242851qko.11
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/SlYHFsBbOx8B80G1ZIY7V5qyExe6SSrrZ+O8mGBQ0=;
 b=CUmUnDw5gRcdP+mQYS9CceLNLpIFSAfd8T1KCXj6R2R9EWiuTZXjXIAHUsGxJGWIWU
 8adypKYUKuj2Hl7k37chohASwg6+zFq0OEnA1+sFQmhYKX3Qw+yt+5JpAMhbfbNruXIo
 WS3ZjC0JsTH5rvyCvfMMXm/wAE1fZ79n9iV9DV6HepETy0HA0FRQsYo+7z5KSM9kCD70
 OWd/M1MOYUIgeoHURdCUFyBWoSTTcvnJ4uR8NUmYYw9ccmaYMVuuD0TfTE4FWlOicwws
 jIyzcsAeaYDS11m+rVVSfx2PmvAw+rAv7/WDpXT5QKUmByJadZ2DBPgsy7yISorEG/Mv
 n3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/SlYHFsBbOx8B80G1ZIY7V5qyExe6SSrrZ+O8mGBQ0=;
 b=gsKP/BjiL6T8R4/z0LXR73gqRMEX+7r00OGH9Z875mNLkfNi2aACsCx7Au+Pj3447B
 hV0ir8B6H/bAMh1XBXEgeMoEy9TrTToaKlE93xFGtUSVijG1TK9jlH9SIhkoS3F01SlB
 jPR+1Ptajsda+t8s6QTRs1aoqHTzPqO0wWTGUefQLMwLS7ky7HrGF0rm+Qa7fs3LvkNh
 /WKpviBWX26RCIWGZ50QPhzZ8sCs6cfBLSnI562ViWvtHD4/r2SR53etLmoJEjPpveuW
 aqwuSUeTTu3T6zORhlRO+9OP4tIuTCuZUpdsLfhTLu5nTO9MMsTtMHl42kg2azLSRHz/
 aTSA==
X-Gm-Message-State: AOAM532MfKseb5JFlfdrH7EcG5Aq4Ypj7pIVYPMNkMKx4QwCHt63JJ3J
 wo6BZT9ZH5Shp4yAmekCSy1hxQ==
X-Google-Smtp-Source: ABdhPJzpXT04RjPc2lac1cvUPXnNZX/PahyEsOxwbbh/8xmFAFRjli8QRzIOtgLiSFr3aV1Ky2XldA==
X-Received: by 2002:a37:ac17:: with SMTP id e23mr28975511qkm.184.1622656846655; 
 Wed, 02 Jun 2021 11:00:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:46 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
Date: Wed,  2 Jun 2021 14:00:37 -0400
Message-Id: <20210602180042.111347-4-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added functionality to trigger ITS command queue processing on
write to CWRITE register and process each command queue entry to
identify the command type and handle commands like MAPD,MAPC,SYNC.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c  | 295 +++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  37 +++++
 2 files changed, 332 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index af60f19c98..6551c577b3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
+                              uint64_t rdbase)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t value;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    uint64_t cte = 0;
+    MemTxResult res = MEMTX_OK;
+
+    if (!s->ct.valid) {
+        return res;
+    }
+
+    if (valid) {
+        /* add mapping entry to collection table */
+        cte = (valid & VALID_MASK) |
+              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
+    }
+
+    /*
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    if (s->ct.indirect) {
+        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+
+            l2t_addr = value & ((1ULL << 51) - 1);
+
+            address_space_stq_le(as, l2t_addr +
+                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
+        }
+    } else {
+        /* Flat level table */
+        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
+                             cte, MEMTXATTRS_UNSPECIFIED, &res);
+    }
+    return res;
+}
+
+static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint16_t icid;
+    uint64_t rdbase;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    uint64_t value;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    icid = value & ICID_MASK;
+
+    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS MAPC: invalid collection table attributes "
+                      "icid %d rdbase %lu\n",  icid, rdbase);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        res = update_cte(s, icid, valid, rdbase);
+    }
+
+    return res;
+}
+
+static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
+                              uint8_t size, uint64_t itt_addr)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t value;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    uint64_t dte = 0;
+    MemTxResult res = MEMTX_OK;
+
+    if (s->dt.valid) {
+        if (valid) {
+            /* add mapping entry to device table */
+            dte = (valid & VALID_MASK) |
+                  ((size & SIZE_MASK) << 1U) |
+                  ((itt_addr & ITTADDR_MASK) << 6ULL);
+        }
+    } else {
+        return res;
+    }
+
+    /*
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    if (s->dt.indirect) {
+        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+
+            l2t_addr = value & ((1ULL << 51) - 1);
+
+            address_space_stq_le(as, l2t_addr +
+                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
+        }
+    } else {
+        /* Flat level table */
+        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
+                             dte, MEMTXATTRS_UNSPECIFIED, &res);
+    }
+    return res;
+}
+
+static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid;
+    uint8_t size;
+    uint64_t itt_addr;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+
+    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if ((devid > s->dt.max_devids) ||
+        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS MAPD: invalid device table attributes "
+                      "devid %d or size %d\n", devid, size);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        res = update_dte(s, devid, valid, size, itt_addr);
+    }
+
+    return res;
+}
+
+/*
+ * Current implementation blocks until all
+ * commands are processed
+ */
+static void process_cmdq(GICv3ITSState *s)
+{
+    uint32_t wr_offset = 0;
+    uint32_t rd_offset = 0;
+    uint32_t cq_offset = 0;
+    uint64_t data;
+    AddressSpace *as = &s->gicv3->dma_as;
+    MemTxResult res = MEMTX_OK;
+    uint8_t cmd;
+
+    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        return;
+    }
+
+    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
+
+    if (wr_offset > s->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid write offset "
+                      "%d\n", __func__, wr_offset);
+        return;
+    }
+
+    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
+                                    MEMTXATTRS_UNSPECIFIED, &res);
+        cmd = (data & CMD_MASK);
+
+        switch (cmd) {
+        case GITS_CMD_INT:
+            break;
+        case GITS_CMD_CLEAR:
+            break;
+        case GITS_CMD_SYNC:
+            /*
+             * Current implementation makes a blocking synchronous call
+             * for every command issued earlier, hence the internal state
+             * is already consistent by the time SYNC command is executed.
+             * Hence no further processing is required for SYNC command.
+             */
+            break;
+        case GITS_CMD_MAPD:
+            res = process_mapd(s, data, cq_offset);
+            break;
+        case GITS_CMD_MAPC:
+            res = process_mapc(s, cq_offset);
+            break;
+        case GITS_CMD_MAPTI:
+            break;
+        case GITS_CMD_MAPI:
+            break;
+        case GITS_CMD_DISCARD:
+            break;
+        default:
+            break;
+        }
+        if (res == MEMTX_OK) {
+            rd_offset++;
+            rd_offset %= s->cq.max_entries;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
+        } else {
+            /*
+             * in this implementation,in case of dma read/write error
+             * we stall the command processing
+             */
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: %x cmd processing failed!!\n", __func__, cmd);
+            break;
+        }
+    }
+}
+
 static void extract_table_params(GICv3ITSState *s)
 {
     uint16_t num_pages = 0;
@@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32,
                                (value & ~R_GITS_CWRITER_RETRY_MASK));
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32,
@@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CREADR:
     case GITS_TYPER:
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index d6aaa94e4c..0932a30560 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
 FIELD(GITS_CBASER, INNERCACHE, 59, 3)
 FIELD(GITS_CBASER, VALID, 63, 1)
 
+FIELD(GITS_CREADR, STALLED, 0, 1)
+FIELD(GITS_CREADR, OFFSET, 5, 15)
+
 FIELD(GITS_CWRITER, RETRY, 0, 1)
 FIELD(GITS_CWRITER, OFFSET, 5, 15)
 
@@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define L1TABLE_ENTRY_SIZE         8
 
 #define GITS_CMDQ_ENTRY_SIZE               32
+#define NUM_BYTES_IN_DW                     8
+
+#define CMD_MASK                  0xff
+
+/* ITS Commands */
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_INT              0x03
+#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_MAPD             0x08
+#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_SYNC             0x05
+
+/* MAPC command fields */
+#define ICID_LENGTH                  16
+#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
+FIELD(MAPC, RDBASE, 16, 32)
+
+#define RDBASE_PROCNUM_LENGTH        16
+#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH) - 1)
+
+#define DEVID_SHIFT                  32
+#define DEVID_LENGTH                 32
+#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
+
+/* MAPD command fields */
+#define ITTADDR_LENGTH               44
+#define ITTADDR_SHIFT                 8
+#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
+#define SIZE_MASK                 0x1f
+
+#define VALID_SHIFT               63
+#define VALID_MASK                1ULL
 
 /**
  * Default features advertised by this version of ITS
-- 
2.27.0


