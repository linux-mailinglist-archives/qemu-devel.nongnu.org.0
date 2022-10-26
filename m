Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1960E8EC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:23:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlvG-0008Al-Oh; Wed, 26 Oct 2022 15:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvE-00089h-6t
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlv6-00022z-Da
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id y16so17628334wrt.12
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hySnLk5K4a30mDEy+T5RInaa/yefNceHFfxvNbQar7I=;
 b=AGFofHXa431+00PLtPCfMT1vjXkQJFp6Ezl6NZqPMQgG4e1WRwWnx3sEJFwFM7i1G5
 21r5Ftz+wncd48N55GVp+QbIIoaFfKI6mZcP5N18wf3IyTTB8cwv9YBVwdu2GNxGYCIV
 8Gyt4rbrGF60j5OA6ehKnKszZLa6uWQe0zEWqjy/cq11PlXEhXoaNjvmttP7Fwg0PGok
 jJxttKEoWE6u5dGJyoOqkg3uoU3ogdQxn+OI0/K0JyF92YrwQRn/UpRIb4U2TRvQuzW3
 8psYtYyotRCS5mwOuqg4heynTNXg3x023PgsdupTQIzAfYN4BmccIQRDzF6k8Iu6hH3B
 eREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hySnLk5K4a30mDEy+T5RInaa/yefNceHFfxvNbQar7I=;
 b=7J9PxQUyRzNwnU8bu1PzAxCldmzhN/t1TegStCKG0TboHCQoit3FwS4zH1gv89lZjw
 uaBgNWhtsCpkSG1N4BDkCMin7r+oSlhX1GuG2gdPYlZdmZi7AZUSIp68zAdHpZfkLXnM
 6qHIDpBg095CZOMCOunISAIgEn1h0l4SFObc3ey27W1z4IKdzCl+dGa8MXZKFbA6p5f5
 0AQ+BMGyPnaZcBCbc3YGBD8MORMCD8aoW7xg1B3min1Kp+1KjOUCxt9lm0vIIedZ86Wj
 pFDDOTAfzqaOhQv/A2C/LKgqhqwIIefRSQWAMZlybUzc2HtGad3Qw2z0PZBI104JYsEr
 rb+w==
X-Gm-Message-State: ACrzQf33cQA8FpD/FIeBgkrIAXSzFcECy7fmKTvnb0nxt0wGilKyN2n+
 tp6V3aVj+XE3QF8XzNFd0sTZO3Nqk7b8yfAT
X-Google-Smtp-Source: AMsMyM4QIe/fL36j6zm6QTMO9aRSxAactd74qSt5Axm9wACC6jc6LwLrgFhTr/CKhwoQOuxDC36AZQ==
X-Received: by 2002:adf:dfce:0:b0:236:6a6f:ed6b with SMTP id
 q14-20020adfdfce000000b002366a6fed6bmr13769830wrn.483.1666811909208; 
 Wed, 26 Oct 2022 12:18:29 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adfe342000000b0023691d62cffsm942950wrj.70.2022.10.26.12.18.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:18:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v4 1/3] hw/mips/bootloader: Allow bl_gen_jump_kernel to
 optionally set register
Date: Wed, 26 Oct 2022 21:18:19 +0200
Message-Id: <20221026191821.28167-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026191821.28167-1-philmd@linaro.org>
References: <20221026191821.28167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When one of the $sp/$a[0..3] register is already set, we might
want bl_gen_jump_kernel() to NOT set it again. Pass a boolean
argument for each register, to allow to optionally set them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/bootloader.c         | 28 +++++++++++++++++++++-------
 hw/mips/boston.c             |  5 ++++-
 hw/mips/fuloong2e.c          |  8 ++++++--
 include/hw/mips/bootloader.h |  8 ++++++--
 4 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 99991f8b2b..f5f42f2bf2 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -165,15 +165,29 @@ void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr)
     bl_gen_nop(p); /* delay slot */
 }
 
-void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
-                        target_ulong a1, target_ulong a2, target_ulong a3,
+void bl_gen_jump_kernel(uint32_t **p,
+                        bool set_sp, target_ulong sp,
+                        bool set_a0, target_ulong a0,
+                        bool set_a1, target_ulong a1,
+                        bool set_a2, target_ulong a2,
+                        bool set_a3, target_ulong a3,
                         target_ulong kernel_addr)
 {
-    bl_gen_load_ulong(p, BL_REG_SP, sp);
-    bl_gen_load_ulong(p, BL_REG_A0, a0);
-    bl_gen_load_ulong(p, BL_REG_A1, a1);
-    bl_gen_load_ulong(p, BL_REG_A2, a2);
-    bl_gen_load_ulong(p, BL_REG_A3, a3);
+    if (set_sp) {
+        bl_gen_load_ulong(p, BL_REG_SP, sp);
+    }
+    if (set_a0) {
+        bl_gen_load_ulong(p, BL_REG_A0, a0);
+    }
+    if (set_a1) {
+        bl_gen_load_ulong(p, BL_REG_A1, a1);
+    }
+    if (set_a2) {
+        bl_gen_load_ulong(p, BL_REG_A2, a2);
+    }
+    if (set_a3) {
+        bl_gen_load_ulong(p, BL_REG_A3, a3);
+    }
 
     bl_gen_jump_to(p, kernel_addr);
 }
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..8976f036e6 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -351,7 +351,10 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
      * a2/$6 = 0
      * a3/$7 = 0
      */
-    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
+    bl_gen_jump_kernel(&p,
+                       true, 0, true, (int32_t)-2,
+                       true, fdt_addr, true, 0, true, 0,
+                       kernel_entry);
 }
 
 static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 5ee546f5f6..b7bf48f9b8 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -180,8 +180,12 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Second part of the bootloader */
     p = (uint32_t *)(base + 0x040);
 
-    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR, ENVP_VADDR + 8,
-                       loaderparams.ram_size, kernel_addr);
+    bl_gen_jump_kernel(&p,
+                       true, ENVP_VADDR - 64,
+                       true, 2, true, ENVP_VADDR,
+                       true, ENVP_VADDR + 8,
+                       true, loaderparams.ram_size,
+                       kernel_addr);
 }
 
 static void main_cpu_reset(void *opaque)
diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
index b5f48d71bb..fffb0b7da8 100644
--- a/include/hw/mips/bootloader.h
+++ b/include/hw/mips/bootloader.h
@@ -12,8 +12,12 @@
 #include "exec/cpu-defs.h"
 
 void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
-void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
-                        target_ulong a1, target_ulong a2, target_ulong a3,
+void bl_gen_jump_kernel(uint32_t **p,
+                        bool set_sp, target_ulong sp,
+                        bool set_a0, target_ulong a0,
+                        bool set_a1, target_ulong a1,
+                        bool set_a2, target_ulong a2,
+                        bool set_a3, target_ulong a3,
                         target_ulong kernel_addr);
 void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
 void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
-- 
2.37.3


