Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033D59CBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:43:58 +0200 (CEST)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG9F-00032m-8n
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG3B-0003II-D0
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG35-0006Zs-8v
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id jl18so11226953plb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=PxgN9VWEP3jH1n+0VfN2/ZE7ETcERcb6AXjxgYUaLFg=;
 b=uaS6tREJEBYF4e0nqq1HZyBrhYMXsfJ3Q3/P2BU5pHfDrzDHPkzgdt/BAi/HKl16Ys
 32pbWLHqpYC6qGebX8jlK4NsBVR0q2zEcqYhaSvgjJzVsKnLRMLNj/w0xKDhbKjwwur7
 UqxmzQ3jDIu0jdNujkbLOkf7Qxr57qFxO3O9MRuOhM1juPNu6fF1mdVTg0nZ0T5D5sVR
 V3NIpEv9npwrW1WjXd4q2JhC3YTmU76Sg2UKeaxsb3SJxRTpq7K81G471RVPoLyn0ZEk
 N46huLXvwbzaum2ZfJ7oafViqlEdMGv2+FhgMD/Ozje9moVmupnnQ2A9feaB/vuuRXEo
 mAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=PxgN9VWEP3jH1n+0VfN2/ZE7ETcERcb6AXjxgYUaLFg=;
 b=zlE0tt0BRB7MYyQ0R/qNWTrdv/4R6OfHvx50jMUzcosJ4MfultXlUaFsszjfyB/yxV
 F01EnY1CroabZ14GXK5gXx/jsENMMKNWbwP2h0kREd9xDIYcDRJhl/4vv9kST9G+M3UM
 ktJSUUdi4kt21KtgOsLlF01lOk9Eo/XXO9/pFcSk50ynQ1oan79Bpu4hTnN1ZuflBUPb
 NTRubOh1T1UucBJnC2c4AMyJtcvxrhh+c2+5V4+qg7xFUHYTiX0nZDdZ0Ki3e9Y3g4Rw
 dJu7+ctXrZdQdfLMt5jcUOuJNb5DKrA+BrDk47JAVl2vHvsZEXX29cZwSitdtCaXGW8V
 W0Mw==
X-Gm-Message-State: ACgBeo0MIEO37sYIyVN4psGYYfhiqpstKMnotc1ujhOjBVN42Gu4/pBY
 RfymJA55knhd5uhR3RhKXXkVIpvRsVZFzQ==
X-Google-Smtp-Source: AA6agR7igKgYoq97aetSfx4FjXiFGrSv98Mdt/giJc6hGU1c3p7qYzZGxXmOKhluxvXGTZ3v5Umj5g==
X-Received: by 2002:a17:90b:3ec9:b0:1f5:62d5:4157 with SMTP id
 rm9-20020a17090b3ec900b001f562d54157mr428989pjb.183.1661207854000; 
 Mon, 22 Aug 2022 15:37:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/i386: Use tcg gvec ops for pmovmskb
Date: Mon, 22 Aug 2022 15:37:22 -0700
Message-Id: <20220822223722.1697758-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

As pmovmskb is used by strlen et al, this is the third
highest overhead sse operation at %0.8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h        | 26 -----------
 target/i386/ops_sse_header.h |  1 -
 target/i386/tcg/translate.c  | 86 +++++++++++++++++++++++++++++++-----
 3 files changed, 74 insertions(+), 39 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index b21f315f37..9f9801be63 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1098,32 +1098,6 @@ uint32_t helper_movmskpd(CPUX86State *env, Reg *s)
 
 #endif
 
-uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
-{
-    uint32_t val;
-
-    val = 0;
-    val |= (s->B(0) >> 7);
-    val |= (s->B(1) >> 6) & 0x02;
-    val |= (s->B(2) >> 5) & 0x04;
-    val |= (s->B(3) >> 4) & 0x08;
-    val |= (s->B(4) >> 3) & 0x10;
-    val |= (s->B(5) >> 2) & 0x20;
-    val |= (s->B(6) >> 1) & 0x40;
-    val |= (s->B(7)) & 0x80;
-#if SHIFT == 1
-    val |= (s->B(8) << 1) & 0x0100;
-    val |= (s->B(9) << 2) & 0x0200;
-    val |= (s->B(10) << 3) & 0x0400;
-    val |= (s->B(11) << 4) & 0x0800;
-    val |= (s->B(12) << 5) & 0x1000;
-    val |= (s->B(13) << 6) & 0x2000;
-    val |= (s->B(14) << 7) & 0x4000;
-    val |= (s->B(15) << 8) & 0x8000;
-#endif
-    return val;
-}
-
 void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     Reg r;
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 542701720e..d6bb10342c 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -201,7 +201,6 @@ DEF_HELPER_2(movmskps, i32, env, Reg)
 DEF_HELPER_2(movmskpd, i32, env, Reg)
 #endif
 
-DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
 DEF_HELPER_3(glue(packsswb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(packuswb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d25d914d63..5829c702d6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2776,6 +2776,77 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
 
+static void gen_pmovmskb_i64(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_andi_i64(d, s, 0x8080808080808080ull);
+
+    /*
+     * After each shift+or pair:
+     * 0:  a.......b.......c.......d.......e.......f.......g.......h.......
+     * 7:  ab......bc......cd......de......ef......fg......gh......h.......
+     * 14: abcd....bcde....cdef....defg....efgh....fgh.....gh......h.......
+     * 28: abcdefghbcdefgh.cdefgh..defgh...efgh....fgh.....gh......h.......
+     * The result is left in the high bits of the word.
+     */
+    tcg_gen_shli_i64(t, d, 7);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 14);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 28);
+    tcg_gen_or_i64(d, d, t);
+}
+
+static void gen_pmovmskb_vec(unsigned vece, TCGv_vec d, TCGv_vec s)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, MO_8, 0x80);
+
+    /* See above */
+    tcg_gen_and_vec(vece, d, s, m);
+    tcg_gen_shli_vec(vece, t, d, 7);
+    tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, d, 14);
+    tcg_gen_or_vec(vece, d, d, t);
+    if (vece == MO_64) {
+        tcg_gen_shli_vec(vece, t, d, 28);
+        tcg_gen_or_vec(vece, d, d, t);
+    }
+}
+
+static void gen_gvec_pmovmskb(TCGv out, int s_reg, bool is_xmm)
+{
+    static const TCGOpcode vecop_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2 g = {
+        .fni8 = gen_pmovmskb_i64,
+        .fniv = gen_pmovmskb_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64
+    };
+
+    int s_ofs = (is_xmm
+                 ? offsetof(CPUX86State, xmm_regs[s_reg].ZMM_X(0))
+                 : offsetof(CPUX86State, fpregs[s_reg].mmx));
+    int d_ofs = (is_xmm
+                 ? offsetof(CPUX86State, xmm_t0.ZMM_X(0))
+                 : offsetof(CPUX86State, mmx_t0));
+    int vec_len = is_xmm ? 16 : 8;
+
+    tcg_gen_gvec_2(d_ofs, s_ofs, vec_len, vec_len, &g);
+
+    if (is_xmm) {
+        TCGv t = tcg_temp_new();
+        tcg_gen_ld8u_tl(t, cpu_env, d_ofs + offsetof(XMMReg, XMM_B(15)));
+        tcg_gen_ld8u_tl(out, cpu_env, d_ofs + offsetof(XMMReg, XMM_B(7)));
+        tcg_gen_deposit_tl(out, out, t, 8, TARGET_LONG_BITS - 8);
+        tcg_temp_free(t);
+    } else {
+        tcg_gen_ld8u_tl(out, cpu_env, d_ofs + offsetof(MMXReg, MMX_B(7)));
+    }
+}
+
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
@@ -3742,21 +3813,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0xd7: /* pmovmskb */
         case 0x1d7:
-            if (mod != 3)
+            if (mod != 3) {
                 goto illegal_op;
-            if (b1) {
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
-                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
-            } else {
-                rm = (modrm & 7);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, fpregs[rm].mmx));
-                gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr0);
             }
+            rm = (modrm & 7) | (is_xmm ? REX_B(s) : 0);
             reg = ((modrm >> 3) & 7) | REX_R(s);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+            gen_gvec_pmovmskb(cpu_regs[reg], rm, is_xmm);
             break;
 
         case 0x138:
-- 
2.34.1


