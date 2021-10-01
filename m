Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BB941F3A1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:51:55 +0200 (CEST)
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMhN-0000DO-VT
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5M-0005J4-9X
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:36 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5E-0005Mh-0e
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:36 -0400
Received: by mail-qt1-x836.google.com with SMTP id a13so9613435qtw.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kxx36+JaRB0XOezqbrSvE6VIGRNmwbnwHPsqVvcTcY0=;
 b=FGUKBeAURoEDspZaPW+aMnUHm/9D6hijb+iqPsbH2xd+uuc36AVvDPDBPLyJ0e3o8e
 L5Zf69UR1fXRW5KhqsjkqwaCGmeimdx5Syly07ESxkdMowX0Dts0lO2TOqa7v/PwvqdK
 jWNwCjJx1KV1ws7zf+MS+/eXk8IwbsXNN1cjvXvJ794i79wnp4FvEE9hNX19EWXFKSlb
 6YhnpccM+hZDN+7Ivig6hAIjL17mCK+WgIvC7HB/r4M2vu4DzthRi+QFYoxg4NA6iMyO
 jrL+0ADjLblTyMED2QR3h+EczXuVfJRaJcgpX9c7LOnDd9tN0C2cj25Vb1HPuTOpzFlS
 tYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kxx36+JaRB0XOezqbrSvE6VIGRNmwbnwHPsqVvcTcY0=;
 b=cCtg3xZD3UuvGy/HgAe7zlsXy89HV0MQuEBLjIMWJFEuiVZiM/m1DnKDXf+x9Zdr+F
 b/N2IUUjHel9S5MprifduuqUfVuAbZXimoMLt/hYjFSc12zLR3cImP5Vo/FjgxYqwTWe
 tP3ReOOiF/T5BzesFDV/tE+Z4mctaCNqnIMISc8TJnjxYLddghodd4PwJwnTQ128S8w+
 pTozk5KUyDI49Q0PXn6bU6cTgfmU0it8rC3UgIQcQNpWWfGfm0JLVp71tCOKKv47jndH
 l/w70M+tpXlnMqPyPAi2KMIazqB7K2pBxDC9CG1YvA4MhCWmQHNfc7NSey7lrv6VmKqZ
 j9RA==
X-Gm-Message-State: AOAM533FUwGkLAkmyC+CLc8PVUL387lxC9ERIeeikAzDf/HHilc4XI5Q
 LCI6w7HIkwlw/Yg3qdszQmWpoqGpiIctFA==
X-Google-Smtp-Source: ABdhPJwFe5Grqpya30jelXmnFWGf2x/Dlg/kPfHtFwyENpUO/OdrGnok0zChsw1YHk61Rsl66PJmug==
X-Received: by 2002:ac8:6b43:: with SMTP id x3mr14317403qts.190.1633108347187; 
 Fri, 01 Oct 2021 10:12:27 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/41] target/sparc: Make sparc_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:49 -0400
Message-Id: <20211001171151.1739472-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for sparc.

This makes all of the code in mmu_helper.c sysemu only, so remove
the ifdefs and move the file to sparc_softmmu_ss.  Remove the code
from cpu_loop that handled TT_DFAULT and TT_TFAULT.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 25 -------------------------
 target/sparc/cpu.c          |  2 +-
 target/sparc/mmu_helper.c   | 25 -------------------------
 target/sparc/meson.build    |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index ad29b4eb6a..0ba65e431c 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -219,17 +219,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_WIN_UNF: /* window underflow */
             restore_window(env);
             break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmuregs[4];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
 #else
         case TT_SPILL: /* window overflow */
             save_window(env);
@@ -237,20 +226,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_FILL: /* window underflow */
             restore_window(env);
             break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT)
-                    info._sifields._sigfault._addr = env->dmmu.mmuregs[4];
-                else
-                    info._sifields._sigfault._addr = cpu_tsptr(env)->tpc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
 #ifndef TARGET_ABI32
         case 0x16e:
             flush_windows(env);
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 21dd27796d..55268ed2a1 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -865,9 +865,9 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = sparc_cpu_tlb_fill,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a44473a1c7..2ad47391d0 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -25,30 +25,6 @@
 
 /* Sparc MMU emulation */
 
-#if defined(CONFIG_USER_ONLY)
-
-bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
-{
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
-
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = TT_TFAULT;
-    } else {
-        cs->exception_index = TT_DFAULT;
-#ifdef TARGET_SPARC64
-        env->dmmu.mmuregs[4] = address;
-#else
-        env->mmuregs[4] = address;
-#endif
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else
-
 #ifndef TARGET_SPARC64
 /*
  * Sparc V8 Reference MMU (SRMMU)
@@ -926,4 +902,3 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index a3638b9503..a801802ee2 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -6,7 +6,6 @@ sparc_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'ldst_helper.c',
-  'mmu_helper.c',
   'translate.c',
   'win_helper.c',
 ))
@@ -16,6 +15,7 @@ sparc_ss.add(when: 'TARGET_SPARC64', if_true: files('int64_helper.c', 'vis_helpe
 sparc_softmmu_ss = ss.source_set()
 sparc_softmmu_ss.add(files(
   'machine.c',
+  'mmu_helper.c',
   'monitor.c',
 ))
 
-- 
2.25.1


