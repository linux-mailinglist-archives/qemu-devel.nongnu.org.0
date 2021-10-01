Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16C41F329
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:32:31 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMOc-0003aD-1w
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5C-00059E-1r
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:26 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM55-0005HN-O3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:25 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a14so5983865qvb.6
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFe/Vw3cr/4hcwv1jUnUaBVa+r7ZoPXYiTXFgPNQ9tk=;
 b=hN0VzbmAKpG9vNs3ycl/GIdoifB2BWVlyH5jMqcd7zECz5NFyhnscNEjBA8hjZ30af
 3LvFg85gHF29/3V9YtGR3X5JQTO7AbUb0tKPiJqUXxVcXZBagS3GAkBI3FcVgp5c7e5L
 nnb0lQBbzrzHiircP0mKtgROlT1M8Zic2r78H86QdOM7pf4SgYJEtW2ASnu6zKQhVFU0
 457umLNgZXsbmc2DxMa+fp18gKgxnZdXlzFFetWYU7FLRpLeJ7IsFpsuHCtq9zc5lY6a
 hTnOlt370bWmoP2CGXnLINK5/6sLgBYiAbehHkXHoIIKXLPJX7aGLvPwSA9MFiKtpFOW
 vJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFe/Vw3cr/4hcwv1jUnUaBVa+r7ZoPXYiTXFgPNQ9tk=;
 b=pfgvWONjdrsqoJ9nNhddmGxfmAOuVsvJX8UXX6Y+C7BuCqTgrlYRHtvICTp8KYVEtU
 Di4/odnoAX6Rl4CbVw93+k+hmmMVSHOi+dZ6Ya2sPBtgGlfJd8ZLTO/sRXlpf2D36FrE
 dBkfMWq+6gAgji0hMKmYVorCHmCCzvPrQPkX+K/vpPllRCvcOG6ANwCPLYR4zFax5gJ0
 xI08qflr0rxphj5MIA8/dl0hZNCTsKd8zpSO71Tqtvj8kcL8CtsU3afNeIIQaylq1Hd0
 nwRsKCJK9qTxBrhZaTXpq47Dsh5qgntDDXfm+wxTsU3ME3R48jW1qwnd9Im3WmlcHlpJ
 d9MQ==
X-Gm-Message-State: AOAM5304xJPP5AoiiUy7yuTiL+UhQMeOPy2sggj47Tmf9H1fRfX1jpla
 CT/odWU+SaNFksM3ndssU54+KplEJUbp9A==
X-Google-Smtp-Source: ABdhPJw5M5zEKytm/f4Ln0ysd2xqTblg3pVCcmMO+QXmL1evcsbuDLOzvrF1KRDemuP9APHpbLiG2Q==
X-Received: by 2002:a05:6214:987:: with SMTP id
 dt7mr11395223qvb.65.1633108338759; 
 Fri, 01 Oct 2021 10:12:18 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/41] target/microblaze: Make mb_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:39 -0400
Message-Id: <20211001171151.1739472-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for mb linux-user.
Remove the code from cpu_loop that handled the unnamed 0xaa exception.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
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


