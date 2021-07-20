Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24CB3D0279
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:04:21 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vyW-0004tV-Kv
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpR-0007FG-CV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpP-00084e-P4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so285486pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2J5gDf0ll8w4iTuhpRWpeMysVEVXrcPOLSCqyOf7Eh4=;
 b=GPVel5q8TCBUHoWHM2IVfBvuo0gEY5g+zTRz6U1/tRiMQ/JARUxUalmmo3C8UcEnJI
 SUi6d9iE1v8U/jXrHaIEAEk+sxtjd7EIvLAZzatrFGyebEaqEJybAbgijcnyZW4nVb2k
 7tBY39H4cxkDDcFuQfoHv+sDNCKafNfPyp6jbxq1OL7yNIoxXi4qr32T/Vnz7h8Fdfsa
 9ZsCk1g5wS3TakhrW5/yVn+fCUTvxRgAal3RC0oqgYY4B2Xfe7wAunO8MTn51YZ3XLQd
 jVLKycMqmbW1ft4T9g9B85SOydVQ+/D8fbj5jMIP+in1J/I2rExwuPdjFD4ICz+JahRz
 HAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2J5gDf0ll8w4iTuhpRWpeMysVEVXrcPOLSCqyOf7Eh4=;
 b=qIg/DH+qcfhAPst+S0sI7i/nJxT/zMRfj+3wynydRgLeI9F6vmydXYspEVuoOOL9pD
 9vC5+bOcKiveDXjpDLH94Ro9jdMF4D+YfHQ/AroPVsLd6PES9IXXg4eM2rJqMwoN1Muv
 v+jeH9mceYTNWG3bFrv4HF+5DhwBDkweO4pjIzYjOsprqWj7rMRb0nmGEK97lmmyhB5U
 lIdRYxifmJsYReKOfC5B05gLiHIHZyAc2j9jvuyMW/BZh7ewbi6VCnAXEN4GpGKCka/+
 Glo+JYBujSdEGsG8xCL0H9H5NS7KG/MJbGhJK+kOBw1BSzOHxkajfVKiKju4kqzn3j7o
 Yn6g==
X-Gm-Message-State: AOAM5300nS6BKGnBRHoWbIrE8BVQlWqk7F2Xr3ydLa1TMh+w6areHnSh
 jhwpecPJa5KFa9txrpFLswR4+AvyjnzehQ==
X-Google-Smtp-Source: ABdhPJzwFVzots9e0WlLePEqaxWquqk/igchYvOgXC06a7O4vUY3+/RZnsUc9Y5VFcDpkuVlqsCZmg==
X-Received: by 2002:a17:90a:590d:: with SMTP id
 k13mr31695632pji.56.1626810894485; 
 Tue, 20 Jul 2021 12:54:54 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 09/17] target/arm: Implement debug_check_breakpoint
Date: Tue, 20 Jul 2021 09:54:31 -1000
Message-Id: <20210720195439.626594-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


