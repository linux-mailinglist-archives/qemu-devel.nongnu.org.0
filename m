Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DF4B93FD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:48:43 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKT6I-0001pG-En
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3c-0007Yf-T3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:45:57 -0500
Received: from [2a00:1450:4864:20::52e] (port=41654
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3b-0003RN-EP
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:45:56 -0500
Received: by mail-ed1-x52e.google.com with SMTP id w3so6435049edu.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DChXguDILJX7hAfj1nv8VIcMQ6DAEI68Y7I8Xvc3k5g=;
 b=aXrMoDjn+7+vZPY/F3No8MKWn2mWLbJ12zuUF9Tle6KSXtU7IZ0K+DmyNtLG+s4AxH
 EZCrX4hlyDF7K6ZPUXczfmcBRKbl0AMhPC5Z6csdgKPHWzHWIUvzjO43xgC1LksQdAlw
 MNB/A12WZEPtWuxsUAO/xYvMJ+ZbDwkw6dLoaahrEFSkJi2m/hZIeLsJonSV9CY3sTsJ
 MSN/4oz0FtPV3nZXkIO7d2rqnallgjsWcd2OGra11vP0bjw7R891rLYrI/8/UNMI9ZEY
 0zjIaSO3eazrvv55jjsODjyyz81NL3QJ7iqxuk1hmnkAFpD5a4gCU/mN3CMAwiFa8jrr
 3Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DChXguDILJX7hAfj1nv8VIcMQ6DAEI68Y7I8Xvc3k5g=;
 b=eDP+VDWnMt2t7c/aAT0aDVAeYKUedCqjb5LsntI4q0I4a9KEbNwadxRMc9SrnCPTaA
 MHD5th4g9nqpsx0g320IyqUg63I8uFQqQSJI98Vjg6Q9ZnoVSzHv+K5W87hSfWLsQv6v
 y76rOncPXNEwpMyiz2PceekoDkxGayLdGZIwo0OfXaPpnrbqzM9gMk8nTiSSOhmH2KgM
 0oIBiZzyl+uctO9x00P322Bz0L+8xw//09TLOTSKUQmPZB2HhRiJ69wKCtPeIyq+qpqy
 4EO+tgrXKV/KZ1v06W8Ch9NCAI2UX73LE98JAS3T9f7DddSJq1YyinARlkXNcdCHJZao
 EhUQ==
X-Gm-Message-State: AOAM533Tvki7EZ369lW+oJHzyNZDLLFoxjmQqIvXvO/3KNyTrH+wUByP
 OjcIzJwAqXc3/ezpB7l4YU4/BKiaLR4=
X-Google-Smtp-Source: ABdhPJy9FWSAg2NWSoWSiJ5TxjJ+vKqrkOs1x7GGIHhlxekfIGiseckjLyxo8WJjLC5MrSVhYc8FqA==
X-Received: by 2002:a05:6402:4245:b0:410:ee7d:8f0b with SMTP id
 g5-20020a056402424500b00410ee7d8f0bmr5340038edb.295.1645051553852; 
 Wed, 16 Feb 2022 14:45:53 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:45:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be
 preserved during migration
Date: Wed, 16 Feb 2022 23:45:13 +0100
Message-Id: <20220216224519.157233-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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


