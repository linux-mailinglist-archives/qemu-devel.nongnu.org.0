Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDD4F9801
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:27:40 +0200 (CEST)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpaN-0002zV-F8
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPC-0006ou-VQ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0002G6-TL
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id v2so2197611wrv.13
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrqFewR1f0mSQHOdTAILd1OutcJSbJ3Z6zOAySPXrP4=;
 b=y8L6VHm/EwW8VeBj2F+lRV4mB/znR9cZjsfbV3CcIfUkiZmcLjNh0snkdSW1JMGcxn
 KqNLNlBDyFPouqFoTiK23+s3B6esGR+lBTbwrUxl0UqOiY2H93kRBqlE/2hKjfQGtTHY
 +8hsA+YvF76u0In2K59wYeM+GNlGJpciJX7++5YXzOk1E/AOUigRoQVFgPy93S9sCkcA
 USH/XOzfO+qNTC0cfW/J8Ms/xwObjS20mv3VvPQR2H0+KokcD0a0X9zhkEH/YMcWz3bx
 1OaV7Ena35m3u+nOZTMjCO1GuULWn3IarI7wIbordl4d7nuqZwtTrTwSJ6sVkzQ/aLUT
 0noQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrqFewR1f0mSQHOdTAILd1OutcJSbJ3Z6zOAySPXrP4=;
 b=CXx9G/hc1Nu7Sg+K997IsvAcbaaeUKq1Sd3KMe6D4XmvOd8CaI3nJ1urJX2MNdG589
 MsD9vuMUVfcTvYh7kzrVcl/Tcf/YYM00U/w3nzmKxR/Zbj8Bw5S4iFTFplYXRRk/Zz+g
 czU1CnrpKNGycJY8vSzjIK8DSYbr1QYGKzZRGS41Wd+lHZclroR/m/osgxxwNKUNMdJk
 ZvjrcijHsuHUEMu3w15OktFev2BvYybuRwdyBk0bKSqntGs1+OgtHo8F1dx07MGMAHzn
 ebEue69tzjLK7oukeGSeqt1XdkBBjhN7vQoxg0Ale/bTJHoa7gWUwpGrJLup6nhPdgOm
 Xp3A==
X-Gm-Message-State: AOAM531cQeSTWrVfgsKLj+jBw7JJLScBSkj7s+W2C3wFlXrLkCmH3AZs
 Y79DYTpr1Np3sflCcVjyp6Yn2Q==
X-Google-Smtp-Source: ABdhPJye4Yiftm3pvjbt28s3QKGVckBY/uCXGpWVYUN2/L8au0e9s34eiWk98lFzTpUr9MSMb1B83Q==
X-Received: by 2002:a5d:53c8:0:b0:206:1c8e:2a4b with SMTP id
 a8-20020a5d53c8000000b002061c8e2a4bmr14516098wrw.370.1649427362590; 
 Fri, 08 Apr 2022 07:16:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/41] hw/intc/arm_gicv3_its: Implement VMAPP
Date: Fri,  8 Apr 2022 15:15:18 +0100
Message-Id: <20220408141550.1271295-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the GICv4 VMAPP command, which writes an entry to the vPE
table.

For GICv4.1 this command has extra fields in the command packet
and additional behaviour. We define the 4.1-only fields with the
FIELD macro, but only implement the GICv4.0 version of the command.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
GICv4.1 emulation is on my todo list, but I'm starting with
just the 4.0 parts first.
---
 hw/intc/gicv3_internal.h | 12 ++++++
 hw/intc/arm_gicv3_its.c  | 88 ++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events     |  2 +
 3 files changed, 102 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index d3670a8894e..bbb8a20ce61 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
 
@@ -377,6 +378,17 @@ FIELD(VMAPTI_1, VPEID, 32, 16)
 FIELD(VMAPTI_2, VINTID, 0, 32) /* VMAPTI only */
 FIELD(VMAPTI_2, DOORBELL, 32, 32)
 
+/* VMAPP command fields */
+FIELD(VMAPP_0, ALLOC, 8, 1) /* GICv4.1 only */
+FIELD(VMAPP_0, PTZ, 9, 1) /* GICv4.1 only */
+FIELD(VMAPP_0, VCONFADDR, 16, 36) /* GICv4.1 only */
+FIELD(VMAPP_1, DEFAULT_DOORBELL, 0, 32) /* GICv4.1 only */
+FIELD(VMAPP_1, VPEID, 32, 16)
+FIELD(VMAPP_2, RDBASE, 16, 36)
+FIELD(VMAPP_2, V, 63, 1)
+FIELD(VMAPP_3, VPTSIZE, 0, 8) /* For GICv4.0, bits [7:6] are RES0 */
+FIELD(VMAPP_3, VPTADDR, 16, 36)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e1f26a205e4..ea2b4b9e5a7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -61,6 +61,12 @@ typedef struct ITEntry {
     uint32_t vpeid;
 } ITEntry;
 
+typedef struct VTEntry {
+    bool valid;
+    unsigned vptsize;
+    uint32_t rdbase;
+    uint64_t vptaddr;
+} VTEntry;
 
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
@@ -842,6 +848,85 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
+/*
+ * Update the vPE Table entry at index @vpeid with the entry @vte.
+ * Returns true on success, false if there was a memory access error.
+ */
+static bool update_vte(GICv3ITSState *s, uint32_t vpeid, const VTEntry *vte)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t entry_addr;
+    uint64_t vteval = 0;
+    MemTxResult res = MEMTX_OK;
+
+    trace_gicv3_its_vte_write(vpeid, vte->valid, vte->vptsize, vte->vptaddr,
+                              vte->rdbase);
+
+    if (vte->valid) {
+        vteval = FIELD_DP64(vteval, VTE, VALID, 1);
+        vteval = FIELD_DP64(vteval, VTE, VPTSIZE, vte->vptsize);
+        vteval = FIELD_DP64(vteval, VTE, VPTADDR, vte->vptaddr);
+        vteval = FIELD_DP64(vteval, VTE, RDBASE, vte->rdbase);
+    }
+
+    entry_addr = table_entry_addr(s, &s->vpet, vpeid, &res);
+    if (res != MEMTX_OK) {
+        return false;
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
+        return true;
+    }
+    address_space_stq_le(as, entry_addr, vteval, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
+}
+
+static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    VTEntry vte;
+    uint32_t vpeid;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    vpeid = FIELD_EX64(cmdpkt[1], VMAPP_1, VPEID);
+    vte.rdbase = FIELD_EX64(cmdpkt[2], VMAPP_2, RDBASE);
+    vte.valid = FIELD_EX64(cmdpkt[2], VMAPP_2, V);
+    vte.vptsize = FIELD_EX64(cmdpkt[3], VMAPP_3, VPTSIZE);
+    vte.vptaddr = FIELD_EX64(cmdpkt[3], VMAPP_3, VPTADDR);
+
+    trace_gicv3_its_cmd_vmapp(vpeid, vte.rdbase, vte.valid,
+                              vte.vptaddr, vte.vptsize);
+
+    /*
+     * For GICv4.0 the VPT_size field is only 5 bits, whereas we
+     * define our field macros to include the full GICv4.1 8 bits.
+     * The range check on VPT_size will catch the cases where
+     * the guest set the RES0-in-GICv4.0 bits [7:6].
+     */
+    if (vte.vptsize > FIELD_EX64(s->typer, GITS_TYPER, IDBITS)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid VPT_size 0x%x\n", __func__, vte.vptsize);
+        return CMD_CONTINUE;
+    }
+
+    if (vte.valid && vte.rdbase >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid rdbase 0x%x\n", __func__, vte.rdbase);
+        return CMD_CONTINUE;
+    }
+
+    if (vpeid >= s->vpet.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VPEID 0x%x out of range (must be less than 0x%x)\n",
+                      __func__, vpeid, s->vpet.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE : CMD_STALL;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -963,6 +1048,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMAPI:
             result = process_vmapti(s, cmdpkt, true);
             break;
+        case GITS_CMD_VMAPP:
+            result = process_vmapp(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index c6b2b9ab459..2fcc9e40e55 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -189,6 +189,7 @@ gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDba
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
+gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
@@ -199,6 +200,7 @@ gicv3_its_ite_write(uint64_t ittaddr, uint32_t eventid, int valid, int inttype,
 gicv3_its_dte_read(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table read for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_write(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table write for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_read_fault(uint32_t devid) "GICv3 ITS: Device Table read for DeviceID 0x%x: faulted"
+gicv3_its_vte_write(uint32_t vpeid, int valid, uint32_t vptsize, uint64_t vptaddr, uint32_t rdbase) "GICv3 ITS: vPE Table write for vPEID 0x%x: valid %d VPTsize 0x%x VPTaddr 0x%" PRIx64 " RDbase 0x%x"
 
 # armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
-- 
2.25.1


