Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B867D4B9D28
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:31:29 +0100 (CET)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKe4L-0007D8-Px
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:31:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdth-0006cP-Lx
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:25 -0500
Received: from [2a00:1450:4864:20::530] (port=42592
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtf-0002v2-1K
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id i11so7081642eda.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPo1LMB8EjG1PKoS7SlXIi3cecxwyMrfD2W0YBpiTmQ=;
 b=SUDeAihqN00OmUM1xdaStiOmlN4tnbim5qRwGyIKiIIW26NAL7G3EteV0xKt/B/PX0
 lwpM301tPUF2N4W44UpOKTThejRuPKKDRLDm6rGmbapd3JSbcwH3gQYyAgJKzjMnvfC3
 PVhfBueP/+2oMBmS65mqWwbfkbLBtIwror4IPfyGnuPZhozIJElDhp/pxMQQay7918C+
 WJ1wBT70paG3klariMxRePGZSqlsQ58FY/1W9mxJbaLvXEikxDuxH4AnUWxteNQFOtuc
 gga4q+xxr7pgv20rMsF2sWeFQAc2cy99td0SaATEUsUA0u3AxnSlI0/7uOabPUIPrC/3
 Yr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPo1LMB8EjG1PKoS7SlXIi3cecxwyMrfD2W0YBpiTmQ=;
 b=HioVKEX+ZHyHVYZgUH5UOWcsuwNKhv/R/bWkjnDmJO1fgYkXhPht32BtVg+PpL/zxY
 su9ri74RN/Y1OMy6IdlG01Rx7BpC8Ts01RjG/a8TgxvJI4a7/ZoIKTMhFAKpdVe8WSzM
 sG48iIaBTouWoftrWBvtqwhHgR406/33Kmf7LUrEi7wd67mHS6gWex1HBjCktA8MFziP
 dsb4u3Ny6avfSBk/SgamKkC8zGlJ3FxvKwOcb7QTbd1WLO/0qrlaP5nkVNSIVcLJeN2Z
 hci0skHWcYqPo7h1yV9J76K1xm7HcdCKCx3QDlis0uXUzmzepzrdkOiXuDXo+EyUinlZ
 6VZg==
X-Gm-Message-State: AOAM531trI52WtROF2IHBaOFYbSoXbVEJvdbVDLQwy2lFhouExMvnuDJ
 I7L6FBx2SVATD2q4M782FqlMaBE8QAU=
X-Google-Smtp-Source: ABdhPJyGJooTDpFvQR2bet5NgkIx3+F7JTUIaWrAIIkJE/nNDFC4zO3Dnq/3/HiyOXbObx4s1GMuLw==
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr1812566edc.438.1645093221585; 
 Thu, 17 Feb 2022 02:20:21 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] hw/isa/piix4: Resolve redundant i8259[] attribute
Date: Thu, 17 Feb 2022 11:19:20 +0100
Message-Id: <20220217101924.15347-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
PIIX4State to make the code movement more obvious. However, i8259[]
seems redundant to *isa, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 196b56e69c..179968b18e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,6 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
-    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -320,11 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
-
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
 
     return dev;
 }
-- 
2.35.1


