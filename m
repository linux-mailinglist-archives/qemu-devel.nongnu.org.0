Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40D6ED14A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy6G-0006kl-A1; Mon, 24 Apr 2023 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy6A-0006jR-0T
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy65-0006sW-BS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so33286065e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnTnpb/oRrMNBNJ0ApTxJdoFLFl10qOphFuNP0DCCUU=;
 b=f8EpeHyY54VprktfHG/XyBsX5br9tra7f77EMN8mLmSbi5ZWbG9NBzjZFEb0OYPDAD
 mJp4HxvOSVCGzHu+w6q+hSr7EaICR3bdWz31p0tTnifHwha4sLBNPdqMJs3vJu8xX35c
 /+IlZBBkyxEGNQjy8IE/1E+XpVZm2uxHlHlTmONPmX/naD2l1Cw8nEUwuLXBy5oZpUD4
 WiUyZ4D3ANezM8Ep7vwkXWe5XdfOMthBshY9PJm2EJJj92usOZNUy94gyhLIWF2T7Z7i
 4dj2hdRIGfjvrFsG2PgO0RLHWBcQLTibZgdvt/pkgS/vuw3ll7S0UwGH7Dqb//bs8zIK
 ubLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnTnpb/oRrMNBNJ0ApTxJdoFLFl10qOphFuNP0DCCUU=;
 b=AuyYtCw/7+dZpvklyO1d2eIlP5lzGTfxE89H8Jiqlh6/2NTJWDnO84Bc2xFHgqteMo
 YULzYdCL3kR9kqnbBFOFmslMLLZQ2t7+GIQOM8TSsMxgz9f//VSUA2E0MDvjmrDceAd9
 8wxcDrHkKQ6/J3kfFGpo/nSPeXuO0CoG8MKLmkCw4oUXv6CFC4a9LfJsyC6ybPlAob5e
 Rv5qOwT1JLglOw7YEuuhiOu4ZR8ijRbuK2Whnw6BVpcgAE+f6fVvTQtzSp5Z6Qta52zz
 EoeUBFy89nXcvBjVzin1Z7qkp5F8r9GmvmWsLqrLrFe6f2F+/TfF+qIdy6gD/cZc/0zg
 YOGA==
X-Gm-Message-State: AAQBX9fyQNoEj6nevMj4tTtQ+raFjpG5jbZufOjpGnomDTtG/QD7GDHC
 PEASv2NOrAMd9ZsXn0b74atroTIKcG+oQoLZ2DA=
X-Google-Smtp-Source: AKy350Z0pfmt9btu/lBi9AxmNX8Fxv6dHOtSGGCdbwKlCRg7htEo/gq2Qu6lS+4KHHwHX0iaGLac6Q==
X-Received: by 2002:a1c:7211:0:b0:3da:1f6a:7b36 with SMTP id
 n17-20020a1c7211000000b003da1f6a7b36mr7761722wmc.0.1682350039748; 
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/3] hw/arm/boot: Make write_bootloader() public as
 arm_write_bootloader()
Date: Mon, 24 Apr 2023 16:27:15 +0100
Message-Id: <20230424152717.1333930-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


