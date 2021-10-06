Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592142451F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:46:10 +0200 (CEST)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAzZ-0005p6-41
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdh-0007Ht-O8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdf-0008CO-7b
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso441915pjb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDn64Ar0c4NUi8qPBLq+7M9+nijncdxsp88/28xGJnw=;
 b=MKeOS4I2Pes9LDCFxdJeHryjk1Kc+dGFAF1LbEUqW5zL2/5EG++csMFzFbWv7tPJko
 IYp5Id77MCKJUcg7Elat3FANNivIBdVeDh1TNu1zJq6rD/eseoDYRB/XIf5GCHZd+oCL
 wmlug2ubCCkt7ZI2ExrmJYzOsZfgaiol6ZK6OW9Lt4FPOKoQeHmbrkwcd6OhinOvKYMt
 gYOD0QpnxqwtdnD4BjNs4zIeUVAPncdi33VH6nR8d5ePlgRuxAIk+tECp35cIiyxcBH2
 bL0z4+Ta1d6DHGG0OyLAs4P7IYA4TjbWWeP8bKFtILaB7tWD43oFEVBtcINL1kSJwdhJ
 i2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDn64Ar0c4NUi8qPBLq+7M9+nijncdxsp88/28xGJnw=;
 b=7lDOMUn4x8cDDLv17UexxF1XobEPD0T66tyd2GxmQXZgOl+T2/I2Njt+lN0AqEk0Gl
 V8Rg2Fkx88cMhu//xSo2lvkTJGnujuDjnzDLIAP9n/spvHni9Kq+h1VFKgD9ZKpRwv1T
 Y+ZuRaIv/5ie4TMfwgbGiGYDF76y6ZL028zdpt1nZ9Cb9hFv6BvKtcP+5XF3CjEqMgLW
 w5m/2sNFuKJA2ltTW63XddjYl2N1YAKjShA6WUNON/1nSAK3Tfs1qD+ED5yrTRUBdPZ1
 mffGdeyKa5c8kLHwqX9uqwK224Rjmq0Y/pLDGEZ0y7fe4L+rvKTBRwirgz7dk6njCsxm
 t92g==
X-Gm-Message-State: AOAM532KSV0kdCx9oK9LHv+0iJb6cFC/t/13FQE2GVaHwmIePy3qjDcM
 0owVnD7saFxzVDeu85hklAx0MSs54vOTHw==
X-Google-Smtp-Source: ABdhPJwcJiiabfwao+Rfkfw4zFPxuSFqGT/z7pnP6FGOXO3cxK7cf3ObhJYZZ86CWGdsCQu8tn708g==
X-Received: by 2002:a17:902:7613:b0:13d:b35f:b4d7 with SMTP id
 k19-20020a170902761300b0013db35fb4d7mr12439940pll.8.1633541009910; 
 Wed, 06 Oct 2021 10:23:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/41] target/hppa: Make hppa_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:22:52 -0700
Message-Id: <20211006172307.780893-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

The fallback code in cpu_loop_exit_sigsegv is sufficient
for hppa linux-user.

Remove the code from cpu_loop that raised SIGSEGV.
This makes all of the code in mem_helper.c sysemu only,
so remove the ifdefs and move the file to hppa_softmmu_ss.

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
index 81607a9b27..e0a62deeb9 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,22 +144,6 @@ void cpu_loop(CPUHPPAState *env)
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
index 89cba9d7a2..23eb254228 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -145,9 +145,9 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
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


