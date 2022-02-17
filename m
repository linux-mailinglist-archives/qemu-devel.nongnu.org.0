Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D534B9CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:25:55 +0100 (CET)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdz0-0001X6-CD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:25:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtm-0006hm-9F
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:30 -0500
Received: from [2a00:1450:4864:20::636] (port=37668
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdti-0002wO-2V
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:29 -0500
Received: by mail-ej1-x636.google.com with SMTP id bg10so6050672ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KELY3CAB4d07BDetRGotYwvw76oRR8+YLOX5VD+ZX1E=;
 b=ptToxxTlCEleYMg563kof57b1qb0w3ByJs3n23JG1NUJyXM6ewm2HPsZWg38cQksY5
 KX8vsoNZqerArcznS8C9Alu4iUVSmVHv07BRyKBQCnFoGMksYRxVEG+4Z1IxBB5MWtSJ
 PRFmxlyONu95M2GZEVhWmf+HQLxMwHjfrzRl6okuvfAbsOL8jvpZKnkZs088P1RvaPeq
 Je+SbiT7DdKr23Z2x90OzvLSiM/qHKAYPs9gQWENXQWadgwgqXGlzgQDUhRcH/GZokqZ
 w5d94xKkaqnwHOkFq7ZsVhcWqfpB2es7o+UbjzYrxaIv3ciuhZ1euRe8FyiuzNP0jvaT
 r8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KELY3CAB4d07BDetRGotYwvw76oRR8+YLOX5VD+ZX1E=;
 b=bpeScxlI/Tt2q5CcJi3Cs0U5NEZNHL8eRG7y7NfkjQP3j5w7iyHgvr8hzzvss34Sat
 +Hn6HV6GpLqad9IZH6Ddy03Z4izewcG64WImXe+HwtMGgbn951LjyNUV8Op/2Ct7nSns
 hJBzoubW3HuTrroQGeCJMNzH4cWuumtgnG1fQY2rqe2dp5XxcuYP97CtcQAuDdZdT4N7
 ENwK0AS60zagCGAz/uvnEJ7txD9YDqwZ2Hn46m59aSmA281ylxY/NuSYxwvmQ0f1d5YU
 5Ygn0rV0UD78pyJhVtjqV0dSfGikHTgRCxauSUVPcQ/h34UyxlwLooahRAlYtcE3U2Wh
 ZGQQ==
X-Gm-Message-State: AOAM530sNHxykPPaC7Tp0EkXuqNWBABcH7VJv4x1IohDHp9zIc908aPp
 zpKHLG+QZUgrll+tljyr9rbM8cmhMY0=
X-Google-Smtp-Source: ABdhPJy7f3c0tV3u87stU3tUfVs8VN5Qtz2B7415uVbuQFqxgsD6pLdNesjwNJzzNr6E4adIBegvZg==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr1670997ejn.551.1645093223644; 
 Thu, 17 Feb 2022 02:20:23 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] hw/isa/piix4: Resolve global instance variable
Date: Thu, 17 Feb 2022 11:19:22 +0100
Message-Id: <20220217101924.15347-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that piix4_set_irq's opaque parameter references own PIIX4State,
piix4_dev becomes redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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


