Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058DF662D0D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtM-0002RF-SY; Mon, 09 Jan 2023 12:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtK-0002PF-Na; Mon, 09 Jan 2023 12:24:58 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtI-0000yw-Lm; Mon, 09 Jan 2023 12:24:58 -0500
Received: by mail-ej1-x62d.google.com with SMTP id fy8so21837643ejc.13;
 Mon, 09 Jan 2023 09:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yD2Nt3sc65GXyJk9LaQMyT8j1pCfMA2t4DX/1jlVSvA=;
 b=YPvx685NNHH+OeuQABNKzGkOQCepCahtqtF9labqsDeGjCw3pZUR7W5Y5voZuJd3O9
 Yr78SR/DXEgjLo9qoDuHNtQXMxkk02EVsKogkbA/TFl49sfmOdOQCIjD63RNBe+CYsSj
 BhoUImI3A6rIsNP4wpdfVlmm+jCKxgxp9xIOCcoNq+zt4p6UseNzQ0pW/aZE4m6FsX2r
 6kE2pJTwnoJ359v7KAAEqjWtoQ6K08p1TltVw9exrhu/5kZUqjgg1nClVL6fQGGLYRFa
 /gXHUdjkN2fa274gCalsscGd2QjAnUlEDxdUxJhNPE/8vV+O5NvEyGEgmJ5CIQPJ7y2P
 ZRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yD2Nt3sc65GXyJk9LaQMyT8j1pCfMA2t4DX/1jlVSvA=;
 b=5MFquZxLs9Gs6K4T1eRAPPYeTBRdwPyVPzeLOLRrw0iitshK85y6XFc4REKGfj3rmi
 mATE+MGZ3Rnmtv6gJWFi9TadyvcSP9smXt5CFZAY2Sn1BhkBzTyVISVRSkjbP+eRvazQ
 ViNaULIfZAgo2ax2Z5/e58nsBGzIWlLdJtAZXKq3lVx5yxikBo2a8wMu2JO2IUA5RWqE
 y04IA48h4PMkC5BePUBo86geLxzRjadJp7haYWbmDUS1+Dc9dQMD27ay6ZHQvoPnLYu2
 BVVdnyNJzHNFxo6GvC4U1c3WPJ7bdFGTJzViPqmqWbgRNk8ml6QLrDFkIgYY8cJcHQpY
 hSZw==
X-Gm-Message-State: AFqh2kqRwheo6kSrwTixgvAFMUwzmO4j8z9d5kkKtMO/g59/q5Rna86f
 YvUErIM+tUVMzoS+5Mn0oRLuOAWC9u7/Dg==
X-Google-Smtp-Source: AMrXdXu+g9udVWr60xRBp3fM/6En2UTIuhOFvhIREU4I1g0Ed6OCTdaSlvUBPFXb2UCbHuuw9/5HCw==
X-Received: by 2002:a17:906:3993:b0:844:de87:8684 with SMTP id
 h19-20020a170906399300b00844de878684mr64741397eje.46.1673285094028; 
 Mon, 09 Jan 2023 09:24:54 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v6 02/33] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Date: Mon,  9 Jan 2023 18:23:15 +0100
Message-Id: <20230109172347.1830-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
index 9bffa1b128..c3dcd43f37 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -803,6 +803,8 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0x8422); stw_p(p++, 0x9088);
                                 /* sw t0, 0x88(t1)              */
 
+    /* TODO set PIIX IRQC[A:D] routing values! */
+
     stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
 
     stw_p(p++, NM_HI2(kernel_entry));
@@ -840,6 +842,9 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
+    const char pci_pins_cfg[PCI_NUM_PINS] = {
+        10, 10, 11, 11 /* PIIX IRQRC[A:D] */
+    };
     uint32_t *p;
 
     /* Small bootloader */
@@ -914,6 +919,20 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 
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


