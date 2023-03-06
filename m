Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB446AB41C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxR-0001fx-83; Sun, 05 Mar 2023 19:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx0-0000VR-7x
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:42 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYywy-0007EH-3d
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:37 -0500
Received: by mail-pl1-x635.google.com with SMTP id u5so8501474plq.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrWUzrLzXXWuLAwrjqKsoR8MNn/TXI8IDKpQbr/JxfE=;
 b=MFbqaB4r+0Ch3h7En32OoK3GWY6uMaziSCt+M9m5IQ52ggsoo3KsVxTKnttjQOzgVG
 RtdrnAXq2iMxAW4neIt0+cb6yqGTeyk7qUpLXxmETCom/cjEaMZ8w96NzRUQ1pV3u+gc
 bsY0TYvRSyVqu/+JjaBhnFeB3fGv9+q3ls93zzBezAMVmhxkUULXBu5LndPspqGAgZAA
 9Q9WIXUjqv+LQ4uFAs19SxOxZLbeMA9j9VyzN/SQs255nh1yjwsiVBSiKxOax/WFF4GA
 8LEgAkqE/fWK1M5hXGbANraPuSsYeS1I5fow2eGDF3yRgkMcbDBu16t9dqAVQoEzNtf4
 hkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qrWUzrLzXXWuLAwrjqKsoR8MNn/TXI8IDKpQbr/JxfE=;
 b=d+Jyn847v2HBp6Fffgl3hlszCX6GgFKhcEz/NMRP68mArsxu8LO6fPUaiUSRCcGixd
 k9KIHQufmgL7HNjsNU7qXSxM0vwBiKrcVZkPi/82O+JYmxfcH8mQmIB5y3Za4ao7Q7Fq
 ELEQ+xKb0aTTe2hs4Lx7n8NxzrN553DITTC0xOdfrQljRwX5CFJhLOZnzUGHz0sQlrdo
 cqi598wMvkUBAKNPuWqN3QSo+0lErRmBZz0VugSZTIOmFQKOzOxfu8CZW1Z+KmPuHAD/
 T3/8RlGvnEXP6Vy1B0iv8g1Uw5RJrgJNg7nCBYL+BvyqdmoIuA0jbxHs7KXvgRTSDifk
 BehQ==
X-Gm-Message-State: AO0yUKVz7XWR+jmMV4hzGCJYQi0GEEEgG1Si5X/vWOB5Px9VjwS5M0fW
 9k1W0HGYJVBC8RSJ/KhRDOx4bsk1g2DhzUP4v3GfFQ==
X-Google-Smtp-Source: AK7set8t3fW00Ck8QdVR4bcQw46hwKMsbg7+TCm0EKZYlN62lEd0W0qtbqmxrlwUBLsZizfyzcSlGQ==
X-Received: by 2002:a05:6a20:7f8c:b0:cd:3f04:6452 with SMTP id
 d12-20020a056a207f8c00b000cd3f046452mr14572969pzj.49.1678063414633; 
 Sun, 05 Mar 2023 16:43:34 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 43/84] target/m68k: Drop mark_to_release
Date: Sun,  5 Mar 2023 16:39:13 -0800
Message-Id: <20230306003954.1866998-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 55 ++++++++++-------------------------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 157c2cbb8f..b3cd3e87e1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -121,35 +121,9 @@ typedef struct DisasContext {
     int done_mac;
     int writeback_mask;
     TCGv writeback[8];
-#define MAX_TO_RELEASE 8
-    int release_count;
-    TCGv release[MAX_TO_RELEASE];
     bool ss_active;
 } DisasContext;
 
-static void init_release_array(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    memset(s->release, 0, sizeof(s->release));
-#endif
-    s->release_count = 0;
-}
-
-static void do_release(DisasContext *s)
-{
-    int i;
-    for (i = 0; i < s->release_count; i++) {
-        tcg_temp_free(s->release[i]);
-    }
-    init_release_array(s);
-}
-
-static TCGv mark_to_release(DisasContext *s, TCGv tmp)
-{
-    g_assert(s->release_count < MAX_TO_RELEASE);
-    return s->release[s->release_count++] = tmp;
-}
-
 static TCGv get_areg(DisasContext *s, unsigned regno)
 {
     if (s->writeback_mask & (1 << regno)) {
@@ -396,8 +370,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
         gen_store(s, opsize, addr, val, index);
         return store_dummy;
     } else {
-        return mark_to_release(s, gen_load(s, opsize, addr,
-                                           what == EA_LOADS, index));
+        return gen_load(s, opsize, addr, what == EA_LOADS, index);
     }
 }
 
@@ -491,7 +464,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         } else {
             bd = 0;
         }
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         if ((ext & 0x44) == 0) {
             /* pre-index */
             add = gen_addr_index(s, ext, tmp);
@@ -501,7 +474,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         if ((ext & 0x80) == 0) {
             /* base not suppressed */
             if (IS_NULL_QREG(base)) {
-                base = mark_to_release(s, tcg_const_i32(offset + bd));
+                base = tcg_const_i32(offset + bd);
                 bd = 0;
             }
             if (!IS_NULL_QREG(add)) {
@@ -517,11 +490,11 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
                 add = tmp;
             }
         } else {
-            add = mark_to_release(s, tcg_const_i32(bd));
+            add = tcg_const_i32(bd);
         }
         if ((ext & 3) != 0) {
             /* memory indirect */
-            base = mark_to_release(s, gen_load(s, OS_LONG, add, 0, IS_USER(s)));
+            base = gen_load(s, OS_LONG, add, 0, IS_USER(s));
             if ((ext & 0x44) == 4) {
                 add = gen_addr_index(s, ext, tmp);
                 tcg_gen_add_i32(tmp, add, base);
@@ -546,7 +519,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         }
     } else {
         /* brief extension word format */
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         add = gen_addr_index(s, ext, tmp);
         if (!IS_NULL_QREG(base)) {
             tcg_gen_add_i32(tmp, add, base);
@@ -676,7 +649,7 @@ static inline TCGv gen_extend(DisasContext *s, TCGv val, int opsize, int sign)
     if (opsize == OS_LONG) {
         tmp = val;
     } else {
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         gen_ext(tmp, val, opsize, sign);
     }
 
@@ -802,7 +775,7 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
             return NULL_QREG;
         }
         reg = get_areg(s, reg0);
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         if (reg0 == 7 && opsize == OS_BYTE &&
             m68k_feature(s->env, M68K_FEATURE_M68K)) {
             tcg_gen_subi_i32(tmp, reg, 2);
@@ -812,7 +785,7 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         return tmp;
     case 5: /* Indirect displacement.  */
         reg = get_areg(s, reg0);
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         ext = read_im16(env, s);
         tcg_gen_addi_i32(tmp, reg, (int16_t)ext);
         return tmp;
@@ -823,14 +796,14 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         switch (reg0) {
         case 0: /* Absolute short.  */
             offset = (int16_t)read_im16(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 1: /* Absolute long.  */
             offset = read_im32(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 2: /* pc displacement  */
             offset = s->pc;
             offset += (int16_t)read_im16(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 3: /* pc index+displacement.  */
             return gen_lea_indexed(env, s, NULL_QREG);
         case 4: /* Immediate.  */
@@ -958,7 +931,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         default:
             return NULL_QREG;
         }
@@ -6287,7 +6260,6 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cc_op_synced = 1;
     dc->done_mac = 0;
     dc->writeback_mask = 0;
-    init_release_array(dc);
 
     dc->ss_active = (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS);
     /* If architectural single step active, limit to 1 */
@@ -6314,7 +6286,6 @@ static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     opcode_table[insn](env, dc, insn);
     do_writebacks(dc);
-    do_release(dc);
 
     dc->pc_prev = dc->base.pc_next;
     dc->base.pc_next = dc->pc;
-- 
2.34.1


