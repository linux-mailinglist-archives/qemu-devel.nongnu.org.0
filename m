Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109264CFBC3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:46:57 +0100 (CET)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAtE-00037P-2w
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:46:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAM9-0003t1-TN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:45 -0500
Received: from [2a00:1450:4864:20::333] (port=56111
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAM8-0004LI-Bi
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id i66so8828411wma.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAr+OMvlkoYQ7CFBaWp4gsKrO37KyhZbmhJyWlgqtm4=;
 b=VACXgPUiSL6mBLKt4ElIPd3BwsepJA0LW/3xV0nsMutjXix6YVeSr+T3SBdqyBA0KB
 hobl2DBrqHDPrhGRa0wofEVzc1rL6IIm562wWLfrqD92/GA+Fym+giFuekHxTIUzr2xj
 8EAtJNPRKEKe1dtNKzwBqIEWghe4TItI3sJH6XkQbNXNv4gD6RdtKnbuzgYP63qu/6DI
 9yy5rmTfYM63E79EmtsoUUcM482UklvI6smzEC7AzlsMgBQSfRARMS8F8C+JfEQI3I6c
 z+GhVKt4c5tu0ZIwoSnufkLoI/BxJFF6su321g8EkmI7Cy0QCz85fGuN7Ykl76dNoLVT
 Dfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAr+OMvlkoYQ7CFBaWp4gsKrO37KyhZbmhJyWlgqtm4=;
 b=L23LkW/FZrRiEFgr++zPJMg1jr85GK5y0iyZOhaA0XDI4LJ4ayZh7V2IHTjkQ46KqR
 vekAEFCuuk06n7faidhMgTIFFMT8gEuptO8Q+oXBUpYFuNQCsYNM6NQcEH5D6ebrxBwX
 O6KFWSMaNImxLFpgoUxotSPKLcZTXG0QverJZBTdGY2/HN8SKx1hTTMn3T9cPBk+S71o
 Bw7WOsEybX9n3w8zZTBAtMHDPkjKcJ3+OdOSrvGTv0wi714uiCkA35k9OFctGOC+6jNV
 h1KsghvFqK8HxuazRVUf/fmjS9c8L7f0uIv/VA0JFfBhq/FqUWCVDpdmLeut6s2aEZwz
 L/SQ==
X-Gm-Message-State: AOAM531p0NqhM4oqIc9ARHqnESJemq2jmSOpSeOE62J38zDVh9BCaOi3
 diJcJZ396tj0tL8haalD6a9NaAPeWBc=
X-Google-Smtp-Source: ABdhPJzp0rxRKOYql+tJ2dYJiir4Zwt969MV2r3HeVNHQH+rnoDd+dCwzNU+TwSVNUSnkZ3blCOj4Q==
X-Received: by 2002:a05:600c:2056:b0:389:736a:5631 with SMTP id
 p22-20020a05600c205600b00389736a5631mr14290311wmg.120.1646647962804; 
 Mon, 07 Mar 2022 02:12:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a056000018c00b001f079518150sm7678574wrx.93.2022.03.07.02.12.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] hw/isa/piix4: Resolve global instance variable
Date: Mon,  7 Mar 2022 11:11:58 +0100
Message-Id: <20220307101207.90369-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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


