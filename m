Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8A50B55B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqhT-0007Ym-4p
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9m-0004MJ-KD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9k-0002c6-JJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x18so10355246wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PcdPPQOjNbwfXaTfJK9YXBBIueNNQIzSTQ868HQOcpY=;
 b=L6qR13FDEhkLKu3UzcpPteU7R2IoNr6C6mNWnaNN4bfqsvN/ZA9FReKJMtnkby3mL4
 8iaeBi44LWK8UB+UAAqe961EoHEYccqUuFnuTkC39A/9U2JKZoQG574dZJl/UKy2esL4
 dG98we/clnuCQM/uCap/liu8LTdFvm560VqYsEbjUW2AczAYM6HRFVgPy+hERIFPFStx
 Y0OP6LWSoakCA+9n3JJs24INl1v94PICmg1hmPzLCI+hDhYdGa6TNNtltBR9Do/LfTZd
 u7v8qayUYEtX3h7sCb0lyX/LlIn3r434YuA5U+cmMMy+83JhZqeoimbzzrGBjI7yMZfh
 8SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcdPPQOjNbwfXaTfJK9YXBBIueNNQIzSTQ868HQOcpY=;
 b=KbYY8ixcdqhnjtEFcculhBIq0U3sm3c98cRniKMPYS183dg431lr30342slz7eQGzf
 Xgoc80gEPJKyqRHQpQpwLkl7zZcbpACAAFRo7R4XasjzgnZfIrMuIC5o87ImRkn5xstZ
 Jp7bX6NC00Z8WGCp0fQaoBoMgQ1fGYOAee4U+WyTMiBAAVolxo0jgvOrVRl8W7wXe8ji
 85YwOTcT2eBzFZmmxxg03w4bWB3m83Y0taBTTfwHCw7spwWnzf1LQqmU5lrOBHicEvcL
 iPWC8DoJaJ0C8C6SAl0QxsgCp7Ed9e3CtCy/z56EbO0EU4bd1XYsa5wWt4rIZwhU05dJ
 2L2Q==
X-Gm-Message-State: AOAM532Cm2HwSg/zdqSVZIoeEvddProdhBWqFGWU9mv+Y/vfKlZwPbdR
 bcQDD7UBgniMb+dvBCEL+yBnh6hHDw992w==
X-Google-Smtp-Source: ABdhPJxBZ6PkYVxBZ/wS+P46YhmI1FhntWKdQWZf/3tO28OjuaDiDBhIbnQVY7bAiyj+iJVUmkVH1w==
X-Received: by 2002:a05:6000:2c5:b0:20a:9675:d26c with SMTP id
 o5-20020a05600002c500b0020a9675d26cmr3019749wry.185.1650621890987; 
 Fri, 22 Apr 2022 03:04:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/61] hw/intc/arm_gicv3_its: Implement INV command properly
Date: Fri, 22 Apr 2022 11:03:49 +0100
Message-Id: <20220422100432.2288247-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

We were previously implementing INV (like INVALL) to just blow away
cached highest-priority-pending-LPI information on all connected
redistributors.  For GICv4.0, this isn't going to be sufficient,
because the LPI we are invalidating cached information for might be
either physical or virtual, and the required action is different for
those two cases.  So we need to do the full process of looking up the
ITE from the devid and eventid.  This also means we can do the error
checks that the spec lists for this command.

Split out INV handling into a process_inv() function like our other
command-processing functions.  For the moment, stick to handling only
physical LPIs; we will add the vLPI parts later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-19-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 12 +++++++++
 hw/intc/arm_gicv3_its.c    | 50 +++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_redist.c | 11 +++++++++
 hw/intc/trace-events       |  3 ++-
 4 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index ef1d75b3cf4..25ea19de385 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -373,6 +373,10 @@ FIELD(MOVI_0, DEVICEID, 32, 32)
 FIELD(MOVI_1, EVENTID, 0, 32)
 FIELD(MOVI_2, ICID, 0, 16)
 
+/* INV command fields */
+FIELD(INV_0, DEVICEID, 32, 32)
+FIELD(INV_1, EVENTID, 0, 32)
+
 /* VMAPI, VMAPTI command fields */
 FIELD(VMAPTI_0, DEVICEID, 32, 32)
 FIELD(VMAPTI_1, EVENTID, 0, 32)
@@ -573,6 +577,14 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs);
  * an incoming migration has loaded new state.
  */
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
+/**
+ * gicv3_redist_inv_lpi:
+ * @cs: GICv3CPUState
+ * @irq: LPI to invalidate cached information for
+ *
+ * Forget or update any cached information associated with this LPI.
+ */
+void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq);
 /**
  * gicv3_redist_mov_lpi:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a3f5bac5513..aa0a62510e5 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1084,6 +1084,50 @@ static ItsCmdResult process_vmovp(GICv3ITSState *s, const uint64_t *cmdpkt)
     return cbdata.result;
 }
 
+static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    uint32_t devid, eventid;
+    ITEntry ite;
+    DTEntry dte;
+    CTEntry cte;
+    ItsCmdResult cmdres;
+
+    devid = FIELD_EX64(cmdpkt[0], INV_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], INV_1, EVENTID);
+
+    trace_gicv3_its_cmd_inv(devid, eventid);
+
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    switch (ite.inttype) {
+    case ITE_INTTYPE_PHYSICAL:
+        cmdres = lookup_cte(s, __func__, ite.icid, &cte);
+        if (cmdres != CMD_CONTINUE_OK) {
+            return cmdres;
+        }
+        gicv3_redist_inv_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid);
+        break;
+    case ITE_INTTYPE_VIRTUAL:
+        if (!its_feature_virtual(s)) {
+            /* Can't happen unless guest is illegally writing to table memory */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid type %d in ITE (table corrupted?)\n",
+                          __func__, ite.inttype);
+            return CMD_CONTINUE;
+        }
+        /* We will implement the vLPI invalidation in a later commit */
+        g_assert_not_reached();
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -1192,14 +1236,18 @@ static void process_cmdq(GICv3ITSState *s)
             result = process_its_cmd(s, cmdpkt, DISCARD);
             break;
         case GITS_CMD_INV:
+            result = process_inv(s, cmdpkt);
+            break;
         case GITS_CMD_INVALL:
             /*
              * Current implementation doesn't cache any ITS tables,
              * but the calculated lpi priority information. We only
              * need to trigger lpi priority re-calculation to be in
              * sync with LPI config table or pending table changes.
+             * INVALL operates on a collection specified by ICID so
+             * it only affects physical LPIs.
              */
-            trace_gicv3_its_cmd_inv();
+            trace_gicv3_its_cmd_invall();
             for (i = 0; i < s->gicv3->num_cpu; i++) {
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index b08b599c887..78650a3bb4c 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -681,6 +681,17 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     gicv3_redist_lpi_pending(cs, irq, level);
 }
 
+void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq)
+{
+    /*
+     * The only cached information for LPIs we have is the HPPLPI.
+     * We could be cleverer about identifying when we don't need
+     * to do a full rescan of the pending table, but until we find
+     * this is a performance issue, just always recalculate.
+     */
+    gicv3_redist_update_lpi(cs);
+}
+
 void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index b9efe14c690..ae4a3cfb004 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -184,7 +184,8 @@ gicv3_its_cmd_mapd(uint32_t devid, uint32_t size, uint64_t ittaddr, int valid) "
 gicv3_its_cmd_mapc(uint32_t icid, uint64_t rdbase, int valid) "GICv3 ITS: command MAPC ICID 0x%x RDbase 0x%" PRIx64 " V %d"
 gicv3_its_cmd_mapi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MAPI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_mapti(uint32_t devid, uint32_t eventid, uint32_t icid, uint32_t intid) "GICv3 ITS: command MAPTI DeviceID 0x%x EventID 0x%x ICID 0x%x pINTID 0x%x"
-gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
+gicv3_its_cmd_inv(uint32_t devid, uint32_t eventid) "GICv3 ITS: command INV DeviceID 0x%x EventID 0x%x"
+gicv3_its_cmd_invall(void) "GICv3 ITS: command INVALL"
 gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
-- 
2.25.1


