Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C493424526
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:49:04 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB2N-0002sa-G0
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdl-0007Sc-HT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdi-0008Fv-MX
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u7so2931468pfg.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tIWq1Y9Lh6wr1x/ixIjLaUf11V/zxN9xw2JRcPgovYc=;
 b=QBd4crZxJWfu2O8BzcCwAtTOwTF/K36sFaPeWMjD7av7IJ6AmuvbuMN3YNDXv8+OwH
 VEpT0IQpA4YfTJ8IEDyW9yD9EwE/ir/1EiqOlE8JQzHa3yc6ij7qEmpsVzVlcMTNU6wv
 Qyvsz290TkDxjvlSfX3ZWxj4mra6HaVhGeapo9QOTXAumg86Ql0CETsgug21cLI3eAZd
 C/biycrEg5zH95RLtrKoLEOgSUI+mpHpB9N5vTQkfYu4A0df56bMQ9i2p0O7SNncsNov
 26BkS28YTb+pbix2zMRY0gg8WHRZt6obKH4owjNCdXcZYxLt4+BEt9n7s2j+PK3G3l3p
 HLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tIWq1Y9Lh6wr1x/ixIjLaUf11V/zxN9xw2JRcPgovYc=;
 b=esCRFV7HonFR1Sn0LkobbQ1tMggX8QeJuRljAsNDXk8GUXkD0BNd9IY+EnYiM9B2C4
 swchgm336sMZzrvRovWEIKbrKMfpqwCtGm+C4NUjuGAaomayK8KzSqDuMzktvTL2YCVP
 RHa94XI6jhHO8fO0VLmmUAasG9RRbxYwcBBsBLDihfEOpegAZYRRLJ26jH9Ay1Flq07n
 lbRewjYeIyoIZMEekvYiMRwLwIIaNFNmPFfUpyuGf8j0kkczbPx9/Pc/yVLPhTto+Qce
 mm3f/ikuSPyf09Un0YMFqnq2sR6/YQuuPscitqeNnDeZu++2hAqfjDRcf8rFthSn0b94
 iNDQ==
X-Gm-Message-State: AOAM532VGD4rMvYxNpRqeowoPVSgSB3wT/IA70AEjUJHXXxSUYefUOLn
 nwI9QzqFPGBPxJVaYKTYkvr18V+aNgiqQw==
X-Google-Smtp-Source: ABdhPJwGwZPiDaR9PAnR3lb79suGK7spqgfA8Jo/mxRArkty5jVCJzC1uStKdFRyTaI5+uiGm/rr4A==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr21389008pgi.401.1633541013462; 
 Wed, 06 Oct 2021 10:23:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/41] target/mips: Make mips_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:22:56 -0700
Message-Id: <20211006172307.780893-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for mips linux-user.

This means we can remove tcg/user/tlb_helper.c entirely.
Remove the code from cpu_loop that raised SIGSEGV.

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


