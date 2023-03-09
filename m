Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC86B2E70
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa2-0003cV-HI; Thu, 09 Mar 2023 15:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZz-0003Pw-7y
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZx-0001Vl-Js
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6664719pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFKvR27NDihSbHS157V+NkcV6tIr6k7+tyVXGGm42uc=;
 b=XbGURHAgs10ano02BT8pfIw4YsH36e0mqmx14m33Db0ENpnpdSQqmypJWF6h3XcR6H
 hcOUFEdfqhVjNSF4bjuD62xXzgkZ8KoYaL9Xr1OJFg7FSls3nth8lhm4gERvOokeI5uc
 gKcGTIYV0Z+3BF8Dwah3zfdl/O9tnRDyE6BVORSOuvZlb1gWQ/dTZ7ZGGAFdF0daQ+iM
 062AePzwT9M0X9RCkzeO8JCUXr8PvECUkUpQ37ql75UV30/qZJig6LLdV6M9inI7xFTi
 nW2A8/Q46eQqH24jwsBM2MG27mmAr5jIdmtk/qfEDQDmWC5gI8wxnYpy4tdOEM9ojjMY
 6YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFKvR27NDihSbHS157V+NkcV6tIr6k7+tyVXGGm42uc=;
 b=oyankdZ09ERJRvWo41fnMSFEXZUq2Xu8XlJOzS54NMFVm2/ASuoE9rycEzN4OT6sDV
 BOiRu2meFhzeukFudT51F3cLLRlNtwo75zgL6aFGPoJXXbEdWfFWCAoVlNfc0u4ekW/U
 6mbwJDion4fCNIF4TsyLiwOHwj/rT8/nooeZqIDgOVqIDb7KDFiTuSvbekBRSbF2ob8o
 rZoc88hweoxv5NjdZEwczAEZZTp1WZg0FlbxiZrNjY5VQaE92nANCq/yweqQBbxMWHxb
 +TslgJSTgYheiGxUQ6LzsMiKjd8fDAvOGlVNp+Fi1bDvC7tO4vLjkDi4L0X9VWSwZrMQ
 R4Ww==
X-Gm-Message-State: AO0yUKVP3R1/eTIPJBENxUcWPwWO4+61TNf4+pjNXtqrnUxY9SI2YRsg
 XNLubM5iyRTnvxLqul3LUcTocC8OckQelPstu8o=
X-Google-Smtp-Source: AK7set/xdmnI7nLbi76L1r9eYHULOVom0HT8RL3BwMZeanxLuojaJCle8GDLPp4ia/JY93K5pl0uuw==
X-Received: by 2002:a17:903:244c:b0:19e:3b41:1828 with SMTP id
 l12-20020a170903244c00b0019e3b411828mr25100045pls.22.1678392572135; 
 Thu, 09 Mar 2023 12:09:32 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 45/91] target/m68k: Avoid tcg_const_i32 when modified
Date: Thu,  9 Mar 2023 12:05:04 -0800
Message-Id: <20230309200550.3878088-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

In several instances, a temp is initialized with a
for use as a constant, and then subsequently used
as an unrelated temp.  Split them.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3055d2d246..0002d80bf9 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1631,8 +1631,8 @@ static void bcd_add(TCGv dest, TCGv src)
      *    = result with some possible exceeding 0x6
      */
 
-    t0 = tcg_const_i32(0x066);
-    tcg_gen_add_i32(t0, t0, src);
+    t0 = tcg_temp_new();
+    tcg_gen_addi_i32(t0, src, 0x066);
 
     t1 = tcg_temp_new();
     tcg_gen_add_i32(t1, t0, dest);
@@ -1818,7 +1818,8 @@ DISAS_INSN(nbcd)
 
     SRC_EA(env, src, OS_BYTE, 0, &addr);
 
-    dest = tcg_const_i32(0);
+    dest = tcg_temp_new();
+    tcg_gen_movi_i32(dest, 0);
     bcd_sub(dest, src);
 
     DEST_EA(env, insn, OS_BYTE, dest, &addr);
@@ -1896,8 +1897,8 @@ DISAS_INSN(bitop_reg)
     else
         tcg_gen_andi_i32(src2, DREG(insn, 9), 31);
 
-    tmp = tcg_const_i32(1);
-    tcg_gen_shl_i32(tmp, tmp, src2);
+    tmp = tcg_temp_new();
+    tcg_gen_shl_i32(tmp, tcg_constant_i32(1), src2);
 
     tcg_gen_and_i32(QREG_CC_Z, src1, tmp);
 
@@ -3076,7 +3077,7 @@ DISAS_INSN(suba)
 
 static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
 {
-    TCGv tmp;
+    TCGv tmp, zero;
 
     gen_flush_flags(s); /* compute old Z */
 
@@ -3085,14 +3086,15 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
      * (X, N) = dest - (src + X);
      */
 
-    tmp = tcg_const_i32(0);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, tmp, QREG_CC_X, tmp);
-    tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, dest, tmp, QREG_CC_N, QREG_CC_X);
+    zero = tcg_constant_i32(0);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, zero, QREG_CC_X, zero);
+    tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, dest, zero, QREG_CC_N, QREG_CC_X);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
     tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
 
     /* Compute signed-overflow for subtract.  */
 
+    tmp = tcg_temp_new();
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_and_i32(QREG_CC_V, QREG_CC_V, tmp);
@@ -3279,7 +3281,7 @@ DISAS_INSN(adda)
 
 static inline void gen_addx(DisasContext *s, TCGv src, TCGv dest, int opsize)
 {
-    TCGv tmp;
+    TCGv tmp, zero;
 
     gen_flush_flags(s); /* compute old Z */
 
@@ -3288,13 +3290,14 @@ static inline void gen_addx(DisasContext *s, TCGv src, TCGv dest, int opsize)
      * (X, N) = src + dest + X;
      */
 
-    tmp = tcg_const_i32(0);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_X, tmp, dest, tmp);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_N, QREG_CC_X, src, tmp);
+    zero = tcg_constant_i32(0);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_X, zero, dest, zero);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_N, QREG_CC_X, src, zero);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
 
     /* Compute signed-overflow for addition.  */
 
+    tmp = tcg_temp_new();
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_andc_i32(QREG_CC_V, QREG_CC_V, tmp);
-- 
2.34.1


