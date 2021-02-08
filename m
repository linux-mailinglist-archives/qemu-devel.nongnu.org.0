Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBC3144E1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:26:45 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Grc-00068v-Qa
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7s-000591-Mc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:28 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7f-00010w-9B
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:26 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d13so8717587plg.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvXiadaSGeRqxaWd2p/qsJeoAY+3ssYrogfEW/VR4Cw=;
 b=xshexf772AvOiOP2ZXOXWBH6IHeu2VIQlPPGeZgtZ9IUEi/jFIqYRrGmko81vgrJaz
 Mq2KqYn1OsqlefrYt0S8OTn36g0OB3VLRn7orjSPTl40sjo2tWKlt56pTTGy+FAYDiKi
 0CGSl1zH3UxyNaWEbzhxgzF3VDMIwapK2bMRURQpjgzCi9/0Za37XpAZn+28Lv0bpXqH
 NFONim0xRSI0ucTobvxQUR/gvTxgDPNg6lQ0i5OtFQFonmqG/c3toVpNQ43NENg++Sla
 gEey5kOxPQ5G98kPJQyOqGva1CeM78kIALTI51EkgcxP+CdFWDPZexLWuTTuQatXqs+4
 XanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bvXiadaSGeRqxaWd2p/qsJeoAY+3ssYrogfEW/VR4Cw=;
 b=F+aD/YgcQ8Ap/YbVsWH83qFzcJDZpADtkCX2ov+A5LTVreuaCEgyKSiZXWUAU8RqEJ
 pOeHl4GhQ0h7Vl1br1URTCxzf5v0IgwI55tDIzNeQjmkHxfCfZ8zCEH7J60LmfEBLbyt
 IG0AnNb3KEZW5e2SOEa1DUXstV/nw3uewtMIdZxSkvJiF64yxpZn8Rw5wHk3dP92c/k2
 EKul/eKANVXnug1p0ns+vdEf+BsYCwbkOvltOmPto1zWoeW1Q4/NlXvNc6RCs8jh5R9n
 plOCPw9+2vdWuijpFuonoMviRf92xeLZ+T7AYzTtsFSBrJv9f+ik0XrsaHEfZX33gBFt
 XHbA==
X-Gm-Message-State: AOAM531wsonzf7iIkDCfjJsm7qT2O3RwulochVA7Jmj0qOiPz318+fOs
 OP/JIaqLSWDxVljB2aQsZdGhNUloTPp+AQ==
X-Google-Smtp-Source: ABdhPJzJK1+g0OIDMiiqO0JD9pjTm1/v42SNI8NeayJmSQ89H/DCFJsxn99C6c5+OxkFa/bKhV2KQw==
X-Received: by 2002:a17:902:6ac2:b029:de:3560:391e with SMTP id
 i2-20020a1709026ac2b02900de3560391emr18011505plt.60.1612827552268; 
 Mon, 08 Feb 2021 15:39:12 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k15sm13483489pgt.35.2021.02.08.15.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 15:39:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/mips: Create mips_io_recompile_replay_branch
Date: Mon,  8 Feb 2021 15:39:05 -0800
Message-Id: <20210208233906.479571-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233906.479571-1-richard.henderson@linaro.org>
References: <20210208233906.479571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: alex.bennee@linaro.org, cfontana@suse.de,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the code from accel/tcg/translate-all.c to target/mips/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 accel/tcg/translate-all.c | 12 ++----------
 target/mips/cpu.c         | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 6eb37883bd..470657b02a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2417,7 +2417,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_MIPS) || defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
@@ -2443,15 +2443,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_neg(cpu)->icount_decr.u16.low++;
         n = 2;
     }
-#if defined(TARGET_MIPS)
-    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
-        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
-        cpu_neg(cpu)->icount_decr.u16.low++;
-        env->hflags &= ~MIPS_HFLAG_BMASK;
-        n = 2;
-    }
-#elif defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
         && env->pc != tb->pc) {
         env->pc -= 2;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad163ead62..bf70c77295 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -268,6 +268,23 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
+
+# ifndef CONFIG_USER_ONLY
+static bool mips_io_recompile_replay_branch(CPUState *cs,
+                                            const TranslationBlock *tb)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
+        && env->active_tc.PC != tb->pc) {
+        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
+        env->hflags &= ~MIPS_HFLAG_BMASK;
+        return true;
+    }
+    return false;
+}
+# endif /* !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
 static bool mips_cpu_has_work(CPUState *cs)
@@ -679,6 +696,7 @@ static struct TCGCPUOps mips_tcg_ops = {
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
+    .io_recompile_replay_branch = mips_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.25.1


