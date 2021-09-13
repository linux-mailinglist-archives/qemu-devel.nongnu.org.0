Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB4409904
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:26:02 +0200 (CEST)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPomP-0004y1-Ox
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYo-0000x7-J2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYm-00089M-Dk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso393713wme.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GJlp/P7OhsPJD6qDW238HHIaWRncW9StTyBdqOo0xTo=;
 b=VUozuQqmH2HgZvZcxgrTMJkaVEFmhSEUHt7DmSSwQo6UmNZPRnQiw5GAzuAH18+EEP
 xn6Um9UhhbCPF/lYfQSAWW8jNzRRnXK6P8hN/o1Y7NZLZAcT7qWm0IyO6W9zrhyD+zAW
 ZMovct5678mCYfhRspJh8390t//87PhAsq/oT99IuKhRrFHklT8EARHLvFhMdnkjnQ4Q
 BkcBEy8Avn7BSmCjcZZjpnTKmPAdME6N6TBKMffJxY+5uA66tevuhRfhrrEiCF2VfLDc
 1XuB3cFk+R+ApBTDlGuUJ6P13OfFaqlefzRWKxotAE2y62tiKwx7vqwRv8ok8lS+X9Ei
 TAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJlp/P7OhsPJD6qDW238HHIaWRncW9StTyBdqOo0xTo=;
 b=UpKsT94gx8SGlh2NAN9OMZErtGctbAMDK6H4Za7XzZ4PDv/zWtmqrz4dEv8EW05Pd+
 TB5VN4UykKCUWfWBFjrjQRWEYLY0NcYbwDrL1z5ZC/rbuvehWO/bP1RqoEdu/SiAK0RW
 zif6Ra1WKZ3FxpQWjiutLTP4MsCYzO6OlyeOrPzKBkRBgPonSNwxireAQ+nAPTMC2Rvx
 qR5tx3MFSOM78dDq2JpeTRsXk32bsqsTmxNtNtb2N61ZGxDN3sq2lsXFuCRpRA+CWMlJ
 pp2tx9dn37zu32sXE+ZuContJBNXYNb3svR9Js/bhxpXCTxtlKiCOvq8/fgbRxmSStCu
 v6UQ==
X-Gm-Message-State: AOAM530FwhpCXWxgHzmCssjlDw/jlNgA+ZNFZrJxVd6JnzrKssRe/KCI
 qq1OA8VQsfODpzPfJvgcHrk2u8Zl1eqLvQ==
X-Google-Smtp-Source: ABdhPJyvzjkyk3cSXDjXN40ZbQZrjYhXr59GohK6/yJ5j33xL7617EyNimIj0JehuyyLdmf5KUSMlw==
X-Received: by 2002:a1c:3b41:: with SMTP id i62mr12132743wma.38.1631549515003; 
 Mon, 13 Sep 2021 09:11:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] hw/intc: GICv3 ITS command queue framework
Date: Mon, 13 Sep 2021 17:11:32 +0100
Message-Id: <20210913161144.12347-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shashi Mallela <shashi.mallela@linaro.org>

Added functionality to trigger ITS command queue processing on
write to CWRITE register and process each command queue entry to
identify the command type and handle commands like MAPD,MAPC,SYNC.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Message-id: 20210910143951.92242-4-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  40 +++++
 hw/intc/arm_gicv3_its.c  | 319 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 359 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 92e0a4fa686..034fadfebeb 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -304,6 +304,43 @@ FIELD(GITS_TYPER, CIL, 36, 1)
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
+#define GITS_CMD_INV              0x0C
+#define GITS_CMD_INVALL           0x0D
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
+/* MAPD command fields */
+#define ITTADDR_LENGTH               44
+#define ITTADDR_SHIFT                 8
+#define ITTADDR_MASK             MAKE_64BIT_MASK(ITTADDR_SHIFT, ITTADDR_LENGTH)
+#define SIZE_MASK                 0x1f
+
+#define DEVID_SHIFT                  32
+#define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
+
+#define VALID_SHIFT               63
+#define CMD_FIELD_VALID_MASK      (1ULL << VALID_SHIFT)
+#define L2_TABLE_VALID_MASK       CMD_FIELD_VALID_MASK
+#define TABLE_ENTRY_VALID_MASK    (1ULL << 0)
 
 /**
  * Default features advertised by this version of ITS
@@ -337,6 +374,9 @@ FIELD(GITS_TYPER, CIL, 36, 1)
  * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
  */
 #define GITS_DTE_SIZE                 (0x8ULL)
+#define GITS_DTE_ITTADDR_SHIFT           6
+#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
+                                                      ITTADDR_LENGTH)
 
 /*
  * 8 bytes Collection Table Entry size
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8234939ccc1..fcd152271a6 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -50,6 +50,318 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
+                       uint64_t rdbase)
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
+        return true;
+    }
+
+    if (valid) {
+        /* add mapping entry to collection table */
+        cte = (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
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
+            return false;
+        }
+
+        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
+    if (res != MEMTX_OK) {
+        return false;
+    } else {
+        return true;
+    }
+}
+
+static bool process_mapc(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint16_t icid;
+    uint64_t rdbase;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    bool result = false;
+    uint64_t value;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    icid = value & ICID_MASK;
+
+    rdbase = (value & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+    rdbase &= RDBASE_PROCNUM_MASK;
+
+    valid = (value & CMD_FIELD_VALID_MASK);
+
+    if ((icid > s->ct.maxids.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS MAPC: invalid collection table attributes "
+                      "icid %d rdbase %lu\n",  icid, rdbase);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        result = update_cte(s, icid, valid, rdbase);
+    }
+
+    return result;
+}
+
+static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
+                       uint8_t size, uint64_t itt_addr)
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
+            dte = (valid & TABLE_ENTRY_VALID_MASK) |
+                  ((size & SIZE_MASK) << 1U) |
+                  (itt_addr << GITS_DTE_ITTADDR_SHIFT);
+        }
+    } else {
+        return true;
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
+            return false;
+        }
+
+        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
+    if (res != MEMTX_OK) {
+        return false;
+    } else {
+        return true;
+    }
+}
+
+static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid;
+    uint8_t size;
+    uint64_t itt_addr;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    bool result = false;
+
+    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
+
+    valid = (value & CMD_FIELD_VALID_MASK);
+
+    if ((devid > s->dt.maxids.max_devids) ||
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
+        result = update_dte(s, devid, valid, size, itt_addr);
+    }
+
+    return result;
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
+    bool result = true;
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
+    if (rd_offset > s->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid read offset "
+                      "%d\n", __func__, rd_offset);
+        return;
+    }
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
+                                    MEMTXATTRS_UNSPECIFIED, &res);
+        if (res != MEMTX_OK) {
+            result = false;
+        }
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
+            result = process_mapd(s, data, cq_offset);
+            break;
+        case GITS_CMD_MAPC:
+            result = process_mapc(s, cq_offset);
+            break;
+        case GITS_CMD_MAPTI:
+            break;
+        case GITS_CMD_MAPI:
+            break;
+        case GITS_CMD_DISCARD:
+            break;
+        case GITS_CMD_INV:
+        case GITS_CMD_INVALL:
+            break;
+        default:
+            break;
+        }
+        if (result) {
+            rd_offset++;
+            rd_offset %= s->cq.max_entries;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
+        } else {
+            /*
+             * in this implementation, in case of dma read/write error
+             * we stall the command processing
+             */
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: %x cmd processing failed\n", __func__, cmd);
+            break;
+        }
+    }
+}
+
 /*
  * This function extracts the ITS Device and Collection table specific
  * parameters (like base_addr, size etc) from GITS_BASER register.
@@ -204,6 +516,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
+            process_cmdq(s);
         }
         break;
     case GITS_CBASER:
@@ -231,6 +544,9 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32,
                                (value & ~R_GITS_CWRITER_RETRY_MASK));
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32, value);
@@ -377,6 +693,9 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CREADR:
         if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
-- 
2.20.1


