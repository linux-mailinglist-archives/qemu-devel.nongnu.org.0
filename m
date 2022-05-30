Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B2537A6F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:12:54 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveGT-0000bY-D7
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdaJ-0001Rl-8T
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:22 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdaH-0001UB-IU
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:29:18 -0400
Received: by mail-pl1-x635.google.com with SMTP id w3so10053011plp.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4vm5jZ9TRldGyYRbAdinFtRSddzUKOPwSaq3LzDjBM=;
 b=e9Th+fdPFELEG7YJlF/DvBFBnnkeUuMXyctZZwHB0MqIS3NYzYwFsS7O8zV/0npK33
 NkxunkyiLkEfiiCMywEKEOSA5+ESIqAw4iPh1SSo1dqh0xoy087OYW96HR6b1WK2qvA0
 799t3yhcksYEFkC2P7BTZPoyd++9tntGcHJ9NpzZ1QqQJDfcaPwB/sHDJr1JaxjM2Bcp
 /9W7X9Qpodp9UzBgYjW4AXC83IHG0lEeGTnp0eUJvPEzql7BC4VyzTd/1XLK3P7Y3P83
 52nstE2Mlc/cZKgYkiW4jOxKddd2DU43lsKmD/cmmUYfKR/IrhtGeX7Z9j+ngoLis8T5
 j6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4vm5jZ9TRldGyYRbAdinFtRSddzUKOPwSaq3LzDjBM=;
 b=jbH9qlBuGtTI9KHC8DfbVX4nuoDptjW2kRnYrtQuYOdOV5E7fNWVHP/0zDUgu6Io1U
 rM9Ut2x16wcEA92lF50/YU49n1MvwRUbU0ZV3wA6McmltHhv6cjsuPaYISc2LJQssRK+
 TaqZaVLy9bdb8t0DGikG+iBGa/n3kwmDjPdmi6zCffYjRjatHl4wCncMzYcTvMY/5y6b
 jMUyKtEuGGW3yHq3O9HgNNXZsmWtHLcW8jooJtr5SbQ7ITBvqGOaevYCn+ZUYbj7pyLN
 no/taKxBt1tPfDO+2gwJYJsPGD+l9lCS95jjewInPC+isyfuwQA+8TisLTuQIgzKGav7
 Ynpg==
X-Gm-Message-State: AOAM533t2SYpucrzsdZfKUF9AIsYgvlxexsWTulNPk24rhtUHeZ8BrcS
 oAe5Dx7Is5ee7hpvOqaMUz0=
X-Google-Smtp-Source: ABdhPJxQFvnkdQavuCvbtMim8A8I6uQhCbNVHc25YZDrn97CIzJS2LzVhBYcf+xrAzEW0LKALnLZJA==
X-Received: by 2002:a17:902:d582:b0:161:c681:c326 with SMTP id
 k2-20020a170902d58200b00161c681c326mr55495618plh.84.1653910155269; 
 Mon, 30 May 2022 04:29:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a1bc400b001e2d2235176sm3189215pjr.51.2022.05.30.04.29.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:29:14 -0700 (PDT)
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
Subject: [PATCH v2 11/11] hw/acpi/piix4: remove unused piix4_pm_initfn()
 function
Date: Mon, 30 May 2022 13:27:18 +0200
Message-Id: <20220530112718.26582-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
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

This function is now unused and so can be completely removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-13-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 19 -------------------
 include/hw/southbridge/piix.h |  4 ----
 2 files changed, 23 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 32033bc9d7..0a81f1ad93 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -505,25 +505,6 @@ static void piix4_pm_init(Object *obj)
     qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
 }
 
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              bool smm_enabled)
-{
-    PCIDevice *pci_dev;
-    DeviceState *dev;
-    PIIX4PMState *s;
-
-    pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
-    dev = DEVICE(pci_dev);
-    qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
-    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
-
-    s = PIIX4_PM(dev);
-
-    pci_realize_and_unref(pci_dev, bus, &error_fatal);
-
-    return s;
-}
-
 static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
 {
     PIIX4PMState *s = opaque;
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b69e0dfb04..976b4da582 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,6 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
-#include "hw/acpi/piix4.h"
-
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


