Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D049FD9D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:06:34 +0100 (CET)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTlh-0008Ap-TU
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0002Dm-4I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::32d] (port=37424
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0006R4-Tq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8456191wmj.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I1PnaZczgSNORCn8G6PIZwsznNCUUzHheMJRzmHG7kk=;
 b=zl+xF80p4E+CNp+1E8Vo/Tc0xcnBPRiu9N/PlVRFSkfyNgDKrU1P14C0A4Syj26P3d
 kx1BPnA2DHOUqB+yzOuRA9/GyFKlBtPbiFj+uccDAln0ShM2luixLUgg72JjZ9MejEys
 ulufJvE8MSSxu5PhlgzanEi6Dvhjy7SoWVTJW1Ps3YoEddPTDMHvR6j9k80muqhT9ITf
 vzQAVPYXV0PqzN3W4BaBfrVdfFr3uC5jEs0RD+ni4gCDA3iTi5fy6RsX3RPt7LsI3DH7
 yHoAtDMMAY+MCv8FYEYOr+3WzqAkIM0kc8PZA/zZN2kuiYK0d1rfGD+XIq5jPdL3XnC/
 uj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1PnaZczgSNORCn8G6PIZwsznNCUUzHheMJRzmHG7kk=;
 b=saVhAb/w87ZDWFr+D0o3L2QON5F8ld/W0WgNm9PCSZVSHa567mnLlSD5fefD81vitI
 Acz00rY3h5sjzFA/OPDKK00kTn1zIIpDRrqgMlUnb2w8A+JyYcNDyEN06sUuW17qf2oG
 lu3+bg8vpqL3/QrREcMmdQX4oGZEcPJCXZ9UhgXziqq69+86ROkx301b4844QMH0wNuw
 PpNFuATxvBC43knRNNGFbYRsns1GOKt3HwgpU0HlkNVIzkX/EZVlPSz2Qti0J5kLKd0Y
 bsm5NvZiEziDNz+qx58FayUAhNXapc+4zBVnztepYXtGDgVf3CZaVtsaQBLjT+5xXkBC
 Nalw==
X-Gm-Message-State: AOAM530ushC0fGp+bKiSOkmVar65YUGbAB3owour7kQ0e7Qtnpp80p6e
 PYXK6bGnlm/7wGXsuAXAr4UgAUmE3mEZUA==
X-Google-Smtp-Source: ABdhPJzFxRQkEXwRoQv3G65gCqA+0b9GLiTMVs5tRIfYI9meJ9m6NJRZCe/cVaSVKUr9epE0+iuxQQ==
X-Received: by 2002:a05:600c:3583:: with SMTP id
 p3mr15006984wmq.172.1643383840755; 
 Fri, 28 Jan 2022 07:30:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/32] hw/intc/arm_gicv3_its: Implement MOVALL
Date: Fri, 28 Jan 2022 15:30:06 +0000
Message-Id: <20220128153009.2467560-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the ITS MOVALL command, which takes all the pending
interrupts on a source redistributor and makes the not-pending on
that source redistributor and pending on a destination redistributor.

This is a GICv3 ITS command which we forgot to implement. (It is
not used by Linux guests.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-14-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 16 +++++++++++
 hw/intc/arm_gicv3_its.c    | 55 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c | 54 +++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index a316f6c58a5..da45975d92b 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -324,6 +324,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_MAPI             0x0B
 #define GITS_CMD_INV              0x0C
 #define GITS_CMD_INVALL           0x0D
+#define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
 
 /* MAPC command fields */
@@ -355,6 +356,10 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define L2_TABLE_VALID_MASK       CMD_FIELD_VALID_MASK
 #define TABLE_ENTRY_VALID_MASK    (1ULL << 0)
 
+/* MOVALL command fields */
+FIELD(MOVALL_2, RDBASE1, 16, 36)
+FIELD(MOVALL_3, RDBASE2, 16, 36)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -497,6 +502,17 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs);
  * an incoming migration has loaded new state.
  */
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
+/**
+ * gicv3_redist_movall_lpis:
+ * @src: source redistributor
+ * @dest: destination redistributor
+ *
+ * Scan the LPI pending table for @src, and for each pending LPI there
+ * mark it as not-pending for @src and pending for @dest, as required
+ * by the ITS MOVALL command.
+ */
+void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest);
+
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 3f2ead45369..ebc0403b3c7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -582,6 +582,58 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
 }
 
+static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
+                                   uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    MemTxResult res = MEMTX_OK;
+    uint64_t rd1, rd2;
+
+    /* No fields in dwords 0 or 1 */
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    rd1 = FIELD_EX64(value, MOVALL_2, RDBASE1);
+    if (rd1 >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: RDBASE1 %" PRId64
+                      " out of range (must be less than %d)\n",
+                      __func__, rd1, s->gicv3->num_cpu);
+        return CMD_CONTINUE;
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    rd2 = FIELD_EX64(value, MOVALL_3, RDBASE2);
+    if (rd2 >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: RDBASE2 %" PRId64
+                      " out of range (must be less than %d)\n",
+                      __func__, rd2, s->gicv3->num_cpu);
+        return CMD_CONTINUE;
+    }
+
+    if (rd1 == rd2) {
+        /* Move to same target must succeed as a no-op */
+        return CMD_CONTINUE;
+    }
+
+    /* Move all pending LPIs from redistributor 1 to redistributor 2 */
+    gicv3_redist_movall_lpis(&s->gicv3->cpu[rd1], &s->gicv3->cpu[rd2]);
+
+    return CMD_CONTINUE;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -679,6 +731,9 @@ static void process_cmdq(GICv3ITSState *s)
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
             break;
+        case GITS_CMD_MOVALL:
+            result = process_movall(s, data, cq_offset);
+            break;
         default:
             break;
         }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index d81d8e5f076..d1645ba22c6 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -681,6 +681,60 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     gicv3_redist_lpi_pending(cs, irq, level);
 }
 
+void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
+{
+    /*
+     * We must move all pending LPIs from the source redistributor
+     * to the destination. That is, for every pending LPI X on
+     * src, we must set it not-pending on src and pending on dest.
+     * LPIs that are already pending on dest are not cleared.
+     *
+     * If LPIs are disabled on dest this is CONSTRAINED UNPREDICTABLE:
+     * we choose to NOP. If LPIs are disabled on source there's nothing
+     * to be transferred anyway.
+     */
+    AddressSpace *as = &src->gic->dma_as;
+    uint64_t idbits;
+    uint32_t pendt_size;
+    uint64_t src_baddr, dest_baddr;
+    int i;
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
+    src_baddr = src->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+    dest_baddr = dest->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
+        uint8_t src_pend, dest_pend;
+
+        address_space_read(as, src_baddr + i, MEMTXATTRS_UNSPECIFIED,
+                           &src_pend, sizeof(src_pend));
+        if (!src_pend) {
+            continue;
+        }
+        address_space_read(as, dest_baddr + i, MEMTXATTRS_UNSPECIFIED,
+                           &dest_pend, sizeof(dest_pend));
+        dest_pend |= src_pend;
+        src_pend = 0;
+        address_space_write(as, src_baddr + i, MEMTXATTRS_UNSPECIFIED,
+                            &src_pend, sizeof(src_pend));
+        address_space_write(as, dest_baddr + i, MEMTXATTRS_UNSPECIFIED,
+                            &dest_pend, sizeof(dest_pend));
+    }
+
+    gicv3_redist_update_lpi(src);
+    gicv3_redist_update_lpi(dest);
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
-- 
2.25.1


