Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA94B9CFB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:25:36 +0100 (CET)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdyh-0001Ly-8x
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:25:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtg-0006cK-2l
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:25 -0500
Received: from [2a00:1450:4864:20::52f] (port=35338
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdte-0002uM-3E
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:23 -0500
Received: by mail-ed1-x52f.google.com with SMTP id f17so8780429edd.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DChXguDILJX7hAfj1nv8VIcMQ6DAEI68Y7I8Xvc3k5g=;
 b=DTg6YNsMvXNavOdjSCAVw/4jyqIRWbvxcDno38Z8Qm9jC0dsnS+ClRfIPcskaIUUM7
 BD2S1AltEG+uItd1XWaGPJr7fwjIM9oQ6qzTACO2lSQ6qn2NsfyxAblpluv3jxy1LxCk
 PvVkf7WIpoafLDRo9iKv7fA1hnC+fg+Scyv7J6BjmoWhkGhEzh1GIlr4DVeqdUwbH5i7
 w0wns6I774MRKCcD0xcTSzekdbzsE5v4L7KeFqUKZJg6U8uLcT/2+UbbhO4jZsEI7ual
 kNC/JEeWBIOhMRKMnRtYzlIBsDxqqvkcahvMX1hTEtjCyG6mgvOq+Z4cLANDTwKiSEAi
 1ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DChXguDILJX7hAfj1nv8VIcMQ6DAEI68Y7I8Xvc3k5g=;
 b=EdDg8LC5e6oF0FnEMiqxpEfpiFtBPxjHcsOXk9ru4ar3f8lEfqGPktlWpzwbzyReZW
 V8GY2XL2T4ezs2PGdPTs5VFTYXu/s7O1jGl0rd1XAT+kFXFT7ZZSgemj66omJ/B8nBlu
 RqDoO74nc8UQEv6Uk2kCB2kHpWhC7xblRq4CHMPVvDtMnoPhBj/wr6FeZxQUyJG4wyA7
 PYFUkKA/DWKETn5aDNe1/0RqF28A4JJ3+9XNb2tDiJO1YI7oaicLHzbRAb/USh/Sp8Z6
 H+FOCVAMNx33puaDUaw69CIotWlAx3EhKGpyFJswJvwhcL61chHBIgYFfHd2gf418imZ
 iksg==
X-Gm-Message-State: AOAM5319XEOLVuDxzfnCwvUBuiL1ap3eVGU5KKZ/W4tM1XMyhE4iOhlM
 KQvRVe88+Y8XKoq0kvOt30jZH8uXV7g=
X-Google-Smtp-Source: ABdhPJyvCAjtPXYmkJXrPwAi6nuBYIlmY9ARai2HUcw3XYGw+Jb8hIRClvdYPZgDmtDkEHXTfuawEQ==
X-Received: by 2002:a05:6402:34c5:b0:411:f082:d69 with SMTP id
 w5-20020a05640234c500b00411f0820d69mr1813940edc.65.1645093219550; 
 Thu, 17 Feb 2022 02:20:19 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be
 preserved during migration
Date: Thu, 17 Feb 2022 11:19:18 +0100
Message-Id: <20220217101924.15347-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:

  piix_pci: eliminate PIIX3State::pci_irq_levels

  PIIX3State::pci_irq_levels are redundant which is already tracked by
  PCIBus layer. So eliminate them.

The IRQ levels in the PCIBus layer are already preserved during
migration. By reusing them and rather than having a redundant implementation
the bug is avoided in the first place.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/gt64xxx_pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index c7480bd019..4cbd0911f5 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1006,14 +1006,11 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
     }
 }
 
-static int pci_irq_levels[4];
-
 static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
     qemu_irq *pic = opaque;
-
-    pci_irq_levels[irq_num] = level;
+    PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
@@ -1023,7 +1020,7 @@ static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
         pic_level = 0;
         for (i = 0; i < 4; i++) {
             if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_irq_levels[i];
+                pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
         qemu_set_irq(pic[pic_irq], pic_level);
-- 
2.35.1


