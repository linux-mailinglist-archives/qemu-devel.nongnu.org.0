Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECA4AFFE5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:08:41 +0100 (CET)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv8i-0002HY-Lg
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuws-0006Iu-5V
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:26 -0500
Received: from [2607:f8b0:4864:20::42a] (port=40920
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwp-0008GY-Cc
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:25 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a39so5903891pfx.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKDZ8g8TLZwW+GhKyikzej7WGz3fO5Ix9rFf9r1R7p0=;
 b=T75xsSwQEH7IfbXQop5/xp8uDHx1vEe+8cbJdt2YXyxfLbjps/yjdXrwx3Aa4Qx9kp
 3AtPKe6rFD+rhG9j97HSw/cCRWixS4uPTRz0FsTR9UmlmIVcCtQpwFFhBx3k+mJvbfyd
 idINYOi7w+9G0A+Dy1wB7ICDk+smGtdEdpCwbuqovtco5bADm4e/dmkSqIqInFhmQC4J
 coDUCtBlqRRqzg8JFgPpHVBh+4gx//ER5N7eaNYoXFPOU8rKvG195UDW0WuNyoU7OLQK
 5Mn3EIHEHbf9M0CmvdvQVP2laDSS2iA02GH5yAdKrk+Wg3jpKqWccKMP47g8OAI0hbis
 fhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pKDZ8g8TLZwW+GhKyikzej7WGz3fO5Ix9rFf9r1R7p0=;
 b=AeXgOJLrjDR+33odgSvmRUWHHZkg6vZCezbfts8ew0MwVEhaRK5+OWZytxB6n+q7V9
 ujq5r0Guz3OPUpN3CNFRT1caeYWNW6X+vhy8R04SCVefdA/3D75RXjKQlG90AOkj9pi1
 0UkD+hudVg29TsCv7I4yIqWd7yRQLIn6/aVLH+nGATapRsqaa2yjvASmamXNIT0K68Rv
 Kcaanv0gO+3buxMqNbJYvInR2d+B1/0I/UZesLTKtJ2nPmq64TOyBUHreRbP8iS4mWiW
 jrBiY4G8ctJTIglAF6ZMmtuG3GRkfL9Et2Hnm5vdMWtl4AkcYIs63Kk8aqUh/6+UUpu0
 P2AA==
X-Gm-Message-State: AOAM532sj0FvoFT4T5saaK2A6twBQL0JXVItgizwECeFqfFhlhhzPaAu
 aDfLKrMV5cw7HwUkoNhOhNwYDgP0R10=
X-Google-Smtp-Source: ABdhPJzxpkvIiuyMu4EzzlEYOUoYcTqVW3YmxWWxIeEVFzWfS0317afbB49LJbMksuorAODY4q8lJg==
X-Received: by 2002:a05:6a00:174c:: with SMTP id
 j12mr4379979pfc.64.1644443781383; 
 Wed, 09 Feb 2022 13:56:21 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mq3sm7630407pjb.4.2022.02.09.13.56.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Date: Wed,  9 Feb 2022 22:54:42 +0100
Message-Id: <20220209215446.58402-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

ArchCPU is our interface with target-specific code. Use it as
a forward-declared opaque pointer (abstract type), having its
structure defined by each target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/typedefs.h     |  1 +
 target/alpha/cpu-qom.h      |  4 +++-
 target/alpha/cpu.h          |  4 +---
 target/arm/cpu-qom.h        |  4 +++-
 target/arm/cpu.h            |  2 --
 target/avr/cpu-qom.h        |  4 +++-
 target/avr/cpu.h            |  6 ++----
 target/cris/cpu-qom.h       |  4 +++-
 target/cris/cpu.h           |  4 +---
 target/hexagon/cpu.h        |  2 +-
 target/hppa/cpu-qom.h       |  4 +++-
 target/hppa/cpu.h           |  4 +---
 target/i386/cpu-qom.h       |  4 +++-
 target/i386/cpu.h           |  4 +---
 target/m68k/cpu-qom.h       |  4 +++-
 target/m68k/cpu.h           |  4 +---
 target/microblaze/cpu-qom.h |  4 +++-
 target/microblaze/cpu.h     |  6 +++---
 target/mips/cpu-qom.h       |  4 +++-
 target/mips/cpu.h           |  4 +---
 target/nios2/cpu.h          |  4 ++--
 target/openrisc/cpu.h       | 11 ++++-------
 target/ppc/cpu-qom.h        |  4 +++-
 target/ppc/cpu.h            |  4 +---
 target/riscv/cpu.h          |  5 ++---
 target/rx/cpu-qom.h         |  4 +++-
 target/rx/cpu.h             |  4 +---
 target/s390x/cpu-qom.h      |  4 +++-
 target/s390x/cpu.h          |  4 +---
 target/sh4/cpu-qom.h        |  4 +++-
 target/sh4/cpu.h            |  4 +---
 target/sparc/cpu-qom.h      |  4 +++-
 target/sparc/cpu.h          |  4 +---
 target/tricore/cpu-qom.h    |  4 +++-
 target/tricore/cpu.h        |  4 +---
 target/xtensa/cpu-qom.h     |  4 +++-
 target/xtensa/cpu.h         |  4 +---
 37 files changed, 76 insertions(+), 77 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c6f692b0dd..c564f54c11 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -26,6 +26,7 @@ typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
 typedef struct Aml Aml;
 typedef struct AnnounceTimer AnnounceTimer;
+typedef struct ArchCPU ArchCPU;
 typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
 typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
 typedef struct BlockBackend BlockBackend;
diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 7bb9173c57..6fd2dec1a7 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_ALPHA_CPU "alpha-cpu"
 
-OBJECT_DECLARE_TYPE(AlphaCPU, AlphaCPUClass,
+typedef struct ArchCPU AlphaCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, AlphaCPUClass,
                     ALPHA_CPU)
 
 /**
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index cfd17fd265..58f00b7814 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -257,7 +257,7 @@ typedef struct CPUArchState {
  *
  * An Alpha CPU.
  */
-struct AlphaCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -283,8 +283,6 @@ int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 #define cpu_list alpha_cpu_list
 
-typedef AlphaCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 enum {
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index a22bd506d0..b0a0724e8c 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -27,7 +27,9 @@ struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
 
-OBJECT_DECLARE_TYPE(ARMCPU, ARMCPUClass,
+typedef struct ArchCPU ARMCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, ARMCPUClass,
                     ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a95a070647..a137c564c4 100644
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
index 14e5b3ce72..e212cac0b5 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -26,7 +26,9 @@
 
 #define TYPE_AVR_CPU "avr-cpu"
 
-OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
+typedef struct ArchCPU AVRCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, AVRCPUClass,
                     AVR_CPU)
 
 /**
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index e4a990556b..55497f851d 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -143,14 +143,14 @@ typedef struct CPUArchState {
  *
  *  A AVR CPU.
  */
-typedef struct AVRCPU {
+struct ArchCPU {
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
index 2596edc7e3..89f1116020 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_CRIS_CPU "cris-cpu"
 
-OBJECT_DECLARE_TYPE(CRISCPU, CRISCPUClass,
+typedef struct ArchCPU CRISCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, CRISCPUClass,
                     CRIS_CPU)
 
 /**
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 763d4f882e..e6776f25b1 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -173,7 +173,7 @@ typedef struct CPUArchState {
  *
  * A CRIS CPU.
  */
-struct CRISCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -265,8 +265,6 @@ static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)
 #define SFR_RW_MM_TLB_LO   env->pregs[PR_SRS]][5
 #define SFR_RW_MM_TLB_HI   env->pregs[PR_SRS]][6
 
-typedef CRISCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUCRISState *env, target_ulong *pc,
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 25c67e43a2..4dce40a360 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -143,7 +143,7 @@ typedef struct HexagonCPUClass {
     DeviceReset parent_reset;
 } HexagonCPUClass;
 
-typedef struct HexagonCPU {
+typedef struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index d424f88370..c846c18304 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_HPPA_CPU "hppa-cpu"
 
-OBJECT_DECLARE_TYPE(HPPACPU, HPPACPUClass,
+typedef struct ArchCPU HPPACPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, HPPACPUClass,
                     HPPA_CPU)
 
 /**
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index d36e5c170c..4cc936b6bf 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -213,7 +213,7 @@ typedef struct CPUArchState {
  *
  * An HPPA CPU.
  */
-struct HPPACPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -223,8 +223,6 @@ struct HPPACPU {
     QEMUTimer *alarm_timer;
 };
 
-typedef HPPACPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline int cpu_mmu_index(CPUHPPAState *env, bool ifetch)
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index f9923cee04..db33cf6762 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -30,7 +30,9 @@
 #define TYPE_X86_CPU "i386-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(X86CPU, X86CPUClass,
+typedef struct ArchCPU X86CPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, X86CPUClass,
                     X86_CPU)
 
 typedef struct X86CPUModel X86CPUModel;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 31ae748570..b5d1ff5956 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1705,7 +1705,7 @@ struct kvm_msrs;
  *
  * An x86 CPU.
  */
-struct X86CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -2072,8 +2072,6 @@ static inline int cpu_mmu_index_kernel(CPUX86State *env)
 #define CC_SRC2 (env->cc_src2)
 #define CC_OP   (env->cc_op)
 
-typedef X86CPU ArchCPU;
-
 #include "exec/cpu-all.h"
 #include "svm.h"
 
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 1ceb160ecb..c2c0736b3b 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
-OBJECT_DECLARE_TYPE(M68kCPU, M68kCPUClass,
+typedef struct ArchCPU M68kCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, M68kCPUClass,
                     M68K_CPU)
 
 /*
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 0245398230..872e8ce637 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -156,7 +156,7 @@ typedef struct CPUArchState {
  *
  * A Motorola 68k CPU.
  */
-struct M68kCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -574,8 +574,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
 
-typedef M68kCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* TB flags */
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index e520eefb12..8f11fe4d73 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
 
-OBJECT_DECLARE_TYPE(MicroBlazeCPU, MicroBlazeCPUClass,
+typedef struct ArchCPU MicroBlazeCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, MicroBlazeCPUClass,
                     MICROBLAZE_CPU)
 
 /**
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index acfd35d3f7..d511b6b877 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -25,6 +25,8 @@
 #include "fpu/softfloat-types.h"
 
 typedef struct CPUArchState CPUMBState;
+typedef struct ArchCPU MicroBlazeCPU;
+
 #if !defined(CONFIG_USER_ONLY)
 #include "mmu.h"
 #endif
@@ -339,7 +341,7 @@ typedef struct {
  *
  * A MicroBlaze CPU.
  */
-struct MicroBlazeCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
 
@@ -394,8 +396,6 @@ void mb_tcg_init(void);
 #define MMU_USER_IDX    2
 /* See NB_MMU_MODES further up the file.  */
 
-typedef MicroBlazeCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* Ensure there is no overlap between the two masks. */
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index dda0c911fa..41f3d01a80 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -29,7 +29,9 @@
 #define TYPE_MIPS_CPU "mips-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(MIPSCPU, MIPSCPUClass,
+typedef struct ArchCPU MIPSCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, MIPSCPUClass,
                     MIPS_CPU)
 
 /**
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index d4f5d7099a..09e98f64de 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1171,7 +1171,7 @@ typedef struct CPUArchState {
  *
  * A MIPS CPU.
  */
-struct MIPSCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -1217,8 +1217,6 @@ static inline int cpu_mmu_index(CPUMIPSState *env, bool ifetch)
     return hflags_mmu_index(env->hflags);
 }
 
-typedef MIPSCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* Exceptions */
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 629b9e2301..05def159b1 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -32,7 +32,7 @@ typedef struct CPUArchState CPUNios2State;
 
 #define TYPE_NIOS2_CPU "nios2-cpu"
 
-OBJECT_DECLARE_TYPE(Nios2CPU, Nios2CPUClass,
+OBJECT_DECLARE_TYPE(ArchCPU, Nios2CPUClass,
                     NIOS2_CPU)
 
 /**
@@ -171,7 +171,7 @@ struct CPUArchState {
  *
  * A Nios2 CPU.
  */
-struct Nios2CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index a218e49f0e..9111b050ad 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -24,12 +24,11 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
-/* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
-struct OpenRISCCPU;
-
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
-OBJECT_DECLARE_TYPE(OpenRISCCPU, OpenRISCCPUClass,
+typedef struct ArchCPU OpenRISCCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, OpenRISCCPUClass,
                     OPENRISC_CPU)
 
 /**
@@ -301,7 +300,7 @@ typedef struct CPUArchState {
  *
  * A OpenRISC CPU.
  */
-struct OpenRISCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -348,8 +347,6 @@ void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
-typedef OpenRISCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #define TB_FLAGS_SM    SR_SM
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 87ea91ef9c..48671b13ac 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -29,7 +29,9 @@
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(PowerPCCPU, PowerPCCPUClass,
+typedef struct ArchCPU PowerPCCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, PowerPCCPUClass,
                     POWERPC_CPU)
 
 typedef struct CPUArchState CPUPPCState;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 55ae99e1b8..86f021c45d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1278,7 +1278,7 @@ typedef struct PPCVirtualHypervisorClass PPCVirtualHypervisorClass;
  *
  * A PowerPC CPU.
  */
-struct PowerPCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -1476,8 +1476,6 @@ void ppc_compat_add_property(Object *obj, const char *name,
                              uint32_t *compat_pvr, const char *basedesc);
 #endif /* defined(TARGET_PPC64) */
 
-typedef PowerPCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /*****************************************************************************/
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 79144ddc24..5981be47d9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -285,7 +285,7 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
+OBJECT_DECLARE_TYPE(ArchCPU, RISCVCPUClass,
                     RISCV_CPU)
 
 /**
@@ -309,7 +309,7 @@ struct RISCVCPUClass {
  *
  * A RISCV CPU.
  */
-struct RISCVCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -430,7 +430,6 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
-typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index f918c46b00..09b59f8e1d 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -26,7 +26,9 @@
 
 #define TYPE_RX62N_CPU RX_CPU_TYPE_NAME("rx62n")
 
-OBJECT_DECLARE_TYPE(RXCPU, RXCPUClass,
+typedef struct ArchCPU RXCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, RXCPUClass,
                     RX_CPU)
 
 /*
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0f3d9d5bd9..b4abd90ccd 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -105,7 +105,7 @@ typedef struct CPUArchState {
  *
  * A RX CPU
  */
-struct RXCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -114,8 +114,6 @@ struct RXCPU {
     CPURXState env;
 };
 
-typedef RXCPU ArchCPU;
-
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 04d5b3012c..fe126e6b1d 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -25,7 +25,9 @@
 
 #define TYPE_S390_CPU "s390x-cpu"
 
-OBJECT_DECLARE_TYPE(S390CPU, S390CPUClass,
+typedef struct ArchCPU S390CPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, S390CPUClass,
                     S390_CPU)
 
 typedef struct S390CPUModel S390CPUModel;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index b668c1b0c7..c49c8466e7 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -163,7 +163,7 @@ static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
  *
  * An S/390 CPU.
  */
-struct S390CPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -840,8 +840,6 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env);
 /* outside of target/s390x/ */
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
 
-typedef S390CPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #endif
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 8903b4b9c7..64be55a924 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -29,7 +29,9 @@
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
 #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
 
-OBJECT_DECLARE_TYPE(SuperHCPU, SuperHCPUClass,
+typedef struct ArchCPU SuperHCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, SuperHCPUClass,
                     SUPERH_CPU)
 
 /**
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 9a89d2d038..c72a30edfd 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -195,7 +195,7 @@ typedef struct CPUArchState {
  *
  * A SuperH CPU.
  */
-struct SuperHCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -264,8 +264,6 @@ static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
     }
 }
 
-typedef SuperHCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 /* MMU control register */
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index f33949aaee..d5f90cffd4 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -29,7 +29,9 @@
 #define TYPE_SPARC_CPU "sparc-cpu"
 #endif
 
-OBJECT_DECLARE_TYPE(SPARCCPU, SPARCCPUClass,
+typedef struct ArchCPU SPARCCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, SPARCCPUClass,
                     SPARC_CPU)
 
 typedef struct sparc_def_t sparc_def_t;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 938efb72bf..abb38db674 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -556,7 +556,7 @@ struct CPUArchState {
  *
  * A SPARC CPU.
  */
-struct SPARCCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -743,8 +743,6 @@ static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
 #endif
 }
 
-typedef SPARCCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 #ifdef TARGET_SPARC64
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 59bfd01bbc..8259595fe5 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -24,7 +24,9 @@
 
 #define TYPE_TRICORE_CPU "tricore-cpu"
 
-OBJECT_DECLARE_TYPE(TriCoreCPU, TriCoreCPUClass,
+typedef struct ArchCPU TriCoreCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, TriCoreCPUClass,
                     TRICORE_CPU)
 
 struct TriCoreCPUClass {
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 398d5076be..108d6b8288 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -196,7 +196,7 @@ typedef struct CPUArchState {
  *
  * A TriCore CPU.
  */
-struct TriCoreCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -368,8 +368,6 @@ static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
     return 0;
 }
 
-typedef TriCoreCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 void cpu_state_reset(CPUTriCoreState *s);
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 41d9859673..c4ee073fc6 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -34,7 +34,9 @@
 
 #define TYPE_XTENSA_CPU "xtensa-cpu"
 
-OBJECT_DECLARE_TYPE(XtensaCPU, XtensaCPUClass,
+typedef struct ArchCPU XtensaCPU;
+
+OBJECT_DECLARE_TYPE(ArchCPU, XtensaCPUClass,
                     XTENSA_CPU)
 
 typedef struct XtensaConfig XtensaConfig;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 4496325970..4515f682aa 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -553,7 +553,7 @@ struct CPUArchState {
  *
  * An Xtensa CPU.
  */
-struct XtensaCPU {
+struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -722,8 +722,6 @@ static inline int cpu_mmu_index(CPUXtensaState *env, bool ifetch)
 #define XTENSA_CSBASE_LBEG_OFF_MASK 0x00ff0000
 #define XTENSA_CSBASE_LBEG_OFF_SHIFT 16
 
-typedef XtensaCPU ArchCPU;
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
-- 
2.34.1


