Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D74653490
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Ss-0002mo-6b; Wed, 21 Dec 2022 12:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SZ-0002l1-Gk; Wed, 21 Dec 2022 12:00:51 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SX-0008BY-Le; Wed, 21 Dec 2022 12:00:51 -0500
Received: by mail-ej1-x634.google.com with SMTP id jo4so29368258ejb.7;
 Wed, 21 Dec 2022 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncw5nnPVK/uF8+rX+LoiYH3+/VQ+iJInXM5uQBXVtuY=;
 b=WDLsRrkFABsAvvAz4ZChQpfB3V+gvUOLjuhdELODJ+3kVyKLfibwURUDKbrpUmYcr+
 htn6JdgqH34MPjLBEHP0vhzaTQu/nnSlCPezDW9khNxDf7uUdMwZi8q++E3EEHOHNwrH
 VXMJiog2w2hMRXZew9afkkZxYYt5JHbzs/NvWb0YLnALLxpXaxVpvZ7ZJ7TCtKYbE7EQ
 qoDbd64ceevh5/biGc7TBrpfoiRnOpJGwLsts8HxpsF8vhToCBvL5yu+kqDW3nSJZWUr
 U42mqHE5Xu3VoEY81HBvA91XmDeRTyU/Qx3XAa7woIjDADVBbwXHncr5r4EzW9HuZi22
 lAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncw5nnPVK/uF8+rX+LoiYH3+/VQ+iJInXM5uQBXVtuY=;
 b=B4TFdFVzObUcSN8Z6migmwh1x7bXFmLqxTjVAuHeVPGAxZAKuPafOGIKzej/s+N+y/
 Ukgfn+N4Z1q0NDj6kjY9WMcLmcbuf+HBZWmc0j8F4KaDGJqUmb5G8PYwf3k44s0BZqoV
 hFoDZYtRtVobdfNURA6AYZoQVhDqTr/wkPa1rzJufy6CYVlsYVT5ON8Ahh2pk4REPwE+
 RIuYePe+HNz3fmUb3bhwjTm0/0Dpd0cQ9nD+l2QobLzA0ysgjiD3KyVdkWgyp7a7lag7
 uOO75YrSrm4CXiPDPgsmzCHb4cNr/1If0Pte/PRr33ATcd7sBFgdCrYK9GFtKYZq04l8
 JGOA==
X-Gm-Message-State: AFqh2kr8O6LEj8edX0PuJ7dlHWK8JOiInPQNXAh4EQp6IoKVfxatjL+M
 u8u40cWAtxKQt/rfog1cXBZwLZgjxIs=
X-Google-Smtp-Source: AMrXdXs4RIDMBgkoXN5zM0QlbDldZI5fpTtYAzk3ywp+xsQatl8tlAN4yq07o7tly/Iyf1rjC7CWxw==
X-Received: by 2002:a17:907:c70b:b0:7c0:e535:13fd with SMTP id
 ty11-20020a170907c70b00b007c0e53513fdmr1978224ejc.70.1671642047575; 
 Wed, 21 Dec 2022 09:00:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 02/30] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Date: Wed, 21 Dec 2022 17:59:35 +0100
Message-Id: <20221221170003.2929-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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


