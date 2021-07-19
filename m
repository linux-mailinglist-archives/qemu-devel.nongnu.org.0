Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF66B3CEE24
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:33:12 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5asx-0007RN-TP
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj3-0004D4-Dj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:57 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj1-0000rK-Pn
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id j199so17757120pfd.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AM1zqN7VpfnJ+vaAL4ncfMEhxDfRqMZA6jvA0oiOJnM=;
 b=K9CmzMbEauIE2HbOOr9Co5z4i2bJnQFenv1uH2MErT/rhj2TmAejj/2tkiC0SbYkRQ
 ldo0xWj5Lz0so6/28ZvEIAVd6B5ppIqoe0y7iMUsEn57YtMVpYMn7yNmq1g9076P2Hvu
 g8v0KayNW220FAf+zpbK6MiFlOk5ttE6HidtxrP7qz+XeB4DuODtNQvqiPoEQcTMtn+o
 I0weKBh4Zr7AoJoMVjQXcK3fKIo5lQYpD1SDSx5lMa0RGzJqDzsfZLaBkjxZLSk9QhUO
 WL5A3UvBdfm1Zo6881IMPbSjsD9qHMI0YSGI8tKYFL4slqJd/MeuQcaHiwOby/56sR/T
 9eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AM1zqN7VpfnJ+vaAL4ncfMEhxDfRqMZA6jvA0oiOJnM=;
 b=U40tam34IQMa69RB8IkzsnpLMDNpBxb9n96PbcPIhdtdQc8zJVwkeqRoijMIFMoadm
 RTEV9kkVxbpZHJYSOqRUuu+1cq4qdFpzUitvxPbdsy2A93xIR5+C2azz9TycIl9QufqH
 kTObQEoVBbAU3X5L+qAuiXcuSqcb3PeZTZ8yeyL+QMzppk8QluRstpAj7iB+Vysv3SI5
 WNi/ciX4kr/ClmZ38GhkNY2gm4QuQTj/mxVoYYbbg8wdAF7XH0LKzzbCfr97fz4VBw9j
 +Uuw/J2YuTZtY+IUc+8f0W6tU+QjAkKheMLUWCV029bn2l5JJ1kd/YSITLd92C9Nx4jZ
 0dSQ==
X-Gm-Message-State: AOAM533fZamm3aOkF+1jztg9edWrLsJCv6Z69KHIwo2OUB04V5VQSC3t
 FymO3s11T3dQnr3i9GcOPUlBjRxLjjpF0w==
X-Google-Smtp-Source: ABdhPJyPc01O8eCU5ozPMxMrb6nGdDvY5jssjNHhnNTeUxPUMSbi0p5LYqE/0vb0mH/VkUzHIHMDrw==
X-Received: by 2002:aa7:93a2:0:b029:333:64d3:e1f7 with SMTP id
 x2-20020aa793a20000b029033364d3e1f7mr24532130pff.25.1626729774509; 
 Mon, 19 Jul 2021 14:22:54 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 08/15] accel/tcg: Move cflags lookup into tb_find
Date: Mon, 19 Jul 2021 11:22:32 -1000
Message-Id: <20210719212239.428740-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

We will shortly require the guest pc for computing cflags,
so move the choice just after cpu_get_tb_cpu_state.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210717221851.2124573-8-richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5bb099174f..4d043a11aa 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -502,15 +502,29 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cflags)
+                                        int tb_exit)
 {
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
+    /*
+     * When requested, use an exact setting for cflags for the next
+     * execution.  This is used for icount, precise smc, and stop-
+     * after-access watchpoints.  Since this request should never
+     * have CF_INVALID set, -1 is a convenient invalid value that
+     * does not require tcg headers for cpu_common_reset.
+     */
+    cflags = cpu->cflags_next_tb;
+    if (cflags == -1) {
+        cflags = curr_cflags(cpu);
+    } else {
+        cpu->cflags_next_tb = -1;
+    }
+
     tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         mmap_lock();
@@ -868,21 +882,7 @@ int cpu_exec(CPUState *cpu)
         int tb_exit = 0;
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
-            uint32_t cflags = cpu->cflags_next_tb;
-            TranslationBlock *tb;
-
-            /* When requested, use an exact setting for cflags for the next
-               execution.  This is used for icount, precise smc, and stop-
-               after-access watchpoints.  Since this request should never
-               have CF_INVALID set, -1 is a convenient invalid value that
-               does not require tcg headers for cpu_common_reset.  */
-            if (cflags == -1) {
-                cflags = curr_cflags(cpu);
-            } else {
-                cpu->cflags_next_tb = -1;
-            }
-
-            tb = tb_find(cpu, last_tb, tb_exit, cflags);
+            TranslationBlock *tb = tb_find(cpu, last_tb, tb_exit);
             cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
-- 
2.25.1


