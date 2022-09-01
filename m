Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3065A9623
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:00:19 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTirq-0002bg-8J
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaT-0005h8-77; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaJ-0000Ff-O4; Thu, 01 Sep 2022 07:42:20 -0400
Received: by mail-ej1-x62c.google.com with SMTP id kk26so34031683ejc.11;
 Thu, 01 Sep 2022 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gLfUGnAVToF9YqO6CURY5qXIngPZ9Wpmw00YUrrVUss=;
 b=am6jwHFe5kH8Pf0UMrqmNfQhYoIEzmwI60mq3pkr/PC/WyWcXJUmkuusBRI1nsjOFH
 2VZyUlFm7uOK57Cd6IxOPw7QOkWNvT/SAkl5oYH5hfgkRguYC6AnalcEx4hVxZuq9/JS
 0XPcUtZtvWmCyuO2MNTvRqvMnMEiZO+SYkuxXEtzDyGAh5phP2KKksoZeIphMD7bBkw6
 0wwE+2fVLkprJhakl3pZ0UldRrUhrejzEIGQNNnEm66Oturxp003Vk6Oa8dHPa9lGYAB
 Ir+H6Z8G6RHCmNEjQ0Y242SMKZTOLauSxrB6uxhL+otIAliBWaQXQ+MvGSaCFScN3VyU
 YHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gLfUGnAVToF9YqO6CURY5qXIngPZ9Wpmw00YUrrVUss=;
 b=Kg+DK5E1FL/I5POei4MwGJHjXrM37ro8MWI3uWdbX4hF7VyXTzqJFvB+K1ai6MVSHU
 EPpCPHYvl9EH+tZlVf8sbvn3JpHsZozqUb7LIlQa8e+BoApXS31KbRmYNKdfH/+ugx28
 DQNs9IKGreBU/SM+hnswyZSHTX+Fl92k25Ai79DzwLJbnUrbPk3KZLpq/e4VDynqrpUX
 m14VSGRdMOR/+vvBRiMcSpy30zqESIwSYvhiAQrXpBhr6+OD8Yx0nq6VXijsALB36ipj
 ORNxjkR25469tSE1LFJNqL11Sg7ScX3nsPFEzHscPhagSV+Kuz2IGm4RuIKHWZt2JTxS
 Af1w==
X-Gm-Message-State: ACgBeo1xbNpAa7I7ch+jki4cfwA+wt5ansmLuQgJp7xk9uiPp8or64GI
 Oh5CO/gwhbhlpNEpN3WTbWsbfstpfzg=
X-Google-Smtp-Source: AA6agR4gBW4E3FtBYyh6LB8dS/u5ueC9EnT4YZU0nYVmFDwjSZHHPgF9Q/t8HuGiCZjyTS30cUixpQ==
X-Received: by 2002:a17:907:75e8:b0:730:ccd3:2683 with SMTP id
 jz8-20020a17090775e800b00730ccd32683mr23417025ejc.329.1662032529151; 
 Thu, 01 Sep 2022 04:42:09 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 12/13] hw/isa/vt82c686: Embed RTCState in host device
Date: Thu,  1 Sep 2022 13:41:26 +0200
Message-Id: <20220901114127.53914-13-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
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


