Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DA60AD8D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:26:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSU-0003Hc-Vh; Mon, 24 Oct 2022 09:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSQ-0003Gm-Ch
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:34 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSO-0003zi-QH
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:34 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y13so4397165pfp.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sLwtp+woNcAwBurs5vXqRRocciat0zxGGrqqGlUOysI=;
 b=TTeQb2g07AU2XkINHJZheWEh6aXFzPK0YbTRWSqLEpvjdHpsw+Maocxb5KCkv7R015
 QNubRC+uT2/cDvbVr5JPddQFs0HqjKggBDwZBoGDyeKeMkrfUMU3FPuloJwVvyZjpHjr
 IL/RxI0WsaghajHnlrmcUtg0EmJbRMeVcQWvtPD7LMijjWojnsTdWeltSsUNIXlucwcw
 v+cqvopJp9pkKf2CtJ4S7zN5A7m1U1XNBI+8EaF1lQT6ScrSkGVt/wGIeWIvia2Sq6/r
 VmCozahhAnaf9IYQOH2f9St+SyBgZULd7IZhbzz2uYvoI/fSfw/qnj1T4wUkzWvQSzf4
 iHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLwtp+woNcAwBurs5vXqRRocciat0zxGGrqqGlUOysI=;
 b=1dMRJtGuH0zNBSs4CFBptVqtc4sM3UBiAqsv+JnB3A565LTUby+v1+tq2yK/FfCPZB
 x4OJpwYTO1XxmrGquZjM667ClUk7lrIF/MtflnGn81H27cCwfoj9Z2yVMHL/bSM2tB+T
 +nLU3yxg0JBChSwkxD0dNkx4dkn3qfShySsztSKpls7oewJR3A3gQxSVDAK52PgFMep7
 +CM9wYJdIfcr/C43Rai3HRk77tuVG7Pbe+zcfmphpJNChsO4g/oUc5zhgBYV+nK4YuSW
 sPewuj9l+MT26+ROu12KFZ++x5iRbB3TMk+a/isi6180ANihqJLai8j6Xeq4+nmlspUg
 ng6w==
X-Gm-Message-State: ACrzQf0jsVmpHZ9LKfxG5BN6O4/ZJDAuKJKMU6V7eANbrq+mgO9BYR26
 IGYfoI4HnaQ8zRYdk0O3oUp1Zt9ktgTe5w==
X-Google-Smtp-Source: AMsMyM5ZDoOWJlX/bL0DzSkocDHFpA+D8G5kzeNBUB9G8BvWMRSCjS+2e0mcSb7TJIlHWkEnUwaq2w==
X-Received: by 2002:a63:8ac2:0:b0:460:6480:8c59 with SMTP id
 y185-20020a638ac2000000b0046064808c59mr28362624pgd.472.1666617931507; 
 Mon, 24 Oct 2022 06:25:31 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/29] target/i386: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:38 +1000
Message-Id: <20221024132459.3229709-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/tcg-cpu.c   | 19 +++++++++++++++++++
 target/i386/tcg/translate.c | 15 ---------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 828244abe2..79ac5908f7 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -56,6 +56,24 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     }
 }
 
+static void x86_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    int cc_op = data[1];
+
+    if (TARGET_TB_PCREL) {
+        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->eip = data[0] - tb->cs_base;
+    }
+    if (cc_op != CC_OP_DYNAMIC) {
+        env->cc_op = cc_op;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
@@ -72,6 +90,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
 static const struct TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
+    .restore_state_to_opc = x86_restore_state_to_opc,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
 #ifdef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e19d5c1c64..c8597e2008 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7022,18 +7022,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
 
     translator_loop(cpu, tb, max_insns, pc, host_pc, &i386_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    int cc_op = data[1];
-
-    if (TARGET_TB_PCREL) {
-        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
-    } else {
-        env->eip = data[0] - tb->cs_base;
-    }
-    if (cc_op != CC_OP_DYNAMIC) {
-        env->cc_op = cc_op;
-    }
-}
-- 
2.34.1


