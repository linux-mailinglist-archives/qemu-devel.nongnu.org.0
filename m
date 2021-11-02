Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90637442D28
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:50:14 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsIv-0005zB-Nm
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreG-0003tz-N4
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:12 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreC-0000we-9H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:12 -0400
Received: by mail-qk1-x72d.google.com with SMTP id n15so5719869qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ap2DHedkoq+uxK6WhzWLDOfP9mxx1Wp6apyTQWx8z3U=;
 b=krxifhDrneb2LmvZHQJOlaSCv/JZc+266S6RNLjiY45l8zBUt4sNb9SXvFuGPv2ogg
 pmvNHH25pz97FIcdrMC8NWsr8i4Kru/GCiC+g7lc7iRquJ76vmsCQaaOkkYSIaLfF3mA
 WZcYipA1QLd9r41le2sc5Hm+PGwlv3PWJE3e9i3fnEUZUtQ2Y7jT4EJP7Jjqs4jhy23G
 J393JRJ34K3b3Ttm8L/g7z5+Co3MwxARbyGO38m2UWsJQEPlItAvCmq6NapANfCtrtyw
 11hkgbMcBx9Awzr0HrEmY8vSVRoEAqS2zDgeklqANHU4pRCwjO1e++z1Gde+EjZDaYWw
 7j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ap2DHedkoq+uxK6WhzWLDOfP9mxx1Wp6apyTQWx8z3U=;
 b=1tp+Gaf0H4i6Ma8j4dNoxL8VJnegRc9WxBcLcThenQZQczRkG2oGEn6qqkA6mR8piB
 TTtrxN0I5snEznkmQPKNaAnpBUqC1Eu1en/a7aO1Vn/DHs4gwld5hBrIw1pkT5dbC3VW
 6fXydp14bkjjIYm4eQq1qm67pEavAlpPdjcBkcXk2Uz7OzB7KPPOqAaYrEO6Gdn/6PUR
 3XJYZojT/+qvwBEcLWGirtE65gjeDrwAIPizaQlw9HhoHXRrxpHkfE3SVvwjyxezMitl
 yiMAHa6ebQo5iEK9/uw3AX6UmPGY7opC+mNB6RA7+2SCU5ou6Ki1sNeJvn+56po1ERUW
 XwfA==
X-Gm-Message-State: AOAM533GsqG6IIdh1qQu4XlY23aMWLWPF3wPXCs46wuy9GMfGndypMxG
 1jkDvcpWLsip+n2ZwbYmQ/r5uf8T5YWzeQ==
X-Google-Smtp-Source: ABdhPJyv1BmRqFxhq0F8hu8oy0ECWHbar5dDVMEruRt/S8UX0eDxIIFQ7AQqKwgQGEncu4ZRWRrbhw==
X-Received: by 2002:a05:620a:2a0f:: with SMTP id
 o15mr12998619qkp.444.1635851279194; 
 Tue, 02 Nov 2021 04:07:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/60] target/mips: Make mips_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:10 -0400
Message-Id: <20211102110740.215699-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for mips linux-user.

This means we can remove tcg/user/tlb_helper.c entirely.
Remove the code from cpu_loop that raised SIGSEGV.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/tcg-internal.h    |  7 ++--
 linux-user/mips/cpu_loop.c        | 11 ------
 target/mips/cpu.c                 |  2 +-
 target/mips/tcg/user/tlb_helper.c | 59 -------------------------------
 target/mips/tcg/meson.build       |  3 --
 target/mips/tcg/user/meson.build  |  3 --
 6 files changed, 5 insertions(+), 80 deletions(-)
 delete mode 100644 target/mips/tcg/user/tlb_helper.c
 delete mode 100644 target/mips/tcg/user/meson.build

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index bad3deb611..466768aec4 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -18,9 +18,6 @@
 void mips_tcg_init(void);
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                   MMUAccessType access_type, int mmu_idx,
                                   uintptr_t retaddr) QEMU_NORETURN;
@@ -60,6 +57,10 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr);
 void cpu_mips_tlb_flush(CPUMIPSState *env);
 
+bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index cb03fb066b..b735c99a24 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -158,17 +158,6 @@ done_syscall:
             }
             env->active_tc.gpr[2] = ret;
             break;
-        case EXCP_TLBL:
-        case EXCP_TLBS:
-        case EXCP_AdEL:
-        case EXCP_AdES:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->CP0_BadVAddr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_CpU:
         case EXCP_RI:
             info.si_signo = TARGET_SIGILL;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e..4aae23934b 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -539,9 +539,9 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
-    .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .tlb_fill = mips_cpu_tlb_fill,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
deleted file mode 100644
index 210c6d529e..0000000000
--- a/target/mips/tcg/user/tlb_helper.c
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * MIPS TLB (Translation lookaside buffer) helpers.
- *
- *  Copyright (c) 2004-2005 Jocelyn Mayer
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "internal.h"
-
-static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
-                                MMUAccessType access_type)
-{
-    CPUState *cs = env_cpu(env);
-
-    env->error_code = 0;
-    if (access_type == MMU_INST_FETCH) {
-        env->error_code |= EXCP_INST_NOTAVAIL;
-    }
-
-    /* Reference to kernel address from user mode or supervisor mode */
-    /* Reference to supervisor address from user mode */
-    if (access_type == MMU_DATA_STORE) {
-        cs->exception_index = EXCP_AdES;
-    } else {
-        cs->exception_index = EXCP_AdEL;
-    }
-
-    /* Raise exception */
-    if (!(env->hflags & MIPS_HFLAG_DM)) {
-        env->CP0_BadVAddr = address;
-    }
-}
-
-bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-
-    /* data access */
-    raise_mmu_exception(env, address, access_type);
-    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
-}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 8f6f7508b6..98003779ae 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -28,9 +28,6 @@ mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'mxu_translate.c',
 ))
 
-if have_user
-  subdir('user')
-endif
 if have_system
   subdir('sysemu')
 endif
diff --git a/target/mips/tcg/user/meson.build b/target/mips/tcg/user/meson.build
deleted file mode 100644
index 79badcd321..0000000000
--- a/target/mips/tcg/user/meson.build
+++ /dev/null
@@ -1,3 +0,0 @@
-mips_user_ss.add(files(
-  'tlb_helper.c',
-))
-- 
2.25.1


