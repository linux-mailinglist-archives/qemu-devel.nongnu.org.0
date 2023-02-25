Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FDA6A2B00
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 18:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVy2y-0001af-LK; Sat, 25 Feb 2023 12:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2w-0001a2-AM; Sat, 25 Feb 2023 12:09:18 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2u-0005bf-NA; Sat, 25 Feb 2023 12:09:18 -0500
Received: by mail-ed1-x536.google.com with SMTP id s26so9298661edw.11;
 Sat, 25 Feb 2023 09:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=fb8l3FH5vliNikDo69X9Z02iyOrPe/M2G8yPO3sgiPR3PiAM74fLA2X3wiV/GEu4ea
 U/1X5CyFVK+H3xePtdhsiMvSAS/InYEZRLQdcbUHZwoH3U6dycJCuqPDqWIr+qD6gAh+
 FxA8bZJrZoNhMy8t2QWZGxVL/nAn0a3Wao+n0SMxICCM/O0bsxFjZO2HUhiDvY8Rx9A0
 vwCGFe6Wx2nwoUuGeLYORQhlhHvREvJ5TkgOku7vK2c5Vid/lg7wedCQnZPNHyiVFgvw
 WYZ7AYhNvUeP11MV3AFTQRpM0/8vMVx/VqFA6gq0XaJYNar3fwaoSDpeYV9xlDZl4wnX
 knKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=vG/6L9aPVhonDeaG23Mmr90ckTy1HUAshJvPCKMAR+pCBHxveJfroXsmZ+HN4znzer
 qePXgPt5ubK/vsGTZ9dkAWSiq1Q4o+RiiuDMr3HldailJtkRX2hl/2pIsf8fuHkNX4Wt
 8Chf1OXezNRvQ3rbqe3ik5MJ3wd4Tzhgzg8r8qin24NZfNMgmNhrbuodyNgxkGAfzPpR
 vTeyglr1+TgY02LvdgVftCjbAg92dq9x9NMJ+HJE0a13ElxUM6f2DGNr9V/nHLLa4SF1
 UPP4ld9HsGHeD4I6Sovv3MzbU3r11IRoDbWH4FFA4O0atR++FA/uEUaeanX9X2dOdHmA
 hQMg==
X-Gm-Message-State: AO0yUKUDNzRXJ2Y8SHP+pJYlyRXYImke9+KdxGFhoLX4PS2bDqhmFZnK
 C31TWF6rIKVKz0qODWJ+2OLxOOsRDII5iA==
X-Google-Smtp-Source: AK7set9DC+rcRxmXaOCkkb1d8suLuaBY/jFWlWRquJh4qeaEBkqRewV4rVm6g+vGxnltdMdtFuKxAA==
X-Received: by 2002:a17:906:4909:b0:8af:2191:89a6 with SMTP id
 b9-20020a170906490900b008af219189a6mr24361766ejq.72.1677344954627; 
 Sat, 25 Feb 2023 09:09:14 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf06ee000578a61baa078133.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:578:a61b:aa07:8133])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a17090616c600b008d356cafaedsm989066ejd.40.2023.02.25.09.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 09:09:14 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/3] hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
Date: Sat, 25 Feb 2023 18:08:55 +0100
Message-Id: <20230225170857.15774-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225170857.15774-1-shentey@gmail.com>
References: <20230225170857.15774-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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


