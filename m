Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3D5A8284
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:57:26 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ5l-0001Hd-Mz
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvO-000320-HO; Wed, 31 Aug 2022 11:46:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvL-00039R-PZ; Wed, 31 Aug 2022 11:46:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nc14so24304097ejc.4;
 Wed, 31 Aug 2022 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gLfUGnAVToF9YqO6CURY5qXIngPZ9Wpmw00YUrrVUss=;
 b=nrOmPDbW1xMgOamol/V0T3/qzGyFPYaLZFFrsfY//7Bsb9fAyeE6N6suG/1em073AA
 IESq1O1DLC/ItC4Kyr3i+zcE9A7fHsoSg+wkjwj2aBxqWR98QScoYmrvXRR5F87cJft8
 0aEhty+F48jJ2SKsu8F68HLumY37VAJEt9ML7mA3ZkyMFp/LPlEJjYjCRbpWdZMFYFWA
 8Uhtiapox/lgHEWxQxZU7HSYv+zjn/c4gaJGK9wrOxJ0KB0eT0I1y8Ch+R7NuDLenk2J
 gB69qkCoZVxvcGRFOr7pW+JY1N6lgtk+jIKGUqsFeJnfZDKI8oWWizyZCa8PvYYdU1mQ
 H0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gLfUGnAVToF9YqO6CURY5qXIngPZ9Wpmw00YUrrVUss=;
 b=0q3VzaGt2EduSYB+FRL/9AEVWW2J38SH5yuanZrQkgvnk9CjgY2aSjAIpe54m5LdeB
 A/taOdxnHLMe36UpQs+/KvfK7LbtaejgaZ6IvH5UUcgf+G1hXj2pQYYv6TsSrRgwMKNV
 0ZLKkvXvD+4HbESoPEZxpWpotND9Rf1+bWChncf3S9X4W+rnvHTU93huzuIWMuv1rWow
 +5HqkxozOcNEVlE0X5xQ7QpW7pfQ5m8ycpgk7xqoQG3uyXzLc52fpCv56hnfmOydn5DY
 Hy01BELf6lG11pQumZIZGHV4KnGnTIokAfZ+mI+M5ItitnB3zfzHdH+puotSYCQjLYRu
 eC5g==
X-Gm-Message-State: ACgBeo2k6urN2dznZ941u6Qmo6nOHdh5B4zVD/iCfa7dXQ48NwFM0bud
 bmgW+7iGvRTEWd6Zaebue8puFA41f8c=
X-Google-Smtp-Source: AA6agR5Ps8hpXpWhwLR2yQPCrK/mjdhesph0GyWVLOf/7Oa9n1BdAAL6WFFKFORZKkK242Tj9YxLhw==
X-Received: by 2002:a17:906:4fd0:b0:73d:be5b:291b with SMTP id
 i16-20020a1709064fd000b0073dbe5b291bmr20858888ejw.157.1661960797372; 
 Wed, 31 Aug 2022 08:46:37 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 11/12] hw/isa/vt82c686: Embed RTCState in host device
Date: Wed, 31 Aug 2022 17:46:04 +0200
Message-Id: <20220831154605.12773-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
index 91686e9570..48cd4d0036 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -550,6 +550,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
@@ -571,6 +572,7 @@ static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
 
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
     object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
@@ -624,7 +626,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
2.37.3


