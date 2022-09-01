Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CB5A961F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:59:53 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTirQ-0002BE-ND
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaR-0005h3-BD; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaC-0000E1-4G; Thu, 01 Sep 2022 07:42:18 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gb36so13197707ejc.10;
 Thu, 01 Sep 2022 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=nNrcfHuvlVW9kpOMhNuh1N6e92wb+572ju3/hKbVAD18z/u7OI21ZPJ7Vy9MyBukk9
 TqMvVCqDstaw6w9C5f0kPC0Wih/X+Ij6uK2113+u9MYy3k0KqVi1Uve0bSI3abKC7gVZ
 tuY0wNxtA4ptXs7HY7YxdPKxb20LWs+UhmRaJWg0rewFh83VdoduFSz/KsoVcwbHvh/i
 pcmfdfjSYWC8etA/aH3/i5XrRTejWuTtSbwa4isCubVtokP5hfX6Vh2DaYdQqxayONq1
 GltDydv1GbaEJhKJFp/Bcp3zg9BGrUggJzHX8qXdQOS7V4aPTYU1udH1Vn50mtHi6KJH
 KNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kziy975Ku9ck3Do5y4RHLxQM6WcJLVSaw/Wzvh4zx/s=;
 b=8EFrjSl05TKd5ByouzIXpBprkDO3H0m5dXJNsKP94VKOb0WfZwoR0mW8xXk9Ca1zGp
 I1/PcYWuhEoo9HqeIoSjlexxtccvYE/TytU/cKcsYH8NQiBq/ieOxgQqn/nyyzuJxqhw
 J36IriHT4yrZ/GeziaEDrX8V4yD7i2jc4gkkuLkN/y3ZpXrUSBof8Q6eXHYSZtNKBY5y
 te69FNlX1VOq82WgPuNExZzpTWaZmqLIqbBRvPT1p550EFJwr4/8FNoQvLgni5vPyYym
 HXW5VywtBaFFyHc5TEGrwJ22xMRF6yhl6LkIfMfn5znk1iVrs8K9naGOZ37caW6FJwza
 VwaA==
X-Gm-Message-State: ACgBeo0omthy6N7xVZa0cpgsORDXkIirQbRbxU/A9Hd7T5kH3MfCwvoe
 xL7ib2OBxcDhrwz+SRgyNX4mXYeToR0=
X-Google-Smtp-Source: AA6agR6qFULVX3R1Xa8MHv0QE07bJGvrOoFUqPyES5GpzCnkaNvTnMXYq18m2D4n6YmY6fKb9I8jBw==
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id
 p27-20020a1709060e9b00b00730a6a19fc9mr23314410ejf.601.1662032519943; 
 Thu, 01 Sep 2022 04:41:59 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:41:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 03/13] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Thu,  1 Sep 2022 13:41:17 +0200
Message-Id: <20220901114127.53914-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
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


