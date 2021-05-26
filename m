Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C439239C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:11:34 +0200 (CEST)
Received: from localhost ([::1]:53326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3cb-0000kN-Fz
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FY-000668-FQ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:44 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FQ-0004cd-0v
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:44 -0400
Received: by mail-pf1-x436.google.com with SMTP id p39so2206839pfw.8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A904/5E6IstmbNT+iW+VVwsm0qipUns0qSF2YCFkFvk=;
 b=K1TosUuC/GFFT8wPU0VgtwVTru6tCCDRtSLFlLnxOf46f2wyu5MeTR1em9V2CUGxbc
 0b0YjDoptmksoDmdTcwh+YvZSCENrkW1cwDscXfF3OJPomUTYkVZnNqqaWn0Ds4o4hAR
 OUs37yIAUxvwiSGN0iTydt9pnlB2/BWa9tQV5Y3f7NE/kh1hZCCZyeUXWWX71Rdrbw4s
 YFQI2FKF87BuetCbHRmbDbW8KoqG/N+Jeu0VK81ZjEPxAp+pkYgMTw2Ma90uF2aS5tky
 qgqWxHsDWN9jX9N5qTFyY2/qBIXegibfhUrMC5rkJ6J51rmEYJmyqL1j5oyNoRXWIWn0
 GzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A904/5E6IstmbNT+iW+VVwsm0qipUns0qSF2YCFkFvk=;
 b=MPuv6zUXQCBCMvC/A08ckZV7RDigxVg4j17PTvuB0O2+4HRT81m8ZzGQbznlop0EjB
 2KFPnu5qF55nCbuxDPKpoFADu3UOWqc15bsY8AAQ2gVqEaB0+/2daR+JMY1Oe1aEYaVh
 JO8z8HzjvsIkCFR0wAs/1yWSaGW4vuokxJTPfsFjgzyPzXb1g1fRspwmShq3JuQRpFbm
 Rxs4553//v7UotP7WfCX5a9LnVo0Kqi/WQEwtVrzb4Wtc+5esSIGkZ+AGYcuKO9aQ4fc
 MGHIFzF7olmWJkdwDdY7E0dJaf06KDH2PwIUYLDeVhQ+iBG0CVufoL6DkqU+O4jzMySq
 FPFw==
X-Gm-Message-State: AOAM532mFbAXhPtCbIdabKEeintt8F4kN/2mBO+gkqzo13b6U+C15iu9
 VoRqpWy1mvgGF+CPksV4CQuwKvSXUEeAxQ==
X-Google-Smtp-Source: ABdhPJyAluR+gNw2+3DKB45NAy4vlRDl8HtlwTxIeh2dM/l5KX65ZUWu1uPglRiaSdMJc7KUZglvFQ==
X-Received: by 2002:a62:8705:0:b029:2d9:5420:a1b5 with SMTP id
 i5-20020a6287050000b02902d95420a1b5mr904462pfe.45.1622072854551; 
 Wed, 26 May 2021 16:47:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:06 -0700
Message-Id: <20210526234710.125396-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-21-f4bug@amsat.org>
[rth: Drop declaration movement from target/*/cpu.h]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            |  8 --------
 include/hw/core/sysemu-cpu-ops.h | 13 +++++++++++++
 hw/core/cpu-sysemu.c             |  6 +++---
 target/alpha/cpu.c               |  2 +-
 target/arm/cpu.c                 |  2 +-
 target/avr/cpu.c                 |  2 +-
 target/cris/cpu.c                |  2 +-
 target/hppa/cpu.c                |  2 +-
 target/i386/cpu.c                |  2 +-
 target/m68k/cpu.c                |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/mips/cpu.c                |  2 +-
 target/nios2/cpu.c               |  2 +-
 target/openrisc/cpu.c            |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/riscv/cpu.c               |  2 +-
 target/rx/cpu.c                  |  2 +-
 target/s390x/cpu.c               |  2 +-
 target/sh4/cpu.c                 |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/tricore/cpu.c             |  2 +-
 target/xtensa/cpu.c              |  2 +-
 22 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index af6246c905..405d1f367f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -104,11 +104,6 @@ struct SysemuCPUOps;
  *       If the target behaviour here is anything other than "set
  *       the PC register to the value passed in" then the target must
  *       also implement the synchronize_from_tb hook.
- * @get_phys_page_debug: Callback for obtaining a physical address.
- * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
- *       associated memory transaction attributes to use for the access.
- *       CPUs which use memory transaction attributes should implement this
- *       instead of get_phys_page_debug.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -147,9 +142,6 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 8f8326e810..1f249e0f06 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,19 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_phys_page_debug: Callback for obtaining a physical address.
+     */
+    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    /**
+     * @get_phys_page_attrs_debug: Callback for obtaining a physical address
+     *       and the associated memory transaction attributes to use for the
+     *       access.
+     * CPUs which use memory transaction attributes should implement this
+     * instead of get_phys_page_debug.
+     */
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
     /**
      * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
      *       a memory access with the specified memory transaction attributes.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index ba53c2eaa8..b31c33ad2b 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -52,12 +52,12 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cc->sysemu_ops->get_phys_page_attrs_debug) {
+        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
+    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 0b12b2be81..7687d5a09a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -210,6 +210,7 @@ static void alpha_cpu_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps alpha_sysemu_ops = {
+    .get_phys_page_debug = alpha_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -243,7 +244,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
     cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 85666b765f..2d9b32ec92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1948,6 +1948,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
@@ -1993,7 +1994,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index b95caf8c0f..7551bca3a6 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -187,6 +187,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps avr_sysemu_ops = {
+    .get_phys_page_debug = avr_cpu_get_phys_page_debug,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -217,7 +218,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     dc->vmsd = &vms_avr_cpu;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index f1095fcf5c..9cb4f817b4 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -197,6 +197,7 @@ static void cris_cpu_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps cris_sysemu_ops = {
+    .get_phys_page_debug = cris_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -299,7 +300,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
     cc->sysemu_ops = &cris_sysemu_ops;
 #endif
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 870130b159..4018e3ad90 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -135,6 +135,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps hppa_sysemu_ops = {
+    .get_phys_page_debug = hppa_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -168,7 +169,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
     cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 45e7ded0ce..de212a939d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6718,6 +6718,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
@@ -6756,7 +6757,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
-    cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 97ef3ae31c..4238775d5e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -507,6 +507,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps m68k_sysemu_ops = {
+    .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -540,7 +541,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
-    cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
     cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 96f221ff71..8f88f2afb9 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -356,6 +356,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps mb_sysemu_ops = {
+    .get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug,
 };
 #endif
 
@@ -393,7 +394,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 7aa3f3ecf5..7275f64eab 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -525,6 +525,7 @@ static Property mips_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .get_phys_page_debug = mips_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_mips_cpu,
 };
 #endif
@@ -568,7 +569,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index cb04b04d24..afcd776746 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -211,6 +211,7 @@ static Property nios2_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps nios2_sysemu_ops = {
+    .get_phys_page_debug = nios2_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -244,7 +245,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
     cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 12d9173043..d8e80b81a2 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -178,6 +178,7 @@ static void openrisc_any_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps openrisc_sysemu_ops = {
+    .get_phys_page_debug = openrisc_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -210,7 +211,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
     cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 16d966696b..1afa29e338 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9267,6 +9267,7 @@ static Property ppc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
@@ -9315,7 +9316,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 80cee005a3..9775d8ca5c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -600,6 +600,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
     .legacy_vmsd = &vmstate_riscv_cpu,
@@ -647,7 +648,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->sysemu_ops = &riscv_sysemu_ops;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 98e6596158..e575669ad1 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -177,6 +177,7 @@ static void rx_cpu_init(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps rx_sysemu_ops = {
+    .get_phys_page_debug = rx_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -214,7 +215,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 #endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
-    cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 157ef61d38..bd5070c783 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_phys_page_debug = s390_cpu_get_phys_page_debug,
     .get_crash_info = s390_cpu_get_crash_info,
     .write_elf64_note = s390_cpu_write_elf64_note,
     .legacy_vmsd = &vmstate_s390_cpu,
@@ -525,7 +526,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 79aec898fa..1d5a715631 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -227,6 +227,7 @@ static const VMStateDescription vmstate_sh_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps sh4_sysemu_ops = {
+    .get_phys_page_debug = superh_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -263,7 +264,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
     cc->sysemu_ops = &sh4_sysemu_ops;
     dc->vmsd = &vmstate_sh_cpu;
 #endif
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ffe85a7f59..ff950fb307 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -852,6 +852,7 @@ static Property sparc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .get_phys_page_debug = sparc_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_sparc_cpu,
 };
 #endif
@@ -896,7 +897,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 7dc6aab66c..ff17d1cecd 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -145,6 +145,7 @@ static void tc27x_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps tricore_sysemu_ops = {
+    .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -175,7 +176,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a196530451..da4dbecdf1 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -184,6 +184,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps xtensa_sysemu_ops = {
+    .get_phys_page_debug = xtensa_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -222,7 +223,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &xtensa_sysemu_ops;
-    cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_xtensa_cpu;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-- 
2.25.1


