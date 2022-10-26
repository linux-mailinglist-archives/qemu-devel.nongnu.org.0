Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067D960D935
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:21:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuO-0005Ig-AB; Tue, 25 Oct 2022 22:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuM-0005IC-5d
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuK-0001GX-5H
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id j12so12691537plj.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTYhZzWqH75b7i9XrWtJz4ZdUurs/QeXSrqfR/Rb3bI=;
 b=x57iF97JFvN3DSTb0St8pnhXCIkcaaYcobsabfcMAX+V6/JooA78tvAiEZPja8M9ws
 gPlZnXNpVXJZ3MMSZTf8oxH1p9mTE1e1Tp1581atlYu1kZw84i3XDsH7bUJRLRkHiMBj
 cbB/dFxuHq6u6S6X7S/yGVBMrbxneDMK+/hf7M3rk0vyb8HO5vFRX3FgIgaHlhYfQO0b
 8To5uQiykNbXEnpbj7lqPPkUQ4ihqqxiGzP0jxLdvH+yOJsG/Cg9T9X4Fl0GjPda+GTa
 WqqXL7mM0VQohgh6A2XQcSuAXGKaEO9cc/xJwBA1dnbFccJct+DXOlqgtpEKUCtlpnGl
 oS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTYhZzWqH75b7i9XrWtJz4ZdUurs/QeXSrqfR/Rb3bI=;
 b=Xs65re/Xe2Ea92wdYz4LZgA23tMYA8gE2lgx6W2z4CrR3X3reshYwc+Ukjdh6FMnZk
 lAnrpqMR4+1FtdqWK+fGHS9xovP1tbMZ/JhvvULyWuCxsMRqHimfgHGERqVQTLYnLafZ
 ZSUJQNvJ6kRbvt/2xmljBG3fTq72RHs4Oo3xnC5o6v/jqIYZTeeDDBH8p3762t52Z7aE
 4U0eBhh8QmcLIxqM9//3oL/P6IitUs9c4n6oYcflWUovbwAPxF6bOSs/KUREGzuQ7Ur+
 8lQcj11cO+BIH005Y8Zdte7GO/bw1cCpdQiAE+5EuqyM3E5ognD0IeKXPY8ZtFErEwRq
 VdhQ==
X-Gm-Message-State: ACrzQf2/eW5zbx0noCPM6Awd4BoHtxnBPnNcfEATBir8LOj2h4xOI6uR
 mk5VUeoQDfcNZ6sD2h3yWpXLRlPwnmN3QQUM
X-Google-Smtp-Source: AMsMyM7vRkpzQPrOtTnajfUXoD8Gxa20fqtitJHx02ftMtrAuyIpeNY5kTwew7RK13XWorJZ8kQQOw==
X-Received: by 2002:a17:902:edcd:b0:17a:6fa:228d with SMTP id
 q13-20020a170902edcd00b0017a06fa228dmr41411096plk.29.1666750358751; 
 Tue, 25 Oct 2022 19:12:38 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 27/47] target/arm: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:10:56 +1000
Message-Id: <20221026021116.1988449-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c       | 26 ++++++++++++++++++++++++++
 target/arm/translate.c | 22 ----------------------
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bc5e9b125..0a7bfbf999 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -90,6 +90,31 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         }
     }
 }
+
+static void arm_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    CPUARMState *env = cs->env_ptr;
+
+    if (is_a64(env)) {
+        if (TARGET_TB_PCREL) {
+            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->pc = data[0];
+        }
+        env->condexec_bits = 0;
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
+    } else {
+        if (TARGET_TB_PCREL) {
+            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->regs[15] = data[0];
+        }
+        env->condexec_bits = data[1];
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
+    }
+}
 #endif /* CONFIG_TCG */
 
 static bool arm_cpu_has_work(CPUState *cs)
@@ -2152,6 +2177,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .debug_excp_handler = arm_debug_excp_handler,
+    .restore_state_to_opc = arm_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d1b868430e..74a903072f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9939,25 +9939,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
 
     translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    if (is_a64(env)) {
-        if (TARGET_TB_PCREL) {
-            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
-        } else {
-            env->pc = data[0];
-        }
-        env->condexec_bits = 0;
-        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
-    } else {
-        if (TARGET_TB_PCREL) {
-            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
-        } else {
-            env->regs[15] = data[0];
-        }
-        env->condexec_bits = data[1];
-        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
-    }
-}
-- 
2.34.1


