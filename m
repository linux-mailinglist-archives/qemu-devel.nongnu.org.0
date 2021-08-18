Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7080C3F0BBE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:26:53 +0200 (CEST)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRDA-0006rq-3g
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6C-0000I4-1O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:40 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR68-0008O8-QW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id q2so2408167plr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=rrcW2Jbu63NUh6oIui9X/7A/Th5BxVh7C0aXIA/qfmcVHbmnh4HVhZzgacZRTEjZ21
 LaM/6UCWCwRzM78YuKFw85syRtsUNLMJGus7JnIafOYEr6N2GohzQrIpDUWMbvoYAYg9
 mRy6rS1cgrddN4Jw3h0Qr/89cg81pyBQPC6EWKlJvqjgTFyNuPOlBFFdGE8LcnsbSL4a
 G39R6Oj4NhSj93+fqdWB21FnrKiHKDeZvSOemmFQLrg1fdWJIzVx6Q/la96DkbScn3vi
 ez7Rkmc/1tp+EtRIGxdBhZxcCY3DNYKyq9Y/z25+T8g1KpyMqKZVC/MoO+SpYJQRoHNv
 y+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=iR/O670fiCDVvL5/cXz0iZIVS7PZEMugAzb5flC3unWvkkjJr2whcSrXJkOaW2K1gT
 2WMu6MEdfjf3rMbp+gC0AmHUy9rP8MnjIRSpM4NXIWSnh4frF55xWphztszXn6Q9tGvt
 30e5+IYtcWfc8Ha541b4iZGtrrTLdBrzXtyGe5GmzcG5ZdUTq6Zk0cpVmqsA1dKBqpJl
 TTr2t7bak02+wi1XEtkSUBypLo1K8OoYGVGDDngfPrU11DVxZPbH5wevR+LAUFbk1F3/
 WVUs/DUU41HkBXH/jIHgauWcUmhV8FfIDsxwUWhTLer/1F+OJ2HS4XxoUkQzoj8xNilZ
 Wvzg==
X-Gm-Message-State: AOAM531k7MyuF3U2Ps0FPfWrDUlfNp48RSCrXxxty34KEaJ381yIMUXI
 wvFme5lTX2avvq0qXOEmxdEq7l+vQVtE9g==
X-Google-Smtp-Source: ABdhPJyuP6hjm7Gm8pe/zOyNrUnZpRpt0mBHM9mGEUkey+kz2+qWobSarKOYMgAXwhW6MbvoC6WzFQ==
X-Received: by 2002:a17:903:300d:b0:12d:d378:1f52 with SMTP id
 o13-20020a170903300d00b0012dd3781f52mr7753160pla.53.1629314373313; 
 Wed, 18 Aug 2021 12:19:33 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/66] target/mips: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:22 -1000
Message-Id: <20210818191920.390759-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c        | 20 ++++++++++++++++----
 target/mips/cpu.c                 |  2 +-
 target/mips/tcg/op_helper.c       |  3 +--
 target/mips/tcg/user/tlb_helper.c | 23 +++++++++++------------
 4 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e..51f4eb65a6 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -158,12 +158,24 @@ done_syscall:
             break;
         case EXCP_TLBL:
         case EXCP_TLBS:
-        case EXCP_AdEL:
-        case EXCP_AdES:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
+            info.si_code = (env->error_code & EXCP_TLB_NOMATCH
+                            ? TARGET_SEGV_MAPERR : TARGET_SEGV_ACCERR);
+            info._sifields._sigfault._addr = env->CP0_BadVAddr;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_AdEL:
+        case EXCP_AdES:
+            /*
+             * Note that on real hw AdE is also raised for access to a
+             * kernel address from user mode instead of a TLB error.
+             * For simplicity, we do not distinguish this in the user
+             * version of mips_cpu_tlb_fill so only unaligned comes here.
+             */
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
             info._sifields._sigfault._addr = env->CP0_BadVAddr;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291..a1658af910 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -541,11 +541,11 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
+    .do_unaligned_access = mips_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
-    .do_unaligned_access = mips_cpu_do_unaligned_access,
     .io_recompile_replay_branch = mips_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index fafbf1faca..0b874823e4 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -375,8 +375,6 @@ void helper_pmon(CPUMIPSState *env, int function)
     }
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                   MMUAccessType access_type,
                                   int mmu_idx, uintptr_t retaddr)
@@ -402,6 +400,7 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     do_raise_exception_err(env, excp, error_code, retaddr);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
                                     MMUAccessType access_type,
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index b835144b82..61a99356e9 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -26,24 +26,23 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
                                 MMUAccessType access_type)
 {
     CPUState *cs = env_cpu(env);
+    int error_code = 0;
+    int flags;
 
-    env->error_code = 0;
     if (access_type == MMU_INST_FETCH) {
-        env->error_code |= EXCP_INST_NOTAVAIL;
+        error_code |= EXCP_INST_NOTAVAIL;
     }
 
-    /* Reference to kernel address from user mode or supervisor mode */
-    /* Reference to supervisor address from user mode */
-    if (access_type == MMU_DATA_STORE) {
-        cs->exception_index = EXCP_AdES;
-    } else {
-        cs->exception_index = EXCP_AdEL;
+    flags = page_get_flags(address);
+    if (!(flags & PAGE_VALID)) {
+        error_code |= EXCP_TLB_NOMATCH;
     }
 
-    /* Raise exception */
-    if (!(env->hflags & MIPS_HFLAG_DM)) {
-        env->CP0_BadVAddr = address;
-    }
+    cs->exception_index = (access_type == MMU_DATA_STORE
+                           ? EXCP_TLBS : EXCP_TLBL);
+
+    env->error_code = error_code;
+    env->CP0_BadVAddr = address;
 }
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.25.1


