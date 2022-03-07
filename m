Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D548C4D009E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:01:34 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDvZ-0005xC-L9
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:01:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfJ-0005Ey-Jf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:45 -0500
Received: from [2607:f8b0:4864:20::534] (port=42535
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfI-0006vU-16
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:45 -0500
Received: by mail-pg1-x534.google.com with SMTP id o8so13593418pgf.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAr+OMvlkoYQ7CFBaWp4gsKrO37KyhZbmhJyWlgqtm4=;
 b=jnud7BP99q6xjZdJBBVF5hzC1MBgTrfKfYBz6Pefn6vO1/JtLJ9Gopc4e8iw/3p/h1
 6qmdBR5oKC1SUt9VgIUTkhX426NAT6AwvddvCI0kXklVAPcarCOeaI6wIYYUa9/aOUrn
 g70uSyF9S4Evg2NwOz7ogIxSH/akARqEl0zgkkW6wVMPH5SKICtLBfc+AsksyFHxfAOC
 1431vxRiLS8ULTyacs1zzyDZPr+5o7IH69v0TzQgqCOJ5yQcxU7bJa4QcQYLBMQq1ilK
 Egxdqq/uOwhfzDRCppzmPk20YChD7YHz+5a9cwKLOx1z78K15zw9xnGp83YPe7McuWMn
 ISsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAr+OMvlkoYQ7CFBaWp4gsKrO37KyhZbmhJyWlgqtm4=;
 b=ZkU/7gUD9YOKx7YkS+3+lP7oCciNlFH+b/zSqwDk4U8GKAvdNhoUhj4GpohEq6f+wG
 TOcEgEnkamvLTt5U3rqyojlNr1ITZv6jfxNb9zEZn1EnhI0aQPdEIOXQPt/JEJOOvGjz
 t1+UEYs4kJXqp1Pj3Og/VlZuxEHAGc3QjnM9vDjA7eCxWPHZNTlyr1Iu+9fErlhozExd
 eDiRxqLNrV+3Jwm7dKjvuk3xvPSvJUt3Lo3M4CXE09buQh87VFXGTOGYCnb0K077S8CY
 Ixes81uKaXpv9uEs7/IHFNRSujA9mGPLDyUqifjbvZLAH/Ka96J1TtjaCdiEciBQECN7
 vYug==
X-Gm-Message-State: AOAM53138MOEgzsTBSu2RigAVGugQVxZ1ZCHPZv2pbG6UTCqdwR2gZT0
 Ks8z8EXJo8lI5LLDQTrb3TY=
X-Google-Smtp-Source: ABdhPJxddUk82e3Aqb4hlghNTrb6svSI1y46zPbSrJYT5PoIctZd2rY696/NAfWWHhaKd3brWSFjpA==
X-Received: by 2002:a65:6955:0:b0:380:64fd:a2dd with SMTP id
 w21-20020a656955000000b0038064fda2ddmr2283408pgq.383.1646660682773; 
 Mon, 07 Mar 2022 05:44:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a634a51000000b00378f9c90e66sm11970161pgl.39.2022.03.07.05.44.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 05/13] hw/isa/piix4: Resolve global instance variable
Date: Mon,  7 Mar 2022 14:43:45 +0100
Message-Id: <20220307134353.1950-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Now that piix4_set_irq's opaque parameter references own PIIX4State,
piix4_dev becomes redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1


