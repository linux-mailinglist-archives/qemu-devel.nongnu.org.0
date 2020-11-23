Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B72C04ED
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:52:13 +0100 (CET)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAOB-0007sz-8L
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFt-0004jF-NH
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:37 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFr-0002ku-Qb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id s8so18237167wrw.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yr0RRNusj+c+w++psVed1AMwBpNn/6sJlaWnKcTBKLQ=;
 b=xvDLs0uAVOcQfX56X9nitH+ALtKckCrH0z0IyVRslwJ3OuVmkpWb+9gva4P+A988Rk
 6OfK4gstDfK0hwFQWOQtN6vwPva48X4m1kAEv5u6AEykYlSaEg5vabcXl5EO+iiH7IAo
 gsCtxiV6dZCFRlf8Ck7UrLtV+0LxV0ZE7VNMqzpBz6uJlvrOBWxv0z3RCAWucVaWIz2I
 YGvMKjGXxpBFSj6VsVwwqhWUXp33IhwdpZeq0qXtnz4eewZ0pHqDdr8GQlgrX6qLi3oU
 hrF2dIuwKRzbp1GESybZ2aHhq4vrSwKQy410rJvjoOa7ZgWnSLBSFvvhHrqv9//XudP8
 wNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yr0RRNusj+c+w++psVed1AMwBpNn/6sJlaWnKcTBKLQ=;
 b=NljLvnjKGPvWrFmiFQXmfTS7ws1gSz5iYS9GdUJDuL/s+4ixN/snUsfFPO298a1Cih
 05P67uGleALyKSRN+0RZhPC8yrPcqaDM4agyvPObmU6RFsuRY+g25DjBtAfP6v+St6vH
 /fy4kZ6TLUpypbaocq+G7lvzjjNCjFiVorePxgx/kWvLc2J3wz8jwLXC5hTRQZNqlJUN
 TqQwPCaYFd3eNXw5OPyKdH+IIulx6R3TnZSTjykPcEkf4JUWfk7u3cGGVleVNUmgswvJ
 Nf7xx0LOLmvXf+C7lzi4CZDiKG/oiyQw7ie2q/2JyYUWJPUbPcaLsOOUmAzHVFVG5U7q
 /oaQ==
X-Gm-Message-State: AOAM5336lUp9Z2CCG0352xFoUVatmnBj+SFKm8SF6ISBl3jbW8jk6pVL
 bkPuL5TH3EXS4eYcJTSuB0D0DkHFPR5Piw==
X-Google-Smtp-Source: ABdhPJw1t1JAVkexcbOyTzTzHRSXleF+WvdSm+osNojXqvwBOoHCIc2e5+Zj6BehPf1GmyDeOY+p8Q==
X-Received: by 2002:adf:c443:: with SMTP id a3mr32439321wrg.249.1606131814280; 
 Mon, 23 Nov 2020 03:43:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/24] linux-user/arm: Deliver SIGTRAP for UDF patterns used as
 breakpoints
Date: Mon, 23 Nov 2020 11:43:06 +0000
Message-Id: <20201123114315.13372-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel doesn't use the official bkpt insn for breakpoints;
instead it uses three instructions in the guaranteed-to-UNDEF space,
and generates SIGTRAP for these rather than the SIGILL that most
UNDEF insns generate:

https://elixir.bootlin.com/linux/v5.9.8/source/arch/arm/kernel/ptrace.c#L197

Make QEMU treat these insns specially too.  The main benefit of this
is that if you're running a debugger on a guest program that runs
into a GCC __builtin_trap() or LLVM "trap because execution should
never reach here" then you'll get the expected signal rather than a
SIGILL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201117155634.6924-1-peter.maydell@linaro.org
---
 linux-user/arm/cpu_loop.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 13629ee1f6a..3d272b56ef0 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -205,6 +205,24 @@ do_kernel_trap(CPUARMState *env)
     return 0;
 }
 
+static bool insn_is_linux_bkpt(uint32_t opcode, bool is_thumb)
+{
+    /*
+     * Return true if this insn is one of the three magic UDF insns
+     * which the kernel treats as breakpoint insns.
+     */
+    if (!is_thumb) {
+        return (opcode & 0x0fffffff) == 0x07f001f0;
+    } else {
+        /*
+         * Note that we get the two halves of the 32-bit T32 insn
+         * in the opposite order to the value the kernel uses in
+         * its undef_hook struct.
+         */
+        return ((opcode & 0xffff) == 0xde01) || (opcode == 0xa000f7f0);
+    }
+}
+
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -234,6 +252,16 @@ void cpu_loop(CPUARMState *env)
                 /* FIXME - what to do if get_user() fails? */
                 get_user_code_u32(opcode, env->regs[15], env);
 
+                /*
+                 * The Linux kernel treats some UDF patterns specially
+                 * to use as breakpoints (instead of the architectural
+                 * bkpt insn). These should trigger a SIGTRAP rather
+                 * than SIGILL.
+                 */
+                if (insn_is_linux_bkpt(opcode, env->thumb)) {
+                    goto excp_debug;
+                }
+
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
                     info.si_signo = TARGET_SIGILL;
-- 
2.20.1


