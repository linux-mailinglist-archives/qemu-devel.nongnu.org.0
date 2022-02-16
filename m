Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E104B9439
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:56:19 +0100 (CET)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTDe-00052D-4H
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT9m-0000xV-RE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:52:18 -0500
Received: from [2a00:1450:4864:20::136] (port=42967
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT9l-0004Qp-6x
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:52:18 -0500
Received: by mail-lf1-x136.google.com with SMTP id e5so6587056lfr.9
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fR+hSpTVUnCA2HhlgC/TOPy1wuGqJeKHWsmQuOseKtM=;
 b=TEL3bGyAmQEcpGKCvJ4iKJbwFfdPAg1vduy/Sv8uyqt6H2S2lnIJFx+hqevUL3yN+t
 4JdhR0sSc0d/eQn9LU9mSbo03EkOgaJJKRGjXRK3LjuKlL2zG4Yxo442AY1rmX8dG7/F
 VJtWBerk9rWMg+4jSVkpvO4pgYddOox0MqcmRW6TUhvfBANiF4JYh10rcQKzs1PLSO0k
 PcDMPco+hY+Y4IPyHAekkexm1WwmbXPh51sIZW7YW0WgKhdl+VL0JN14loCYkzj4kqYJ
 VLE7nDoXR6btjpMhS80bXS8Uf7srfGjNkG4J7oZZ+Y8Cw9LphmwcjB41UqNHknGnfzIT
 P5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fR+hSpTVUnCA2HhlgC/TOPy1wuGqJeKHWsmQuOseKtM=;
 b=mezV1HkwDlbLoxoC5cMxLWTzUOyvZKTmdQJy0WE5oEnuBOMWApmp2unQ9CYscqUjIN
 MHLdsNSmg//wJV1uu8dPtZDQpUSd49yZjAzg0cN4Pf6qutdLdYn3vT/UuIgBXDoJ42o2
 bPjiZViWAq8B3ijGQH/bR/l8R2BZo41b4WxbaqpJWR/iCoyuWX43qYQbjaIvlX4gzCLF
 rWZDl7dAOLd+KoVe4IHOaUo09hxPu/1YdcClPJvxsrBos6mjchFNkN9l16IhhpKQvC1X
 6NdrVPbjaKZrQk/dGov+b7uf7J/zI6Mpehlrftk8yy3um1Lmjys8XRKbQCUyqmEla41o
 KpZQ==
X-Gm-Message-State: AOAM5309KplEn3He6LpPruT1BOW6ZtCSPkWp3YOEf4VaGu5fPI7qpXy9
 nn8kjl/RHwW345sovvhJDh6hiqgOuZU=
X-Google-Smtp-Source: ABdhPJzyp6gztMFMkJUkB2mVbFp29gZVAVw00whdurJJ3SEepsUmBJH7FAFId5r/InUq4xfG+7Eevw==
X-Received: by 2002:a17:907:c92:b0:6b5:c8ae:7918 with SMTP id
 gi18-20020a1709070c9200b006b5c8ae7918mr136550ejc.531.1645051560991; 
 Wed, 16 Feb 2022 14:46:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:46:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] hw/isa/piix4: Resolve global instance variable
Date: Wed, 16 Feb 2022 23:45:17 +0100
Message-Id: <20220216224519.157233-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that piix4_set_irq's opaque parameter references own PIIX4State,
piix4_dev becomes redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 10 +++-------
 include/hw/southbridge/piix.h |  2 --
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index caa2002e2c..2e9b5ccada 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -39,8 +39,6 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-PCIDevice *piix4_dev;
-
 struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
@@ -58,16 +56,16 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
     PIIX4State *s = opaque;
-    PCIBus *bus = pci_get_bus(piix4_dev);
+    PCIBus *bus = pci_get_bus(&s->dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
-    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
+    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
     if (pic_irq < 16) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
         for (i = 0; i < 4; i++) {
-            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
+            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
@@ -219,8 +217,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
-
-    piix4_dev = dev;
 }
 
 static void piix4_init(Object *obj)
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 6387f2b612..f63f83e5c6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,8 +70,6 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
-extern PCIDevice *piix4_dev;
-
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.35.1


