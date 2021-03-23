Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF73456A6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:20:19 +0100 (CET)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYWg-0001B2-Qm
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPc-0000jt-H8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:00 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPM-0006bJ-Aq
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:12:57 -0400
Received: by mail-qk1-x735.google.com with SMTP id c4so13111964qkg.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=te6zLYq8PJH8MbvrLGCtpL7G2FDmfaJBuFqu6R6k4qU=;
 b=jcvTIemWcdTOKcPmlG8XLDDFdBSJMDADR1QzBk++IGSU3NTqiBgqnrF95tO3APvJej
 XeR0CV8xIZISw/F/qcmeXS3yCywA31nFmScfAL7w+bUtxz3thT4OoO3dI3obAD6wp754
 UndKxTxoL6LLkeoN6Nzik4EnhCdlsWd1TvwGVisCgaQeiUI6xHlPtqErlgXXg64Kdc4E
 wHryWlTFMASHnjIyMbeGelD3dUKW2UMGJWdhq6iJJ+JsJU1rvmMTk8uOsISlW4UXVlQJ
 w9GvL0UkzojB1Lo+0tsDxwHKNydwlwgYOz9MQ9IahAqoXxhMUbRibdqhVDgEW09YMV88
 4u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=te6zLYq8PJH8MbvrLGCtpL7G2FDmfaJBuFqu6R6k4qU=;
 b=a3HXo17Fp+cUopfYodFBb11cwqiFMaJGC6BzENTL/jfpGMYgJ3iBo4Q/28MRADY39t
 VG3RcNpFLwn7g1QSB3gqNrObNW5QBRzhB/t3DDHoP5y0x1t53F4jTe+6i4Z8mMghyOiP
 xHpVudMpCNuXMMQCpFTuySa/2uOc76LHoSWMoJRyXx+ypLGOdszUyiEY6vGhLPtp48Gb
 pJjeG8bdifrzjsUZ5jEbf135dqW+ujH3moNUdT431Xmbs6Wa2T3wRZke30nhNBqQEFkx
 d1V4LyaijcyCTthzp0Aa8SQOjro98auvzWScYYXaT0uN4za8dBe2a6zrek5/5l5CdvuU
 hgzQ==
X-Gm-Message-State: AOAM533w/Xxq2vMV9y6tP3Z2dYqagNwSTaOWcWPL20JqFYNXmIsLeWFF
 KPeaOQqydiTzZ7TCvM4Gok/O2g==
X-Google-Smtp-Source: ABdhPJxU7ZQmZr1HHeGjrjpGIcByLFl3ERI5hFaZeoIBcTRqs2srFUgUFBF0JhWw9QmdajxynZtt3w==
X-Received: by 2002:a37:5f04:: with SMTP id t4mr3523364qkb.440.1616472762421; 
 Mon, 22 Mar 2021 21:12:42 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:42 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 3/8] hw/intc: GICv3 ITS command queue framework
Date: Tue, 23 Mar 2021 00:12:33 -0400
Message-Id: <20210323041238.133835-4-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/intc/arm_gicv3_its.c | 362 ++++++++++++++++++++
 1 file changed, 362 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 4895d32e67..9b094e1f0a 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -56,6 +56,362 @@ struct GICv3ITSClass {
     CmdQDesc      cq;
 };
 
+static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t rdbase;
+    uint64_t value;
+    bool pta = false;
+    MemTxResult res = MEMTX_OK;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+    if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
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
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
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
+                                     c->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->ct.entry_sz;
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
+        address_space_write(as, c->ct.base_addr + (icid * GITS_CTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &cte,
+                            sizeof(cte));
+    }
+}
+
+static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
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
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    icid = value & ICID_MASK;
+
+    if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
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
+        if ((icid > c->ct.max_collids) || (!pta &&
+                (rdbase > s->gicv3->num_cpu))) {
+            if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                             GITS_TYPER_SEIS_MASK) {
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
+            if (c->ct.valid) {
+                /* add mapping entry to collection table */
+                cte_entry = (valid & VALID_MASK) |
+                            (pta ? ((rdbase & RDBASE_MASK) << 1ULL) :
+                            ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL));
+
+                update_cte(s, icid, cte_entry);
+            }
+        }
+    } else {
+        if (c->ct.valid) {
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
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint64_t value;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (c->dt.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
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
+                                     c->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->dt.entry_sz;
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
+        address_space_write(as, c->dt.base_addr + (devid * GITS_DTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &dte, sizeof(dte));
+    }
+}
+
+static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
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
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    itt_addr = (value >> ITTADDR_OFFSET) & ITTADDR_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if (valid) {
+        if ((devid > c->dt.max_devids) ||
+            (size > ((s->typer >> GITS_TYPER_IDBITS_OFFSET) &
+                          GITS_TYPER_IDBITS_MASK))) {
+            if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                             GITS_TYPER_SEIS_MASK) {
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
+            if (c->dt.valid) {
+                /* add mapping entry to device table */
+                dte_entry = (valid & VALID_MASK) |
+                            ((size & SIZE_MASK) << 1U) |
+                            ((itt_addr & ITTADDR_MASK) << 6ULL);
+
+                update_dte(s, devid, dte_entry);
+            }
+        }
+    } else {
+        if (c->dt.valid) {
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
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    uint32_t wr_offset = 0;
+    uint32_t rd_offset = 0;
+    uint32_t cq_offset = 0;
+    uint64_t data;
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    MemTxResult res = MEMTX_OK;
+    uint8_t cmd;
+
+    wr_offset = (s->cwriter >> GITS_CWRITER_OFFSET) &
+                             GITS_CWRITER_OFFSET_MASK;
+
+    if (wr_offset > c->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: invalid write offset "
+                        "%d\n", __func__, wr_offset);
+        res = MEMTX_ERROR;
+        return res;
+    }
+
+    rd_offset = (s->creadr >> GITS_CREADR_OFFSET) &
+                             GITS_CREADR_OFFSET_MASK;
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, c->cq.base_addr + cq_offset,
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
+            rd_offset %= c->cq.max_entries;
+            s->creadr = (rd_offset << GITS_CREADR_OFFSET);
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
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
@@ -325,6 +681,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        if ((s->ctlr & GITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32, value);
@@ -459,6 +818,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value;
+        if ((s->ctlr & GITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
+            result = process_cmdq(s);
+        }
         break;
     case GITS_TYPER:
     case GITS_CREADR:
-- 
2.27.0


