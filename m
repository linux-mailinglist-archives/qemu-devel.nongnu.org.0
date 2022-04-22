Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FB50B57D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:44:39 +0200 (CEST)
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqmE-0007Td-UH
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9p-0004UH-Br
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9n-0002cv-C2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so4691727wmb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8RgWYhgKur6Ax4yz2dzmYZrqxwZTXpBGbv3xdnrc6bE=;
 b=VlnFJ792NRBN7jywmFqgn8v6wunMHPCXHCPmHCsLGBjzOeSN8O/ne3B4ZOyW9FBSpc
 flw3j8RDgcNK0lyZ7yd7bvvhdKKLEJCECN26fxE0j2I/b6DLF/J0Cgae/xrs5w3Abeiz
 7iOl4Nfd+k+o9QEz8c9mT3zyeIGu31WObvMW/U2tqr5+mngSCdgUC/dlMMunM16tVv52
 /Qkhlhb9tD2d64TgIGBfISWhirHMBGbWixtXlboHSNdVG/ni24v6AnNm+rvUQSNdkZBn
 Da3fv06xI0vK5H5zbjIuB4SZfIsmk91UqKf13UYctoNxYhewTEdr0cV6Kt3cOjaPBVNb
 BkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RgWYhgKur6Ax4yz2dzmYZrqxwZTXpBGbv3xdnrc6bE=;
 b=wTfdqT3UuDfUmjeBZkF/UHm70jB6cRyCD9Cf0drjkQbXPcqLOvwVcNz7aF32KApT1j
 pyBqXZQ2VOAp9eOpFhSqkrC07JvYx6PAsZFVs5x8YWzJ+9lejc+PNT32Tyr5fXx6zvfP
 R3B9+rOYSIIeay7Pe/Xzz/YmkRkr+mulTPyBQMgLyilMMCfMFznDc0otdoKtR1CQWmJG
 Js5eQd9OqaJrrJnpZpBRB7PWchuBkUtJV9Oa4kspxqL+7022IU0kT+iLPbdlQrz49LDs
 qHwRpkJioliXT89+dh+eR4wDnlKTPWCVgRuREqwoG1fcepLIJ9m70it1ChspB3njTWVp
 g6yQ==
X-Gm-Message-State: AOAM531mbcbwVkIngI0BXuXmKz+7ccHjx97mGWLR6MzWOtU1y2M/agZa
 GiYc16vrBnB+1WmXGXakAd6w8DRVgUqGuA==
X-Google-Smtp-Source: ABdhPJzFfjGsaIv+Tx2uNLV53sVzVlt+s6wRdh/0x9SdVrNHlDzxTiFKUDQ9rRfnS8kRKZ2HaOsk0w==
X-Received: by 2002:a05:600c:a06:b0:392:a4f2:2097 with SMTP id
 z6-20020a05600c0a0600b00392a4f22097mr12706179wmp.97.1650621892808; 
 Fri, 22 Apr 2022 03:04:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/61] hw/intc/arm_gicv3_its: Implement VMOVI
Date: Fri, 22 Apr 2022 11:03:51 +0100
Message-Id: <20220422100432.2288247-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the GICv4 VMOVI command, which moves the pending state
of a virtual interrupt from one redistributor to another. As with
MOVI, we handle the "parse and validate command arguments and
table lookups" part in the ITS source file, and pass the final
results to a function in the redistributor which will do the
actual operation. As with the "make a VLPI pending" change,
for the moment we leave that redistributor function as a stub,
to be implemented in a later commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-21-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 23 +++++++++++
 hw/intc/arm_gicv3_its.c    | 82 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c | 10 +++++
 hw/intc/trace-events       |  1 +
 4 files changed, 116 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 2f653a9b917..050e19d133b 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMOVI            0x21
 #define GITS_CMD_VMOVP            0x22
 #define GITS_CMD_VSYNC            0x25
 #define GITS_CMD_VMAPP            0x29
@@ -403,6 +404,13 @@ FIELD(VMOVP_2, RDBASE, 16, 36)
 FIELD(VMOVP_2, DB, 63, 1) /* GICv4.1 only */
 FIELD(VMOVP_3, DEFAULT_DOORBELL, 0, 32) /* GICv4.1 only */
 
+/* VMOVI command fields */
+FIELD(VMOVI_0, DEVICEID, 32, 32)
+FIELD(VMOVI_1, EVENTID, 0, 32)
+FIELD(VMOVI_1, VPEID, 32, 16)
+FIELD(VMOVI_2, D, 0, 1)
+FIELD(VMOVI_2, DOORBELL, 32, 32)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -614,6 +622,21 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq);
  * by the ITS MOVALL command.
  */
 void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest);
+/**
+ * gicv3_redist_mov_vlpi:
+ * @src: source redistributor
+ * @src_vptaddr: (guest) address of source VLPI table
+ * @dest: destination redistributor
+ * @dest_vptaddr: (guest) address of destination VLPI table
+ * @irq: VLPI to update
+ * @doorbell: doorbell for destination (1023 for "no doorbell")
+ *
+ * Move the pending state of the specified VLPI from @src to @dest,
+ * as required by the ITS VMOVI command.
+ */
+void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
+                           GICv3CPUState *dest, uint64_t dest_vptaddr,
+                           int irq, int doorbell);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f7c01c2be19..c718ef2ff92 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1084,6 +1084,85 @@ static ItsCmdResult process_vmovp(GICv3ITSState *s, const uint64_t *cmdpkt)
     return cbdata.result;
 }
 
+static ItsCmdResult process_vmovi(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    uint32_t devid, eventid, vpeid, doorbell;
+    bool doorbell_valid;
+    DTEntry dte;
+    ITEntry ite;
+    VTEntry old_vte, new_vte;
+    ItsCmdResult cmdres;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    devid = FIELD_EX64(cmdpkt[0], VMOVI_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], VMOVI_1, EVENTID);
+    vpeid = FIELD_EX64(cmdpkt[1], VMOVI_1, VPEID);
+    doorbell_valid = FIELD_EX64(cmdpkt[2], VMOVI_2, D);
+    doorbell = FIELD_EX64(cmdpkt[2], VMOVI_2, DOORBELL);
+
+    trace_gicv3_its_cmd_vmovi(devid, eventid, vpeid, doorbell_valid, doorbell);
+
+    if (doorbell_valid && !valid_doorbell(doorbell)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid doorbell 0x%x\n", __func__, doorbell);
+        return CMD_CONTINUE;
+    }
+
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (ite.inttype != ITE_INTTYPE_VIRTUAL) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: ITE is not for virtual interrupt\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    cmdres = lookup_vte(s, __func__, ite.vpeid, &old_vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+    cmdres = lookup_vte(s, __func__, vpeid, &new_vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (!intid_in_lpi_range(ite.intid) ||
+        ite.intid >= (1ULL << (old_vte.vptsize + 1)) ||
+        ite.intid >= (1ULL << (new_vte.vptsize + 1))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ITE intid 0x%x out of range\n",
+                      __func__, ite.intid);
+        return CMD_CONTINUE;
+    }
+
+    ite.vpeid = vpeid;
+    if (doorbell_valid) {
+        ite.doorbell = doorbell;
+    }
+
+    /*
+     * Move the LPI from the old redistributor to the new one. We don't
+     * need to do anything if the guest somehow specified the
+     * same pending table for source and destination.
+     */
+    if (old_vte.vptaddr != new_vte.vptaddr) {
+        gicv3_redist_mov_vlpi(&s->gicv3->cpu[old_vte.rdbase],
+                              old_vte.vptaddr << 16,
+                              &s->gicv3->cpu[new_vte.rdbase],
+                              new_vte.vptaddr << 16,
+                              ite.intid,
+                              ite.doorbell);
+    }
+
+    /* Update the ITE to the new VPEID and possibly doorbell values */
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
+}
+
 static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
@@ -1282,6 +1361,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMOVP:
             result = process_vmovp(s, cmdpkt);
             break;
+        case GITS_CMD_VMOVI:
+            result = process_vmovi(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 856494b4e8f..dc25997d1f9 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -808,6 +808,16 @@ void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
      */
 }
 
+void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
+                           GICv3CPUState *dest, uint64_t dest_vptaddr,
+                           int irq, int doorbell)
+{
+    /*
+     * The redistributor handling for moving a VLPI will be added
+     * in a subsequent commit.
+     */
+}
+
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index ae4a3cfb004..9894756e55a 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -193,6 +193,7 @@ gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
 gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
+gicv3_its_cmd_vmovi(uint32_t devid,  uint32_t eventid, uint32_t vpeid, int dbvalid, uint32_t doorbell) "GICv3 ITS: command VMOVI DeviceID 0x%x EventID 0x%x vPEID 0x%x D %d Dbell_pINTID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


