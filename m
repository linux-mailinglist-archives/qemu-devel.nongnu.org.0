Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442F6F51FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6q4-00019a-6o; Wed, 03 May 2023 03:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6px-00010b-E0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6pu-0001Rq-A4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so2315637f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098616; x=1685690616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEenKRIMM4xhjszjE87I10eI5/PFMtywJu1d0Ns5Hvs=;
 b=nr8P3upI9TePxX4sbBAdF/vbronDYOqbr5L0zWV133E+4ibylmmGVImM1eZWlzM9Bj
 olzHLsMId3Cu1BpN9OZBlTzisCE2Ll7sciTHZWOqrlmGeusP3gBU376i4ANYNxJ16POR
 +tz+q5Id1y9ywm7aFNf6aIOH0zcTelWSmr6ktNEAZMdAI9xtzUYIJp0LFejx1/jRchOX
 63er9Pq0HP3erHnTqw/hegVeSCK7jDTCNhaHBJqY14tmDYEC8GpZF3ORrdjQGZw94Zyy
 H+qFBx57gsVcYueqaS4VBsinTnwTFIi28/MBGkiS3HpaCVptg7SzUI8tzJ0yTr5gTAiv
 I+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098616; x=1685690616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEenKRIMM4xhjszjE87I10eI5/PFMtywJu1d0Ns5Hvs=;
 b=f3EzrzI3LzV9BMSibFrNVUKb8KyPqvexx/EEEysJXerMDhXu/6wSVFGaCWV6Ee4xgg
 AwHLCtXH7F1ehhkQNcDpAc9T1FWWfAxi933kHx0qDeqLXqAIIPhDGAc+9PpXkAt3Ilhy
 BLPTgyJQgPS0R1hPvKch96D+tUKZXDkmvqbGphpXt7dIuWPvyJ/MpzwSlc1wSMs9Z2UI
 WeioYz2vWt6rjdJjCoLcR9lcBTYHeZGzafmRu99dbDKuPkLdMyjTeOZG3cxiqO7lsT1N
 ymdbUZ5m/8V9oM+3KuQdM7rKO0hS89To25TAOHA5zsqqeE86QeG/wQwYbacgSXeddvpp
 W71w==
X-Gm-Message-State: AC+VfDwZ2IbxroFRrklcAccslvdeZzhiSIUtIA65pvZbmK/WXqYPyYYB
 PT4fKSDUck5kDhQkszJS4rH8HIxTEpaP4UjnZ03jqw==
X-Google-Smtp-Source: ACHHUZ6Lu3S3DbC0qqAgAwqge1ShqJyPrlVWbsCSqpoze4s4nT6JWQU7VkjGcOh7gCFv0Azo7ZXfQQ==
X-Received: by 2002:a5d:5344:0:b0:306:43bc:806f with SMTP id
 t4-20020a5d5344000000b0030643bc806fmr511115wrv.24.1683098616701; 
 Wed, 03 May 2023 00:23:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 02/84] tcg: Widen gen_insn_data to uint64_t
Date: Wed,  3 May 2023 08:22:09 +0100
Message-Id: <20230503072331.1747057-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We already pass uint64_t to restore_state_to_opc; this changes all
of the other uses from insn_start through the encoding to decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h      | 39 +++++++++------------------------------
 include/tcg/tcg-opc.h     |  2 +-
 include/tcg/tcg.h         | 30 +++++++++++++++---------------
 accel/tcg/translate-all.c | 28 ++++++++++++++++------------
 tcg/tcg.c                 | 18 ++++--------------
 5 files changed, 45 insertions(+), 72 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 4401fa493c..de3b70aa84 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -723,48 +723,27 @@ static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 #endif
 
 #if TARGET_INSN_START_WORDS == 1
-# if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
 static inline void tcg_gen_insn_start(target_ulong pc)
 {
-    tcg_gen_op1(INDEX_op_insn_start, pc);
+    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, 64 / TCG_TARGET_REG_BITS);
+    tcg_set_insn_start_param(op, 0, pc);
 }
-# else
-static inline void tcg_gen_insn_start(target_ulong pc)
-{
-    tcg_gen_op2(INDEX_op_insn_start, (uint32_t)pc, (uint32_t)(pc >> 32));
-}
-# endif
 #elif TARGET_INSN_START_WORDS == 2
-# if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
 static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1)
 {
-    tcg_gen_op2(INDEX_op_insn_start, pc, a1);
+    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, 2 * 64 / TCG_TARGET_REG_BITS);
+    tcg_set_insn_start_param(op, 0, pc);
+    tcg_set_insn_start_param(op, 1, a1);
 }
-# else
-static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1)
-{
-    tcg_gen_op4(INDEX_op_insn_start,
-                (uint32_t)pc, (uint32_t)(pc >> 32),
-                (uint32_t)a1, (uint32_t)(a1 >> 32));
-}
-# endif
 #elif TARGET_INSN_START_WORDS == 3
-# if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
 static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
                                       target_ulong a2)
 {
-    tcg_gen_op3(INDEX_op_insn_start, pc, a1, a2);
+    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, 3 * 64 / TCG_TARGET_REG_BITS);
+    tcg_set_insn_start_param(op, 0, pc);
+    tcg_set_insn_start_param(op, 1, a1);
+    tcg_set_insn_start_param(op, 2, a2);
 }
-# else
-static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
-                                      target_ulong a2)
-{
-    tcg_gen_op6(INDEX_op_insn_start,
-                (uint32_t)pc, (uint32_t)(pc >> 32),
-                (uint32_t)a1, (uint32_t)(a1 >> 32),
-                (uint32_t)a2, (uint32_t)(a2 >> 32));
-}
-# endif
 #else
 # error "Unhandled number of operands to insn_start"
 #endif
diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 94cf7c5d6a..29216366d2 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -190,7 +190,7 @@ DEF(mulsh_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_mulsh_i64))
 #define DATA64_ARGS  (TCG_TARGET_REG_BITS == 64 ? 1 : 2)
 
 /* QEMU specific */
-DEF(insn_start, 0, 0, TLADDR_ARGS * TARGET_INSN_START_WORDS,
+DEF(insn_start, 0, 0, DATA64_ARGS * TARGET_INSN_START_WORDS,
     TCG_OPF_NOT_PRESENT)
 DEF(exit_tb, 0, 0, 1, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
 DEF(goto_tb, 0, 0, 1, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index efbd891f87..7c6a613364 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -629,7 +629,7 @@ struct TCGContext {
     TCGTemp *reg_to_temp[TCG_TARGET_NB_REGS];
 
     uint16_t gen_insn_end_off[TCG_MAX_INSNS];
-    target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
+    uint64_t gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
 
     /* Exit to translator on overflow. */
     sigjmp_buf jmp_trans;
@@ -771,24 +771,24 @@ static inline void tcg_set_insn_param(TCGOp *op, int arg, TCGArg v)
     op->args[arg] = v;
 }
 
-static inline target_ulong tcg_get_insn_start_param(TCGOp *op, int arg)
+static inline uint64_t tcg_get_insn_start_param(TCGOp *op, int arg)
 {
-#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-    return tcg_get_insn_param(op, arg);
-#else
-    return tcg_get_insn_param(op, arg * 2) |
-           ((uint64_t)tcg_get_insn_param(op, arg * 2 + 1) << 32);
-#endif
+    if (TCG_TARGET_REG_BITS == 64) {
+        return tcg_get_insn_param(op, arg);
+    } else {
+        return deposit64(tcg_get_insn_param(op, arg * 2), 32, 32,
+                         tcg_get_insn_param(op, arg * 2 + 1));
+    }
 }
 
-static inline void tcg_set_insn_start_param(TCGOp *op, int arg, target_ulong v)
+static inline void tcg_set_insn_start_param(TCGOp *op, int arg, uint64_t v)
 {
-#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-    tcg_set_insn_param(op, arg, v);
-#else
-    tcg_set_insn_param(op, arg * 2, v);
-    tcg_set_insn_param(op, arg * 2 + 1, v >> 32);
-#endif
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_set_insn_param(op, arg, v);
+    } else {
+        tcg_set_insn_param(op, arg * 2, v);
+        tcg_set_insn_param(op, arg * 2 + 1, v >> 32);
+    }
 }
 
 /* The last op that was emitted.  */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5b13281119..7b7d9a5fff 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -72,9 +72,11 @@ QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
 
 TBContext tb_ctx;
 
-/* Encode VAL as a signed leb128 sequence at P.
-   Return P incremented past the encoded value.  */
-static uint8_t *encode_sleb128(uint8_t *p, target_long val)
+/*
+ * Encode VAL as a signed leb128 sequence at P.
+ * Return P incremented past the encoded value.
+ */
+static uint8_t *encode_sleb128(uint8_t *p, int64_t val)
 {
     int more, byte;
 
@@ -92,21 +94,23 @@ static uint8_t *encode_sleb128(uint8_t *p, target_long val)
     return p;
 }
 
-/* Decode a signed leb128 sequence at *PP; increment *PP past the
-   decoded value.  Return the decoded value.  */
-static target_long decode_sleb128(const uint8_t **pp)
+/*
+ * Decode a signed leb128 sequence at *PP; increment *PP past the
+ * decoded value.  Return the decoded value.
+ */
+static int64_t decode_sleb128(const uint8_t **pp)
 {
     const uint8_t *p = *pp;
-    target_long val = 0;
+    int64_t val = 0;
     int byte, shift = 0;
 
     do {
         byte = *p++;
-        val |= (target_ulong)(byte & 0x7f) << shift;
+        val |= (int64_t)(byte & 0x7f) << shift;
         shift += 7;
     } while (byte & 0x80);
     if (shift < TARGET_LONG_BITS && (byte & 0x40)) {
-        val |= -(target_ulong)1 << shift;
+        val |= -(int64_t)1 << shift;
     }
 
     *pp = p;
@@ -132,7 +136,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
     int i, j, n;
 
     for (i = 0, n = tb->icount; i < n; ++i) {
-        target_ulong prev;
+        uint64_t prev;
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
@@ -444,7 +448,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             /* Dump header and the first instruction */
             fprintf(logfile, "OUT: [size=%d]\n", gen_code_size);
             fprintf(logfile,
-                    "  -- guest addr 0x" TARGET_FMT_lx " + tb prologue\n",
+                    "  -- guest addr 0x%016" PRIx64 " + tb prologue\n",
                     tcg_ctx->gen_insn_data[insn][0]);
             chunk_start = tcg_ctx->gen_insn_end_off[insn];
             disas(logfile, tb->tc.ptr, chunk_start);
@@ -457,7 +461,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             while (insn < tb->icount) {
                 size_t chunk_end = tcg_ctx->gen_insn_end_off[insn];
                 if (chunk_end > chunk_start) {
-                    fprintf(logfile, "  -- guest addr 0x" TARGET_FMT_lx "\n",
+                    fprintf(logfile, "  -- guest addr 0x%016" PRIx64 "\n",
                             tcg_ctx->gen_insn_data[insn][0]);
                     disas(logfile, tb->tc.ptr + chunk_start,
                           chunk_end - chunk_start);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 45f8758fda..a3b8c82073 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2276,13 +2276,8 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             col += ne_fprintf(f, "\n ----");
 
             for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
-                target_ulong a;
-#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-                a = deposit64(op->args[i * 2], 32, 32, op->args[i * 2 + 1]);
-#else
-                a = op->args[i];
-#endif
-                col += ne_fprintf(f, " " TARGET_FMT_lx, a);
+                col += ne_fprintf(f, " %016" PRIx64,
+                                  tcg_get_insn_start_param(op, i));
             }
         } else if (c == INDEX_op_call) {
             const TCGHelperInfo *info = tcg_call_info(op);
@@ -5940,13 +5935,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
             }
             num_insns++;
             for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
-                target_ulong a;
-#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-                a = deposit64(op->args[i * 2], 32, 32, op->args[i * 2 + 1]);
-#else
-                a = op->args[i];
-#endif
-                s->gen_insn_data[num_insns][i] = a;
+                s->gen_insn_data[num_insns][i] =
+                    tcg_get_insn_start_param(op, i);
             }
             break;
         case INDEX_op_discard:
-- 
2.34.1


