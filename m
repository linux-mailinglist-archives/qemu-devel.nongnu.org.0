Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F314CEBC8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:39:40 +0100 (CET)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr6o-00015I-IX
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqX7-000365-DV
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:45 -0500
Received: from [2a00:1450:4864:20::434] (port=35662
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqX4-0004Ie-Uo
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id b5so19360364wrr.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmPUCkhJtxQtyev0yq8DhJ5CCuN/hIFd3qPiS8iTNZM=;
 b=B+9y8/3nz44vPRV7TzbzZ8ZAY5Ac/OcdMvXGoZ4n5HpyqaPipSnzNzO8gDZhx9M070
 Ys+hlNwZBn6oMbXlBMxfa4WpT92d7jE3kd1GcCR/lylJ+i2QKLPhYF8V1Qu7zIktOWV6
 iMfG6mjeDDV53T159k4gLr4clrZvTuWGdfOs6LQmeVI1orPXEksPS1TyXgtObMZh2xek
 o260HnonQDDTedwQV+oUbc1o2e5ONsEpyPXsUDHjW43SdBKTiK8+IAFne7AZxwy5QXT9
 XMcf8GqGcmGrMopr70zg3dt2RtMy6ornGcZKj3qRxd13r2Ps9Ll7PDJZf1THGmOwsnJw
 htQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmPUCkhJtxQtyev0yq8DhJ5CCuN/hIFd3qPiS8iTNZM=;
 b=z2bjCb+b2+N16JWw85xcwv8O2fH8gHilUrq/98DaCZXRv6ELAtP7TnERYVlcKyiP7m
 KehAAQtgIMzsifZW9uiJhQIhhFyOUmJmCSs6AdIVR3eakqdHmdG86sHWZl4EEXFGqIj9
 T/CtKxY4SveWLQxrNLb7sur228P2sg74HjodnP+Kdff4fFOy0/T+q0+713EGNVTt0ESy
 M5AQGB0gDDuaRftOPstvY7/0GNpsI7DmVy2lB98y5JyP0E2AY8xtIcixVujhNsQIeZCp
 l86QSlEe9Agd0KFxsrTDtbav7MJ+WQH03q8n1IwM6OP8Eu0MYz/MbnZxsibQzC1jBMw1
 ZeqA==
X-Gm-Message-State: AOAM532VtlDjMObnC/lkEFy6tfi71AAXoRLyIE3chn169LrgBy5+N9GK
 D3mSG6rvrduUMqBziXcZ27jDCUBVf1w=
X-Google-Smtp-Source: ABdhPJyi7+hZCrd6BRua7bfCnDFn7DjlXEyeS53aTIWnQSqzviwlCOJxGveIc6M95RB0zkcbv2Dlgw==
X-Received: by 2002:adf:f904:0:b0:1f1:dfd6:723e with SMTP id
 b4-20020adff904000000b001f1dfd6723emr4634455wrr.83.1646571759790; 
 Sun, 06 Mar 2022 05:02:39 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b00389a4eb251esm663803wmq.32.2022.03.06.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] target: Introduce and use OBJECT_DECLARE_CPU_TYPE() macro
Date: Sun,  6 Mar 2022 13:59:57 +0100
Message-Id: <20220306130000.8104-31-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace the boilerplate code to declare CPU QOM types
and macros, and forward-declare the CPU instance type.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-14-f4bug@amsat.org>
---
 include/hw/core/cpu.h       | 18 ++++++++++++++++++
 target/alpha/cpu-qom.h      |  3 +--
 target/alpha/cpu.h          |  2 --
 target/arm/cpu-qom.h        |  3 +--
 target/arm/cpu.h            |  2 --
 target/avr/cpu-qom.h        |  3 +--
 target/avr/cpu.h            |  6 ++----
 target/cris/cpu-qom.h       |  3 +--
 target/cris/cpu.h           |  2 --
 target/hexagon/cpu.h        |  6 +++---
 target/hppa/cpu-qom.h       |  3 +--
 target/hppa/cpu.h           |  2 --
 target/i386/cpu-qom.h       |  3 +--
 target/i386/cpu.h           |  2 --
 target/m68k/cpu-qom.h       |  3 +--
 target/m68k/cpu.h           |  2 --
 target/microblaze/cpu-qom.h |  3 +--
 target/microblaze/cpu.h     |  2 --
 target/mips/cpu-qom.h       |  3 +--
 target/mips/cpu.h           |  2 --
 target/nios2/cpu.h          |  3 +--
 target/openrisc/cpu.h       |  8 +-------
 target/ppc/cpu-qom.h        |  3 +--
 target/ppc/cpu.h            |  2 --
 target/riscv/cpu.h          |  4 +---
 target/rx/cpu-qom.h         |  3 +--
 target/rx/cpu.h             |  2 --
 target/s390x/cpu-qom.h      |  3 +--
 target/s390x/cpu.h          |  2 --
 target/sh4/cpu-qom.h        |  3 +--
 target/sh4/cpu.h            |  2 --
 target/sparc/cpu-qom.h      |  3 +--
 target/sparc/cpu.h          |  2 --
 target/tricore/cpu-qom.h    |  3 +--
 target/tricore/cpu.h        |  2 --
 target/xtensa/cpu-qom.h     |  3 +--
 target/xtensa/cpu.h         |  2 --
 37 files changed, 42 insertions(+), 81 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c9d41e4ece5..2a0893b1dc7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -55,6 +55,24 @@ typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                        TYPE_CPU)
 
+/**
+ * OBJECT_DECLARE_CPU_TYPE:
+ * @CpuInstanceType: instance struct name
+ * @CpuClassType: class struct name
+ * @CPU_MODULE_OBJ_NAME: the CPU name in uppercase with underscore separators
+ *
+ * This macro is typically used in "cpu-qom.h" header file, and will:
+ *
+ *   - create the typedefs for the CPU object and class structs
+ *   - register the type for use with g_autoptr
+ *   - provide three standard type cast functions
+ *
+ * The object struct and class struct need to be declared manually.
+ */
+#define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
+    OBJECT_DECLARE_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME); \
+    typedef CpuInstanceType ArchCPU;
+
 typedef enum MMUAccessType {
     MMU_DATA_LOAD  = 0,
     MMU_DATA_STORE = 1,
diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 7bb9173c57f..1f200724b67 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_ALPHA_CPU "alpha-cpu"
 
-OBJECT_DECLARE_TYPE(AlphaCPU, AlphaCPUClass,
-                    ALPHA_CPU)
+OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
 
 /**
  * AlphaCPUClass:
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index cfd17fd265a..84430aff421 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -283,8 +283,6 @@ int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 #define cpu_list alpha_cpu_list
 
-typedef AlphaCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 enum {
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index a22bd506d07..64c44cef2dd 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -27,8 +27,7 @@ struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
 
-OBJECT_DECLARE_TYPE(ARMCPU, ARMCPUClass,
-                    ARM_CPU)
+OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fe55ca80be4..af89509f5a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3410,8 +3410,6 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
     }
 }
 
-typedef ARMCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /*
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 14e5b3ce72f..32a1c762e64 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -26,8 +26,7 @@
 
 #define TYPE_AVR_CPU "avr-cpu"
 
-OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
-                    AVR_CPU)
+OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 
 /**
  *  AVRCPUClass:
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index e4a990556b3..a833799fc14 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -143,14 +143,14 @@ typedef struct CPUArchState {
  *
  *  A AVR CPU.
  */
-typedef struct AVRCPU {
+struct AVRCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUAVRState env;
-} AVRCPU;
+};
 
 extern const struct VMStateDescription vms_avr_cpu;
 
@@ -245,8 +245,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
 
-typedef AVRCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #endif /* !defined (QEMU_AVR_CPU_H) */
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index 2596edc7e31..71e8af0e70a 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_CRIS_CPU "cris-cpu"
 
-OBJECT_DECLARE_TYPE(CRISCPU, CRISCPUClass,
-                    CRIS_CPU)
+OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
 
 /**
  * CRISCPUClass:
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 763d4f882ef..af7121bba06 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -265,8 +265,6 @@ static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)
 #define SFR_RW_MM_TLB_LO   env->pregs[PR_SRS]][5
 #define SFR_RW_MM_TLB_HI   env->pregs[PR_SRS]][6
 
-typedef CRISCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUCRISState *env, target_ulong *pc,
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index a65bd935c3f..8db0aa542d6 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -130,7 +130,7 @@ typedef struct CPUArchState {
     VTCMStoreLog vtcm_log;
 } CPUHexagonState;
 
-OBJECT_DECLARE_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
+OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
 
 typedef struct HexagonCPUClass {
     /*< private >*/
@@ -140,7 +140,7 @@ typedef struct HexagonCPUClass {
     DeviceReset parent_reset;
 } HexagonCPUClass;
 
-typedef struct HexagonCPU {
+struct HexagonCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -149,7 +149,7 @@ typedef struct HexagonCPU {
 
     bool lldb_compat;
     target_ulong lldb_stack_adjust;
-} HexagonCPU;
+};
 
 #include "cpu_bits.h"
 
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index d424f88370c..b96e0318c77 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_HPPA_CPU "hppa-cpu"
 
-OBJECT_DECLARE_TYPE(HPPACPU, HPPACPUClass,
-                    HPPA_CPU)
+OBJECT_DECLARE_CPU_TYPE(HPPACPU, HPPACPUClass, HPPA_CPU)
 
 /**
  * HPPACPUClass:
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index d36e5c170cd..73a3f323895 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -223,8 +223,6 @@ struct HPPACPU {
     QEMUTimer *alarm_timer;
 };
 
-typedef HPPACPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline int cpu_mmu_index(CPUHPPAState *env, bool ifetch)
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index f9923cee046..c557a522e1e 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -30,8 +30,7 @@
 #define TYPE_X86_CPU "i386-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(X86CPU, X86CPUClass,
-                    X86_CPU)
+OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 
 typedef struct X86CPUModel X86CPUModel;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5c2cf38cab9..d99e175e17c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2074,8 +2074,6 @@ static inline int cpu_mmu_index_kernel(CPUX86State *env)
 #define CC_SRC2 (env->cc_src2)
 #define CC_OP   (env->cc_op)
 
-typedef X86CPU ArchCPU;
-
 #include "exec/cpu-all.h"
 #include "svm.h"
 
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 1ceb160ecb0..cd9687192cd 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
-OBJECT_DECLARE_TYPE(M68kCPU, M68kCPUClass,
-                    M68K_CPU)
+OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 
 /*
  * M68kCPUClass:
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 02453982301..76a7cc70b4f 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -574,8 +574,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
 
-typedef M68kCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* TB flags */
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index e520eefb127..255b39a45df 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
 
-OBJECT_DECLARE_TYPE(MicroBlazeCPU, MicroBlazeCPUClass,
-                    MICROBLAZE_CPU)
+OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
 
 /**
  * MicroBlazeCPUClass:
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index acfd35d3f7f..6e4e90a41ed 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -394,8 +394,6 @@ void mb_tcg_init(void);
 #define MMU_USER_IDX    2
 /* See NB_MMU_MODES further up the file.  */
 
-typedef MicroBlazeCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* Ensure there is no overlap between the two masks. */
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index dda0c911fa7..e28b5296073 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -29,8 +29,7 @@
 #define TYPE_MIPS_CPU "mips-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(MIPSCPU, MIPSCPUClass,
-                    MIPS_CPU)
+OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 
 /**
  * MIPSCPUClass:
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index d4f5d7099af..c361408cc81 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1217,8 +1217,6 @@ static inline int cpu_mmu_index(CPUMIPSState *env, bool ifetch)
     return hflags_mmu_index(env->hflags);
 }
 
-typedef MIPSCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* Exceptions */
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a354ff4bea7..e07da73df0d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -32,8 +32,7 @@ typedef struct CPUArchState CPUNios2State;
 
 #define TYPE_NIOS2_CPU "nios2-cpu"
 
-OBJECT_DECLARE_TYPE(Nios2CPU, Nios2CPUClass,
-                    NIOS2_CPU)
+OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index a218e49f0e4..bcd28802e49 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -24,13 +24,9 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
-/* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
-struct OpenRISCCPU;
-
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
-OBJECT_DECLARE_TYPE(OpenRISCCPU, OpenRISCCPUClass,
-                    OPENRISC_CPU)
+OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 
 /**
  * OpenRISCCPUClass:
@@ -348,8 +344,6 @@ void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
-typedef OpenRISCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #define TB_FLAGS_SM    SR_SM
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 78b19a5cdb8..ad7e3c3db90 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -29,8 +29,7 @@
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(PowerPCCPU, PowerPCCPUClass,
-                    POWERPC_CPU)
+OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7be5ca2085e..03bba61c8b4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1477,8 +1477,6 @@ void ppc_compat_add_property(Object *obj, const char *name,
                              uint32_t *compat_pvr, const char *basedesc);
 #endif /* defined(TARGET_PPC64) */
 
-typedef PowerPCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /*****************************************************************************/
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c28cbe6868e..2810389fddb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -320,8 +320,7 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
-                    RISCV_CPU)
+OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
 /**
  * RISCVCPUClass:
@@ -499,7 +498,6 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
-typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index f918c46b003..4533759d966 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -26,8 +26,7 @@
 
 #define TYPE_RX62N_CPU RX_CPU_TYPE_NAME("rx62n")
 
-OBJECT_DECLARE_TYPE(RXCPU, RXCPUClass,
-                    RX_CPU)
+OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
 
 /*
  * RXCPUClass:
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0f3d9d5bd97..f81bf5b592a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -114,8 +114,6 @@ struct RXCPU {
     CPURXState env;
 };
 
-typedef RXCPU ArchCPU;
-
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 04d5b3012cd..00cae2b1311 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -25,8 +25,7 @@
 
 #define TYPE_S390_CPU "s390x-cpu"
 
-OBJECT_DECLARE_TYPE(S390CPU, S390CPUClass,
-                    S390_CPU)
+OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index b668c1b0c75..bdf3f7d4feb 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -840,8 +840,6 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env);
 /* outside of target/s390x/ */
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
 
-typedef S390CPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #endif
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 8903b4b9c7c..d4192d10908 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -29,8 +29,7 @@
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
 #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
 
-OBJECT_DECLARE_TYPE(SuperHCPU, SuperHCPUClass,
-                    SUPERH_CPU)
+OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
 
 /**
  * SuperHCPUClass:
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 9a89d2d038c..dd477ba5771 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -264,8 +264,6 @@ static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
     }
 }
 
-typedef SuperHCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* MMU control register */
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index f33949aaeec..86ed37d9333 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -29,8 +29,7 @@
 #define TYPE_SPARC_CPU "sparc-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(SPARCCPU, SPARCCPUClass,
-                    SPARC_CPU)
+OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
 
 typedef struct sparc_def_t sparc_def_t;
 /**
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 938efb72bf7..2a7fd47da3e 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -743,8 +743,6 @@ static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
 #endif
 }
 
-typedef SPARCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #ifdef TARGET_SPARC64
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 59bfd01bbcf..ee24e9fa76a 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -24,8 +24,7 @@
 
 #define TYPE_TRICORE_CPU "tricore-cpu"
 
-OBJECT_DECLARE_TYPE(TriCoreCPU, TriCoreCPUClass,
-                    TRICORE_CPU)
+OBJECT_DECLARE_CPU_TYPE(TriCoreCPU, TriCoreCPUClass, TRICORE_CPU)
 
 struct TriCoreCPUClass {
     /*< private >*/
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 398d5076be8..cd1954aa9ed 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -368,8 +368,6 @@ static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
     return 0;
 }
 
-typedef TriCoreCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 void cpu_state_reset(CPUTriCoreState *s);
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 41d98596734..4fc35ee49b8 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -34,8 +34,7 @@
 
 #define TYPE_XTENSA_CPU "xtensa-cpu"
 
-OBJECT_DECLARE_TYPE(XtensaCPU, XtensaCPUClass,
-                    XTENSA_CPU)
+OBJECT_DECLARE_CPU_TYPE(XtensaCPU, XtensaCPUClass, XTENSA_CPU)
 
 typedef struct XtensaConfig XtensaConfig;
 
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 44963259704..a361ab87859 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -722,8 +722,6 @@ static inline int cpu_mmu_index(CPUXtensaState *env, bool ifetch)
 #define XTENSA_CSBASE_LBEG_OFF_MASK 0x00ff0000
 #define XTENSA_CSBASE_LBEG_OFF_SHIFT 16
 
-typedef XtensaCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
-- 
2.35.1


