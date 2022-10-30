Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB57612D7C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGti-00086R-Lq; Sun, 30 Oct 2022 18:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGs0-0003MY-6K
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrx-0000Ai-IY
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id g12so13656142wrs.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaljxaQNlFmc4Z/p7eQ7X46FOizDdCb0oWN28wVwFGw=;
 b=uK4VSTLiBacY8D/ch8KmcTikej23tpTS1xeOaSX/+ahh3G67nDWaqYmn2klJTSWcZU
 RAf2nI4AtNu3AUER1tUta9JJO0cVNR7ELYURx/EJ58FXoq/zQQqlS6zmDa69zDvlRc0L
 xmSTGgBibBjK39B7kHAT4Uo2Ed8Iodf6vrXAHrz8NkChCHTZNDBZ0J8ntEUFofBuzdDf
 4u8hb0rCOjzuyKOmqv/lXlDa5vBkvab2bsmE5G/I9WPD4+h4HQHr+lK6EPkWPvrME/GH
 O+u118uOqTiB9sRwE1dxDVlZsfbA+cVXzz1IDPC/HQTIf32+1YKtFznxooqDBNCcnNzy
 zlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaljxaQNlFmc4Z/p7eQ7X46FOizDdCb0oWN28wVwFGw=;
 b=Yi6QXGbtpe3pYibEIdAw1+5Qi7ygSAz0DEcZ3XgcjkvaxlUU/bLkUrUc3FvjmYmhha
 j0KwfmjgFszOgpSWJBNd0EN31eexIbKQuhI+LZ/cXEvT195lT7Kjn5Chqsz9elgMbwbn
 sVqOZTw+k92Awnv8O3jCw/63oixH58AmGmVGtso4UEZxc6mq3Z96Mr73uHgQdaZH/VEl
 94n0cwFbCM1yokt/pbparAhIuj/OhXTtTDMzjXZnntqjew90PBqvhKxQwbR/REGNPaxr
 Mb2lK2DF8e1gxZftPDGPYT47Y9fMXA84hXgtLAxWlIlEzKWre0DljWVQXb/bhvqr4mkE
 d1vg==
X-Gm-Message-State: ACrzQf2bU/zxgOH2FqMxRBIW7PwIpY+XvNvUp59HWwCTHt7B7sUu/SVR
 ffyWWxdujr7bv8nna98BWigjI0iZNFJiMQ==
X-Google-Smtp-Source: AMsMyM4yyO274B9zGGg/L5gGFvhJmyBAPEXHySqCUR0DhR33JYDYhrCOUW4+k24LqED05/MK4FEMtg==
X-Received: by 2002:adf:ebcf:0:b0:22c:9eb4:d6f6 with SMTP id
 v15-20020adfebcf000000b0022c9eb4d6f6mr6100972wrn.251.1667169207999; 
 Sun, 30 Oct 2022 15:33:27 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm5376871wmb.42.2022.10.30.15.33.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 43/55] hw/isa/piix3: Modernize reset handling
Date: Sun, 30 Oct 2022 23:28:29 +0100
Message-Id: <20221030222841.42377-44-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Rather than registering the reset handler via a function which
appends the handler to a global list, prefer to implement it as
a virtual method - PIIX4 does the same already.

Note that this means that piix3_reset can now also be called writing to
the relevant configuration space register on a PCI bridge.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix3.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 72dbf688d9..723ad0a896 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -31,7 +31,6 @@
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/xen.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -156,9 +155,9 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(void *opaque)
+static void piix3_reset(DeviceState *dev)
 {
-    PIIX3State *d = opaque;
+    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -313,8 +312,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
-    qemu_register_reset(piix3_reset, d);
-
     i8257_dma_init(isa_bus, 0);
 }
 
@@ -337,6 +334,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.37.3


