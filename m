Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B9A412BC6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:33:38 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVbD-0004It-IN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTh-0005j1-Mo
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTc-0006Ic-6F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h3-20020a17090a580300b0019ce70f8243so874691pji.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpOMNzZjs3eYQt+AetmKowQQtI1fMdvXZt6ja8gx9sA=;
 b=nCcReL1T0EVrjHqQfnnXcgOV5RiyGuB4xixn5iSDX7KI8Jluexlea6YMbHx19UVePM
 N6Jji5TeSg9WzztcG1Do5I/fBLpfSttMchXg3Pkz10q4IftGRWUPvKWeGbLelaZIM3yN
 zpaFVz/2Sp6TAOxIJWqMB6kKHa+p0CrykE2wEe6QyXFRzDdQEXlMWjydIE4BFkZ+w1Et
 lI8jXbp5AE8XuO7vAyNvx8U2cVDq3+sj4HWiPVHKDK1Zmxt7tTVlxfrFaImLAd/XUZHQ
 rIMCXJV3J7B64eZTbTbY6eC5bW/nPFUiPsjOShWtqeMRhV1WdRiwkdXStMxq/DL9rIUe
 WPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpOMNzZjs3eYQt+AetmKowQQtI1fMdvXZt6ja8gx9sA=;
 b=hLg8RjOnvCe0g5X36DbsA6BryB9O8JOdFBkJ3rGvHUJpz14mFpcYMO5gz080pjYeYe
 ClCtWWL2yP208wQgg69CfnpH/9ojfs59AaqY0vKAgmrGtasrPL/Oi75bJdZfvDbrtGxb
 hsaskIH1QnjT/I4zmyiNBA+6kvxUHAqc2treSXFUhT5GeBvdXqFVU52KRIq4JcnjBQfA
 0hJmCVwdNeoSu4rRr+V5bHFVatkzE4PnDYH+LxKb1Pi+yy14DnthErLjFJWk4BjPugWq
 DvidHvxUNZLA/csKhss4n5iXCtVHP4RumYNilgj/mw0q6B4Lqu/g2vg/PMeFI1xAWFWQ
 VqXg==
X-Gm-Message-State: AOAM531GskDs0nb5Mcc62bdTUcKPKla/AQR9zCd7Mh5WgiIy+Iva+XzT
 mMmBkoYfh7ZNHoXhCKCnyIrRWrptGWyvzQ==
X-Google-Smtp-Source: ABdhPJwOW77NDpGoZy7RJVZN4JmZbfFQLgKQjwXfjKV87EOupRsNAGNon/c01ZvBI5iKjlAVdmjy+Q==
X-Received: by 2002:a17:90a:e612:: with SMTP id
 j18mr2401591pjy.163.1632191142677; 
 Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] hw/core: Make do_unaligned_access noreturn
Date: Mon, 20 Sep 2021 19:25:33 -0700
Message-Id: <20210921022534.365291-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we may have had some thought of allowing system-mode
to return from this hook, we have no guests that require this.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h  | 3 ++-
 target/alpha/cpu.h             | 4 ++--
 target/arm/internals.h         | 2 +-
 target/microblaze/cpu.h        | 2 +-
 target/mips/tcg/tcg-internal.h | 4 ++--
 target/nios2/cpu.h             | 4 ++--
 target/ppc/internal.h          | 4 ++--
 target/riscv/cpu.h             | 2 +-
 target/s390x/s390x-internal.h  | 4 ++--
 target/sh4/cpu.h               | 4 ++--
 target/xtensa/cpu.h            | 4 ++--
 target/hppa/cpu.c              | 7 ++++---
 12 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 55123cb4d2..6cbe17f2e6 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -78,10 +78,11 @@ struct TCGCPUOps {
                                   MemTxResult response, uintptr_t retaddr);
     /**
      * @do_unaligned_access: Callback for unaligned access handling
+     * The callback must exit via raising an exception.
      */
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index ce9ec32199..772828cc26 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -283,8 +283,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_list alpha_cpu_list
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd2ea8a388..8a77929793 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -594,7 +594,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr);
+                                 int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 13ed3cd4dd..b7a848bbae 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -361,7 +361,7 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
 #endif /* !CONFIG_USER_ONLY */
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index c7a77ddccd..bad3deb611 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -22,8 +22,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
-                                  int mmu_idx, uintptr_t retaddr);
+                                  MMUAccessType access_type, int mmu_idx,
+                                  uintptr_t retaddr) QEMU_NORETURN;
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 88a511209c..a80587338a 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -197,8 +197,8 @@ void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 void do_nios2_semihosting(CPUNios2State *env);
 
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index b71406fa46..55284369f5 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -213,8 +213,8 @@ void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
 
 /* Raise a data fault alignment exception for the specified virtual address */
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr);
+                                 MMUAccessType access_type, int mmu_idx,
+                                 uintptr_t retaddr) QEMU_NORETURN;
 
 /* translate.c */
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 465142616a..5896aca346 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -344,7 +344,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr);
+                                    uintptr_t retaddr) QEMU_NORETURN;
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 7a6aa4dacc..27d4a03ca1 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -274,8 +274,8 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 
 /* fpu_helper.c */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 56f7c32df9..dc81406646 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -209,8 +209,8 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 646965f379..f9a510ca46 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -581,8 +581,8 @@ void xtensa_count_regs(const XtensaConfig *config,
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_list xtensa_cpu_list
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bf..89cba9d7a2 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -72,9 +72,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                         MMUAccessType access_type,
-                                         int mmu_idx, uintptr_t retaddr)
+static void QEMU_NORETURN
+hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                             MMUAccessType access_type, int mmu_idx,
+                             uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
-- 
2.25.1


