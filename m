Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659F3BE0D7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:23:25 +0200 (CEST)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xDg-0000I8-EI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x99-0000DI-Cz
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:43 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8l-0001Nu-Vv
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:43 -0400
Received: by mail-qk1-x72d.google.com with SMTP id a6so485695qka.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGyP9cFCj2fGmwrSHtTwRB/4lMmCANuJJgI13JIkXjg=;
 b=zbgjwU0XBTk4wtlhEo2BckWHXvMmkz6/J/ob/Z8q6jqlR6GKwL6NNfited6EQivu8y
 fBaEwJ+S5VP4ifVvpbMPQIzhA/wEMvE0bobaxP7nw7LzgAWawQFTxcPI9HHvMcc8z2a4
 c07ypLsBsp1GxKzaq6uA4wss+O6GXSnf+4CMN+W9EegvJP3w8bTG5wnTgasUyiia/mBk
 yMjEJ9ZIUcPLIsjey9+YMe7/MFjY1LK3ss+XMYDGH5t/49VwjO/w3BWxDUytRs1FMRZ8
 m3iYETeaGph4wmVee6IgWkZ88JqY1TwH8sdQT1PTqoEe/KbDilm1SwrUpeFB1p4h5HTG
 R1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGyP9cFCj2fGmwrSHtTwRB/4lMmCANuJJgI13JIkXjg=;
 b=EI3neV4fFV92SAk/qkpMlbb6xo9D9V1PJRIUw95UNM6AV78M1iAS5PVf6lWZqDP0OI
 3jzvc6W7CxWuo3PsSW0iV8vdzUxVQwKhnU0I97VSD+TRedMTN2nwAAkL6l9SBT4j4DWs
 jLIssikzAoIm/LqYhHwOwSiWRrBZhVpHNbG3rLPO8dXpksXAQIf8SngNHkD2XlIvNVpE
 q2CjXGBTP/BEq98jIU5u8EErtI/hpvaaPk6qXmSBboHtk0IIZQbKZJaVhdMRQsaXlr3x
 GZMfgTzYhaMUHxPFtWzublZcuXTqmR4hVonY/e8uu3TAZfgVrE0VRBK9vxIsr6GXn7TZ
 H61g==
X-Gm-Message-State: AOAM530QLeLXSI/XFebheUHAXiPOe5YghciaRLqdC5kgEdoHp+ro5/w4
 4gqjeQ+jYw1MYqxfiDz8pOaooA==
X-Google-Smtp-Source: ABdhPJyuSfnWKQznviIALGUr8sVOtqc1wkSN39pvBP2LcqjBFKbKCZUHXQ9kN/1kUXF9mvzsSiGBEQ==
X-Received: by 2002:a05:620a:1a14:: with SMTP id
 bk20mr20919058qkb.361.1625624299145; 
 Tue, 06 Jul 2021 19:18:19 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:18 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 03/10] hw/intc: GICv3 ITS command queue framework
Date: Tue,  6 Jul 2021 22:18:08 -0400
Message-Id: <20210707021815.45938-4-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added functionality to trigger ITS command queue processing on
write to CWRITE register and process each command queue entry to
identify the command type and handle commands like MAPD,MAPC,SYNC.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its.c  | 305 +++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  40 +++++
 2 files changed, 345 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 683d40182f..05cdc15e77 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -50,6 +50,304 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
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
+            return res;
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
+            dte = (valid & TABLE_ENTRY_VALID_MASK) |
+                  ((size & SIZE_MASK) << 1U) |
+                  (itt_addr << GITS_DTE_ITTADDR_SHIFT);
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
+    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
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
+        case GITS_CMD_INV:
+        case GITS_CMD_INVALL:
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
@@ -206,6 +504,7 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
+            process_cmdq(s);
         }
         break;
     case GITS_CBASER:
@@ -233,6 +532,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32,
                                (value & ~R_GITS_CWRITER_RETRY_MASK));
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32, value);
@@ -379,6 +681,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        if (s->cwriter != s->creadr) {
+            process_cmdq(s);
+        }
         break;
     case GITS_CREADR:
         if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 2756561a94..3e149e3877 100644
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
@@ -338,6 +375,9 @@ FIELD(GITS_TYPER, CIL, 36, 1)
  * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
  */
 #define GITS_DTE_SIZE                 (0x8ULL)
+#define GITS_DTE_ITTADDR_SHIFT           6
+#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
+                                                      ITTADDR_LENGTH)
 
 /*
  * 8 bytes Collection Table Entry size
-- 
2.27.0


