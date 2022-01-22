Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A4496D4B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:30:36 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBL9n-0000MM-PY
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:30:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0005hx-Py
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:16 -0500
Received: from [2a00:1450:4864:20::432] (port=35723
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4S-0007i4-Iy
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:06 -0500
Received: by mail-wr1-x432.google.com with SMTP id r14so5909106wrp.2
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDK8B4Dq1xfGJouKuuAJ+UquJZW2SfG7Vdo6726q22Y=;
 b=jtJwW4DiJE2oUAWC5iw8MRolHXjzeAoMC8KVoCQqwu28Jofe5lhffnZW621jyN0oD+
 cuErblqUseOE/tm9Gaq0NXcETK6Uql60EPyVX78ECd2rh5llIesBwCsLD/HEawx+Z8RN
 o8GevB9R6C3XiOCPzvAvZWHhDmwigveUcEB2miLPKYZGRnffZijfIadMnWTGJDZXiWO0
 aj0QZmeeEiFf6NWjsiMbPgHkZdy7X5KZLD2DqUvrRjx/fs4ROXwUjda1HJrBY1gKDlk/
 Y3ttK425qdOS6kBk6zqoB1fVLEJk8iyg+TE3gS9OTJCkwbYWAZmGhfgA7WpunbSAi77L
 pXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDK8B4Dq1xfGJouKuuAJ+UquJZW2SfG7Vdo6726q22Y=;
 b=4zkvEJBsYiXmYKoKLOwPJ1vNT1eggUqiyntlDUymYTRHpWKjlnbxzAnsAE2Xt+E9SA
 lLa0FaYTgnkDI0sYbpwo4Z8tmTkC/mGibSB9Fh1igG/0mRm4agO6Z9QgIJ6duRiCcLUO
 ZqMWHtu4zqGFSy9NZhrFeGb5FT02IpOsp55yuvkrBQ99+dolYtiMXtIpPbpfTtUfgdoh
 Lq8s8LqIrG3og7iqN3KwosFTamBi75og6asU1A4SZBj84j07UFlCojJy+Xu9ItboF77f
 cwnR6YJ5wkcu6woxUjZYa/02Qn3hbBDonwFsDbB976njfYLTxTPpmpTxGjekcyd0BxZE
 eyAA==
X-Gm-Message-State: AOAM530sJrAxA8+quHh9UzmPjJEXXiXKmUHIRkIEEdKxicXbfC/nHyC1
 UeOuIt4tZp0s6BJYmjVXM6R38vr1xoU0DA==
X-Google-Smtp-Source: ABdhPJwBsjdLoruHPanF92R/anMzaG/7vZEKqx08cnBUf5LZVm5YU0/q9N302+XnP7Q1tZg/+whXZw==
X-Received: by 2002:a5d:59ad:: with SMTP id p13mr8556415wrr.16.1642875896636; 
 Sat, 22 Jan 2022 10:24:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/14] hw/intc/arm_gicv3_its: Implement MOVI
Date: Sat, 22 Jan 2022 18:24:44 +0000
Message-Id: <20220122182444.724087-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the ITS MOVI command. This command specifies a (physical) LPI
by DeviceID and EventID and provides a new ICID for it. The ITS must
find the interrupt translation table entry for the LPI, which will
tell it the old ICID. It then moves the pending state of the LPI from
the old redistributor to the new one and updates the ICID field in
the translation table entry.

This is another GICv3 ITS command that we forgot to implement.  Linux
does use this one, but only if the guest powers off one of its CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
All the "validate guest command argument, log and return if bad"
logic feels very clunky here...
---
 hw/intc/gicv3_internal.h   |  16 ++++
 hw/intc/arm_gicv3_its.c    | 146 +++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c |  53 ++++++++++++++
 3 files changed, 215 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index da45975d92b..b1af26df9f4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -315,6 +315,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define CMD_MASK                  0xff
 
 /* ITS Commands */
+#define GITS_CMD_MOVI             0x01
 #define GITS_CMD_INT              0x03
 #define GITS_CMD_CLEAR            0x04
 #define GITS_CMD_SYNC             0x05
@@ -360,6 +361,11 @@ FIELD(MAPC, RDBASE, 16, 32)
 FIELD(MOVALL_2, RDBASE1, 16, 36)
 FIELD(MOVALL_3, RDBASE2, 16, 36)
 
+/* MOVI command fields */
+FIELD(MOVI_0, DEVICEID, 32, 32)
+FIELD(MOVI_1, EVENTID, 0, 32)
+FIELD(MOVI_2, ICID, 0, 16)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -502,6 +508,16 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs);
  * an incoming migration has loaded new state.
  */
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
+/**
+ * gicv3_redist_mov_lpi:
+ * @src: source redistributor
+ * @dest: destination redistributor
+ * @irq: LPI to update
+ *
+ * Move the pending state of the specified LPI from @src to @dest,
+ * as required by the ITS MOVI command.
+ */
+void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq);
 /**
  * gicv3_redist_movall_lpis:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ebc0403b3c7..51d9be4ae6f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -634,6 +634,149 @@ static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
     return CMD_CONTINUE;
 }
 
+static ItsCmdResult process_movi(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    MemTxResult res = MEMTX_OK;
+    uint32_t devid, eventid, intid;
+    uint16_t old_icid, new_icid;
+    uint64_t old_cte, new_cte;
+    uint64_t old_rdbase, new_rdbase;
+    uint64_t dte;
+    bool dte_valid, ite_valid, cte_valid;
+    uint64_t num_eventids;
+    IteEntry ite = {};
+
+    devid = FIELD_EX64(value, MOVI_0, DEVICEID);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    eventid = FIELD_EX64(value, MOVI_1, EVENTID);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    new_icid = FIELD_EX64(value, MOVI_2, ICID);
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+    dte = get_dte(s, devid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
+    if (!dte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d\n",
+                      __func__, dte, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    ite_valid = get_ite(s, eventid, dte, &old_icid, &intid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    if (old_icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
+                      __func__, old_icid);
+        return CMD_CONTINUE;
+    }
+
+    if (new_icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: ICID 0x%x\n",
+                      __func__, new_icid);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, old_icid, &old_cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, old_cte);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, new_icid, &new_cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, new_cte);
+        return CMD_CONTINUE;
+    }
+
+    old_rdbase = FIELD_EX64(old_cte, CTE, RDBASE);
+    if (old_rdbase >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
+                      __func__, old_rdbase);
+        return CMD_CONTINUE;
+    }
+
+    new_rdbase = FIELD_EX64(new_cte, CTE, RDBASE);
+    if (new_rdbase >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
+                      __func__, new_rdbase);
+        return CMD_CONTINUE;
+    }
+
+    if (old_rdbase != new_rdbase) {
+        /* Move the LPI from the old redistributor to the new one */
+        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_rdbase],
+                             &s->gicv3->cpu[new_rdbase],
+                             intid);
+    }
+
+    /* Update the ICID field in the interrupt translation table entry */
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
+    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -731,6 +874,9 @@ static void process_cmdq(GICv3ITSState *s)
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
             break;
+        case GITS_CMD_MOVI:
+            result = process_movi(s, data, cq_offset);
+            break;
         case GITS_CMD_MOVALL:
             result = process_movall(s, data, cq_offset);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index d1645ba22c6..412a04f59cf 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -681,6 +681,59 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     gicv3_redist_lpi_pending(cs, irq, level);
 }
 
+void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
+{
+    /*
+     * Move the specified LPI's pending state from the source redistributor
+     * to the destination.
+     *
+     * If LPIs are disabled on dest this is CONSTRAINED UNPREDICTABLE:
+     * we choose to NOP. If LPIs are disabled on source there's nothing
+     * to be transferred anyway.
+     */
+    AddressSpace *as = &src->gic->dma_as;
+    uint64_t idbits;
+    uint32_t pendt_size;
+    uint64_t src_baddr;
+    uint8_t src_pend;
+
+    if (!(src->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
+        !(dest->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
+        return;
+    }
+
+    idbits = MIN(FIELD_EX64(src->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+    idbits = MIN(FIELD_EX64(dest->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 idbits);
+
+    pendt_size = 1ULL << (idbits + 1);
+    if ((irq / 8) >= pendt_size) {
+        return;
+    }
+
+    src_baddr = src->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    address_space_read(as, src_baddr + (irq / 8),
+                       MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
+    if (!extract32(src_pend, irq % 8, 1)) {
+        /* Not pending on source, nothing to do */
+        return;
+    }
+    src_pend &= ~(1 << (irq % 8));
+    address_space_write(as, src_baddr + (irq / 8),
+                        MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
+    if (irq == src->hpplpi.irq) {
+        /*
+         * We just made this LPI not-pending so only need to update
+         * if it was previously the highest priority pending LPI
+         */
+        gicv3_redist_update_lpi(src);
+    }
+    /* Mark it pending on the destination */
+    gicv3_redist_lpi_pending(dest, irq, 1);
+}
+
 void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
 {
     /*
-- 
2.25.1


