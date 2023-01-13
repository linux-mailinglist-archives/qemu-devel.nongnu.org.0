Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA89669E44
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHB-0002L0-NE; Fri, 13 Jan 2023 10:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMH9-0002Gz-Id
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMH7-0006ME-Mk
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17666821wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4yHKwLa0eOU7lIkX7VogKZwEOB3VNYYLjvGA5PLysQ=;
 b=mi1CTKRMdH+WSeNuLrnPRutL7WHVbVc+WWwDD49DWxtpbi8XJcjIwHaQwH71v1mDiG
 blvJXQWjNL+jAH3Fb5swWibxhmJrNbnfZsvI81tCtrV99IvP66IHILwVkljYh3OSEJYz
 3dUdgGjA5cdP98iefxipBVuM1Uj6e33Ncn0/z/T+sTbZ0RngqSvkhtoPech2vMZnHNIn
 ZJo6hQRGn6zyC1MKZUd7hsWbLl5XGqmEenmTqZsqKAmM5ejooizucW9TYKNUywqXTd4e
 ureuufKhhSfazlZyuBkjxTgRwlNH2nLJ7Qmu+Oux6JVrhpBueI9vlwDQjlCiz97SnNN0
 Y4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4yHKwLa0eOU7lIkX7VogKZwEOB3VNYYLjvGA5PLysQ=;
 b=QZq0m0e+7Fx3VSHNONySjXyFay/8O4oTdNsFIFPPxTUudD+dkPyIuhqipwYKUYnRyZ
 T6XkFxCdCdUXxfi2LxuAhWo1vuepwHzMSwQN2j1VAJosxwiaCScufaIghf3Z7x5tDdd+
 T8s9HsMeVxQa7so44fOdXOuwcvx+UgbR8lRoXiq1bT0hZGHIO+gPWV1Le+0fJWJwLq6C
 J2n4Wh+ydNyLyPKHwwLF8JoEUk3VLU2Qd7alRU3F3EPcasEZqGlDNFRvODiWMwOoOiHe
 EFxROAuiNZSCermRmvk0PDdcE6uPttK95TOMv7OA9ooiXWOSxMnANZ5iLN8Z7x58qwj0
 7bhg==
X-Gm-Message-State: AFqh2ko1+xmd3qCnLtWX9IAAco+9cCP4D3Eh+fuFHqQl1gCJnvX7CUd2
 8h/NFMplUm7rvFjsLDBUf0qWjxcUa3pUTZX9
X-Google-Smtp-Source: AMrXdXsrgqgDmrb+DrhP7sqw0qYHzC1Hqm1aJzggMgVY5o8NOpbug8ELQH9Lu2WSkm61Xb/uK8+Wgw==
X-Received: by 2002:a05:600c:4f12:b0:3d9:f9ef:3d23 with SMTP id
 l18-20020a05600c4f1200b003d9f9ef3d23mr10975662wmq.23.1673624844812; 
 Fri, 13 Jan 2023 07:47:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm35169581wmp.19.2023.01.13.07.47.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/46] hw/mips/malta: Merge common BL code as
 bl_setup_gt64120_jump_kernel()
Date: Fri, 13 Jan 2023 16:45:09 +0100
Message-Id: <20230113154532.49979-24-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Merge common code shared between write_bootloader() and
write_bootloader_nanomips() into bl_setup_gt64120_jump_kernel().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-12-philmd@linaro.org>
---
 hw/mips/malta.c | 155 +++++++++++++++++-------------------------------
 1 file changed, 56 insertions(+), 99 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b66dad0510..34c24110cd 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -616,11 +616,64 @@ static void network_init(PCIBus *pci_bus)
     }
 }
 
+static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
+                                         uint64_t kernel_entry)
+{
+    /* Bus endianess is always reversed */
+#if TARGET_BIG_ENDIAN
+#define cpu_to_gt32 cpu_to_le32
+#else
+#define cpu_to_gt32 cpu_to_be32
+#endif
+
+    /* setup MEM-to-PCI0 mapping as done by YAMON */
+
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(p, /* GT_ISD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
+                     cpu_to_gt32(0x1be00000 << 3));
+
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(p, /* GT_PCI0IOLD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
+                     cpu_to_gt32(0x18000000 << 3));
+    bl_gen_write_u32(p, /* GT_PCI0IOHD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
+                     cpu_to_gt32(0x08000000 << 3));
+
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(p, /* GT_PCI0M0LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
+                     cpu_to_gt32(0x10000000 << 3));
+    bl_gen_write_u32(p, /* GT_PCI0M0HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
+                     cpu_to_gt32(0x07e00000 << 3));
+    bl_gen_write_u32(p, /* GT_PCI0M1LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
+                     cpu_to_gt32(0x18200000 << 3));
+    bl_gen_write_u32(p, /* GT_PCI0M1HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
+                     cpu_to_gt32(0x0bc00000 << 3));
+
+#undef cpu_to_gt32
+
+    bl_gen_jump_kernel(p,
+                       true, ENVP_VADDR - 64,
+                       /*
+                        * If semihosting is used, arguments have already
+                        * been passed, so we preserve $a0.
+                        */
+                       !semihosting_get_argc(), 2,
+                       true, ENVP_VADDR,
+                       true, ENVP_VADDR + 8,
+                       true, loaderparams.ram_low_size,
+                       kernel_entry);
+}
+
 static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                       uint64_t kernel_entry)
 {
     uint16_t *p;
-    void *v;
 
     /* Small bootloader */
     p = (uint16_t *)base;
@@ -644,55 +697,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     /* to_here: */
 
-#if TARGET_BIG_ENDIAN
-#define cpu_to_gt32 cpu_to_le32
-#else
-#define cpu_to_gt32 cpu_to_be32
-#endif
-    v = p;
-
-    /* setup MEM-to-PCI0 mapping as done by YAMON */
-
-    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
-    bl_gen_write_u32(&v, /* GT_ISD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
-                     cpu_to_gt32(0x1be00000 << 3));
-
-    /* setup PCI0 io window to 0x18000000-0x181fffff */
-    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
-                     cpu_to_gt32(0x18000000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
-                     cpu_to_gt32(0x08000000 << 3));
-
-    /* setup PCI0 mem windows */
-    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
-                     cpu_to_gt32(0x10000000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
-                     cpu_to_gt32(0x07e00000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
-                     cpu_to_gt32(0x18200000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
-                     cpu_to_gt32(0x0bc00000 << 3));
-
-#undef cpu_to_gt32
-
-    bl_gen_jump_kernel(&v,
-                       true, ENVP_VADDR - 64,
-                       /*
-                        * If semihosting is used, arguments have already been
-                        * passed, so we preserve $a0.
-                        */
-                       !semihosting_get_argc(), 2,
-                       true, ENVP_VADDR,
-                       true, ENVP_VADDR + 8,
-                       true, loaderparams.ram_low_size,
-                       kernel_entry);
+    bl_setup_gt64120_jump_kernel((void **)&p, run_addr, kernel_entry);
 }
 
 /*
@@ -758,55 +763,8 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
      *
      */
 
-    /* Bus endianess is always reversed */
-#if TARGET_BIG_ENDIAN
-#define cpu_to_gt32 cpu_to_le32
-#else
-#define cpu_to_gt32 cpu_to_be32
-#endif
     v = p;
-
-    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
-    bl_gen_write_u32(&v, /* GT_ISD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
-                     cpu_to_gt32(0x1be00000 << 3));
-
-    /* setup MEM-to-PCI0 mapping */
-    /* setup PCI0 io window to 0x18000000-0x181fffff */
-    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
-                     cpu_to_gt32(0x18000000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
-                     cpu_to_gt32(0x08000000 << 3));
-    /* setup PCI0 mem windows */
-    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
-                     cpu_to_gt32(0x10000000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
-                     cpu_to_gt32(0x07e00000 << 3));
-
-    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
-                     cpu_to_gt32(0x18200000 << 3));
-    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
-                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
-                     cpu_to_gt32(0x0bc00000 << 3));
-
-#undef cpu_to_gt32
-
-    bl_gen_jump_kernel(&v,
-                       true, ENVP_VADDR - 64,
-                       /*
-                        * If semihosting is used, arguments have already been
-                        * passed, so we preserve $a0.
-                        */
-                       !semihosting_get_argc(), 2,
-                       true, ENVP_VADDR,
-                       true, ENVP_VADDR + 8,
-                       true, loaderparams.ram_low_size,
-                       kernel_entry);
+    bl_setup_gt64120_jump_kernel(&v, run_addr, kernel_entry);
     p = v;
 
     /* YAMON subroutines */
@@ -851,7 +809,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     stl_p(p++, 0x00000000);                  /* nop */
     stl_p(p++, 0x03e00009);                  /* jalr ra */
     stl_p(p++, 0xa1040000);                  /* sb a0,0(t0) */
-
 }
 
 static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
-- 
2.38.1


