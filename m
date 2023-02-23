Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDA6A1122
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI7e-0005fA-Ux; Thu, 23 Feb 2023 15:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7c-0005dc-Ie; Thu, 23 Feb 2023 15:23:20 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7Z-0002KP-2w; Thu, 23 Feb 2023 15:23:19 -0500
Received: by mail-ed1-x532.google.com with SMTP id x10so45921363edd.13;
 Thu, 23 Feb 2023 12:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=DKG9YAuMLc1XScc+0Qw1duvBG4NGDR0w6oljM7W3U0+iaO4wRsLz9mxC5qqX2u7LT/
 SlVOJWcpTcDmVZ0A3bpLEkUaWrQAjtenx3sOllfeyqkRZbeN20ZyNXnkhs3CKWVoEm9T
 FgZbo5dEhtjozBsdIejP3hYVSvkgF+0E1bSmI/9nyiylSBlhRh+aqhw/yroVXLadcWcr
 MEcXIhb3t+GDI2/DVW0ZNbWWBkas5QwjtRAEL/c5VUUz2HMxo4fflYcYBspyWNH3lLTR
 YS0SbyqEO8quco/42eO3jTFIw//v6aSN/tcziUA8ENmQzTcABe095adCSVySoJwLut0Q
 uWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=VfUOiPwF2aGP1z+kPsjdLf34Id95m7CsuZK1UG2Mj7VdjqkvF/k9dPhmiWLx6TBk9D
 PkVkVKLoTkVuBbzd214NbqbvZoCKN67a9j63nj0Py1aVhffjf6OvPBoPJhXr2HcHvnJp
 jKqkD+gmWTZxgX/QRZ4J9hrg12QHp6P0MUxEuX9Segriw/cVGEMgzU2fhOXVnC1wMWUH
 JBDCIeQFIpqexjHh6e1yl1CJ7LA0Ypr8IDnO/nKUVBMoxfFlZhPrkyZykL3BjRKfelrG
 +YhkAFP+ZDO5sEwo5uKfdqAX7sg/P1yn9KaRkW4RAOF77EmDbNq5EuVdoPiQCPz5xgjM
 SN/g==
X-Gm-Message-State: AO0yUKUBvnn5ZqBjxi1I/Frp8OeCkBFCOc9fxyIgZTyLJQ8GOBIa23O0
 ddTCwezdZLj5lhA5f2fVgwZtTK8oziQ=
X-Google-Smtp-Source: AK7set+o7CGyG3Aky511aZFZiHnticak1STivdnrr2djB5eJRiUru5zH4Z0u2gUWzIQja0yTs3ZDJw==
X-Received: by 2002:a17:906:230b:b0:878:625c:c8ff with SMTP id
 l11-20020a170906230b00b00878625cc8ffmr20681699eja.54.1677183793673; 
 Thu, 23 Feb 2023 12:23:13 -0800 (PST)
Received: from osoxes.fritz.box (pd9ed7433.dip0.t-ipconnect.de.
 [217.237.116.51]) by smtp.gmail.com with ESMTPSA id
 jj1-20020a170907984100b008d606b1bbb1sm5200917ejc.9.2023.02.23.12.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:23:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/5] hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
Date: Thu, 23 Feb 2023 21:20:49 +0100
Message-Id: <20230223202053.117050-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223202053.117050-1-shentey@gmail.com>
References: <20230223202053.117050-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

The firmware of the real PegasosII board routes all PIRQx to IRQ9, so do
the same in QEMU. The PCI_INTERRUPT_LINE registers of the respective
internal PCI functions are already initialized with IRQ9 which are
currently used for routing.

Note that the PCI interrupt router isn't implemented yet in the VIA
south bridges. This change has therefore no effect until this happens.

Inspired-by:
<c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
("hw/ppc/pegasos2: Fix PCI interrupt routing")

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/pegasos2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a9563f4fb2..41688699eb 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -268,6 +268,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
                               PCI_INTERRUPT_LINE, 2, 0x9);
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               0x50, 1, 0x2);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x55, 1, 0x90);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x56, 1, 0x99);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x57, 1, 0x90);
 
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x109);
-- 
2.39.2


