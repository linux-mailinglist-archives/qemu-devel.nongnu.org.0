Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B86A2B01
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 18:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVy30-0001c6-8c; Sat, 25 Feb 2023 12:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2y-0001ak-4d; Sat, 25 Feb 2023 12:09:20 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2w-0005dD-Ix; Sat, 25 Feb 2023 12:09:19 -0500
Received: by mail-ed1-x52e.google.com with SMTP id ec43so9370277edb.8;
 Sat, 25 Feb 2023 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xl/DOZlATxgugred1fzKweHRfgNnXhLpLoX6XzlsSKs=;
 b=JMdqwGFtPgxlI94YDuKnYNYtGjysm6MU9owjSn3zHvqf6NibPSvwW2AgNRZ1SSBXTj
 i6Z2yHwGlHQRvMYes7EgCY6xOcykEPw3+nP8EUZfN3HULT6nAMvQU9xU5i92iYh4k8kX
 isjr4PlPXGWPHZFvzq+pWppzPhFngNE4LzoP5lQ2WnWAuaDvuQTFCc9HGXl6LrNu2n95
 c6YFCSiXdH2axEgUhuTNioCeE/C6BoAYGQ2YjQD1XmEk0zbHNhbGysY6XrJP4hEZu1Bk
 VVFk426TshC2D73ab6C5SlOPmcmCs6DIaUz2nAKHej9ZYrKXoWGAVopcpyZrmPuhRfYA
 UFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xl/DOZlATxgugred1fzKweHRfgNnXhLpLoX6XzlsSKs=;
 b=Xv/FHIqJT64S3zWzPf0tE57LFXO5Z7VmQAByjhfcU5D/oT/4ZXtE3h76ESefue5zD/
 oMZ8S6nPFPQMmLNO4IQ0Bq5b/cAt7M2mzsUnI0OzYZM41f8YAEk3JdXlJSzsukiFJ9ym
 Qk+aXgrHO1AR0zIi3AHkX2HDoc0KvEPR3s2q9LhXueUHsjNjER29NwtwF8uuTvDhpffR
 qEorB6G2iDs3BuW0zE5l1N6K7jKl9h+qQG34HXJBmbjwzd69UtilzuC8Ms0h+YwVWOTu
 3BvzuJt45XNoVxvlEzXKPz4j+x4FfRWgJYyryvQTMEGEl0VPCW1loN06tibKxhQsBbpQ
 /oaw==
X-Gm-Message-State: AO0yUKUbREZK7f1RriIT9UVlhOL01YHAcgiofPLvt1qtmf5787GmHAh7
 mwL6Y4bN/kyNTDsHQy7KNBfM78TGZmlzWg==
X-Google-Smtp-Source: AK7set9eNHJzHz6iYyU+6Tan7r4YRib39D76L9ClSK4mp3n/lOuSpvIaBaIL/4h2Gl0AvW8UKP8ahQ==
X-Received: by 2002:a17:907:2d29:b0:8e6:bcb6:469e with SMTP id
 gs41-20020a1709072d2900b008e6bcb6469emr19613507ejc.0.1677344956491; 
 Sat, 25 Feb 2023 09:09:16 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf06ee000578a61baa078133.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:578:a61b:aa07:8133])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a17090616c600b008d356cafaedsm989066ejd.40.2023.02.25.09.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 09:09:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 3/3] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
Date: Sat, 25 Feb 2023 18:08:57 +0100
Message-Id: <20230225170857.15774-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225170857.15774-1-shentey@gmail.com>
References: <20230225170857.15774-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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


