Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005941FC56
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:38:56 +0200 (CEST)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfE7-0002kU-H1
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfDD-00025w-Mx
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:37:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfDB-0004bl-Kn
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:37:59 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so2370663wmg.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xestjMyTU7oTS0aNWwsb1degxoOmHdnc4pP8SK5HjqQ=;
 b=VAFh6x2ykob7+dXJPU3qAQMesSaOsOyrKChdePdyp5K7/f1mFN+00+x60XWNgQTjA7
 PiJW8NQe5MvRKJieyrrqyw3OcdKI0BppadRUANp1fQsSkSKHhwnOPfpgCJBDI+GJzQMw
 dkGXN2skzkZc/Eji60C1MLojVyN111ZPHWzJR/xVOv7i9zVZkkx0Fc/AiKooZgfIVuxo
 dkUYaULBZxDqA7yNET3uqQRRjYWYZXS8TP2gJeh0UCZUxuth7g7zLaFGjzQwev6wIwkm
 J+I0nAOz7gCOEdy5EzqhARsMwbJfMaoWnLp9eDslseQFwaeqCoEnCx/sFJ+XUnXsZJBO
 G8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xestjMyTU7oTS0aNWwsb1degxoOmHdnc4pP8SK5HjqQ=;
 b=w+rL9XtQWaDrIfAWA4v0Z6pM/MQDt2hEDkk63H5de6q3o/bigTTf3NpJrPx3Wfmbu1
 N99YUsxWyRriYqkS+pXBn7+TaGjKQjaYBKVyJpBuTBk+lNadlCc9NzEM0NvboMNZTE/a
 ZOL70M6GhhZ2WzdXNyQznmiqlItPNCXaaCdIjYvUFz5NbzKk+rl68TQTRA1U91d9nud0
 /0yDQDBcbp4MV0FdAFnMl7sqUDYt6rV7FUZOhNJTLU5V97vc88qru526Pyo19dnRH5jG
 idinr5LXdio4TX2EoWWQEJiDQFHToQUrTJRA/jALc6QPEhBghQXYXL0eIX00UducR8UJ
 FTrg==
X-Gm-Message-State: AOAM530QjTsrKStNovG1436QJbrHj+v3EJiKgcj+77yi/y/3vXKg8hd5
 MQ1nyBFuH6MCJpdzE7dUINtF3mCrhqk=
X-Google-Smtp-Source: ABdhPJze7YGVi8pTY3Mo+g/xn7EVaqWCJpycZGKFze2HnfZu/ko0k6E3tunKIm17r99kjOYqrPe0qg==
X-Received: by 2002:a7b:c7ce:: with SMTP id z14mr9871999wmk.91.1633181874865; 
 Sat, 02 Oct 2021 06:37:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i27sm10807171wmb.40.2021.10.02.06.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 06:37:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: remove gen_mfc0_load64() and use
 tcg_gen_ld32s_tl()
Date: Sat,  2 Oct 2021 15:37:53 +0200
Message-Id: <20211002133753.3432668-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leon Alrae <leon.alrae@imgtec.com>

Remove misleading gen_mfc0_load64() which actually loads 32 or 64 bits
depending whether MIPS32 or MIPS64 and also replace the pair of
tcg_gen_ld_tl() + tcg_gen_ext32s_tl() with single tcg_gen_ld32s_tl().

Patch partly generated using the following spatch script:

    @@
    expression reg, env, ofs;
    @@
    -tcg_gen_ld_tl(reg, env, ofs);
    -tcg_gen_ext32s_tl(reg, reg);
    +tcg_gen_ld32s_tl(reg, env, ofs);

Signed-off-by: Leon Alrae <leon.alrae@imgtec.com>
[PMD: Rebased and used Coccinelle spatch to complete]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 68 ++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 148afec9dc0..40b350d6e17 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5382,12 +5382,6 @@ static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
     tcg_temp_free_i32(t0);
 }
 
-static inline void gen_mfc0_load64(TCGv arg, target_ulong off)
-{
-    tcg_gen_ld_tl(arg, cpu_env, off);
-    tcg_gen_ext32s_tl(arg, arg);
-}
-
 static inline void gen_mtc0_store32(TCGv arg, target_ulong off)
 {
     TCGv_i32 t0 = tcg_temp_new_i32();
@@ -5679,17 +5673,19 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             break;
         case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_YQMask));
+            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMask));
             register_name = "YQMask";
             break;
         case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPESchedule));
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name = "VPESchedule";
             break;
         case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            gen_mfc0_load64(arg, offsetof(CPUMIPSState, CP0_VPEScheFBack));
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name = "VPEScheFBack";
             break;
         case CP0_REG01__VPEOPT:
@@ -5790,8 +5786,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_04:
         switch (sel) {
         case CP0_REG04__CONTEXT:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Context));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Context));
             register_name = "Context";
             break;
         case CP0_REG04__CONTEXTCONFIG:
@@ -5801,9 +5796,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         case CP0_REG04__USERLOCAL:
             CP0_CHECK(ctx->ulri);
-            tcg_gen_ld_tl(arg, cpu_env,
-                          offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
             register_name = "UserLocal";
             break;
         case CP0_REG04__MMID:
@@ -5828,20 +5822,20 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             break;
         case CP0_REG05__SEGCTL0:
             CP0_CHECK(ctx->sc);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl0));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_SegCtl0));
             register_name = "SegCtl0";
             break;
         case CP0_REG05__SEGCTL1:
             CP0_CHECK(ctx->sc);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl1));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_SegCtl1));
             register_name = "SegCtl1";
             break;
         case CP0_REG05__SEGCTL2:
             CP0_CHECK(ctx->sc);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_SegCtl2));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_SegCtl2));
             register_name = "SegCtl2";
             break;
         case CP0_REG05__PWBASE:
@@ -5917,8 +5911,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_08:
         switch (sel) {
         case CP0_REG08__BADVADDR:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_BadVAddr));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_BadVAddr));
             register_name = "BadVAddr";
             break;
         case CP0_REG08__BADINSTR:
@@ -5975,8 +5969,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_10:
         switch (sel) {
         case CP0_REG10__ENTRYHI:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EntryHi));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_EntryHi));
             register_name = "EntryHi";
             break;
         default:
@@ -6032,8 +6026,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_14:
         switch (sel) {
         case CP0_REG14__EPC:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EPC));
             register_name = "EPC";
             break;
         default:
@@ -6048,15 +6041,14 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             break;
         case CP0_REG15__EBASE:
             check_insn(ctx, ISA_MIPS_R2);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
             register_name = "EBase";
             break;
         case CP0_REG15__CMGCRBASE:
             check_insn(ctx, ISA_MIPS_R2);
             CP0_CHECK(ctx->cmgcr);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_CMGCRBase));
             register_name = "CMGCRBase";
             break;
         default:
@@ -6163,8 +6155,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case CP0_REG20__XCONTEXT:
 #if defined(TARGET_MIPS64)
             check_insn(ctx, ISA_MIPS3);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_XContext));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_XContext));
             register_name = "XContext";
             break;
 #endif
@@ -6227,8 +6219,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         switch (sel) {
         case CP0_REG24__DEPC:
             /* EJTAG support */
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_DEPC));
             register_name = "DEPC";
             break;
         default:
@@ -6341,8 +6332,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_30:
         switch (sel) {
         case CP0_REG30__ERROREPC:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_ErrorEPC));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_ErrorEPC));
             register_name = "ErrorEPC";
             break;
         default:
@@ -6363,9 +6354,8 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case CP0_REG31__KSCRATCH5:
         case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
-            tcg_gen_ld_tl(arg, cpu_env,
-                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]));
-            tcg_gen_ext32s_tl(arg, arg);
+            tcg_gen_ld32s_tl(arg, cpu_env,
+                             offsetof(CPUMIPSState, CP0_KScratch[sel - 2]));
             register_name = "KScratch";
             break;
         default:
-- 
2.31.1


