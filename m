Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6541F320
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:30:31 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMMg-00087z-N2
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5C-0005AE-Ad
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:26 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5A-0005Hn-8A
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:25 -0400
Received: by mail-qt1-x832.google.com with SMTP id r1so9592328qta.12
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mS1vCOgpN+V+J5nlq9LKRVT4rEwhx/pTcxKt2Kvegg=;
 b=oMEguWANqVRdFfaZpS+NyyN+QKTmwzS+fxLIpoBkuqlzDSV4fDFnSKR7qiQdlkp/cS
 54keSaotJBTMjhySIX7D0RLzfOx1+kkUuDC7oASlf3bgeeOeUZH71iX8Jka9NWUEaQ+T
 n7DhU3e6m35cT2E4QpZjMnjqlE2ay69j/mc78DZHnm1zrs+YwzcKBBJrKaIqtfPPJjeK
 cjZhKgTiQ5muoGIua3TwA8vLJeL/oRKMaU2Fx+zgcFvYR5e6iNakyzNT0kDs0nXj5eRp
 rAvEy/x0zWJHfPj+36wLRFK1qZ1mEHMgcliwQOaxcURXPjJVXcXom2B7FqLaOnu7RqrB
 08Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mS1vCOgpN+V+J5nlq9LKRVT4rEwhx/pTcxKt2Kvegg=;
 b=6I6dui6HtNX+2B2SHaM2E0ybPr89sCSF5yhzXNSf3OB+aw/3zhrtw5LhGl0vOD8iov
 /7bIxndnhib/+hp249uPrcoy50zhdyarCszJhd4ZYdHCFy0+JbfHwYywsy6EOaePU0bG
 ihzsfKsKnJaHwRXqRQyU7F+rFAAEjPmVTwuvkKjocoSFeWTcdUKhGTjO6EI2N/mgP+Ek
 kfkBDVm6tJ1k2w69SqYA6JRfLfWwldpYr3FvBQemRIiACb+t+yGuguCkcytmrfTMOavM
 EXp7Li0xZXOEMb07wbMjSBMgAW4EHdoZcWO33jR9TRTJQptXmi/XG/Ae985PiVizzQIQ
 F2og==
X-Gm-Message-State: AOAM530bDJ81C1IU+WGJIM5SoFkVd2pwPWywBgMJLNaSYK4wvbkf6fbQ
 Wb8TkBk4bGYFEtUkWJbkODq0SiqLnVvO2g==
X-Google-Smtp-Source: ABdhPJz3H3i1xaIzSvJvY99Wz7LB4nB54ZgZPM2f/aSBfpuPwMyZafkqF/Giq/0gvocx7GVlI+3WVQ==
X-Received: by 2002:ac8:148b:: with SMTP id l11mr14304016qtj.298.1633108339652; 
 Fri, 01 Oct 2021 10:12:19 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/41] target/mips: Make mips_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:40 -0400
Message-Id: <20211001171151.1739472-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for mips linux-user.
This means we can remove tcg/user/tlb_helper.c entirely.
Remove the code from cpu_loop that raised SIGSEGV.

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


