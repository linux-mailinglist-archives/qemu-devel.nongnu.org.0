Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53C669F08
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:07:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHL-0002O1-H7; Fri, 13 Jan 2023 10:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHK-0002Nb-5n
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHI-0006Rg-LB
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so1346928wmc.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lve/VP9rdCZNT+dVW+MP0O31KuoNjsj6O9zBWuWgJ0=;
 b=qxwokEqbtqY4ZmQPpKl0bS0Se69TQSGUmMP8i3MG3LVwqhTpdRcRvqaK3A4DPy8IC+
 3V3450YPW0cPK59G1qObE7nfFoZxulcbepDIjD8HlxFizvB7dEdoD9r893p7gMUzO7Z+
 K/iOea7CWBtqQ0J3n5QzPWmVyHC9EHARhhnS2zvlhtyvEWzy6cNlD9ZNLqkJ9LQOQISz
 ktxRY5uOdLE5KgL3lRrbu2zH5LllNH3fZOPneQ1hPfO1Il3N3dVTOosc9Uw1fHiSjWfU
 irQR+zGplcgM50tIklBIA/p20sGL3+16UUENANQzwIVdjCTayfcjbM4pu9NIS9GJML8Z
 TiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lve/VP9rdCZNT+dVW+MP0O31KuoNjsj6O9zBWuWgJ0=;
 b=4cJmSwzWJYsqz2azaBkmaVvgH9UoPOGjO8DDrdgOxIT0JCPqJznGj1LZqTy6XJ2gmL
 MxEk27KHWdd61nv8fhI5oYU3X03OF7u9lGQiV1RTwS7kDhei0slZCEWH8Rbz67GSmCd6
 083GbqLIrrNe85lzmqUOme3jOG3l1H5GXXpt+zeccNXpiPwuKfBUSlmh34ESLrcvI66D
 Ri3ZyqVoiStmM/098Ru8S2irGaMJnVFhzgQ+Q7RG/3Aecsw0fY98Hvg9xEvGcOV1DxU7
 OyZsVLCnED2tEp96EYQRCB8H8JN+mvDDZnFdyBTXcdA3N4+kZHq56rRom7uAFsjk75+L
 ATrw==
X-Gm-Message-State: AFqh2ko9+hWv+w7eH/kypeCPattHg1Wx4GbLDJEd8Xy0LEcXbr2450mr
 BJnI066ZeBE2PNjs4q4du2o382NDF+HPPUns
X-Google-Smtp-Source: AMrXdXtU+mkDXLAUiJQL1/cr3W78k/NOghKAjpJnWaf78VL5umrtc5V4FDlZejyj90SVa2q9RE0TjQ==
X-Received: by 2002:a05:600c:3ca8:b0:3d9:e8b3:57fa with SMTP id
 bg40-20020a05600c3ca800b003d9e8b357famr17284984wmb.30.1673624855133; 
 Fri, 13 Jan 2023 07:47:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm21649052wms.1.2023.01.13.07.47.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 25/46] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Date: Fri, 13 Jan 2023 16:45:11 +0100
Message-Id: <20230113154532.49979-26-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221027204720.33611-3-philmd@linaro.org>
---
 hw/mips/malta.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9fc3280407..ae76b4db70 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -621,6 +621,10 @@ static void network_init(PCIBus *pci_bus)
 static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
                                          uint64_t kernel_entry)
 {
+    static const char pci_pins_cfg[PCI_NUM_PINS] = {
+        10, 10, 11, 11 /* PIIX IRQRC[A:D] */
+    };
+
     /* Bus endianess is always reversed */
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32 cpu_to_le32
@@ -659,6 +663,20 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
 
 #undef cpu_to_gt32
 
+    /*
+     * The PIIX ISA bridge is on PCI bus 0 dev 10 func 0.
+     * Load the PIIX IRQC[A:D] routing config address, then
+     * write routing configuration to the config data register.
+     */
+    bl_gen_write_u32(p, /* GT_PCI0_CFGADDR */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcf8),
+                     tswap32((1 << 31) /* ConfigEn */
+                             | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
+                             | PIIX_PIRQCA));
+    bl_gen_write_u32(p, /* GT_PCI0_CFGDATA */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
+                     tswap32(ldl_be_p(pci_pins_cfg)));
+
     bl_gen_jump_kernel(p,
                        true, ENVP_VADDR - 64,
                        /*
-- 
2.38.1


