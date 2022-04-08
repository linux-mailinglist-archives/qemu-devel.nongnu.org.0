Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B492A4F97F1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:23:03 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpVu-0002Xq-Pb
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPC-0006oD-QL
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:06 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0002Fp-0d
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id q20so5588320wmq.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qy9U68mC1EeGqtN5ZnmG6vvYW4DtojrPnaWG7hfNQA=;
 b=BerPhU+fHg50VLauu+/7gXI1aAWMLTZF65HP8Db87Rd9dmVOgY9V7XKTEhc5GUP6Na
 gFzw21ghTjvZ6Ut+OrGKzRLuJiqHtBTFoWD3UKsmTej4ktKcmEctcCyOvPotCJq/TqMq
 9jyu4JvCX7vaC/qK4sRH9787JmIzAsBfRL3iCKSWfEoluVB6o66Aiuq399ClrPqhteaa
 dr3RB3dwLPrB4tcHsyi6dQYbFcA+jYOVLkQYhGl9Osy02HqCjcLaC/cXkRqewmNfhutP
 wAFgCj4ce9hdJOGsu57mW20POsSUgYoWbEbosw4FIeeex99mKRXy1+LQbJyEHU/+MWrw
 mdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qy9U68mC1EeGqtN5ZnmG6vvYW4DtojrPnaWG7hfNQA=;
 b=U40ouPLgNyRfkEgLgpO46uX4Z8vufuLz3HBTU7WEeZYLcj0WckjWpVerRE97zqz8e+
 KcUL4h0qysgjZ/Lnh31nPipJJEB/azFTw60J7qh7Wy4ejgs+9PiLZx4vZU638p4O5fRs
 suQ31IrG3eXUWiFzF83SMQQFfn6996RVL2dC3PNC8mxGw6bJWh/Sgg+8IiFweVBOaPAZ
 nVokTvbMj6Y1EuDQ1v3xrbq/+r/hVEdSmsGgk7o6dniBnnJTmdyBqRfSOcSXaKyjmTJ5
 2W3upqs6umFTWvXVN74xo2QI6sZw8oxsLeibrhh4R5WY0S0eg8uifkPFF/qdsMAAkOP4
 ug+A==
X-Gm-Message-State: AOAM531jbvFnzaGa2edpxPJ4IYslvA54itWMdEuIbaGQiLRG8OK74yAi
 XyyxepTJ373b6x66J/G9I9mZrh5BUBydIA==
X-Google-Smtp-Source: ABdhPJxDA/tepDuR50QwJRfYX7HIOrBzBq5hsqH5kDm4sh4vqv4XxUlRd2D9grl/XpOz+nsKGXcASg==
X-Received: by 2002:a7b:cc15:0:b0:38c:8af7:f47c with SMTP id
 f21-20020a7bcc15000000b0038c8af7f47cmr16997534wmh.177.1649427361599; 
 Fri, 08 Apr 2022 07:16:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/41] hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
Date: Fri,  8 Apr 2022 15:15:17 +0100
Message-Id: <20220408141550.1271295-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the GICv4 VMAPI and VMAPTI commands. These write
an interrupt translation table entry that maps (DeviceID,EventID)
to (vPEID,vINTID,doorbell). The only difference between VMAPI
and VMAPTI is that VMAPI assumes vINTID == EventID rather than
both being specified in the command packet.

(This code won't be reachable until we allow the GIC version to be
set to 4.  Support for reading this new virtual-interrupt DTE and
handling it correctly will be implemented in a later commit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  9 ++++
 hw/intc/arm_gicv3_its.c  | 91 ++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events     |  2 +
 3 files changed, 102 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 4613b9e59ba..d3670a8894e 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,8 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMAPTI           0x2A
+#define GITS_CMD_VMAPI            0x2B
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
@@ -368,6 +370,13 @@ FIELD(MOVI_0, DEVICEID, 32, 32)
 FIELD(MOVI_1, EVENTID, 0, 32)
 FIELD(MOVI_2, ICID, 0, 16)
 
+/* VMAPI, VMAPTI command fields */
+FIELD(VMAPTI_0, DEVICEID, 32, 32)
+FIELD(VMAPTI_1, EVENTID, 0, 32)
+FIELD(VMAPTI_1, VPEID, 32, 16)
+FIELD(VMAPTI_2, VINTID, 0, 32) /* VMAPTI only */
+FIELD(VMAPTI_2, DOORBELL, 32, 32)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 609c29496a0..e1f26a205e4 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -91,6 +91,12 @@ static inline bool intid_in_lpi_range(uint32_t id)
         id < (1ULL << (GICD_TYPER_IDBITS + 1));
 }
 
+static inline bool valid_doorbell(uint32_t id)
+{
+    /* Doorbell fields may be an LPI, or 1023 to mean "no doorbell" */
+    return id == INTID_SPURIOUS || intid_in_lpi_range(id);
+}
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -486,6 +492,85 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
+static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
+                                   bool ignore_vintid)
+{
+    uint32_t devid, eventid, vintid, doorbell, vpeid;
+    uint32_t num_eventids;
+    DTEntry dte;
+    ITEntry ite;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    devid = FIELD_EX64(cmdpkt[0], VMAPTI_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], VMAPTI_1, EVENTID);
+    vpeid = FIELD_EX64(cmdpkt[1], VMAPTI_1, VPEID);
+    doorbell = FIELD_EX64(cmdpkt[2], VMAPTI_2, DOORBELL);
+    if (ignore_vintid) {
+        vintid = eventid;
+        trace_gicv3_its_cmd_vmapi(devid, eventid, vpeid, doorbell);
+    } else {
+        vintid = FIELD_EX64(cmdpkt[2], VMAPTI_2, VINTID);
+        trace_gicv3_its_cmd_vmapti(devid, eventid, vpeid, vintid, doorbell);
+    }
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid DeviceID 0x%x (must be less than 0x%x)\n",
+                      __func__, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!dte.valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: no entry in device table for DeviceID 0x%x\n",
+                      __func__, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (dte.size + 1);
+
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: EventID 0x%x too large for DeviceID 0x%x "
+                      "(must be less than 0x%x)\n",
+                      __func__, eventid, devid, num_eventids);
+        return CMD_CONTINUE;
+    }
+    if (!intid_in_lpi_range(vintid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VIntID 0x%x not a valid LPI\n",
+                      __func__, vintid);
+        return CMD_CONTINUE;
+    }
+    if (!valid_doorbell(doorbell)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Doorbell 0x%x not 1023 and not a valid LPI\n",
+                      __func__, doorbell);
+        return CMD_CONTINUE;
+    }
+    if (vpeid >= s->vpet.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VPEID 0x%x out of range (must be less than 0x%x)\n",
+                      __func__, vpeid, s->vpet.num_entries);
+        return CMD_CONTINUE;
+    }
+    /* add ite entry to interrupt translation table */
+    ite.valid = true;
+    ite.inttype = ITE_INTTYPE_VIRTUAL;
+    ite.intid = vintid;
+    ite.icid = 0;
+    ite.doorbell = doorbell;
+    ite.vpeid = vpeid;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+}
+
 /*
  * Update the Collection Table entry for @icid to @cte. Returns true
  * on success, false if there was a memory access error.
@@ -872,6 +957,12 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_MOVALL:
             result = process_movall(s, cmdpkt);
             break;
+        case GITS_CMD_VMAPTI:
+            result = process_vmapti(s, cmdpkt, false);
+            break;
+        case GITS_CMD_VMAPI:
+            result = process_vmapti(s, cmdpkt, true);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 53414aa1979..c6b2b9ab459 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -187,6 +187,8 @@ gicv3_its_cmd_mapti(uint32_t devid, uint32_t eventid, uint32_t icid, uint32_t in
 gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
 gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
+gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
+gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


