Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9803AF199
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNTo-0005cR-Eq
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNRN-0002fO-B2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:10:29 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNRI-0006v8-Ua
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:10:28 -0400
Received: by mail-pg1-x52e.google.com with SMTP id u190so10855961pgd.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6UDS/h0EdjPQ8Lu46siJtRgmRWaeR+iI26m93HAz8s=;
 b=Z2d/PaL2SCrE+aLjxvRQTw36xU7CdgJ1IxG1WboL8dtJa0cXWfGseNUDEYWGQGdUuH
 wxoJT6X3nZ/GIGwkzqiKaApijPAAXqLhA7dCLEhFZ8jZSdTS9Cki5FWauF4svs9Rz18M
 3H92XHzKbcEisKFhBbI0HoYEwT9uzNH1RgagvRFxZPidJXCkSI4UInXO5NzwqwJf44J/
 w4D3/itfSus7v4jFq+Sk/ioXoyydjavMQy1FOqEoGSL+W2YT9M8ryayui0Kysk7F7xBD
 0HjxtNRMt+x8WASvfDR1eSKRijXi7HBR2zAvtcIECoy8iLAo89bK4MiRYnrNnsS4odGY
 ZrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6UDS/h0EdjPQ8Lu46siJtRgmRWaeR+iI26m93HAz8s=;
 b=p+1w9eZ8zcK7lF7ZGcO/zmbXZCcHFpmZUJAinCWcgs4wCQa8Mp87gWwJGEBl6g9A9f
 UQTChdUNgvZW+VUSsKwrLmxe1j5X2FeEV4qbZDMeUdokOR0b1NYZtEYd2GSmhjTt2iRE
 GwFWi4oeJkzW6i72Pq66rety/lodsUXcYvXqKgqnfx5a5ND6C0y7tUw2ZUyr77tXo2Yq
 Q2z+SsKMFewPKTq956RMiFBomqbl2hUUHAkngUX8iunPQRxnFuccNZTNeT4DMH4gZDMh
 0dRf5SLsRqT+wLjY0TqK00O1CSKeKa5s+11uxhSYkgRTL0jof6qGo1QDx+kFHh1jI8Uk
 qyjQ==
X-Gm-Message-State: AOAM531HIQrZPReTEEtMtMe6/A5MtrKJ6/+hgZtA40Lh+Lyh12aOwMuA
 Vsy6AAbB0M81gHdilg9/N0siNUHr4IjWQA==
X-Google-Smtp-Source: ABdhPJyx8y4mfEa5YWgGtR+nEXQdpi6fK1ZNlMDQ+ObodruwQtbA9IJ1yXhr7SKOrJE8pymrJNlrKg==
X-Received: by 2002:a05:6a00:2d7:b029:304:5af1:65f6 with SMTP id
 b23-20020a056a0002d7b02903045af165f6mr2845124pft.80.1624295423054; 
 Mon, 21 Jun 2021 10:10:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm19458054pjv.7.2021.06.21.10.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 10:10:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/alpha: Honor the FEN bit
Date: Mon, 21 Jun 2021 10:10:21 -0700
Message-Id: <20210621171021.1819881-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jason Thorpe <thorpej@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bit is used by NetBSD for lazy fpu migration.

Reported-by: Jason Thorpe <thorpej@me.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/438
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 75 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f454adea5e..f2922f5f8c 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1471,6 +1471,13 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
         }                                       \
     } while (0)
 
+#define REQUIRE_FEN                             \
+    do {                                        \
+        if (!(ctx->tbflags & ENV_FLAG_FEN)) {   \
+            goto raise_fen;                     \
+        }                                       \
+    } while (0)
+
 static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
 {
     int32_t disp21, disp16, disp12 __attribute__((unused));
@@ -2066,6 +2073,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x04:
             /* ITOFS */
             REQUIRE_REG_31(rb);
+            REQUIRE_FEN;
             t32 = tcg_temp_new_i32();
             va = load_gpr(ctx, ra);
             tcg_gen_extrl_i64_i32(t32, va);
@@ -2075,17 +2083,20 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x0A:
             /* SQRTF */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             vb = load_fpr(ctx, rb);
             gen_helper_sqrtf(vc, cpu_env, vb);
             break;
         case 0x0B:
             /* SQRTS */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_sqrts(ctx, rb, rc, fn11);
             break;
         case 0x14:
             /* ITOFF */
             REQUIRE_REG_31(rb);
+            REQUIRE_FEN;
             t32 = tcg_temp_new_i32();
             va = load_gpr(ctx, ra);
             tcg_gen_extrl_i64_i32(t32, va);
@@ -2095,18 +2106,21 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x24:
             /* ITOFT */
             REQUIRE_REG_31(rb);
+            REQUIRE_FEN;
             va = load_gpr(ctx, ra);
             tcg_gen_mov_i64(vc, va);
             break;
         case 0x2A:
             /* SQRTG */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             vb = load_fpr(ctx, rb);
             gen_helper_sqrtg(vc, cpu_env, vb);
             break;
         case 0x02B:
             /* SQRTT */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_sqrtt(ctx, rb, rc, fn11);
             break;
         default:
@@ -2123,18 +2137,22 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         switch (fpfn) { /* fn11 & 0x3F */
         case 0x00:
             /* ADDF */
+            REQUIRE_FEN;
             gen_helper_addf(vc, cpu_env, va, vb);
             break;
         case 0x01:
             /* SUBF */
+            REQUIRE_FEN;
             gen_helper_subf(vc, cpu_env, va, vb);
             break;
         case 0x02:
             /* MULF */
+            REQUIRE_FEN;
             gen_helper_mulf(vc, cpu_env, va, vb);
             break;
         case 0x03:
             /* DIVF */
+            REQUIRE_FEN;
             gen_helper_divf(vc, cpu_env, va, vb);
             break;
         case 0x1E:
@@ -2143,35 +2161,43 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             goto invalid_opc;
         case 0x20:
             /* ADDG */
+            REQUIRE_FEN;
             gen_helper_addg(vc, cpu_env, va, vb);
             break;
         case 0x21:
             /* SUBG */
+            REQUIRE_FEN;
             gen_helper_subg(vc, cpu_env, va, vb);
             break;
         case 0x22:
             /* MULG */
+            REQUIRE_FEN;
             gen_helper_mulg(vc, cpu_env, va, vb);
             break;
         case 0x23:
             /* DIVG */
+            REQUIRE_FEN;
             gen_helper_divg(vc, cpu_env, va, vb);
             break;
         case 0x25:
             /* CMPGEQ */
+            REQUIRE_FEN;
             gen_helper_cmpgeq(vc, cpu_env, va, vb);
             break;
         case 0x26:
             /* CMPGLT */
+            REQUIRE_FEN;
             gen_helper_cmpglt(vc, cpu_env, va, vb);
             break;
         case 0x27:
             /* CMPGLE */
+            REQUIRE_FEN;
             gen_helper_cmpgle(vc, cpu_env, va, vb);
             break;
         case 0x2C:
             /* CVTGF */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_helper_cvtgf(vc, cpu_env, vb);
             break;
         case 0x2D:
@@ -2181,16 +2207,19 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x2F:
             /* CVTGQ */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_helper_cvtgq(vc, cpu_env, vb);
             break;
         case 0x3C:
             /* CVTQF */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_helper_cvtqf(vc, cpu_env, vb);
             break;
         case 0x3E:
             /* CVTQG */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_helper_cvtqg(vc, cpu_env, vb);
             break;
         default:
@@ -2203,54 +2232,67 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         switch (fpfn) { /* fn11 & 0x3F */
         case 0x00:
             /* ADDS */
+            REQUIRE_FEN;
             gen_adds(ctx, ra, rb, rc, fn11);
             break;
         case 0x01:
             /* SUBS */
+            REQUIRE_FEN;
             gen_subs(ctx, ra, rb, rc, fn11);
             break;
         case 0x02:
             /* MULS */
+            REQUIRE_FEN;
             gen_muls(ctx, ra, rb, rc, fn11);
             break;
         case 0x03:
             /* DIVS */
+            REQUIRE_FEN;
             gen_divs(ctx, ra, rb, rc, fn11);
             break;
         case 0x20:
             /* ADDT */
+            REQUIRE_FEN;
             gen_addt(ctx, ra, rb, rc, fn11);
             break;
         case 0x21:
             /* SUBT */
+            REQUIRE_FEN;
             gen_subt(ctx, ra, rb, rc, fn11);
             break;
         case 0x22:
             /* MULT */
+            REQUIRE_FEN;
             gen_mult(ctx, ra, rb, rc, fn11);
             break;
         case 0x23:
             /* DIVT */
+            REQUIRE_FEN;
             gen_divt(ctx, ra, rb, rc, fn11);
             break;
         case 0x24:
             /* CMPTUN */
+            REQUIRE_FEN;
             gen_cmptun(ctx, ra, rb, rc, fn11);
             break;
         case 0x25:
             /* CMPTEQ */
+            REQUIRE_FEN;
             gen_cmpteq(ctx, ra, rb, rc, fn11);
             break;
         case 0x26:
             /* CMPTLT */
+            REQUIRE_FEN;
             gen_cmptlt(ctx, ra, rb, rc, fn11);
             break;
         case 0x27:
             /* CMPTLE */
+            REQUIRE_FEN;
             gen_cmptle(ctx, ra, rb, rc, fn11);
             break;
         case 0x2C:
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             if (fn11 == 0x2AC || fn11 == 0x6AC) {
                 /* CVTST */
                 gen_cvtst(ctx, rb, rc, fn11);
@@ -2262,16 +2304,19 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x2F:
             /* CVTTQ */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_cvttq(ctx, rb, rc, fn11);
             break;
         case 0x3C:
             /* CVTQS */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_cvtqs(ctx, rb, rc, fn11);
             break;
         case 0x3E:
             /* CVTQT */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             gen_cvtqt(ctx, rb, rc, fn11);
             break;
         default:
@@ -2284,12 +2329,14 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         case 0x010:
             /* CVTLQ */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             vc = dest_fpr(ctx, rc);
             vb = load_fpr(ctx, rb);
             gen_cvtlq(vc, vb);
             break;
         case 0x020:
             /* CPYS */
+            REQUIRE_FEN;
             if (rc == 31) {
                 /* Special case CPYS as FNOP.  */
             } else {
@@ -2306,6 +2353,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             break;
         case 0x021:
             /* CPYSN */
+            REQUIRE_FEN;
             vc = dest_fpr(ctx, rc);
             vb = load_fpr(ctx, rb);
             va = load_fpr(ctx, ra);
@@ -2313,6 +2361,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             break;
         case 0x022:
             /* CPYSE */
+            REQUIRE_FEN;
             vc = dest_fpr(ctx, rc);
             vb = load_fpr(ctx, rb);
             va = load_fpr(ctx, ra);
@@ -2320,6 +2369,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             break;
         case 0x024:
             /* MT_FPCR */
+            REQUIRE_FEN;
             va = load_fpr(ctx, ra);
             gen_helper_store_fpcr(cpu_env, va);
             if (ctx->tb_rm == QUAL_RM_D) {
@@ -2330,37 +2380,45 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             break;
         case 0x025:
             /* MF_FPCR */
+            REQUIRE_FEN;
             va = dest_fpr(ctx, ra);
             gen_helper_load_fpcr(va, cpu_env);
             break;
         case 0x02A:
             /* FCMOVEQ */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_EQ, ra, rb, rc);
             break;
         case 0x02B:
             /* FCMOVNE */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_NE, ra, rb, rc);
             break;
         case 0x02C:
             /* FCMOVLT */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_LT, ra, rb, rc);
             break;
         case 0x02D:
             /* FCMOVGE */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_GE, ra, rb, rc);
             break;
         case 0x02E:
             /* FCMOVLE */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_LE, ra, rb, rc);
             break;
         case 0x02F:
             /* FCMOVGT */
+            REQUIRE_FEN;
             gen_fcmov(ctx, TCG_COND_GT, ra, rb, rc);
             break;
         case 0x030: /* CVTQL */
         case 0x130: /* CVTQL/V */
         case 0x530: /* CVTQL/SV */
             REQUIRE_REG_31(ra);
+            REQUIRE_FEN;
             vc = dest_fpr(ctx, rc);
             vb = load_fpr(ctx, rb);
             gen_helper_cvtql(vc, cpu_env, vb);
@@ -2793,34 +2851,42 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
 #endif
     case 0x20:
         /* LDF */
+        REQUIRE_FEN;
         gen_load_mem(ctx, &gen_qemu_ldf, ra, rb, disp16, 1, 0);
         break;
     case 0x21:
         /* LDG */
+        REQUIRE_FEN;
         gen_load_mem(ctx, &gen_qemu_ldg, ra, rb, disp16, 1, 0);
         break;
     case 0x22:
         /* LDS */
+        REQUIRE_FEN;
         gen_load_mem(ctx, &gen_qemu_lds, ra, rb, disp16, 1, 0);
         break;
     case 0x23:
         /* LDT */
+        REQUIRE_FEN;
         gen_load_mem(ctx, &tcg_gen_qemu_ld64, ra, rb, disp16, 1, 0);
         break;
     case 0x24:
         /* STF */
+        REQUIRE_FEN;
         gen_store_mem(ctx, &gen_qemu_stf, ra, rb, disp16, 1, 0);
         break;
     case 0x25:
         /* STG */
+        REQUIRE_FEN;
         gen_store_mem(ctx, &gen_qemu_stg, ra, rb, disp16, 1, 0);
         break;
     case 0x26:
         /* STS */
+        REQUIRE_FEN;
         gen_store_mem(ctx, &gen_qemu_sts, ra, rb, disp16, 1, 0);
         break;
     case 0x27:
         /* STT */
+        REQUIRE_FEN;
         gen_store_mem(ctx, &tcg_gen_qemu_st64, ra, rb, disp16, 1, 0);
         break;
     case 0x28:
@@ -2862,12 +2928,15 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         ret = gen_bdirect(ctx, ra, disp21);
         break;
     case 0x31: /* FBEQ */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_EQ, ra, disp21);
         break;
     case 0x32: /* FBLT */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_LT, ra, disp21);
         break;
     case 0x33: /* FBLE */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_LE, ra, disp21);
         break;
     case 0x34:
@@ -2875,12 +2944,15 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         ret = gen_bdirect(ctx, ra, disp21);
         break;
     case 0x35: /* FBNE */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_NE, ra, disp21);
         break;
     case 0x36: /* FBGE */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_GE, ra, disp21);
         break;
     case 0x37: /* FBGT */
+        REQUIRE_FEN;
         ret = gen_fbcond(ctx, TCG_COND_GT, ra, disp21);
         break;
     case 0x38:
@@ -2918,6 +2990,9 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
     invalid_opc:
         ret = gen_invalid(ctx);
         break;
+    raise_fen:
+        ret = gen_excp(ctx, EXCP_FEN, 0);
+        break;
     }
 
     return ret;
-- 
2.25.1


