Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF666A3AF8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWO4-0006AZ-HC; Mon, 27 Feb 2023 00:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMq-0002CH-Ug
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:09 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMo-0007Mb-IV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:08 -0500
Received: by mail-pl1-x643.google.com with SMTP id bh1so5538204plb.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdRDdNWfFqD4FUaoiGI/L+KvxtDfP/G1FLTK9icUxXA=;
 b=AqqJIR4YpbCJWZOdDpLGmynl5/UDCEA5MBjuIKuj1nN+8baGACFz2pZ+aM82nXqX/k
 CtABGn0lGyvEjFW1z1e+7jjicU/y7QLXTk948nT6812zkBwPNUW3dlBW2KJa+nSwoj/5
 1lewWgGS4pLtBZoIMZDAMJhWzapT7jt6gUMSoRmJA68U3Fr/yslLmEoBM+27CMo5hyHN
 Xe8IC1ORIfGKUIGoigoCJpk80S6QNXMD+9d39A1RIoZqjGcqUaGcW3F49Uld2jqqyJYW
 i7uQg56k726fvYeJa1taJy61JKnlQ22nCujPKepe361ZONFvBp/9w7MEd0sQs+7U87YZ
 tHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cdRDdNWfFqD4FUaoiGI/L+KvxtDfP/G1FLTK9icUxXA=;
 b=vh2+tebn54LdyPWYiXWLzWwpwkCJv5MbW6k6jxqN7axnbTCFR2Fc8mnzioJB314RDo
 20vwNRZ1DuIl9+ad+zHDNFv6TWxG3fekvkcFvW/4zGU4TwsxjrDOJtcTW01cA3b5BLBT
 jyCDbsANU1df6zs+IP4JSWDy+oUYR3d8AEMe9ZBeXfKWmoYBXCIFzgoQMKejGTRfwh+f
 6n+i/2mo9/yjf25cW9ikdgQwh1NZ4OkRq+dWwZXum2JSGn3leFlMYvYxeTkESyrUT6ti
 +xS30RQGvfJYEm+wgJ8oqf2McIZsA7YMniuTObsl3G+8LqJi12aUvMzeGUaTiQUM9CSL
 UoYQ==
X-Gm-Message-State: AO0yUKUYVLhj9y+F5vYnRHNX/+W3BFYv6s+LAZD921KFr5b8P7RDN0/4
 JDtua1l1OX/ypyBUPTwP5uoqoVhrMfKbpjAP2xs7lA==
X-Google-Smtp-Source: AK7set8mns3hzoUxDI1WA0ayN+Bwp8zDiX5pvSH8N0SIjZeo+IxVXc4vCE1NvN0F/afykuXslUIEYg==
X-Received: by 2002:a17:903:430e:b0:19c:d796:9ab8 with SMTP id
 jz14-20020a170903430e00b0019cd7969ab8mr8398104plb.53.1677476885164; 
 Sun, 26 Feb 2023 21:48:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 53/70] target/sh4: Avoid tcg_const_i32
Date: Sun, 26 Feb 2023 19:42:16 -1000
Message-Id: <20230227054233.390271-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 70a45c26e8..97da8bce48 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -526,13 +526,13 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x9000:		/* mov.w @(disp,PC),Rn */
 	{
-            TCGv addr = tcg_const_i32(ctx->base.pc_next + 4 + B7_0 * 2);
+            TCGv addr = tcg_constant_i32(ctx->base.pc_next + 4 + B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
 	}
 	return;
     case 0xd000:		/* mov.l @(disp,PC),Rn */
 	{
-            TCGv addr = tcg_const_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
+            TCGv addr = tcg_constant_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
 	}
 	return;
@@ -694,7 +694,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x300e:		/* addc Rm,Rn */
         {
             TCGv t0, t1;
-            t0 = tcg_const_tl(0);
+            t0 = tcg_constant_tl(0);
             t1 = tcg_temp_new();
             tcg_gen_add2_i32(t1, cpu_sr_t, cpu_sr_t, t0, REG(B7_4), t0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
@@ -754,7 +754,7 @@ static void _decode_opc(DisasContext * ctx)
             TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
-            TCGv zero = tcg_const_i32(0);
+            TCGv zero = tcg_constant_i32(0);
 
             /* shift left arg1, saving the bit being pushed out and inserting
                T on the right */
@@ -849,7 +849,7 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x600a:		/* negc Rm,Rn */
         {
-            TCGv t0 = tcg_const_i32(0);
+            TCGv t0 = tcg_constant_i32(0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
                              REG(B7_4), t0, cpu_sr_t, t0);
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
@@ -913,7 +913,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x300a:		/* subc Rm,Rn */
         {
             TCGv t0, t1;
-            t0 = tcg_const_tl(0);
+            t0 = tcg_constant_tl(0);
             t1 = tcg_temp_new();
             tcg_gen_add2_i32(t1, cpu_sr_t, cpu_sr_t, t0, REG(B7_4), t0);
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
@@ -1242,7 +1242,7 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv imm;
 	    CHECK_NOT_DELAY_SLOT
             gen_save_cpu_state(ctx, true);
-	    imm = tcg_const_i32(B7_0);
+	    imm = tcg_constant_i32(B7_0);
             gen_helper_trapa(cpu_env, imm);
             ctx->base.is_jmp = DISAS_NORETURN;
 	}
@@ -1709,8 +1709,8 @@ static void _decode_opc(DisasContext * ctx)
         CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_1
         {
-            TCGv m = tcg_const_i32((ctx->opcode >> 8) & 3);
-            TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
+            TCGv m = tcg_constant_i32((ctx->opcode >> 8) & 3);
+            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
             gen_helper_fipr(cpu_env, m, n);
             return;
         }
@@ -1722,7 +1722,7 @@ static void _decode_opc(DisasContext * ctx)
             if ((ctx->opcode & 0x0300) != 0x0100) {
                 goto do_illegal;
             }
-            TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
+            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
             gen_helper_ftrv(cpu_env, n);
             return;
         }
@@ -1926,7 +1926,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
         }
         op_dst = B11_8;
         op_opc = INDEX_op_xor_i32;
-        op_arg = tcg_const_i32(-1);
+        op_arg = tcg_constant_i32(-1);
         break;
 
     case 0x7000 ... 0x700f: /* add #imm,Rn */
@@ -1934,7 +1934,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
             goto fail;
         }
         op_opc = INDEX_op_add_i32;
-        op_arg = tcg_const_i32(B7_0s);
+        op_arg = tcg_constant_i32(B7_0s);
         break;
 
     case 0x3000: /* cmp/eq Rm,Rn */
@@ -1980,7 +1980,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
             goto fail;
         }
         op_opc = INDEX_op_setcond_i32;
-        op_arg = tcg_const_i32(0);
+        op_arg = tcg_constant_i32(0);
 
         NEXT_INSN;
         if ((ctx->opcode & 0xff00) != 0x8900 /* bt label */
-- 
2.34.1


