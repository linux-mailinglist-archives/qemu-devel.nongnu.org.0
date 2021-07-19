Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDD3CEE27
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:34:53 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aua-0003EH-E8
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj6-0004Pr-Qh
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:00 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj5-0000tt-6V
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:00 -0400
Received: by mail-pg1-x52f.google.com with SMTP id y17so20488700pgf.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Og5qRofVVysqqx/NRwWHk/rtIdv4ghjwZRwj/LrGEQk=;
 b=UJztf3QaCu6gp24AqG6qTkK0OBpj1ncsplbaWn10OgcwaBqsRNVPkI1hXcdIQacrKR
 LmuKnar5G/kxLivmm4zjDiRgC5fW3wQq/WOFjHOL7RspN4gGy0uPX1JuCei5wD2Y182p
 h4Tbs7zMV39STE2qGHJZikBFT+r8dQsAsnkrmzi1lvR1AfPnbUYTd6uQ1FbIclT5GM3d
 VHhJ7SUIZG4e7NYBu42RaALcH2P5bLODmsvWtfXQMLSVhxEJRULo1QIdtqHLC6Z3Tpq9
 QgStSUS5G6IXe+XBa6j13qw1hBKF+j+fxnB4BxwvND8cQhAr8cfVF+2EmvSKxLkmP8zc
 rF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Og5qRofVVysqqx/NRwWHk/rtIdv4ghjwZRwj/LrGEQk=;
 b=G06d4RVz6VyY5KeDKbkbKBT0fWOceh50sLghSt9yN7l3fVFcnOiXqnjI3bIkBQinmM
 T4eT9H+MvNxnjmP2T/hWRcIjxKnWFUr5Zg7I+nCLTtEm85n46UpBFWmCnbUk87Ane+2+
 Tu1JPOvXO7DIAH4EvV/QgDJZn0bL4IU0z1HI9yTEAbxahO5V/qzltCi9opxvh4lzTQ4p
 qO3aA9QfZX3HlY5KctUjK6Wr1gV7ZN1WHnN5Iwpe46dYfb7NjiTWH65w8xdGFaBO52wO
 7xxSq8GyiGVjtaT8C9I0PPavRHcG2XnVN+wQa21kp3yEssyMYIxWLIO1T+glhh72xi6n
 THoQ==
X-Gm-Message-State: AOAM533kCX8/BcpgBywHti3MHz5a96xXs6LgDj9gWkFZNjEqs8HnyR4G
 AxcgaGY6LLHmJD0Z0W2pKaOZTddDZB57HA==
X-Google-Smtp-Source: ABdhPJzZGoFk45q+CJTlaJNn6tapB/YIK+s7/IPyXt1Y8sk2gatZsTqr8LxxIzZHS3JzTCgse8E31Q==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id
 i22-20020aa78b560000b02902b977bed305mr28152313pfd.61.1626729777946; 
 Mon, 19 Jul 2021 14:22:57 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 10/15] target/arm: Implement debug_check_breakpoint
Date: Mon, 19 Jul 2021 11:22:34 -1000
Message-Id: <20210719212239.428740-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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


