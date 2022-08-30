Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9155A6D6E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:33:45 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6zY-0007t1-FO
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UJ-0003AG-JT; Tue, 30 Aug 2022 15:01:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UG-0008Sj-SR; Tue, 30 Aug 2022 15:01:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id az27so15444427wrb.6;
 Tue, 30 Aug 2022 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8B7eBgW29BU1C+cqonsxs06FxkT27yX/E40I1fAu85w=;
 b=cLc6/bMCqeJYwneMRYn2aCmmu5jCYB1VWTb1Bpl5z9IetCEbHCsR3gpEsIEOI4LuYi
 zeZyXNBVgvZxIfiuBRMK3T+APl8rCOPeH7cx6YgYHZBGXddB6AiTdN0080IchJrPB1H6
 h18bGrbmQgGazyB8m+SzbX2mhsDbifl+Z8M7m5jIhlexzbq+l2PAfrk/NznU00fvhUUY
 1kWCMszjNx0XpooutTsC3RQsp37s5XyslF2biiXxE6V4vFBHowFX+KtAtSLnYwhmdOGB
 xuOmaZ8ZLfNf8yX5RUbhith8+xIDayhybMtHj20qkdRN05xNVLXzETRUGhbToXIuWo2Z
 7Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8B7eBgW29BU1C+cqonsxs06FxkT27yX/E40I1fAu85w=;
 b=60Rwsr2I3/UCpg9ckdrQhF8toMCq9Ftnh8BQTDoVyFGXe0Ijo2kcKs1hZ+shM4TuTq
 Q0yEMkCbmQR1lCMngopFNbFTTzPPNa7pNmd6upoWUI2OsprkT3l5MK9IyDhs9o7Ie2GW
 owb4HbjcyxcgoEYKQPpVkCyPyhdva80yhq5oRFQO9u+BQeB5GMQhuZ9oDeejD6YxD6fl
 V+OmhhAoyyFBBb8S2BKFGmEjG7dfS6jO/thbB/rZtF0yABwteTfbBMuzKJPHNynEk/+c
 dbI1PuVhpZh71DK7ciAV0lYsqFmPGMh7whDJbMzech73IDcePN1als8ST6frzuj0jvaR
 qseg==
X-Gm-Message-State: ACgBeo3gpQFdkZ+XuQ/Dk1PwfPoZLnGeN+siojb6xgqtMH0jqZg2iyHX
 jVodxZKYidtAzVRpYjOorFLdXU1Hz8M=
X-Google-Smtp-Source: AA6agR7weKuqtPDz5lxMBcq2EhtOySKLwrEYUoeh128Ga3fMbNxVBUpu/e0RW72ooRoZceIQ6ZyeQg==
X-Received: by 2002:a5d:4746:0:b0:226:da9e:46bc with SMTP id
 o6-20020a5d4746000000b00226da9e46bcmr6401595wrs.665.1661886082884; 
 Tue, 30 Aug 2022 12:01:22 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:21 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 10/10] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Date: Tue, 30 Aug 2022 21:00:48 +0200
Message-Id: <20220830190048.67448-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
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

According to good QOM practice, an object should only deal with objects
of its own sub tree. Having devices create an alias on the machine
object doesn't respect this good practice. To resolve this, create the
alias in the machine's code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 2 --
 hw/mips/fuloong2e.c | 4 ++++
 hw/ppc/pegasos2.c   | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0ef9446374..a23ffbb3ff 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -631,8 +631,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
-                              "date");
     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2d8723ab74..0f4cfe1188 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0, intc);
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 09fdb7557f..f50e1d8b3f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-- 
2.37.2


