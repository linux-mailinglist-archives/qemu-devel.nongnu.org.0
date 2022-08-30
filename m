Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DA5A6D5C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:29:12 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6v9-0003Iw-8W
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UI-0003AD-A9; Tue, 30 Aug 2022 15:01:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UG-0008Sb-Kh; Tue, 30 Aug 2022 15:01:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1749785wmr.3; 
 Tue, 30 Aug 2022 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nmcgz1gXNUhjBIJ2W+p0Z4n0UItAGPtSr6Xm0Wuhb+I=;
 b=An+eGfSD+AE2PHtzmk2e8PZsnFyUbJnrf/QEH3yB91l8C7ySWPZ4XaHjCXNRVf4xlU
 UBrBRdGZgZs2tbIx/bLQBuqa63ENMLIFAGX8qe7c6M8N9KnGUACbpoL7FjSkMuQN16Wx
 kfFI+avXMA6LT4XNgL3XjoKLs1Lum98oA82sL+vTtR4K3T0g3ttDY7is5sQSRefDgJBe
 bQOaYqKBuQBoIuPc12fEwnaFMFyAaK7CqFr1XhGb8hw3Fou1A4p7/e/uiu5tEnPPzeHM
 kmC/EXAsKIOxAWp5MX3Vx1CqhlMDlI8HYlmqfhMlLtCW/pz7NEEkWTpiGiEfw44jBnTU
 c3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nmcgz1gXNUhjBIJ2W+p0Z4n0UItAGPtSr6Xm0Wuhb+I=;
 b=7bde+7adfSzxSE9z5zpzpUtlUFl4Dt5QD6EtP0v3QPV0PpxP8ZOEqerG++B7x6LoEA
 YRyt08w3qO9IAjDwvLSqakSmbtMn3zITcDdKuoPYRWSq5dRl44vSYwQolTisSrwH+Vyp
 /toeJhx/xtRyBLYktJ2339ws5pwiciG0Ijd3iXnwXuLCJ0p6NaPBwa7Tz2VyxwBzIzfC
 EFN0oZ4tCZopW4VlI6bSyqC/zcEZO0+YJTeR0TQSysMSDyTBei1N0QyLH5Nwg/E8IvJU
 zw0gQX0ApsMCHr39cq8dhXKSyyurbIk/1HwcV3DQOZqIH+liCFUBAfZOtORZjgMfwYEY
 KOjw==
X-Gm-Message-State: ACgBeo11w23JFWiw0h037bwNkwVYTeRO4Hx7Qd2XqSSdsnYyh3qwsK64
 6/Spw2+zWJYarqWfthYwLgSPPDmrxyY=
X-Google-Smtp-Source: AA6agR7lw4ZVou8XLMiZMbL+PqXr/YxD+SltTYJqxqi27QY7l9vhaq7cuqp2aBIhXr+37DO8PTtGIw==
X-Received: by 2002:a05:600c:1f1a:b0:3a6:2569:496b with SMTP id
 bd26-20020a05600c1f1a00b003a62569496bmr10341278wmb.176.1661886080079; 
 Tue, 30 Aug 2022 12:01:20 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/10] hw/isa/vt82c686: Embed RTCState in host device
Date: Tue, 30 Aug 2022 21:00:47 +0200
Message-Id: <20220830190048.67448-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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

Embed the rtc in the host device, analoguous to the other child devices
and analoguous to PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 150e9401d0..0ef9446374 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -549,6 +549,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
@@ -570,6 +571,7 @@ static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
 
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
@@ -623,7 +625,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    mc146818_rtc_init(isa_bus, 2000, NULL);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
+    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
+                              "date");
+    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-- 
2.37.2


