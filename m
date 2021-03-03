Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C732BC67
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:59:34 +0100 (CET)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZWn-0004pM-Lh
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMk-0006Ms-04; Wed, 03 Mar 2021 16:49:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMi-0002aX-7M; Wed, 03 Mar 2021 16:49:09 -0500
Received: by mail-wr1-x435.google.com with SMTP id e10so25126138wro.12;
 Wed, 03 Mar 2021 13:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YomvsDs5ZuIQvjHtj4a66pfmvsA4AEqB6lKkhbtyTa0=;
 b=Q9kzaXXLsrtgfnSy3Tmba9fCoXSao4m4lBzQq5YHleVSSrhl5zcnSqGhWkEO4OAobR
 WvW/ywB6OTsHYI6wQ8cPu6VaeIvn/CYQiUjUcCYUDVEQG7R8Ms7BiFJx0ZyN88JYnF0u
 G/52mSy5QIerKxgusOdPeJgyGXbt6ahhnW5NmJrE85vpSEc617OVjW9CJcp0t++14T5b
 BjkEBuNXGKWR7Z4Teu6KbLpTp9kiXtNX24tHACRzjnjBqG+1lbJ+uDPGBBYeCivsdwSI
 OO0FsP49qsvuTTNGyX8rMMWTUxEB17cYGPC6IBxoLdEdsv2hn3uVOx39iIMg6psvp6hA
 q6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YomvsDs5ZuIQvjHtj4a66pfmvsA4AEqB6lKkhbtyTa0=;
 b=ly/oUbBl2rMObUyMSUkpCfI1K53ZOYKx33doPxMNfrtqIgpY4micW0SbwXE9ZaqsYf
 AOEiwEIuPSZPFd1tjYZZbpqpl5DE9c9PDivjhiuNGYFgFF6y4FUUUh3mzhMi0tCm1733
 xXeQk/mvuNTpnyRXwM7cEn2B4M/UECQKi7o3sfxQJF+iLYQMGE9CQtgdJSVelvWdytW8
 MAtiWtOAYXFg6avZsrb2qBUoHZKtwYa+uui/uPk7LTFlpgOQTL0sRloasvH7bOCSDwOg
 z1CfDN7SEcIDav3ViwY/jKJ5sZ+OrfvzsDGhbh5hJMg0Pw8pDsfBxX/qOc+dlx4z9eVc
 fyeA==
X-Gm-Message-State: AOAM530TlTmQqHbXjhgZRt1cZ94EeFcku0LG3v9HzZxKEhpb+Rm2dAIX
 PB/RHrb3QJnQ9sHn6fcziTZ2n4s8iyY=
X-Google-Smtp-Source: ABdhPJzaxOXYuwf2B9PFQezRCx5O1WE2DWF5RcZ8r+jGknmMEb+TBFXF69v358dK6ZjgUEnlnFQ20w==
X-Received: by 2002:adf:9261:: with SMTP id 88mr754722wrj.270.1614808145655;
 Wed, 03 Mar 2021 13:49:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h22sm9089008wmb.36.2021.03.03.13.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/28] target/arm: Refactor some function bodies
Date: Wed,  3 Mar 2021 22:47:01 +0100
Message-Id: <20210303214708.1727801-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor few fonctions body to ease #ifdef'ry review
in the next commit. No logical change intented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Patch easier to review using:
'git-diff --color-moved-ws=allow-indentation-change'
---
 target/arm/debug_helper.c | 72 +++++++++++++++++++--------------------
 target/arm/helper.c       |  5 ++-
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c01d8524443..980110e1328 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -230,7 +230,6 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
-    int n;
 
     /*
      * If breakpoints are disabled globally or we can't take debug
@@ -241,7 +240,7 @@ static bool check_breakpoints(ARMCPU *cpu)
         return false;
     }
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
+    for (int n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
         }
@@ -266,47 +265,48 @@ void arm_debug_excp_handler(CPUState *cs)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint64_t pc;
+    bool same_el;
     CPUWatchpoint *wp_hit = cs->watchpoint_hit;
 
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
-            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
+    if (wp_hit && (wp_hit->flags & BP_CPU)) {
+        bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+        bool same_el = arm_debug_target_el(env) == arm_current_el(env);
 
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception(env, EXCP_DATA_ABORT,
-                    syn_watchpoint(same_el, 0, wnr),
-                    arm_debug_target_el(env));
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-        bool same_el = (arm_debug_target_el(env) == arm_current_el(env));
-
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
+        cs->watchpoint_hit = NULL;
 
         env->exception.fsr = arm_debug_exception_fsr(env);
-        /*
-         * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-         * values to the guest that it shouldn't be able to see at its
-         * exception/security level.
-         */
-        env->exception.vaddress = 0;
-        raise_exception(env, EXCP_PREFETCH_ABORT,
-                        syn_breakpoint(same_el),
+        env->exception.vaddress = wp_hit->hitaddr;
+        raise_exception(env, EXCP_DATA_ABORT,
+                        syn_watchpoint(same_el, 0, wnr),
                         arm_debug_target_el(env));
+        return;
     }
+
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    same_el = (arm_debug_target_el(env) == arm_current_el(env));
+
+    /*
+     * (1) GDB breakpoints should be handled first.
+     * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
+     * since singlestep is also done by generating a debug internal
+     * exception.
+     */
+    if (cpu_breakpoint_test(cs, pc, BP_GDB)
+        || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
+        return;
+    }
+
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    raise_exception(env, EXCP_PREFETCH_ABORT,
+                    syn_breakpoint(same_el),
+                    arm_debug_target_el(env));
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211..54648c7fbb6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6595,7 +6595,7 @@ static void define_debug_regs(ARMCPU *cpu)
      * These are just dummy implementations for now.
      */
     int i;
-    int wrps, brps, ctx_cmps;
+    int brps, ctx_cmps;
 
     /*
      * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
@@ -6614,7 +6614,6 @@ static void define_debug_regs(ARMCPU *cpu)
 
     /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
-    wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
 
     assert(ctx_cmps <= brps);
@@ -6644,7 +6643,7 @@ static void define_debug_regs(ARMCPU *cpu)
         define_arm_cp_regs(cpu, dbgregs);
     }
 
-    for (i = 0; i < wrps; i++) {
+    for (i = 0; i < arm_num_wrps(cpu); i++) {
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
-- 
2.26.2


