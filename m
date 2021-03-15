Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9133AA92
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:54:44 +0100 (CET)
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfFb-0004p3-H8
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfE9-0004Em-Vg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:53:13 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfE7-0002ko-A0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615783991; x=1647319991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WEiIbUCnpOLDPL3hB5paf+XWkN+GHFWvzq1N7zEXmCw=;
 b=G3I00ZGP3OPTWO3doMn52Ng2/sp8WfJDjlSVXk3505it69FM29fEXsB1
 zvNIqxSOwiiQqeIO7UN/JG/DB8/3TgwWZaTA/7+Fh1JRZyQO40F0hdoyw
 h7M2xk0fGvACk/Ic3ZWEGvEUsHlVcTZfs9042dhWhREKrXgbouYodtQ1g A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2021 21:53:07 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 14 Mar 2021 21:53:07 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id E3A0FC90; Sun, 14 Mar 2021 23:53:06 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) translation changes
Date: Sun, 14 Mar 2021 23:53:04 -0500
Message-Id: <1615783984-25918-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, tsimpson@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change cpu_ldl_code to translator_ldl
Don't end the TB after every packet when HEX_DEBUG is on
Make gen_check_store_width a simple call

Address feedback from Richard Henderson <<richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/translate.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index eeaad5f..2317508 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -88,8 +88,8 @@ static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
 
     memset(words, 0, PACKET_WORDS_MAX * sizeof(uint32_t));
     for (nwords = 0; !found_end && nwords < PACKET_WORDS_MAX; nwords++) {
-        words[nwords] = cpu_ldl_code(env,
-                                ctx->base.pc_next + nwords * sizeof(uint32_t));
+        words[nwords] =
+            translator_ldl(env, ctx->base.pc_next + nwords * sizeof(uint32_t));
         found_end = is_packet_end(words[nwords]);
     }
     if (!found_end) {
@@ -292,20 +292,16 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
     tcg_temp_free(pval);
 }
 
-#if HEX_DEBUG
-static inline void gen_check_store_width(DisasContext *ctx, int slot_num)
+static void gen_check_store_width(DisasContext *ctx, int slot_num)
 {
+#if HEX_DEBUG
     TCGv slot = tcg_const_tl(slot_num);
     TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
     gen_helper_debug_check_store_width(cpu_env, slot, check);
     tcg_temp_free(slot);
     tcg_temp_free(check);
-}
-#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num) \
-    gen_check_store_width(ctx, slot_num)
-#else
-#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num)  /* nothing */
 #endif
+}
 
 static bool slot_is_predicated(Packet *pkt, int slot_num)
 {
@@ -355,25 +351,25 @@ void process_store(DisasContext *ctx, Packet *pkt, int slot_num)
          */
         switch (ctx->store_width[slot_num]) {
         case 1:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st8(hex_store_val32[slot_num],
                              hex_store_addr[slot_num],
                              ctx->mem_idx);
             break;
         case 2:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st16(hex_store_val32[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
             break;
         case 4:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st32(hex_store_val32[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
             break;
         case 8:
-            HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num);
+            gen_check_store_width(ctx, slot_num);
             tcg_gen_qemu_st64(hex_store_val64[slot_num],
                               hex_store_addr[slot_num],
                               ctx->mem_idx);
@@ -593,10 +589,6 @@ static void hexagon_tr_translate_packet(DisasContextBase *dcbase, CPUState *cpu)
         if (hex_cpu->lldb_compat && qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-#if HEX_DEBUG
-        /* When debugging, only put one packet per TB */
-        ctx->base.is_jmp = DISAS_TOO_MANY;
-#endif
     }
 }
 
-- 
2.7.4


