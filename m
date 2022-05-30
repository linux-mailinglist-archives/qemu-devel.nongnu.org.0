Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB9537A5C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:07:32 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveBF-0000xb-Js
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdaC-0001KU-4e
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:15 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvda6-0001T3-AW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:11 -0400
Received: by mail-pf1-x42f.google.com with SMTP id j6so10314998pfe.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mth1gvUbuD4AT0F5emQ5fFGB+oFvgzntgmPLZykCEgk=;
 b=YFyA6YyiGZkkNP4wZGZ5ATpr7ZA9BcvKzfCckF+xdXNZI+3loydGdlwZvKxrNbRpxY
 z6Atxs6DxghYD00iqhDP/NioWkd6va+9rI93jcDDt/D0dCqIJD9a3PQ6BZ9OVJeYKVrR
 SifmwG2h3RF6CmPUfAE4/c/B2N64fszvB2zMl4OrFcFl9vrv55om1y19RDzdD1qXOSRv
 QUlLmJQzdi0IlZL5pUBtH/XpVCMkaL5/lMZC9TewavkPgypeLmjKuoZ5ALOd9Jd/2x3p
 xiXdXjJwTQhEtenXP1KG0qaCZyGn4n/IOnK/pHQisK07LUuhFZQuo6uYFZqk0yRRvxlh
 Qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mth1gvUbuD4AT0F5emQ5fFGB+oFvgzntgmPLZykCEgk=;
 b=m9nRPYMr4khmbvug9mIUG2EYHqkJKH5MHUWLgNvieGLtKF1/KVXjTa5NPToKO+/l2N
 ze1uW147RjZnWD9aNTQVBEX4sT7NAeQarNH03StC8gBCi+OA/fQTUEY4gQ98trwyrVl1
 UYO+HWv/wwqLcSoj0fGSU84AVL/8t4D/ql8h8b4DQ+IEXLlLpDewddBSP4HOFrnfuM2E
 5o7ov60Ear9JI68S3GzlQPSl9VEKZIHwJru3k0PGWZS8xnHPisl9ETJrMQDlZabyZkMZ
 +/GnnZnTInM8EoOuyg2mFWizThG6SH228mBOFQzCfmd4op3fAVdRhDCzRH7J4LD+aFlB
 D1Zg==
X-Gm-Message-State: AOAM532kAZXMyo5AWONvJcSA/HVUamKvAlWuyAykzoZl/vyDXlfZJ9bb
 eisy4eUEU/ybQvloE1vFovg=
X-Google-Smtp-Source: ABdhPJw2HRYvEPYs42+NzxejWE6cgop6kpoYvz+VuJEdeYDDe1zwrx10Ujc1cznPh1ln1tqrnqu26g==
X-Received: by 2002:a63:8043:0:b0:3fb:984f:69b2 with SMTP id
 j64-20020a638043000000b003fb984f69b2mr15585755pgd.108.1653910145196; 
 Mon, 30 May 2022 04:29:05 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170902f65000b0015e8d4eb2ccsm8880823plg.278.2022.05.30.04.29.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:29:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 10/11] hw/isa/piix4.c: create PIIX4_PM device directly
 instead of using piix4_pm_initfn()
Date: Mon, 30 May 2022 13:27:17 +0200
Message-Id: <20220530112718.26582-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 775e15eb20..9a6d981037 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -34,6 +34,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
+#include "hw/acpi/piix4.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -293,7 +294,6 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
-    PIIX4PMState *pms;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -311,10 +311,13 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, 0);
-        qdev_connect_gpio_out(DEVICE(pms), 0,
+        pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
+        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
+        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
+        pci_realize_and_unref(pci, pci_bus, &error_fatal);
+        qdev_connect_gpio_out(DEVICE(pci), 0,
                               qdev_get_gpio_in_named(dev, "isa", 9));
-        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
+        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-- 
2.36.1


