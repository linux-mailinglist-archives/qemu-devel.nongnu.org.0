Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D959C68A488
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qd-0000LT-BJ; Fri, 03 Feb 2023 16:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QM-0000F8-Ci
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:56 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QJ-0006Cn-62
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:45 -0500
Received: by mail-ed1-x535.google.com with SMTP id u21so6424127edv.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCe5fq1LEdCOCuZfIaOgrR1H22bGU2FTnkvkdNk/zEU=;
 b=sga5CwGkHM9CRvff0crmalFXpNd020JW9AL7+egepLvMqBS4p9D7ETsZ3J7ARDWqgj
 kR/W2gwiBwLoSy4m9X07vSJtZR9YytVugXFaKF4XLMlQHCVzdmRq6Y/vpE8sIKgpxhna
 cOWzFiwU83E1juQUF/BzVjkZ2PNyHI/JCGxyRGMO1KPRTMwOexoVR/P6cZ8D3tvxGxOO
 9MYI6jCOGS/lOBxvfWY/jryRh17sH/8fvi3wuniuRBfNrPRGsjIPDIzMm779/KBfXNvJ
 ZufnDod+XFy633X+Cdu7sdy2sdkD5HBrmV7gWb5ERWJ6f8yFlsmBf1LtmOVHJxQf+Lhb
 tvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCe5fq1LEdCOCuZfIaOgrR1H22bGU2FTnkvkdNk/zEU=;
 b=fVJoq40gvrx2xIAgylMCSaUrBzrw+I8scB5JHY/1ueKW7nc3vIEWm4ySHpENuVUgGs
 +BmB22d+QOEJ1AdBChCIyxd9bTGmnzihMyyOaei8qVl+6gN/xS6yTwMZ0vBSPnG3ytIi
 vryjEbWCH8ObNgOOzCQWCfJYscPCPCO2rK9NBWZQrgpgrooXMQU5QKDMIK7cx5J1TA7+
 IuDJeAMBJj4QV8N3tXGQDPJe/iu9u5Y92fn6Ta7L6KAkn89HWhZrI+nJmjTBjKzvzfI3
 Hkhc5sVvpFrydqt5pXMVQ+NPzV7Q17MANb0TV+vA/WAEjIqZJYBgdPi+3dbdYbSLENYH
 e2jw==
X-Gm-Message-State: AO0yUKWzFU1J96hCZO8gUiwsH3bp2SEPL4r0AN0bA4WgncHLTYQCIr06
 TOLMXIS9kCva74AqcPl8QDhAUDhsij7+mq9T
X-Google-Smtp-Source: AK7set9OziNcQ6IqENo7+TkdxHDkZ3YkihJ7++Z8I/53PInEblm9n1Nr1bvlWzfk6Q4xe8GsJDVGOQ==
X-Received: by 2002:a05:6402:34d6:b0:4a2:2e8a:14cc with SMTP id
 w22-20020a05640234d600b004a22e8a14ccmr16533258edc.1.1675459001193; 
 Fri, 03 Feb 2023 13:16:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060a4a00b00880dbd4b6d4sm1876093ejf.136.2023.02.03.13.16.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:16:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/pci-host/raven: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 22:16:20 +0100
Message-Id: <20230203211623.50930-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

All calls use either errp=&error_fatal or NULL, so
converting to the QDev API is almost a no-op (QDev API
always uses &error_abort).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/raven.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index cdfb62ac2e..2c842d2146 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -246,8 +246,7 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
         /* According to PReP specification section 6.1.6 "System Interrupt
          * Assignments", all PCI interrupts are routed via IRQ 15 */
         s->or_irq = OR_IRQ(object_new(TYPE_OR_IRQ));
-        object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
-                                &error_fatal);
+        qdev_prop_set_uint16(DEVICE(s->or_irq), "num-lines", PCI_NUM_PINS);
         qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
         sysbus_init_irq(dev, &s->or_irq->out_irq);
 
@@ -319,8 +318,7 @@ static void raven_pcihost_initfn(Object *obj)
 
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DEVICE);
     pci_dev = DEVICE(&s->pci_dev);
-    object_property_set_int(OBJECT(&s->pci_dev), "addr", PCI_DEVFN(0, 0),
-                            NULL);
+    qdev_prop_set_int32(pci_dev, "addr", PCI_DEVFN(0, 0));
     qdev_prop_set_bit(pci_dev, "multifunction", false);
 }
 
-- 
2.38.1


