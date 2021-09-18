Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414641085B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:26:28 +0200 (CEST)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfyl-00042Q-Aq
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLo-0005O4-F2
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:16 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLg-0006zV-Jr
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:12 -0400
Received: by mail-pl1-x629.google.com with SMTP id o8so8402702pll.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkkzYJUY8Ap6SXnhYvTgrVEh2l0oObcUDiO/BLDBzw0=;
 b=nlbammJFqlm9eVNMRbYzb5TJ20C9Zx4h/Jpcs4TWAs/rEUoqAPkVPH0F/ib/M0Rd1e
 MGIhFOqew9kS0LlIHY2gGl0THVmmdhdDRRsGLDizpQ1IN3/WVLILQnoTzzoZxJi8KzIM
 Gt7X0Pud1H7KyYpG4wJrf61PQBDSEsII4nhNcNGX21LEGSHrVJE/8FQ3hlZMUKQyZm9M
 h5PrzN71jqgNwyntA289XMIWu9BLkDP3lTDEasEhf4PEvdFKn2oe8Mk3pzptF+x1LcEN
 yjZPgTWphxgyAotJ8v6/ZpIw8CHMgDU8MawJTblHNHlVlGqGIxU+4HmnfzQRxr98r/Dj
 ftrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkkzYJUY8Ap6SXnhYvTgrVEh2l0oObcUDiO/BLDBzw0=;
 b=BFssp2a40WqZwBvJYUqOvumFDE5FJB4kr7xQugKOr3r2QR9NVRO6tFCwY4jgBEt5sp
 5Fo7+K3W2wTl2Jw4Ygbdh0C9k/YlbAoVNAHRyKwxLEK5fVHbC/iVoEFSW2RlYxpKoOra
 TvcikcD/pjtfKKge8zNxUv7rXV2TpKfTPfaMxW7jtWOTGlMXZj7jCraJGqLhQ9vwEMts
 CbRwbWicq1kBgh9GzbyctZGIRaeW8Caa787Lqg3UMpqKDNbncHH5FoiZ+tUElT6rrO0P
 LiAiTMICU2DCDVOKyM4b71TBv5NRn+Aca+jNxh1T0MCr/27u9g32t11s/REZd3CXCrCi
 adWQ==
X-Gm-Message-State: AOAM530E7m370Lj0b/AWHhn8s3RplVHvXajHBBXqTmM2Ru/enNUIqAJN
 N7PCp3Nk1NGb1s+dkPrakF+Nl2V94n4w9Q==
X-Google-Smtp-Source: ABdhPJy8wzim6Ec3dIvCY7BqqeavPb6i0fGIYdx1HnkyByth4sk5RP538nlbh1LITjcWj1OG+hl77A==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr20336548pjb.1.1631990761058; 
 Sat, 18 Sep 2021 11:46:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:46:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/41] target/sparc: Make sparc_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:25 -0700
Message-Id: <20210918184527.408540-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for sparc.

This makes all of the code in mmu_helper.c sysemu only, so remove
the ifdefs and move the file to sparc_softmmu_ss.  Remove the code
from cpu_loop that handled TT_DFAULT and TT_TFAULT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 25 -------------------------
 target/sparc/cpu.c          |  2 +-
 target/sparc/mmu_helper.c   | 25 -------------------------
 target/sparc/meson.build    |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198d..f5e0de7eaf 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -217,17 +217,6 @@ void cpu_loop (CPUSPARCState *env)
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
@@ -235,20 +224,6 @@ void cpu_loop (CPUSPARCState *env)
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
index 4a63ed1264..c068ef98e3 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -866,10 +866,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = sparc_cpu_has_work,
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


