Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389B6738B6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:37:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8j-0006R7-H4; Thu, 19 Jan 2023 07:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8h-0006Nl-J5; Thu, 19 Jan 2023 07:35:31 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8f-0007c8-Gf; Thu, 19 Jan 2023 07:35:31 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXs6M99z4xN5;
 Thu, 19 Jan 2023 23:35:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXr0jV9z4xN1;
 Thu, 19 Jan 2023 23:35:23 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 08/25] hw/arm/boot: Export write_bootloader for Aspeed machines
Date: Thu, 19 Jan 2023 13:34:32 +0100
Message-Id: <20230119123449.531826-9-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

AST2600 Aspeed machines have an home made boot loader for secondaries.
To improve support, export the internal ARM boot loader and use it
instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
 hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
 hw/arm/boot.c         | 34 +++++++---------------------------
 3 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index f18cc3064f..23edd0d31b 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -183,4 +183,28 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
                                             hwaddr mvbar_addr);
 
+typedef enum {
+    FIXUP_NONE = 0,     /* do nothing */
+    FIXUP_TERMINATOR,   /* end of insns */
+    FIXUP_BOARDID,      /* overwrite with board ID number */
+    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
+    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
+    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
+    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
+    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
+    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
+    FIXUP_BOOTREG,      /* overwrite with boot register address */
+    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
+    FIXUP_MAX,
+} FixupType;
+
+typedef struct ARMInsnFixup {
+    uint32_t insn;
+    FixupType fixup;
+} ARMInsnFixup;
+
+void arm_write_bootloader(const char *name, hwaddr addr,
+                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                          AddressSpace *as);
+
 #endif /* HW_ARM_BOOT_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4919a1fe9e..c373bd2851 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -198,33 +198,35 @@ struct AspeedMachineState {
 static void aspeed_write_smpboot(ARMCPU *cpu,
                                  const struct arm_boot_info *info)
 {
-    static const uint32_t poll_mailbox_ready[] = {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+    static const ARMInsnFixup poll_mailbox_ready[] = {
         /*
          * r2 = per-cpu go sign value
          * r1 = AST_SMP_MBOX_FIELD_ENTRY
          * r0 = AST_SMP_MBOX_FIELD_GOSIGN
          */
-        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
-        0xe21000ff,  /* ands    r0, r0, #255          */
-        0xe59f201c,  /* ldr     r2, [pc, #28]         */
-        0xe1822000,  /* orr     r2, r2, r0            */
-
-        0xe59f1018,  /* ldr     r1, [pc, #24]         */
-        0xe59f0018,  /* ldr     r0, [pc, #24]         */
-
-        0xe320f002,  /* wfe                           */
-        0xe5904000,  /* ldr     r4, [r0]              */
-        0xe1520004,  /* cmp     r2, r4                */
-        0x1afffffb,  /* bne     <wfe>                 */
-        0xe591f000,  /* ldr     pc, [r1]              */
-        AST_SMP_MBOX_GOSIGN,
-        AST_SMP_MBOX_FIELD_ENTRY,
-        AST_SMP_MBOX_FIELD_GOSIGN,
+        { 0xee100fb0 },  /* mrc     p15, 0, r0, c0, c0, 5 */
+        { 0xe21000ff },  /* ands    r0, r0, #255          */
+        { 0xe59f201c },  /* ldr     r2, [pc, #28]         */
+        { 0xe1822000 },  /* orr     r2, r2, r0            */
+
+        { 0xe59f1018 },  /* ldr     r1, [pc, #24]         */
+        { 0xe59f0018 },  /* ldr     r0, [pc, #24]         */
+
+        { 0xe320f002 },  /* wfe                           */
+        { 0xe5904000 },  /* ldr     r4, [r0]              */
+        { 0xe1520004 },  /* cmp     r2, r4                */
+        { 0x1afffffb },  /* bne     <wfe>                 */
+        { 0xe591f000 },  /* ldr     pc, [r1]              */
+        { AST_SMP_MBOX_GOSIGN },
+        { AST_SMP_MBOX_FIELD_ENTRY },
+        { AST_SMP_MBOX_FIELD_GOSIGN },
+        { 0, FIXUP_TERMINATOR }
     };
+    uint32_t fixupcontext[FIXUP_MAX] = { 0 };
 
-    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
-                       sizeof(poll_mailbox_ready),
-                       info->smp_loader_start);
+    arm_write_bootloader("aspeed.smpboot", info->smp_loader_start,
+                         poll_mailbox_ready, fixupcontext, as);
 }
 
 static void aspeed_reset_secondary(ARMCPU *cpu,
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..ed6fd7c77f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -59,26 +59,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
     return cpu_get_address_space(cs, asidx);
 }
 
-typedef enum {
-    FIXUP_NONE = 0,     /* do nothing */
-    FIXUP_TERMINATOR,   /* end of insns */
-    FIXUP_BOARDID,      /* overwrite with board ID number */
-    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
-    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
-    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
-    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
-    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
-    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
-    FIXUP_BOOTREG,      /* overwrite with boot register address */
-    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
-    FIXUP_MAX,
-} FixupType;
-
-typedef struct ARMInsnFixup {
-    uint32_t insn;
-    FixupType fixup;
-} ARMInsnFixup;
-
 static const ARMInsnFixup bootloader_aarch64[] = {
     { 0x580000c0 }, /* ldr x0, arg ; Load the lower 32-bits of DTB */
     { 0xaa1f03e1 }, /* mov x1, xzr */
@@ -149,9 +129,9 @@ static const ARMInsnFixup smpboot[] = {
     { 0, FIXUP_TERMINATOR }
 };
 
-static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
-                             AddressSpace *as)
+void arm_write_bootloader(const char *name, hwaddr addr,
+                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                          AddressSpace *as)
 {
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -213,8 +193,8 @@ static void default_write_secondary(ARMCPU *cpu,
         fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
     }
 
-    write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext, as);
+    arm_write_bootloader("smpboot", info->smp_loader_start,
+                         smpboot, fixupcontext, as);
 }
 
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
@@ -1173,8 +1153,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext, as);
+        arm_write_bootloader("bootloader", info->loader_start,
+                             primary_loader, fixupcontext, as);
 
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
-- 
2.39.0


