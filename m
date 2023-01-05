Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B336965EF0E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJG-0002pp-DT; Thu, 05 Jan 2023 09:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002kk-Ht; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIs-0006tS-ED; Thu, 05 Jan 2023 09:33:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id co23so36341866wrb.4;
 Thu, 05 Jan 2023 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncw5nnPVK/uF8+rX+LoiYH3+/VQ+iJInXM5uQBXVtuY=;
 b=RNX1JKz3q/4t+luafx4cuFcZmg3YaPBe4lkGOzfk2MTTFF+n7wO6FfDCKj31vmJQEn
 OtYa4o8cmx4j278C6ezrlYrxfSXRzVXFpM4Lrtt8jJO8FVstG/GauXDNUqobSYUVuriL
 FUYOpM5qvx0sKlnspEaJLlmGborKqwic0yeub4U65imMCanSMQnOrPh04+D/P22QEqb8
 OODSZJCQtSLi9MJMKYNUN3tBXsN1klyjQ9NRDT/hAl96A/M4RXhh8iYhmY5QcimzXRXA
 mdGZzBll+wQ25grgMx9XRN9YfmefGDW1q3kvmOxWBYZZ2m13QXF3oPv7NPo/K8+FE2zz
 PMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncw5nnPVK/uF8+rX+LoiYH3+/VQ+iJInXM5uQBXVtuY=;
 b=NQiXYFfBnbxOKDmNQmLUuf2IABKobVwOk/9SiLmPZ1MUYsKyCZ+eProURGu/eUIMcJ
 DiMBs3qAylEsp+M6wP9xkUuQ3ULtwomGeg07GdsSu8DMITyh5nr/9Hyz4YqGKPNRXmi1
 cvshnGNSaGMULcnvmVh4CmzwjVAqzmV1VWwFYgOeiUg2vZQYlFBvxTJ5PSEsyOVAXPnl
 97h7HMuafs7YifJzIM1XXpaZ82V1bBa124SAU3aBdgrSECC1AMb3b8fb++I3bPzP8rk/
 G5FhD8CXK47vUlBg7XszpM03W+4IdhKkQlPMPfmyoaumZMsQRn7YZb/EG1949fYb7k/Q
 gLPQ==
X-Gm-Message-State: AFqh2krwg9SREue4Pzpo9/Bs+paLSBgstKFHoNOWk30TNIOqX+wEm0uO
 e5PwrQX7U6A06Er+6R9fHZgzbkTH4vwo2A==
X-Google-Smtp-Source: AMrXdXuPLv690JBT8uxgyB/BFUC53+jyeFKb35Pmq+MQWuV41mzgtbe+ALht/IYcnZdpP6h9fm5dlA==
X-Received: by 2002:a05:6000:18a6:b0:280:4a9:c8dd with SMTP id
 b6-20020a05600018a600b0028004a9c8ddmr40208330wri.18.1672929188361; 
 Thu, 05 Jan 2023 06:33:08 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 02/31] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Date: Thu,  5 Jan 2023 15:31:59 +0100
Message-Id: <20230105143228.244965-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
Message-Id: <20221027204720.33611-3-philmd@linaro.org>
---
 hw/mips/malta.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 2e175741ff..ef3e10dc4d 100644
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
+                     tswap32((1 << 31) /* ConfigEn */
+                             | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
+                             | PIIX_PIRQCA));
+    bl_gen_write_u32(&p, /* GT_PCI0_CFGDATA */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
+                     tswap32(ldl_be_p(pci_pins_cfg)));
+
     bl_gen_jump_kernel(&p,
                        true, ENVP_VADDR - 64,
                        /*
-- 
2.39.0


