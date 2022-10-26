Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E371460E991
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:49:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmMf-0004Dz-H5; Wed, 26 Oct 2022 15:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMJ-0002o1-T6
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:42 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMG-00072q-Fo
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id n14so6731087wmq.3
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=622bstx+b/J583b5PKPx60lVjqF4abbcPq+aoKN4uak=;
 b=ShmBVx1z1J49kk92fR6aMB5+9hBVQRjreebQLU9XyV855yFQjzi6+vxTat5U2/F3O6
 a0fdZpmn/9w2F07j6gY/I5Fih7aGee6+pRJye3RigV5Tjhn1tmDY2ffdFB4QdLnS/0wJ
 NdjDnCrrQ6ULWun2wSRzOWz2GhRRliPbCbV4rn+Oq3SG5J3iWulu0Lx+m7bPSnv5r/FC
 Cek9qB6uyFFRmBWuveUFzw94KQ3zhI9FAKTXkJL/rIvBgfUy4KZGyl9UqT7fxEWHYpRE
 PK8EkYByXWdZ5RvyZ78xZnQMQw9U5XiVYfYZt4EvfLaCbZwxg8DiD1+NlYVHpTayzycN
 BQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=622bstx+b/J583b5PKPx60lVjqF4abbcPq+aoKN4uak=;
 b=tkJQ8m1DMs0JuMRllVaCCSpo0TrFrqs6HLDOz6YbEwaktfISlDpoXN2udMU2+Ez13r
 YAVUH9GXnfcBD3KNsdC5thQ0pdNB0anSpE/pO7obwSIU1xjIjtnAaFtfg8ffCumkXtPS
 0Xax04X0mIM292Su4fCe7+omQZb2XKlX7C/wzIUL6JLvw92auArxu9w69Io0NN8rp8to
 4i/bnXRQ493rEZC/HnOsgZ1lviYp4OtNU0lGiQJ8+APPIBrBHUwx4bdkEjkuLadmO9n5
 pUbgJLEuDkdHZCGWbw2Zdfl019wDSpY2X4FfOPsp1SFRTB7AQe335QqAzgv8sGzCEnuy
 RJHQ==
X-Gm-Message-State: ACrzQf3b3ygV0uJn+6ocC/rHtE923YVNu4DOCZrig0AkC8i8RkznzHVM
 dWtJCzn+Y3+6uKJm8RpsF5x94w==
X-Google-Smtp-Source: AMsMyM7NI8e+ELGmorAM0ukC34ppZq5G1V9gn4vCWNT8dmdIleQPT3TB54SrHV/N+Ed584Hs+BQGpA==
X-Received: by 2002:a05:600c:3147:b0:3c6:f871:1fec with SMTP id
 h7-20020a05600c314700b003c6f8711fecmr3685274wmo.71.1666813593193; 
 Wed, 26 Oct 2022 12:46:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi15-20020a05600c3d8f00b003b497138093sm2513127wmb.47.2022.10.26.12.46.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:46:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
Date: Wed, 26 Oct 2022 21:46:18 +0200
Message-Id: <20221026194619.28880-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026194619.28880-1-philmd@linaro.org>
References: <20221026194619.28880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Linux kernel expects the northbridge & southbridge chipsets
configured by the BIOS firmware. We emulate that by writing
a tiny bootloader code in write_bootloader().

Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
the PIIX4 configuration space included values specific to
the Malta board.

Set the Malta-specific IRQ routing values in the embedded
bootloader, so the next commit can remove the Malta specific
bits from the PIIX4 PCI-ISA bridge and make it generic
(matching the real hardware).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
FIXME: Missing the nanoMIPS counter-part!
---
 hw/mips/malta.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index df0f448b67..f0b98922f2 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -804,6 +804,8 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0x8422); stw_p(p++, 0x9088);
                                 /* sw t0, 0x88(t1)              */
 
+    /* TODO set PIIX IRQC[A:D] routing values! */
+
     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
 
     stw_p(p++, NM_HI2(kernel_entry));
@@ -841,6 +843,9 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
+    const char pci_pins_cfg[PCI_NUM_PINS] = {
+        10, 10, 11, 11 /* PIIX IRQRC[A:D] */
+    };
     uint32_t *p;
 
     /* Small bootloader */
@@ -915,6 +920,20 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 
 #undef cpu_to_gt32
 
+    /*
+     * The PIIX ISA bridge is on PCI bus 0 dev 10 func 0.
+     * Load the PIIX IRQC[A:D] routing config address, then
+     * write routing configuration to the config data register.
+     */
+    bl_gen_write_u32(&p, /* GT_PCI0_CFGADDR */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcf8),
+                     bswap32((1 << 31) /* ConfigEn */
+                             | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
+                             | PIIX_PIRQCA));
+    bl_gen_write_u32(&p, /* GT_PCI0_CFGDATA */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
+                     bswap32(ldl_le_p(pci_pins_cfg)));
+
     bl_gen_jump_kernel(&p,
                        true, ENVP_VADDR - 64,
                        /*
-- 
2.37.3


