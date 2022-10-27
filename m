Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33485610348
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:49:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9nC-0003F5-Gy; Thu, 27 Oct 2022 16:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9mv-0003EX-HQ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9mt-0007Rs-Qz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so5073126wms.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gABDM3SAd3eC6ZX61AV1tyP17xHBzgjqBVHS8eXGXg=;
 b=cAi+oU2ZnZiXwGb9GNkd5cKMph5pSPxhytRjXoFJ1BSQFXU8F+pr/r1P7pxPlnQJAa
 aqsQTrujn5ebk5t7XZrCh+a9EL5iZGaWvc+hzsd8ceGX89Aa1xfjUXsmsMbRCqtXoqJ7
 XvftmRIQONsB3u2TiHfC3iyMweFznAeqOS3gVy/VTHEFQSU80n1oP1uo7J4vDVG5hbWt
 dZMXNHYUoXYq3QBxLfx2MGbshjFUmh2hMXc8CINw4fUcZ1qbI7bFelEtEZEsY8+StF5P
 E5YQ4HJufZcCToIDCbToiA+pXTpvEPCStJK4SY/AXCN9m6VuRN8tezfZ+A70BgRXUCFQ
 oztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gABDM3SAd3eC6ZX61AV1tyP17xHBzgjqBVHS8eXGXg=;
 b=LczNlfm8j/RMwvtqINVr8DRlFNn08b2uKEt7edfWVXXwEPVpLQAx/sNawC5lCkN1X5
 xTDbjtxkgqfcGdeVJprfO93fC10dPyzUnUWRPBtzTcEo85gZy/nSvXVorsS3Z2zb6lFC
 aV/guaYJmjg+i/gRYyqgLXDsgxkVFrlF6j8MPdBEAblnzTKl9NUfIiRwjvaT7RpvCxut
 oHidJ4PvP+KJWLLPd93WO6XFnyd1c/lT/T3mQTIpuoOONmsnleUBBDoFnEENOBwDj85w
 cJDVLaquV9VR9k9NwMa70mThquH/yIdMOH8bV+O3rsOLyRdkMcE4tZi3tydb1SfaAycd
 LHbg==
X-Gm-Message-State: ACrzQf1FRHin2a6/boHsarFaKpk665DicBpBeNsW/rXruxpUIi9TlvHy
 FNDzvN6gxdlOydsHyEo5MSHC3y2IXunyuDmE
X-Google-Smtp-Source: AMsMyM7MaEgg91PZ9dd9F4+WvIEcnx2kRBeoSRlTwEwdlYCV0qd8qKsuwVs7DlXhPHkvVFEg5uD2xA==
X-Received: by 2002:a05:600c:4fcf:b0:3c6:cdb9:b68f with SMTP id
 o15-20020a05600c4fcf00b003c6cdb9b68fmr7406300wmq.73.1666903657769; 
 Thu, 27 Oct 2022 13:47:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b003cf568a736csm1538859wmq.20.2022.10.27.13.47.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Oct 2022 13:47:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Date: Thu, 27 Oct 2022 22:47:19 +0200
Message-Id: <20221027204720.33611-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027204720.33611-1-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
index df0f448b67..4403028778 100644
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
2.37.3


