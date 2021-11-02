Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E2442CB3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:35:32 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs4h-0006Rj-7b
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreJ-00042g-F9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000wM-7H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: by mail-qk1-x72c.google.com with SMTP id n15so5719852qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wm8ynGMh6kJsv+mBV6l6SdFFT71ClM8AMZtK4AOJ7uE=;
 b=ucLC/rW27YL59WvVDAQ8zlrSheapRx3yaCFnBoWQhysaLQWvNSlgIFEJ1JJNSUUj9n
 DXi2Yj+r5yMb5TcKogKFLvFxqNgTxtGJmfvmr+rCiPKALWy6i4N06bSkmTljJ0kCfo6Z
 MBegi6OTJTqONsK/OUdi8COoR3+Ssc+l2ASzeiATIwJ88VC/b2K3QWsbxlDzlU2UW9Y7
 jZl4ZiLtSJMYi2s42OryclKgYgjt5sSq3MhmLLvDu0v35KeiJZphykEuQRs7LlhDCz5f
 oTCZTFY00FOiIXCq8KWzc3IrC5Euk33890N7lB7Fejs6VhvVyGnp6E9VVnsMSbnY8jiu
 Aisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wm8ynGMh6kJsv+mBV6l6SdFFT71ClM8AMZtK4AOJ7uE=;
 b=RmWDhMlKK732/sdqG3ymjNw+HMRSVMSfDeoX9trvPFJR8qfYpBVb3l9aDi7aQ9L5P0
 E6vyYBJkM7IN0zPePeLxGd1JoZWXiAJewrS3r1ZNeQVqOIuQStzIOWvdiyouQLPocT8q
 BbaRjH6a1bYCnAEF3O0wWfWP6K6w7+RLzQ2CCXP4bB/qyT6aFT6n5jR6hwuSiuSQjZgN
 28WFP6LaddYJXGzFn356z2c/JoPJ0rvKTFgBUCdM3Q1b5i551Vu/bAxbuNe0INTHDgR/
 t7MVE7YUOwms53u072bd/ECPc/3+sZ03dr+angPk0JWRCARLKl+lpudFdINXwd4F05O/
 mi1g==
X-Gm-Message-State: AOAM532hmXTNTe0ulknJnAdD30QpMObp2u3pBrgyOKUNl9p8Ttjp6ppw
 spTGE9vojAGm+vQedmWkIrcH+x35AqfroQ==
X-Google-Smtp-Source: ABdhPJzNIarwgcPdjrTpQwoUfVi3gfNqVHT8oX4PY5kH4MQCOfBWsbX6Qk1/dP7Y+PF9WfXTxpr13Q==
X-Received: by 2002:a05:620a:414a:: with SMTP id
 k10mr12266267qko.309.1635851278583; 
 Tue, 02 Nov 2021 04:07:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/60] target/microblaze: Make mb_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:09 -0400
Message-Id: <20211102110740.215699-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for microblaze linux-user.

Remove the code from cpu_loop that handled the unnamed 0xaa exception.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          |  8 ++++----
 linux-user/microblaze/cpu_loop.c | 10 ----------
 target/microblaze/cpu.c          |  2 +-
 target/microblaze/helper.c       | 13 +------------
 4 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index b7a848bbae..e9cd0b88de 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -394,10 +394,6 @@ void mb_tcg_init(void);
 #define MMU_USER_IDX    2
 /* See NB_MMU_MODES further up the file.  */
 
-bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
-
 typedef CPUMBState CPUArchState;
 typedef MicroBlazeCPU ArchCPU;
 
@@ -415,6 +411,10 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
 }
 
 #if !defined(CONFIG_USER_ONLY)
+bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                     MMUAccessType access_type, int mmu_idx,
+                     bool probe, uintptr_t retaddr);
+
 void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                unsigned size, MMUAccessType access_type,
                                int mmu_idx, MemTxAttrs attrs,
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 52222eb93f..a94467dd2d 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -37,16 +37,6 @@ void cpu_loop(CPUMBState *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_INTERRUPT:
           /* just indicate that signals should be handled asap */
           break;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925..b9c888b87e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,9 +365,9 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = mb_cpu_tlb_fill,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index dd2aecd1d5..a607fe68e5 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -24,18 +24,7 @@
 #include "qemu/host-utils.h"
 #include "exec/log.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr)
-{
-    cs->exception_index = 0xaa;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
+#ifndef CONFIG_USER_ONLY
 static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
                                     MMUAccessType access_type)
 {
-- 
2.25.1


