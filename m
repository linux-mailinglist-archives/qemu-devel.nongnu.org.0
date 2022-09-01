Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1D5A9D41
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:40:22 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnEr-0002lj-NF
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2F-0002A8-AB
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-0001VH-7y
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id fy31so35422456ejc.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=czze0c+OUMqF2Te1RN6krGNr4VtVef5mDNYvk0Wdy9k=;
 b=QCi5Cn9qG52n+MZ4v4eft/V+IrvvNkdnIrGf5TOPnd0xchVLLrMaVm7c0YP/p+7CuW
 +Wsx7i0Eu3amMFtkZKVa/lEAGjP2VZDWMBsATb8YYz7i8yGg5NVKf5fCG33SORFmCNlt
 walmmzw5RtD876uhwIRtJAxf+z6fo2hjgcTCs3fNSmLlH1DaW9rlPo3A+m3JmR0DEZDi
 8XBa6kN2HT4rVwrV5xuL+jgo5lRcBRKEKqph30l1o6CH6h3ZYO6osX29sZBHhuGBMatD
 dGTEpyfp+U4dOgkZtnuCbUyWG3fVyGGsp452FfosOAg3WMx6JKGV+dGVzVDd7LHPHnnd
 PqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=czze0c+OUMqF2Te1RN6krGNr4VtVef5mDNYvk0Wdy9k=;
 b=y8WLyVKOzrMmLnmfQ509xsR/0MaplNXuM77UhZ/vlZQjTBjM1S6moRXmXqbh1JTTAq
 SJI9AKh+ehF71yn8UuNQqo/Gv759uAPjV9TJb3SsFSHv1cq5VoX6WH5u9jJRD+gXtS62
 TgpTjo4mgfOn232g/PAM/MnT8rL9UX7c09LKa+ampzAD/HO+GKB/qgSjLykuw4afR62k
 Ga2rIqPodgon6WUOhWiBU9YnS9FiVZnL3oufYM/4djXE258UbqtEdoPn7GDh0/CtC91v
 nu0cZySZ1K2lUMpC8okQBLVowpis+AJsIPYlrv0QKxIVA2G8leIypI6yRv0CKskDdhUd
 6XYQ==
X-Gm-Message-State: ACgBeo3BHdH7ie5XCVFQuiLswvE/EUqdXSANvP/AQfOfROOcoOLLbqcc
 HPNV2iHeIWGOsgb0k1s8DQTrUTM57f0=
X-Google-Smtp-Source: AA6agR5S1GCx3QFGKizAr8ULPGcfcscopdbKfuT/EJx5DElz5NxWxKPnKeKTJtRyfhHTkndGG2zF/w==
X-Received: by 2002:a17:907:9706:b0:741:64ca:ae10 with SMTP id
 jg6-20020a170907970600b0074164caae10mr15746800ejc.364.1662049626506; 
 Thu, 01 Sep 2022 09:27:06 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:06 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 20/42] hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
Date: Thu,  1 Sep 2022 18:25:51 +0200
Message-Id: <20220901162613.6939-21-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The additional prefix aligns the function name with both other
piix3-internal functions as well as QEMU conventions. Furthermore, it
will help to distinguish the function from its PIIX4 counterpart once
merged.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d027c5b61e..e5772475be 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -84,7 +84,7 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
  */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
     slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
@@ -440,7 +440,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix3_set_irq, piix3_pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
-- 
2.37.3


