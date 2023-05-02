Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CD6F438A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:17:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov9-00045S-6l; Tue, 02 May 2023 08:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oR-Tc
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouY-0002zt-J2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so166353505e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029714; x=1685621714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sShQGlTtH7QC6fdnlv5owKwlCnFg1XQFOqO8T1sr/OY=;
 b=N8uv32FEZwq/m4wL4jvaiITJgG0qASzOScFCp54lsyu7zNhv9tudcaOHTnRuTMf1Bg
 rTMZANSXnwsq/JsW2y4qVwTh/AcO9UAhGd+xUZGXMzLXPLAF0oxsSiT+4i8ty7bgbG7J
 Gt+Z87llMBgA8c7aKjtiRR5aumPcy2s1uZ83N7AU4h3A/99FYg91Rtr7hpuZYsvbonwE
 3Mlm5nLq8mNYi/nhisMq5pisKEAxJgCWBvN3G/tuM2pUjWIx2PGKZ5Vb4YLfq+kQ9h/R
 1UDnpJOkYhBl+WEiRnQWIJ5AyIqlSc/gkSaKa3uGJZ7GQ1R7X1aQjw8aNmn2DgjNmzxn
 /p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029714; x=1685621714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sShQGlTtH7QC6fdnlv5owKwlCnFg1XQFOqO8T1sr/OY=;
 b=Y4/cHpDId9P9ZBOv/TBRFwGz/RmMlEBp+ZrT6r8YBdukYaIgW2AjxNwSpxXHREg3Tq
 /ME2Ql0m58Mu2yV6KxQNNKBjYCmVVX7w8UV/ZvKLyXKuMjy1rdFUQZJREnPmXdYI2jQC
 S2fWOyf48OJhDo12PBQtMNdhybNRoYNtEfx7fwwBOsRYs1gSXahEhJouNvZX8wmmWQu+
 dRfwOqMj74tu8Y/FRaINn60N6gQ5WaabLQhN404iJcKQOyA++uqdypLZ0Dhu5mxl8pFu
 m7L+7/+mlllCYifQJ0C45jIvjQBj4xwBs3Tg73Q+mC9/xTHIz2hmG/Lq4CgfzCir3Dn5
 7n+A==
X-Gm-Message-State: AC+VfDwA7czyujLR4jhqIFu0PqAK/LxOx4sqJU/Q0PYr5qj4rnwcFQI4
 /w3F3tllM5RFp82+4iU3Cxcbs5z53yjYfnwoyR0=
X-Google-Smtp-Source: ACHHUZ66IN4/VYrbt5mQpqjG9pCWIbKqUuyqQOddz1lemFDLfY5I9YBMBJHlaWnnD7h3Z4m98jhMvA==
X-Received: by 2002:a05:600c:4706:b0:3f3:284d:8cec with SMTP id
 v6-20020a05600c470600b003f3284d8cecmr10625530wmo.2.1683029713649; 
 Tue, 02 May 2023 05:15:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] hw/arm/boot: Make write_bootloader() public as
 arm_write_bootloader()
Date: Tue,  2 May 2023 13:14:52 +0100
Message-Id: <20230502121459.2422303-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

The arm boot.c code includes a utility function write_bootloader()
which assists in writing a boot-code fragment into guest memory,
including handling endianness and fixing it up with entry point
addresses and similar things.  This is useful not just for the boot.c
code but also in board model code, so rename it to
arm_write_bootloader() and make it globally visible.

Since we are making it public, make its API a little neater: move the
AddressSpace* argument to be next to the hwaddr argument, and allow
the fixupcontext array to be const, since we never modify it in this
function.

Cc: qemu-stable@nongnu.org
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230424152717.1333930-2-peter.maydell@linaro.org
[PMM: Split out from another patch by Cédric, added doc comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/boot.c         | 35 +++++++------------------------
 2 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index f18cc3064ff..80c492d7421 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -183,4 +183,53 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
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
+/**
+ * arm_write_bootloader - write a bootloader to guest memory
+ * @name: name of the bootloader blob
+ * @as: AddressSpace to write the bootloader
+ * @addr: guest address to write it
+ * @insns: the blob to be loaded
+ * @fixupcontext: context to be used for any fixups in @insns
+ *
+ * Write a bootloader to guest memory at address @addr in the address
+ * space @as. @name is the name to use for the resulting ROM blob, so
+ * it should be unique in the system and reasonably identifiable for debugging.
+ *
+ * @insns must be an array of ARMInsnFixup structs, each of which has
+ * one 32-bit value to be written to the guest memory, and a fixup to be
+ * applied to the value. FIXUP_NONE (do nothing) is value 0, so effectively
+ * the fixup is optional when writing a struct initializer.
+ * The final entry in the array must be { 0, FIXUP_TERMINATOR }.
+ *
+ * All other supported fixup types have the semantics "ignore insn
+ * and instead use the value from the array element @fixupcontext[fixup]".
+ * The caller should therefore provide @fixupcontext as an array of
+ * size FIXUP_MAX whose elements have been initialized for at least
+ * the entries that @insns refers to.
+ */
+void arm_write_bootloader(const char *name,
+                          AddressSpace *as, hwaddr addr,
+                          const ARMInsnFixup *insns,
+                          const uint32_t *fixupcontext);
+
 #endif /* HW_ARM_BOOT_H */
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 54f6a3e0b3c..720f22531a6 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -60,26 +60,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
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
@@ -150,9 +130,10 @@ static const ARMInsnFixup smpboot[] = {
     { 0, FIXUP_TERMINATOR }
 };
 
-static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
-                             AddressSpace *as)
+void arm_write_bootloader(const char *name,
+                          AddressSpace *as, hwaddr addr,
+                          const ARMInsnFixup *insns,
+                          const uint32_t *fixupcontext)
 {
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -214,8 +195,8 @@ static void default_write_secondary(ARMCPU *cpu,
         fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
     }
 
-    write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext, as);
+    arm_write_bootloader("smpboot", as, info->smp_loader_start,
+                         smpboot, fixupcontext);
 }
 
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
@@ -1186,8 +1167,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext, as);
+        arm_write_bootloader("bootloader", as, info->loader_start,
+                             primary_loader, fixupcontext);
 
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
-- 
2.34.1


