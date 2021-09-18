Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D902410853
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:18:17 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfqq-0002Fh-Bt
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLj-0005Ec-3r
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLV-0006vh-Et
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id t20so9164991pju.5
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZeJrnrGXbns19Ke8zIFiDiL715TP9FXdW45pYc4kaZA=;
 b=evgczxDMW6NoVmZJV9OG47gOO74RerBksVVmt67+5F78SCqFd8/NJpgPI6BuRv5ZQY
 eEW3/7AQuOFXsuKDGwLV7S48qmEmBLPXei3PWnq1XvEzuStvE0fs3fiU7GJwzOGUjmes
 smApN+o+qE+PVrDRInYhG/eUg1SKUNdkp7NhtD3r+Yg/QwsPb3KLKVwX4PR8xRYf1S4B
 DF3XO/30nBHrK87XTJD55w3GbKiEIeNUHDN/BQnccRfCP1H0abzplO2jYwrYUlMR/XwU
 12jV/ihzpNCLMxQ9nm6dbf5XJujRxShnqXrVjGINHphpj1oHhdWOIAC16tja3jCAliJD
 SfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZeJrnrGXbns19Ke8zIFiDiL715TP9FXdW45pYc4kaZA=;
 b=EJsbaBWb7Cyxk1dfGuynAUrf//3jFuCSkq2jbVH2YRAJA5k59LX4gM/fkNuBLFMere
 pJpeo67S0nIR3t8XcmfSc0ockojkD2YlK65RWjLd83T+i9eihm4L0IqF570wMAnii6z7
 0HbLNi03Gjy9oTWuOG4NA4wuWEwyo9MT7S9BZDZY3US8+KX4Tm5gFdA76NVPSjE9usAs
 rTn6mC+sDxpqhZkWV6GQfIeuHETeIF+p1zRmZY0148JgwxucnJ44wYQMFV1OBhBhg8QI
 dVeJVTNsjAkqanLDG2AUV07QVPNvcBOJnCcBuTQg6QKnuNxSh1vEOB3+uET6tuCZB0Nd
 l9hQ==
X-Gm-Message-State: AOAM530GV8+3h4XIiapaIir3Mmy54nGMQpc7hWYr3ywT5HfHQfXBEcff
 3tlEsCFKZDBLJ+vy6dNp9SRrdLaI8omCIw==
X-Google-Smtp-Source: ABdhPJweIvN0WqiwcioCWBctzwN1MlrgfezUSRX8T8SdG6dPTHPMqwhijg0yl7j5EjuAQDMqP5pl5g==
X-Received: by 2002:a17:903:31c2:b0:13c:9de8:d314 with SMTP id
 v2-20020a17090331c200b0013c9de8d314mr15212452ple.1.1631990750138; 
 Sat, 18 Sep 2021 11:45:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/41] target/hppa: Make hppa_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:12 -0700
Message-Id: <20210918184527.408540-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The fallback code in raise_sigsegv is sufficient for hppa-linux-user.
Remove the code from cpu_loop that raised SIGSEGV.

This makes all of the code in mem_helper.c sysemu only, so remove the
ifdefs and move the file to hppa_softmmu_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h          |  2 +-
 linux-user/hppa/cpu_loop.c | 16 ----------------
 target/hppa/cpu.c          |  2 +-
 target/hppa/mem_helper.c   | 15 ---------------
 target/hppa/meson.build    |  6 ++++--
 5 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index d3cb7a279f..294fd7297f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -323,10 +323,10 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
+#ifndef CONFIG_USER_ONLY
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
-#ifndef CONFIG_USER_ONLY
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821..a6122b3594 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -142,22 +142,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_ITLB_MISS:
-        case EXCP_DTLB_MISS:
-        case EXCP_NA_ITLB_MISS:
-        case EXCP_NA_DTLB_MISS:
-        case EXCP_IMP:
-        case EXCP_DMP:
-        case EXCP_DMB:
-        case EXCP_PAGE_REF:
-        case EXCP_DMAR:
-        case EXCP_DMPI:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_ACCERR;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index be940ae224..9b92e82af7 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -146,10 +146,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = hppa_cpu_has_work,
+    .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index afc5b56c3e..bf07445cd1 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -24,20 +24,6 @@
 #include "hw/core/cpu.h"
 #include "trace.h"
 
-#ifdef CONFIG_USER_ONLY
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
-{
-    HPPACPU *cpu = HPPA_CPU(cs);
-
-    /* ??? Test between data page fault and data memory protection trap,
-       which would affect si_code.  */
-    cs->exception_index = EXCP_DMP;
-    cpu->env.cr[CR_IOR] = address;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-#else
 static hppa_tlb_entry *hppa_find_tlb(CPUHPPAState *env, vaddr addr)
 {
     int i;
@@ -392,4 +378,3 @@ int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr)
     hppa_tlb_entry *ent = hppa_find_tlb(env, vaddr);
     return ent ? ent->ar_type : -1;
 }
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 8a7ff82efc..021e42a2d0 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -7,13 +7,15 @@ hppa_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'int_helper.c',
-  'mem_helper.c',
   'op_helper.c',
   'translate.c',
 ))
 
 hppa_softmmu_ss = ss.source_set()
-hppa_softmmu_ss.add(files('machine.c'))
+hppa_softmmu_ss.add(files(
+  'machine.c',
+  'mem_helper.c',
+))
 
 target_arch += {'hppa': hppa_ss}
 target_softmmu_arch += {'hppa': hppa_softmmu_ss}
-- 
2.25.1


