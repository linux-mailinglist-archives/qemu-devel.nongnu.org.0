Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B4350CC5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:45:50 +0200 (CEST)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnLB-0006qj-Gn
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHU-0002fW-QB
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:00 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:34308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHR-00038p-M5
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:00 -0400
Received: by mail-qk1-x72f.google.com with SMTP id g20so933764qkk.1
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kLngbFEr9GhCFoyvPAOLu0rbvy+LRo3Rc7TDtcOjkI=;
 b=GpT8vs9YkGTOLq1hvyEw4lJRI5K5o8MwmvkpOjXFmJEdI3xY7i475iHBAUXBkTA2we
 7j7yICUWDxl3D+kmtTtzOqTJkn8I9cL89VCN1+Z0DpF/umcnp9fEbQxIEtna4eANvTd2
 g7Y3aaiv1Yd0wSoQUFK0E30V1LMBQJLQkGVaptcswmLeluv59VOrLwYOzuLAK622/rmD
 jz0ijvuBqjXNUs7G/gzByeIMp+bi2MTUg+0oKPVrljCD8/5L0olwdyRH/SdtNSzADYJX
 pvEWOzTpBaHLHZtkjuNtMn4vWTKiVjqBbmjVq7cemLvPqp1HJG36M4M7tJBYjnPsMm9L
 N3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kLngbFEr9GhCFoyvPAOLu0rbvy+LRo3Rc7TDtcOjkI=;
 b=b2deXo69qLJs8s0babZHKTzTz/ctogMOcd4ban+PSkKE1KxbWqAOgd0zpFvhHbMYhV
 tySDADRBIk3CvtdUq0ZyExnm56nSFGWHo3DfYrSgAOEs3RE6oPwVDGCKRGvB37rYHe/0
 njDBZOmPQbnUncp3KHvPjoluwIyhV92KTsFFs5hS9Lum5k0OE8GgZ026GUD9zwXiI5Dp
 guQRWU8m442lA8md38ly4+bEDDEztz16pys6I7feaENMGiPYlfYcrB9lNit0BveV++TU
 99QK1b1k1RvrcqKg5OCn0TNdlU3WS+mVUTZaJTklHWYljkpwsR9rnoBAceJL1OXkFJx5
 Q97Q==
X-Gm-Message-State: AOAM533mPzA2FC4AfITjSdQ1Cqk3PdCV2nfClvIG5WmXJqiSnmTvOP2d
 pIN/7YQ0nfq50z5SHNaJz+Bk2A==
X-Google-Smtp-Source: ABdhPJywb7A8xShRiIUpL3QK8WmG2Eb1tdaL/AH3g2KgRMMaP7OoBQ82tf7dp5Hxc2R4OwBhLFfREg==
X-Received: by 2002:a05:620a:e16:: with SMTP id
 y22mr6452628qkm.310.1617244916593; 
 Wed, 31 Mar 2021 19:41:56 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:56 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 3/8] hw/intc: GICv3 ITS command queue framework
Date: Wed, 31 Mar 2021 22:41:47 -0400
Message-Id: <20210401024152.203896-4-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72f.google.com
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
 hw/intc/arm_gicv3_its.c  | 347 +++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  41 +++++
 2 files changed, 388 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 81373f049d..fcac33c836 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,347 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t rdbase;
+    uint64_t value;
+    bool pta = false;
+    MemTxResult res = MEMTX_OK;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
+        /*
+         * only bits[47:16] are considered instead of bits [51:16]
+         * since with a physical address the target address must be
+         * 64KB aligned
+         */
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
+        pta = true;
+    } else {
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
+    }
+
+    if (!pta && (rdbase < (s->gicv3->num_cpu))) {
+        /*
+         * Current implementation makes a blocking synchronous call
+         * for every command issued earlier,hence the internal state
+         * is already consistent by the time SYNC command is executed.
+         */
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    return res;
+}
+
+static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (s->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = FIELD_EX64(s->baser[1], GITS_BASER, PAGESIZE);
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / s->ct.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            address_space_write(as, l2t_addr +
+                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 &cte, sizeof(cte));
+        }
+    } else {
+        /* Flat level table */
+        address_space_write(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &cte,
+                            sizeof(cte));
+    }
+}
+
+static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint16_t icid;
+    uint64_t rdbase;
+    bool valid;
+    bool pta = false;
+    MemTxResult res = MEMTX_OK;
+    uint64_t cte_entry;
+    uint64_t value;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    icid = value & ICID_MASK;
+
+    if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
+        /*
+         * only bits[47:16] are considered instead of bits [51:16]
+         * since with a physical address the target address must be
+         * 64KB aligned
+         */
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
+        pta = true;
+    } else {
+        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
+    }
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if (valid) {
+        if ((icid > s->ct.max_collids) || (!pta &&
+                (rdbase > s->gicv3->num_cpu))) {
+            if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
+                /* Generate System Error here if supported */
+            }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: invalid collection table attributes "
+                "icid %d rdbase %lu\n", __func__, icid, rdbase);
+            /*
+             * in this implementation,in case of error
+             * we ignore this command and move onto the next
+             * command in the queue
+             */
+        } else {
+            if (s->ct.valid) {
+                /* add mapping entry to collection table */
+                cte_entry = (valid & VALID_MASK) |
+                            (pta ? ((rdbase & RDBASE_MASK) << 1ULL) :
+                            ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL));
+
+                update_cte(s, icid, cte_entry);
+            }
+        }
+    } else {
+        if (s->ct.valid) {
+            /* remove mapping entry from collection table */
+            cte_entry = 0;
+
+            update_cte(s, icid, cte_entry);
+        }
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (s->dt.indirect) {
+        /* 2 level table */
+        page_sz_type = FIELD_EX64(s->baser[0], GITS_BASER, PAGESIZE);
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / s->dt.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            address_space_write(as, l2t_addr +
+                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED, &dte, sizeof(dte));
+        }
+    } else {
+        /* Flat level table */
+        address_space_write(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &dte, sizeof(dte));
+    }
+}
+
+static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid;
+    uint8_t size;
+    uint64_t itt_addr;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    uint64_t dte_entry = 0;
+
+    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    itt_addr = (value >> ITTADDR_OFFSET) & ITTADDR_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if (valid) {
+        if ((devid > s->dt.max_devids) ||
+            (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+            if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
+                /* Generate System Error here if supported */
+            }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: invalid device table attributes "
+                "devid %d or size %d\n", __func__, devid, size);
+            /*
+             * in this implementation,in case of error
+             * we ignore this command and move onto the next
+             * command in the queue
+             */
+        } else {
+            if (s->dt.valid) {
+                /* add mapping entry to device table */
+                dte_entry = (valid & VALID_MASK) |
+                            ((size & SIZE_MASK) << 1U) |
+                            ((itt_addr & ITTADDR_MASK) << 6ULL);
+
+                update_dte(s, devid, dte_entry);
+            }
+        }
+    } else {
+        if (s->dt.valid) {
+            /* remove mapping entry from device table */
+            dte_entry = 0;
+            update_dte(s, devid, dte_entry);
+        }
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+/*
+ * Current implementation blocks until all
+ * commands are processed
+ */
+static MemTxResult process_cmdq(GICv3ITSState *s)
+{
+    uint32_t wr_offset = 0;
+    uint32_t rd_offset = 0;
+    uint32_t cq_offset = 0;
+    uint64_t data;
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    MemTxResult res = MEMTX_OK;
+    uint8_t cmd;
+
+    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
+
+    if (wr_offset > s->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: invalid write offset "
+                        "%d\n", __func__, wr_offset);
+        res = MEMTX_ERROR;
+        return res;
+    }
+
+    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
+                                      MEMTXATTRS_UNSPECIFIED, &res);
+        cmd = (data & CMD_MASK);
+
+        switch (cmd) {
+        case GITS_CMD_INT:
+            break;
+        case GITS_CMD_CLEAR:
+            break;
+        case GITS_CMD_SYNC:
+            res = process_sync(s, cq_offset);
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: %x cmd processing failed!!\n", __func__, cmd);
+            break;
+        }
+    }
+    return res;
+}
+
 static bool extract_table_params(GICv3ITSState *s, int index)
 {
     uint16_t num_pages = 0;
@@ -282,6 +623,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        if ((s->ctlr & ITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32, value);
@@ -416,6 +760,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value;
+        if ((s->ctlr & ITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
         break;
     case GITS_TYPER:
     case GITS_CREADR:
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b7701e8ca5..7e1ff426ef 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -253,6 +253,12 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
 FIELD(GITS_CBASER, INNERCACHE, 59, 3)
 FIELD(GITS_CBASER, VALID, 63, 1)
 
+FIELD(GITS_CREADR, STALLED, 0, 1)
+FIELD(GITS_CREADR, OFFSET, 5, 15)
+
+FIELD(GITS_CWRITER, RETRY, 0, 1)
+FIELD(GITS_CWRITER, OFFSET, 5, 15)
+
 FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
@@ -284,6 +290,41 @@ FIELD(GITS_TYPER, CIL, 36, 1)
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
+#define ICID_LEN                  16
+#define ICID_MASK                 ((1U << ICID_LEN) - 1)
+#define RDBASE_LEN                32
+#define RDBASE_OFFSET             16
+#define RDBASE_MASK               ((1ULL << RDBASE_LEN) - 1)
+#define RDBASE_PROCNUM_LEN        16
+#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LEN) - 1)
+
+#define DEVID_OFFSET              32
+#define DEVID_LEN                 32
+#define DEVID_MASK                ((1ULL << DEVID_LEN) - 1)
+
+/* MAPD command fields */
+#define ITTADDR_LEN               44
+#define ITTADDR_OFFSET            8
+#define ITTADDR_MASK              ((1ULL << ITTADDR_LEN) - 1)
+#define SIZE_MASK                 0x1f
+
+#define VALID_SHIFT               63
+#define VALID_MASK                0x1
 
 /**
  * Default features advertised by this version of ITS
-- 
2.27.0


