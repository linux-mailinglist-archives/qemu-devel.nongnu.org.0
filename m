Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C125A7AFD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:09:06 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKef-0002an-Eg
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXz-0006jd-2c; Wed, 31 Aug 2022 06:02:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXj-0002sk-Ht; Wed, 31 Aug 2022 06:02:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id nc14so22383154ejc.4;
 Wed, 31 Aug 2022 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=ll6REgkrTF5ggEcd8E4a0O9eWmjzQDTduFH8PLL0184pauPl8/2NZEvBsK5r0LSMyf
 6w/NdjJKVf1uAEGrnkvtPRiOZeL+iy9+9HwjqK2BuBHcDC6MUQ2BO32gskslbbU51Jqm
 ZhbtAzfDLAOEmXR5SHMKJNrSnSCa+TvJrh7x8VHv5yQtFCtx1RitB/4XWXSK2bDdSl4a
 o3kfMyYMqrmwT3m8xls9LIQEU0ywrySh1udcN2nyynf+wt8JKbJ6VJ+mkt24DC+hFKzn
 XSaEdDPYf4yYVCSXwIrqwYvNjX2pUZlhWHfthUcJ+RaZldVK3pOoKudX3s42AmkycruN
 52Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=XLWWluDAFjtReCj9gu7UHNsCxc/WsIk76Wdt35/ZHGSWC2mNm4fWzZX1GWykZHqGsL
 b/RxmZIhad8CVOjEwmGY6xZcRioNMD9DNKQyRUXE7b6DzrV/tHKjMmPf3xVC4JesfE2j
 k1HN20oFyev2vA0ejhNsjz3Gha7VdoKbsjmKpZDbRQTzsn3+c35/kONHRiBDrCEgmKBm
 dcNJJYSXw9FWj2vqBQTkDkAeO0bgH+hCRV532wxsPHOmIAjY25ZMTEaXq+I+IwqakzEY
 aXbGhz6G7wvJ0XDDZp50H6HJ7ofNLVOsTgsTuIKe48i19F6S3hVCG2CngAeHiLbp7a/Y
 /DdA==
X-Gm-Message-State: ACgBeo3ppFO0OX5Y79OcKDcgSutgjzdHS3XLoRgnc6AfllOJExKpL/LP
 X/+vlu/F6YZ9iy7sz57oRlH0CIqro8s=
X-Google-Smtp-Source: AA6agR5clYhfiC4ZOcwtAqC1wDrjiJI1BIbz85U1oTewx4w94Yvn0isFGyNv+4mVElntDpC9TkCZ0g==
X-Received: by 2002:a17:907:d08:b0:72f:b107:c07a with SMTP id
 gn8-20020a1709070d0800b0072fb107c07amr19897870ejc.340.1661940113766; 
 Wed, 31 Aug 2022 03:01:53 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 03/10] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Wed, 31 Aug 2022 11:59:07 +0200
Message-Id: <20220831095914.2041-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Unlike get_system_memory(), pci_address_space() respects the memory tree
available to the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9d12e1cae4..5582c0b179 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -589,7 +589,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           &error_fatal);
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
-- 
2.37.3


