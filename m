Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F46C31749E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 00:46:30 +0100 (CET)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9zBk-0001e1-Dp
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 18:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9z92-0000u9-Lu
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 18:43:40 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9z91-0006DH-2f
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 18:43:40 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g10so5107050eds.2
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 15:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3MoxBD0unAoPswSn09+/l/9PYwKbEY8e0no6zI0s4o=;
 b=FLJizUZKEoBFOlIBEeLNJfkUJrzib7sjD2U8wRGXScjeNDecZVON8+hQsnKLNaaIOL
 AHdRZ6gs0Z8WRGA2pZghnhc62+qTbfx+xbKDtVESVmhEltcnsGLTsQiEXu5WUcTEJ8Mf
 547Y0N8QHtsXf5ee/RXi69CbrszwsH+MQeiGeaVc9/DuyRZSC3KoJdkT6HxEd0LF3O9C
 enpumklhBsnjdOWkM26LVbJ2s6rWAwLAvre4TRPOMkE/2POwlr8wyLonNIxb1m4RQE36
 T/DB0bY+Vw5hMmHcIeQ4tTYWLRd6ZRS5gbDOOFxE6+yd1igOLZdsvGi/zFmlZGXgtk0S
 n/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=f3MoxBD0unAoPswSn09+/l/9PYwKbEY8e0no6zI0s4o=;
 b=YNduI8K0XeWu9AJ1lFOCZGDEfDcZI2ApA3u8soWGzQ/DpCSdEx1+jHEbs4y+vbe1mY
 Alz3CldgWNMtjYol8Rz6TtvQM+3nNTDLWawhsqJ9sX+IC+tWIz06ADGrJbfEUbrRVJiL
 Hyjs+NwDzhcOW3ZY+N2pcAPBep1LMmCak2DVpWJ+thXBB0RNWxTNZmDc1K70x/hQ2OsI
 pMTvdnZEhghEdSlJtCMYn6E//HVsWDCZcpBnZFPPFGIa4d2/nGPJR6Z8ZxX5jv1wQZVy
 /0+3jRSjaO7uwn7ga9FMZ4Nf6Ve6ORzNOwJFbgISBceOINgGg7+fsnsNg4FE5ukB+Bxt
 co3Q==
X-Gm-Message-State: AOAM531GIVgy+IvvWY280EMMcbrHyDVPk/3Cmq4kDZlK2k9jME5oKVCO
 aIUs4wlZ+10XfHIoEv0N+1qP5NP/SfQ=
X-Google-Smtp-Source: ABdhPJySHMI9uGos75cLBYb/ioR+zRSbbVW5fT2+MrSeUX35heTJnk4QmnhCdNHXdy5FWP6aCGJ9EQ==
X-Received: by 2002:a05:6402:40c6:: with SMTP id
 z6mr5439618edb.360.1613000617294; 
 Wed, 10 Feb 2021 15:43:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n12sm2510676eja.46.2021.02.10.15.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 15:43:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
Date: Thu, 11 Feb 2021 00:43:34 +0100
Message-Id: <20210210234334.3750022-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new clock_ns_to_ticks() function in cp0_timer where
appropriate. This allows us to remove CPUMIPSState::cp0_count_ns
and mips_cp0_period_set().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20210209132040.5091-1-peter.maydell@linaro.org>

RFC because this is just a starter patch to test Peter's series
providing a handy function which "tells me how many times this
clock would tick in this length of time".

Also because we could rethink the MIPS CP0 timer logic to avoid
too frequent divu128 calls (painful on 32-bit hosts).

The style should be updated, using more variables for easier
review. env_archcpu() could eventually be dropped (by passing
MIPSCPU* instead of CPUMIPSState*).

This passes my MIPS tier1 tests, kicking CI before going to bed.
Posting meanwhile for comments.
---
 target/mips/cpu.h       |  1 -
 target/mips/cp0_timer.c | 34 +++++++++++++++++++++++++---------
 target/mips/cpu.c       | 10 ----------
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b9e227a30e9..946748d8cc7 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1156,7 +1156,6 @@ struct CPUMIPSState {
     struct MIPSITUState *itu;
     MemoryRegion *itc_tag; /* ITC Configuration Tags */
     target_ulong exception_base; /* ExceptionBase input to the core */
-    uint64_t cp0_count_ns; /* CP0_Count clock period (in nanoseconds) */
 };
 
 /**
diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 70de95d338f..3a128302122 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -30,13 +30,17 @@
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
 {
+    MIPSCPU *cpu = env_archcpu(env);
     uint64_t now_ns, next_ns;
     uint32_t wait;
+    uint64_t now_ticks;
 
     now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    wait = env->CP0_Compare - env->CP0_Count -
-           (uint32_t)(now_ns / env->cp0_count_ns);
-    next_ns = now_ns + (uint64_t)wait * env->cp0_count_ns;
+    now_ticks = clock_ns_to_ticks(cpu->clock, now_ns);
+    wait = env->CP0_Compare - env->CP0_Count
+           - (uint32_t)(now_ticks / cpu->cp0_count_rate);
+    next_ns = now_ns + (uint64_t)wait * clock_ticks_to_ns(cpu->clock,
+                                                          cpu->cp0_count_rate);
     timer_mod(env->timer, next_ns);
 }
 
@@ -55,6 +59,7 @@ uint32_t cpu_mips_get_count(CPUMIPSState *env)
     if (env->CP0_Cause & (1 << CP0Ca_DC)) {
         return env->CP0_Count;
     } else {
+        MIPSCPU *cpu = env_archcpu(env);
         uint64_t now_ns;
 
         now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -64,12 +69,15 @@ uint32_t cpu_mips_get_count(CPUMIPSState *env)
             cpu_mips_timer_expire(env);
         }
 
-        return env->CP0_Count + (uint32_t)(now_ns / env->cp0_count_ns);
+        return env->CP0_Count + (uint32_t)(clock_ns_to_ticks(cpu->clock, now_ns)
+                                           / cpu->cp0_count_rate);
     }
 }
 
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
 {
+    MIPSCPU *cpu = env_archcpu(env);
+
     /*
      * This gets called from cpu_state_reset(), potentially before timer init.
      * So env->timer may be NULL, which is also the case with KVM enabled so
@@ -78,10 +86,14 @@ void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
     if (env->CP0_Cause & (1 << CP0Ca_DC) || !env->timer) {
         env->CP0_Count = count;
     } else {
+        uint64_t cp0_count_ticks;
+
+        cp0_count_ticks = clock_ns_to_ticks(cpu->clock,
+                                            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         /* Store new count register */
-        env->CP0_Count = count -
-               (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                          env->cp0_count_ns);
+        env->CP0_Count = count - (uint32_t)(cp0_count_ticks / cpu->cp0_count_rate);
+
+
         /* Update timer timer */
         cpu_mips_timer_update(env);
     }
@@ -106,9 +118,13 @@ void cpu_mips_start_count(CPUMIPSState *env)
 
 void cpu_mips_stop_count(CPUMIPSState *env)
 {
+    MIPSCPU *cpu = env_archcpu(env);
+    uint64_t cp0_count_ticks;
+
+    cp0_count_ticks = clock_ns_to_ticks(cpu->clock,
+                                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
     /* Store the current value */
-    env->CP0_Count += (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                                 env->cp0_count_ns);
+    env->CP0_Count += (uint32_t)(cp0_count_ticks / cpu->cp0_count_rate);
 }
 
 static void mips_timer_cb(void *opaque)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 2f3d9d2ce2c..17caf236da9 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -578,15 +578,6 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 #define CPU_FREQ_HZ_DEFAULT     200000000
 #define CP0_COUNT_RATE_DEFAULT  2
 
-static void mips_cp0_period_set(MIPSCPU *cpu)
-{
-    CPUMIPSState *env = &cpu->env;
-
-    env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
-                                          cpu->cp0_count_rate);
-    assert(env->cp0_count_ns);
-}
-
 static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -607,7 +598,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
         /* Initialize the frequency in case the clock remains unconnected. */
         clock_set_hz(cpu->clock, CPU_FREQ_HZ_DEFAULT);
     }
-    mips_cp0_period_set(cpu);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
-- 
2.26.2


