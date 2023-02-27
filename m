Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6886A41C3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWchq-0004jI-4Y; Mon, 27 Feb 2023 07:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchT-0004Ws-TZ; Mon, 27 Feb 2023 07:33:52 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchR-0008Nv-OW; Mon, 27 Feb 2023 07:33:51 -0500
Received: by mail-ed1-x52d.google.com with SMTP id o15so22614294edr.13;
 Mon, 27 Feb 2023 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXt1ZpsJN5ZgwRHSb4ipAOnMsP1I28K0i627Hl46eSc=;
 b=mhw+0a26KA9Adgf4nsVCwN6IY4+U7DL58nT9urpc5bWlueZb1aZ8Wuuhns+pFDmLBj
 o8D238/f40ml8gsDjj3bXMS84Hzozh3FS2cnIkh4cKphsp4yhS+eWZolA+jo+jig5oKe
 +tl9DbR/eB1oJi615Qo1833/cwccr+AB/CwJU9HrOvdsULQMredl6ZzBsg+WzrmiYaU6
 iUIqrdfUXPszcmOZqECcSkjaXOiX9M1ymxdIbwrpq8DUEBQXR2kHjE06SLrFpEPwIph3
 8k1fqyOYp/MOkt40ZC453kTseU76/gO5SI6LdmYBmdnE/INpg0MsNi5hzVO9GfBHaH8V
 uLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXt1ZpsJN5ZgwRHSb4ipAOnMsP1I28K0i627Hl46eSc=;
 b=MW/2FlstkjrmYpYw92rf5MPDpLRXqutMUxQ+NoG1iAPghSnWRlrOhZVTzHRpEeaHw+
 wRgD/SFYjQuQum7CJQ7sjSXc9dHlxQ18nPVu8jUO/ZphwFT8NS+nZOJEmZnKJ7inyh98
 UI9mbGn690vqNIuvf4XiYSqX1FxbtkE927gcbOGzx4anCnYet3WGedXKP1YOOd2fR0IF
 LYQSQNBXDNXfFNs3BvOd+rlJZ3e8G9aolWZv0CP5m5EHCteJ4pVDtCNFfzlDh8Wpgb6x
 brfBEhq/YxWPvAhAyOLWn4ApwrPZfQKMtiTD7va7fXGyI9yrtp5FWStsE8rorwwIaI1w
 +f/A==
X-Gm-Message-State: AO0yUKUOLuOVMkKukajSopP55dEkLsfgbFHf+8Ii7rlyMJEAxhBpDRyL
 8fLwWjE4powJxq1/JQhPdfuR/voYXLk=
X-Google-Smtp-Source: AK7set97bFlND77iX6WS3TrFL3URVpbMPOqOYcR0KQb5/IdzTv41y25jrrVpKv8ZRyHa46J7w942cw==
X-Received: by 2002:a17:907:6e8a:b0:8de:502e:2061 with SMTP id
 sh10-20020a1709076e8a00b008de502e2061mr7998006ejc.3.1677501227871; 
 Mon, 27 Feb 2023 04:33:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 oy26-20020a170907105a00b008b133f9b33dsm3092124ejb.169.2023.02.27.04.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:33:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Rene Engel <ReneEngel80@emailn.de>
Subject: [PATCH v3 3/3] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
Date: Mon, 27 Feb 2023 13:33:16 +0100
Message-Id: <20230227123316.18719-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227123316.18719-1-shentey@gmail.com>
References: <20230227123316.18719-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

According to the PCI specification, PCI_INTERRUPT_LINE shall have no
effect on hardware operations. Now that the VIA south bridges implement
the internal PCI interrupt router let's be more conformant to the PCI
specification.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/usb/vt82c686-uhci-pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 46a901f56f..b4884c9011 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,17 +1,7 @@
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
-static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
-{
-    UHCIState *s = opaque;
-    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
-    if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
-    }
-}
-
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
-    object_unref(s->irq);
-    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.39.2


