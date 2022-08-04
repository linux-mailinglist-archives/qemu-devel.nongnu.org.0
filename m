Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E07589B7E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:13:20 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZj5-0007Ae-GW
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZSe-0000tN-0g
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:21 -0400
Received: from rev.ng ([5.9.113.41]:55817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZSc-0004bZ-BM
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6HpBnlneMfrQsyXhxxXQafCMkV8GMJKGdP+Ivr9bS90=; b=FzJNLZ8/ioIm9caD9TIJ/2l88a
 +PZt59csf6yKwZ8qv9Dr90iGzNl1HkIWtDLnbOMQPkWC4v1nslIMkDJNyRxT9zMbzTgNvR6ygtbOA
 2wM7yv+jPpC+zbxUX2ttUjDpCHnRwk9/+taHTIIW8KEAGJawIcaKT+/zHO2eyCvw8asY=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, anjo@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v11 12/15] target/hexagon: prepare frontend for parser
Date: Thu,  4 Aug 2022 13:55:45 +0200
Message-Id: <20220804115548.13024-13-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-1-anjo@rev.ng>
References: <20220804115548.13024-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

This patch adds the necessary changes to the Hexagon frontend, required
by idef-parser to deal with a :mem_noshuf packet with a store in slot 1
and predicated load in slot 0.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/hexagon/cpu.h       |  8 ++++++++
 target/hexagon/translate.c | 22 ++++++++++++++++++++++
 target/hexagon/translate.h |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2a65a57bab..1511e5a73e 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -107,6 +107,14 @@ typedef struct CPUArchState {
     target_ulong llsc_val;
     uint64_t     llsc_val_i64;
 
+    /*
+     * Global state which keeps tracks of whether or not a process_store was
+     * actually executed at runtime. Used only for :mem_noshuf packets with a
+     * pload instruction to execute the process_store at packet commit if the
+     * predicated branch is not taken.
+     */
+    target_ulong did_s1_store;
+
     MMVector VRegs[NUM_VREGS] QEMU_ALIGNED(16);
     MMVector future_VRegs[VECTOR_TEMPS_MAX] QEMU_ALIGNED(16);
     MMVector tmp_VRegs[VECTOR_TEMPS_MAX] QEMU_ALIGNED(16);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index e3e250fd4f..72bf8d591b 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -53,6 +53,7 @@ TCGv hex_QRegs_updated;
 TCGv hex_vstore_addr[VSTORES_MAX];
 TCGv hex_vstore_size[VSTORES_MAX];
 TCGv hex_vstore_pending[VSTORES_MAX];
+TCGv hex_did_s1_store;
 
 static const char * const hexagon_prednames[] = {
   "p0", "p1", "p2", "p3"
@@ -239,6 +240,9 @@ static void gen_start_packet(DisasContext *ctx, Packet *pkt)
         tcg_gen_movi_tl(hex_this_PC, ctx->base.pc_next);
     }
 
+    ctx->insn_is_noshuf_pload = false;
+    tcg_gen_movi_tl(hex_did_s1_store, 0);
+
     /* Initialize the runtime state for packet semantics */
     if (need_pc(pkt)) {
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
@@ -494,6 +498,22 @@ void process_store(DisasContext *ctx, Packet *pkt, int slot_num)
 
 static void process_store_log(DisasContext *ctx, Packet *pkt)
 {
+    /*
+     * Here we deal with the special case of a :mem_noshuf packet with a
+     * predicated load in slot 0 with a store in slot 1. If the predicated
+     * branch wasn't taken during packet execution, then store in slot 1
+     * will not have been executed, corresponding to hex_did_store_s1 being 0.
+     * If this is the case, process the store here.
+     */
+    if (ctx->insn_is_noshuf_pload) {
+        TCGLabel *l = gen_new_label();
+        /* Reset s1_store_processed so process_store actually emits a store */
+        ctx->s1_store_processed = false;
+        tcg_gen_brcondi_tl(TCG_COND_EQ, hex_did_s1_store, 1, l);
+        process_store(ctx, pkt, 1);
+        gen_set_label(l);
+    }
+
     /*
      *  When a packet has two stores, the hardware processes
      *  slot 1 and then slot 0.  This will be important when
@@ -925,6 +945,8 @@ void hexagon_translate_init(void)
         offsetof(CPUHexagonState, llsc_val), "llsc_val");
     hex_llsc_val_i64 = tcg_global_mem_new_i64(cpu_env,
         offsetof(CPUHexagonState, llsc_val_i64), "llsc_val_i64");
+    hex_did_s1_store = tcg_global_mem_new(cpu_env,
+        offsetof(CPUHexagonState, did_s1_store), "did_s1_store");
     hex_VRegs_updated = tcg_global_mem_new(cpu_env,
         offsetof(CPUHexagonState, VRegs_updated), "VRegs_updated");
     hex_QRegs_updated = tcg_global_mem_new(cpu_env,
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 494471548e..f340ed8fb6 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -54,6 +54,7 @@ typedef struct DisasContext {
     int qreg_log_idx;
     bool pre_commit;
     uint32_t npc;
+    bool insn_is_noshuf_pload;
 } DisasContext;
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
@@ -147,6 +148,7 @@ extern TCGv hex_QRegs_updated;
 extern TCGv hex_vstore_addr[VSTORES_MAX];
 extern TCGv hex_vstore_size[VSTORES_MAX];
 extern TCGv hex_vstore_pending[VSTORES_MAX];
+extern TCGv hex_did_s1_store;
 
 bool is_gather_store_insn(Insn *insn, Packet *pkt);
 void process_store(DisasContext *ctx, Packet *pkt, int slot_num);
-- 
2.37.0


