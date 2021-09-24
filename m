Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0A416F97
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:52:28 +0200 (CEST)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThsZ-0007vI-NC
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgn-0004zv-Sh; Fri, 24 Sep 2021 05:40:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgm-0006xh-9e; Fri, 24 Sep 2021 05:40:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w17so25396090wrv.10;
 Fri, 24 Sep 2021 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=138lKCCsDusDobsjTqkgHXFS+q7YngmR9S6d2RdS3Vk=;
 b=lypblXQgni2MLkl05r8H44c+0FOKn+nARJAdFkzwDpwtIyvHpqTey9VZZuaOGHb5Wf
 Z7pchjExeKF/vaHiW9+23NWPiIpPcIrWeP9YV8EFz4ujtbg35rog0burb9GK3SuJSPww
 R4IXwvbpZ6eaamT8wQjtzx4x2+GbRz+oaRgfuZOZ4d/hOTut4sMgFZ2LY2q7fe+G8t/f
 OqY9Qkt1S6n6AxrLmAkXjN8DO69azDNb8JB+5aSNRQdDySV52uyepCnk9xEHX16C8CfF
 EbVtowKnr49CuvfvrIJitXWog072b3VL+Xq6Xh+5E//s6+40Ey6P7mMkc2IhhQcycriN
 L2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=138lKCCsDusDobsjTqkgHXFS+q7YngmR9S6d2RdS3Vk=;
 b=zkLplrE23ZxGyVHKvyFj/G3JwFl3TmANQUB4ac2d6/bazPhzpSUAPApwZwWwXPnt4L
 28P/BLP5leH2g9dWMCn5jY9dSTOES5xDclQGG8RXFF2BxMk/x8GNFau3WMVteVYBAgM1
 uXAbnJ5ENFHvHjH6xcMY2AoyH44SO+yCoh90MTH0rvc+nDJSSZf6vr29Q9YVU7bT5E8m
 WCO38FuWAbguH8fcMGrppgASyLO9pUpRd/SVxRnRBHAAwTvWMiISgxy3ye4q5ZP55m+B
 YRnbklARmFTwur64DfZKl9ZRqBw4HHon0TVzua5WLl/b8tzri0RYPe7xu4f/tCL63tZX
 UI7g==
X-Gm-Message-State: AOAM530oHOGvlknShvGJY+Q6THL6X1B4GOErkZFuExwCioSr94L6P/mv
 +mPFN4K34bLiR5WHAkNn/lMmVm0Sci8=
X-Google-Smtp-Source: ABdhPJz5Mhg4SjIGXAxwlA1P8B7B0hXecgEQQIjmWt5AlgAIp7Yy2d0W3X6wwYFu5Ahjn+dduoigxA==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr1041690wmp.35.1632476414383; 
 Fri, 24 Sep 2021 02:40:14 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o17sm7541189wrj.96.2021.09.24.02.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/40] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:25 +0200
Message-Id: <20210924093847.1014331-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict arm_cpu_has_work() and has_work() handler to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 4 +++-
 target/arm/cpu.c       | 7 +++++--
 target/arm/cpu_tcg.c   | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 864b5ad4cdf..29bb815100d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -175,9 +175,11 @@ void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-#endif /* CONFIG_TCG */
 
+#if !defined(CONFIG_USER_ONLY)
 bool arm_cpu_has_work(CPUState *cs);
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
 /**
  * aarch64_sve_zcr_get_valid_len:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4b08f717f64..53c478171ac 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,8 +74,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -86,6 +86,9 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2035,6 +2038,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2059,7 +2063,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9a0927ad5d0..7d0d9fcbc79 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -920,7 +921,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
-    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1


