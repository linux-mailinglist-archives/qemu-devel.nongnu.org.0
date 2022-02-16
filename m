Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9004B9400
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:48:49 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKT6O-0001yl-8z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3i-0007bI-3f
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:03 -0500
Received: from [2a00:1450:4864:20::62e] (port=41774
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3g-0003S3-Mg
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:01 -0500
Received: by mail-ej1-x62e.google.com with SMTP id a8so2559275ejc.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsH7psBDlNZ46FWkWuLCo+KqCVzav8ctlundqbcFfp8=;
 b=IYVMHdrPIxxGmVvTginocTtQV952330510rl0cFmuUhvfdJDwC728kGimyPG7Bhi6T
 WWvUzalH4i5Ii2Grb5ZRyWAABnCfShJXIOo3nUd7NwQiwlQGUOT+DhrzAckwegML9gtv
 VMw00g9uixkIy1kWipbU3UP8vvrb/Ha7hBnmi2T44DJMQtg9SEDcAldCgwqW13ktvNSP
 DPTcSuoQy7ZHI+xXaD+kKtGleq5Ls5fNyaHvlw75wAyGiV/EHOM7/c+gtsgeG3OnOnWI
 U2q2oerbNmw+rZcYm7FAILo0NPlvkumlyN/s4OkryADnFkRam2U60sY9opVlFjB3E1Mr
 LMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsH7psBDlNZ46FWkWuLCo+KqCVzav8ctlundqbcFfp8=;
 b=fkYFskDQT3vgLQPCPyaEFLQnE3sSU6zyy0uP7MBIwZB9d8PuYS5O8caQdiTjGcfbAW
 u1o4FV7DMdEzFfiwabXy6oIbrCM6mGgd1/9PTBps0Dut8oJB+Hxlt6LlRvoR1OH/4ftz
 uZVj1dcEU7ort9TPYLGuVs4Qm6kM5fLRW6Dhj0wYUmT1y5bKpPT20/GiOSuUHr2z3h6g
 2BDVoeL0lxWtASVKx7uoOiTEDBuHSv/tx3CivZyDo5agS9wlDoUpT3jqeuzqMb3qxcdI
 /5WFcHlmqHUBwYwELqJPS2chhZgWVAUrOgSfhv/qTB1wNFLNQYyl3bow/04TleQzKg2s
 bi7A==
X-Gm-Message-State: AOAM530UltNCEXWWcl0E+K4ZxzVTxXtW+P+LDVgSLY3pMiN5g+U98qGZ
 8tETEZFDAYICqczt34PHkTsZeNFcqHI=
X-Google-Smtp-Source: ABdhPJxKkalKww9hIXgmHJqB6KRzvSaRyU+TxVarNQQhbdq8BQAfTu3QBHRAW9BD6CLbiTDZJiJ9xw==
X-Received: by 2002:a17:906:3905:b0:6cf:7ef5:fee0 with SMTP id
 f5-20020a170906390500b006cf7ef5fee0mr148614eje.307.1645051559377; 
 Wed, 16 Feb 2022 14:45:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:45:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] hw/isa/piix4: Pass PIIX4State as opaque parameter for
 piix4_set_irq()
Date: Wed, 16 Feb 2022 23:45:16 +0100
Message-Id: <20220216224519.157233-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing PIIX4State rather than just the qemu_irq allows for resolving
the global piix4_dev variable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 179968b18e..caa2002e2c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -57,7 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
+    PIIX4State *s = opaque;
     PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
@@ -71,7 +71,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(pic[pic_irq], pic_level);
+        qemu_set_irq(s->isa[pic_irq], pic_level);
     }
 }
 
@@ -319,7 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
 
     return dev;
 }
-- 
2.35.1


