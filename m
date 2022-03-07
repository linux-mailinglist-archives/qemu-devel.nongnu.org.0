Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F94D048D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:51:25 +0100 (CET)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGZw-0001MS-8s
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW4-0001kW-H4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:24 -0500
Received: from [2a00:1450:4864:20::429] (port=40744
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW2-0007kv-Kj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id k24so14822941wrd.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rTX2jK+IjrpdOkaSjScoBgbhdOK2PtRbSfSVbqxnH7w=;
 b=Agr+lCbuFecOueyYbqoM+Rf1EdZSsdnSkVH+4JHQIlyThzzf5dq/Z9xkQ280wT01PK
 YLlCoPY1HMEswDOyiVbmbODUU9NxfeDl751LpMK7IexLh+mUKj4067qgZnX/qAQVt7g9
 ErlUrBWXs25bY2aCALhjee0BiHznm5mg0at+qrm2gd9uZTvmow3Y0NgsYUiNKHd3RkyB
 pRqI+A6EpLeG74rrHvEFKEcYKyRSRX3mNDtq84ItWwZKAUA1XCOBS9yMPnLokj9F0gqD
 Ibq+qxF/0RhtzNNTu0gDmaZ4y6+Ph55YoU68BmJLbbr+Viau8NNTw8m2VNJXXnOzbELL
 XHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTX2jK+IjrpdOkaSjScoBgbhdOK2PtRbSfSVbqxnH7w=;
 b=K6pw1kj4FZsjPjvjD7P9cEH/v4nWU4CYyqCA5MJC2PuZhXixUtbjy1mC5bzqeAIVbl
 HfdJeXzuKpa0v1wEBHNHMh9hwVO1j6o/V1MrksCAFPQvaEXBCP9PfYmI04/nE1Sk9zC0
 K0OSZBi+xytI8iCwSbgGGCmOh6waHVFSCiMMR4QYQ3dKnpyTtNDpuQuii/mwMb2B+mKP
 qh7wX+23+ZvkKxPhnskpOM9a8Qh/arDgZ50ZjUtlMiHqN6bt9/dkFDN/J8R9z+eUD9tV
 MR3Gwrs64u4XNysXoC9VXCey2o6jWmk1th+n+BauOSZRCuB6jHpvgW+32C/toRUj5Fp8
 F36w==
X-Gm-Message-State: AOAM533Lb+il8kXgWnmSeqkKTSyvyXgRak5jIhRSyupLZnfBNVn5PxAc
 7lpA2joSBguc/gmSSJpSs0I8edvUgAAhWw==
X-Google-Smtp-Source: ABdhPJycksPcOVOVw4e0a5urgaarM56kQvxnAa0UhwBWisAQhQ4qr7pN7cvIJZyw383DtYemOGNvhg==
X-Received: by 2002:a05:6000:168e:b0:1f1:faee:f1c4 with SMTP id
 y14-20020a056000168e00b001f1faeef1c4mr3067576wrd.173.1646671641372; 
 Mon, 07 Mar 2022 08:47:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] hw/intc/arm_gicv3_its: Add trace events for commands
Date: Mon,  7 Mar 2022 16:47:02 +0000
Message-Id: <20220307164709.2503250-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303202341.2232284-2-peter.maydell@linaro.org
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


