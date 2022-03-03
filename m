Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816D4CC70A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:27:32 +0100 (CET)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPs2t-0000QU-7o
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:27:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001us-J8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:50 -0500
Received: from [2a00:1450:4864:20::434] (port=40663
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzH-0001ZQ-08
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:49 -0500
Received: by mail-wr1-x434.google.com with SMTP id k24so89347wrd.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=29b8lo8/2aDtc19BPdL0SPSbYLySMtmUOuWMoFbG/ns=;
 b=FvZhtGVer27dTJubJdUK4af2xjGTJfVuowUcpZS94HUS1nV8nO7QN1+HaS+qKU6FA+
 ArCinFc1JY/PHXoXmEyvahtirOr6ZP2W0THT63dt3DGSL16iZps2aKzBpC8xpbeP2Alu
 kpO8jfcFHfmfIuI5yVE23AsfyMm4DgPrQe6bmnenEQi03euZJYebXkEdXbQjOQ5Rs447
 oflJH+WeHusjde9I0JKq8AQyN19b5jLZQ2nEFg9xaLjdCyBBogjH2Q8t8SlNQY/9PX8h
 r5AjNN5D8jiOk/aBr9eGi/ttnDeFrmvBIGBJeo/5x+3kmPdWrVTRsCwBReUnwvN5C38K
 wioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29b8lo8/2aDtc19BPdL0SPSbYLySMtmUOuWMoFbG/ns=;
 b=AVCpR4Gbcp/aqwfDa/sZVDUKoxdqTZ2KiBi8J5t1dkPBycIp5paEHVVFvkiVqMMUf0
 kRLntA2f74swj5/I0JjngOjrZCaH3P9/4ZYqbCL6NuppAJVS4MsfksxPDYVXbnoMWET8
 viWaYLG9dg/O6m6rTxNJy/06KD25o4YTdPsRbQm4hzUDWHy4ywQEUA6BntTQW7jzKPGx
 oNSPnuYESThQQdlBI3ZbBLAHf1NDrNCEaZDRkmIDYnNTJt7H1qK1mvAaY9bJcJhzxSQB
 jgZIJ/4OtnuhFKn6jM25YKtCYVSdEILvywi4GdiPnAnwiTmmge1Sr04dvLFv3QX7YC0o
 3tbg==
X-Gm-Message-State: AOAM530BOiJfwM96bsUTEqPy3BRmtgMQHrgBQvcwXxuwOETpUQAfRTXs
 kbJmcMoEJW8IH9rs8pYjcsw6DQ==
X-Google-Smtp-Source: ABdhPJx+HrN9qThkWWQ4SI7ZLeyjLu8c9YPIxz5PYd8myyVgVsVgft21VX2awbbPoxEGoA4bFwssWg==
X-Received: by 2002:a5d:648d:0:b0:1ef:d62a:8414 with SMTP id
 o13-20020a5d648d000000b001efd62a8414mr15184822wri.99.1646339025232; 
 Thu, 03 Mar 2022 12:23:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/intc/arm_gicv3_its: Add trace events for commands
Date: Thu,  3 Mar 2022 20:23:37 +0000
Message-Id: <20220303202341.2232284-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

When debugging code that's using the ITS, it's helpful to
see tracing of the ITS commands that the guest executes. Add
suitable trace events.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 28 ++++++++++++++++++++++++++--
 hw/intc/trace-events    | 12 ++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 4f598d3c14f..77dc702734b 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -366,6 +366,19 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
+    switch (cmd) {
+    case INTERRUPT:
+        trace_gicv3_its_cmd_int(devid, eventid);
+        break;
+    case CLEAR:
+        trace_gicv3_its_cmd_clear(devid, eventid);
+        break;
+    case DISCARD:
+        trace_gicv3_its_cmd_discard(devid, eventid);
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return do_process_its_cmd(s, devid, eventid, cmd);
 }
 
@@ -382,15 +395,16 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
+    icid = cmdpkt[2] & ICID_MASK;
 
     if (ignore_pInt) {
         pIntid = eventid;
+        trace_gicv3_its_cmd_mapi(devid, eventid, icid);
     } else {
         pIntid = (cmdpkt[1] & pINTID_MASK) >> pINTID_SHIFT;
+        trace_gicv3_its_cmd_mapti(devid, eventid, icid, pIntid);
     }
 
-    icid = cmdpkt[2] & ICID_MASK;
-
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
@@ -484,6 +498,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     } else {
         cte.rdbase = 0;
     }
+    trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
 
     if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
@@ -539,6 +554,8 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
     dte.ittaddr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
     dte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
+    trace_gicv3_its_cmd_mapd(devid, dte.size, dte.ittaddr, dte.valid);
+
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device ID field 0x%x >= 0x%x\n",
@@ -562,6 +579,8 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
     rd1 = FIELD_EX64(cmdpkt[2], MOVALL_2, RDBASE1);
     rd2 = FIELD_EX64(cmdpkt[3], MOVALL_3, RDBASE2);
 
+    trace_gicv3_its_cmd_movall(rd1, rd2);
+
     if (rd1 >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: RDBASE1 %" PRId64
@@ -601,6 +620,8 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
     new_icid = FIELD_EX64(cmdpkt[2], MOVI_2, ICID);
 
+    trace_gicv3_its_cmd_movi(devid, eventid, new_icid);
+
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
@@ -779,6 +800,7 @@ static void process_cmdq(GICv3ITSState *s)
              * is already consistent by the time SYNC command is executed.
              * Hence no further processing is required for SYNC command.
              */
+            trace_gicv3_its_cmd_sync();
             break;
         case GITS_CMD_MAPD:
             result = process_mapd(s, cmdpkt);
@@ -803,6 +825,7 @@ static void process_cmdq(GICv3ITSState *s)
              * need to trigger lpi priority re-calculation to be in
              * sync with LPI config table or pending table changes.
              */
+            trace_gicv3_its_cmd_inv();
             for (i = 0; i < s->gicv3->num_cpu; i++) {
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
@@ -814,6 +837,7 @@ static void process_cmdq(GICv3ITSState *s)
             result = process_movall(s, cmdpkt);
             break;
         default:
+            trace_gicv3_its_cmd_unknown(cmd);
             break;
         }
         if (result == CMD_CONTINUE) {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index b28cda4e08e..e92662b405c 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -176,6 +176,18 @@ gicv3_its_write(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write:
 gicv3_its_badwrite(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u: error"
 gicv3_its_translation_write(uint64_t offset, uint64_t data, unsigned size, uint32_t requester_id) "GICv3 ITS TRANSLATER write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u requester_id 0x%x"
 gicv3_its_process_command(uint32_t rd_offset, uint8_t cmd) "GICv3 ITS: processing command at offset 0x%x: 0x%x"
+gicv3_its_cmd_int(uint32_t devid, uint32_t eventid) "GICv3 ITS: command INT DeviceID 0x%x EventID 0x%x"
+gicv3_its_cmd_clear(uint32_t devid, uint32_t eventid) "GICv3 ITS: command CLEAR DeviceID 0x%x EventID 0x%x"
+gicv3_its_cmd_discard(uint32_t devid, uint32_t eventid) "GICv3 ITS: command DISCARD DeviceID 0x%x EventID 0x%x"
+gicv3_its_cmd_sync(void) "GICv3 ITS: command SYNC"
+gicv3_its_cmd_mapd(uint32_t devid, uint32_t size, uint64_t ittaddr, int valid) "GICv3 ITS: command MAPD DeviceID 0x%x Size 0x%x ITT_addr 0x%" PRIx64 " V %d"
+gicv3_its_cmd_mapc(uint32_t icid, uint64_t rdbase, int valid) "GICv3 ITS: command MAPC ICID 0x%x RDbase 0x%" PRIx64 " V %d"
+gicv3_its_cmd_mapi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MAPI DeviceID 0x%x EventID 0x%x ICID 0x%x"
+gicv3_its_cmd_mapti(uint32_t devid, uint32_t eventid, uint32_t icid, uint32_t intid) "GICv3 ITS: command MAPTI DeviceID 0x%x EventID 0x%x ICID 0x%x pINTID 0x%x"
+gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
+gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
+gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
+gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 
 # armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
-- 
2.25.1


