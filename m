Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD23CF141
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:22:23 +0200 (CEST)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eSk-0006dO-BS
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOp-0006gL-WE
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOo-0003SN-Dz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id j199so18226987pfd.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Og5qRofVVysqqx/NRwWHk/rtIdv4ghjwZRwj/LrGEQk=;
 b=XmTzgQSzJGGRw6+WmGCjh6tsUBfAb1o+qTMRtLN8EyThxhBohfMgCBvQSIyfhUi9jb
 fpZSh/Rhzs6l/OoxBT5aJ64lB4sf0PrWSm8JYDQ7dIgCVW1D0cVDV+UZbZulEKyCwNCi
 YhrGoDWYWoypsdp9kGGD1qsOxf3dUmrR2BVf1afqjjIRJq8HKnDzp/dPIFhfhl6VnSwh
 vsGDu4kAzW9197aMIEq10+22+Eov78wAxQ9OowHY/CuvBGPrbOdmgrtFwpioX047Mf0X
 6CJa7HOur0Wrs41oaHSfG9KlqX+uWuyLb4kDtjXToWXmOjaosXA5PKOGoc9IEPDfmpDJ
 d4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Og5qRofVVysqqx/NRwWHk/rtIdv4ghjwZRwj/LrGEQk=;
 b=l3KnQ1JyOFI5u7qbJCb8jrvpl9X7P43tO7mzpsUdIuW63E7StrPEpv36rBpc+JJZvM
 qAhAimMPmJkv0n58j3j33uL95hSkEydVuhRyMN3FP14QUJEBEbXu7Pt8RhGmV3CzPSp/
 geE38FgdMw8099rZ74x9IYPIl528sUa8GnWH+OVpX9WRM9oyHQkuG0zNPtMon4+AP8uX
 3FfmA+fGdW8+U7SSownvXp8DKaAUB8nFmQaXiOhKa1I2Xj4PC+glCyLC1x0VpsoiUaEd
 i0/3OIJais0DBf6cAmOXkIgMlaBa0aV4SoMCCWjHvzfbZSRQDaWo7XN5GEYcQRK4Y1aT
 MvRg==
X-Gm-Message-State: AOAM531eBswI7uc7o6ySKdXSBBNEinnFOLFpAoeauEjdALQSSi2HGD9p
 DcVAoTIbhz930JEJuDQ9FKwlkubp+tFLAw==
X-Google-Smtp-Source: ABdhPJzrR0rLaplNh4pZhI0oBm13V4LQ6xHyWypEPGUdpxn1bI0OpqZDcOVzhFfQYxD09A5aKehI2w==
X-Received: by 2002:a62:3852:0:b029:32e:50d4:6ee5 with SMTP id
 f79-20020a6238520000b029032e50d46ee5mr28419145pfa.3.1626743896438; 
 Mon, 19 Jul 2021 18:18:16 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 09/15] target/arm: Implement debug_check_breakpoint
Date: Mon, 19 Jul 2021 15:17:54 -1000
Message-Id: <20210720011800.483966-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reuse the code at the bottom of helper_check_breakpoints,
which is what we currently call from *_tr_breakpoint_check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 3 +++
 target/arm/cpu.c          | 1 +
 target/arm/cpu_tcg.c      | 1 +
 target/arm/debug_helper.c | 7 +++----
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3ba86e8af8..11a72013f5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -282,6 +282,9 @@ void hw_breakpoint_update(ARMCPU *cpu, int n);
  */
 void hw_breakpoint_update_all(ARMCPU *cpu);
 
+/* Callback function for checking if a breakpoint should trigger. */
+bool arm_debug_check_breakpoint(CPUState *cs);
+
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9cddfd6a44..752b15bb79 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1984,6 +1984,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
+    .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d2d97115ea..ed444bf436 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -911,6 +911,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
+    .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2ff72d47d1..4a0c479527 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -216,8 +216,9 @@ static bool check_watchpoints(ARMCPU *cpu)
     return false;
 }
 
-static bool check_breakpoints(ARMCPU *cpu)
+bool arm_debug_check_breakpoint(CPUState *cs)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     int n;
 
@@ -240,9 +241,7 @@ static bool check_breakpoints(ARMCPU *cpu)
 
 void HELPER(check_breakpoints)(CPUARMState *env)
 {
-    ARMCPU *cpu = env_archcpu(env);
-
-    if (check_breakpoints(cpu)) {
+    if (arm_debug_check_breakpoint(env_cpu(env))) {
         HELPER(exception_internal(env, EXCP_DEBUG));
     }
 }
-- 
2.25.1


