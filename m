Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FAF649661
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDn-0005wz-7z; Sun, 11 Dec 2022 15:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDk-0005uj-5y
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:48 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDi-0003Xa-8s
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:47 -0500
Received: by mail-ed1-x534.google.com with SMTP id f7so10307985edc.6
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2k1G1pmT56KOvkf35By/qtvt/7hQagB/gjT4uBwXvA=;
 b=dl005hTBxa8Gzs7Yja2fgwAbVxVipV2I/oysViaUJC8EbeQkUedvDTkMHs6sHAo4Vj
 If+ooiYsbh7z+fB/RFMpdbcNrHsC1GvBHzMA25gBYPVFvywp3ptC21EogXFDfp1+M6wr
 jh6tQDeAAe9URQ15WKrAlRI8OB1Uhl1fJFNn2txMr8g08c9khQo459k2rNqVgtqWYSIw
 lYtQgVQwVetTFOpbHVGHxtFlG3XvZALC6TpA2d0fft0fMpm1JRPGD0/7HbjR0c5VdNAJ
 SIqGNblbJyMnbZEAfpgQKvLe6GkMK9IjVb5Fob+OIrP6MD2KzLv/LdKVM20w9b1xvyst
 DwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2k1G1pmT56KOvkf35By/qtvt/7hQagB/gjT4uBwXvA=;
 b=nX06QbIfKx2R3Nk+YG8dtmwuPjPJkaW50Spd3mWgJnx1n9xvkW/0X9LOa1cdXiJf/U
 ld6d0WKWI6XFIfMHXsoYcj5qUYUumAz6m27n0V0xaLw9vHHjWDpRyJ3sGq53DQbbjR6d
 IsTj5dOyH0H9Ai/8w+18EEfjplL4CWLFPfLzfpq4pKo9WTDPToqWqJtG9vqr7VVz7Efo
 tA7PQullWzztChQU9io4/8VsXC+8Suo0W4JVphh2Q8HtbWMShfToTY+exZicXTJsvvEo
 NfSDkmcuJ6Bn9A4vLzy2RiwfieyWfrObVYTH99My8g64MSnPRUPMTj7SfQgGGAMzeuXp
 yFuQ==
X-Gm-Message-State: ANoB5pn28HkrpFawt7N9IicCJQl3A+maxhiNHPdIJkB2lTlCyQBsIHU5
 NM1sOfbzhK/Ve30BBlk9MzHQQwihwG7Sh28UChc=
X-Google-Smtp-Source: AA0mqf64rSrNGMdn9s7aE586moLHZX3JefKUCsN4tIWGTwAW88w/cxdsXoWdLBesQPAj1a+xtWWmjg==
X-Received: by 2002:a05:6402:5299:b0:45c:835b:9461 with SMTP id
 en25-20020a056402529900b0045c835b9461mr11418747edb.29.1670791603759; 
 Sun, 11 Dec 2022 12:46:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a05640214c500b00458b41d9460sm2991699edx.92.2022.12.11.12.46.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 11/11] hw/mips/malta: Merge common BL code as
 bl_setup_gt64120_jump_kernel()
Date: Sun, 11 Dec 2022 21:45:33 +0100
Message-Id: <20221211204533.85359-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
---
 hw/mips/malta.c | 155 +++++++++++++++++-------------------------------
 1 file changed, 56 insertions(+), 99 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 876bc26a7f..9cd59c13e4 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -610,11 +610,64 @@ static void network_init(PCIBus *pci_bus)
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
@@ -638,55 +691,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
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
@@ -752,55 +757,8 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
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
@@ -845,7 +803,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     stl_p(p++, 0x00000000);                  /* nop */
     stl_p(p++, 0x03e00009);                  /* jalr ra */
     stl_p(p++, 0xa1040000);                  /* sb a0,0(t0) */
-
 }
 
 static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
-- 
2.38.1


