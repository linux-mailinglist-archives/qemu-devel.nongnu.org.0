Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349C612D88
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGts-0000pv-Cr; Sun, 30 Oct 2022 18:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsI-00043R-6V
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsG-0000La-1s
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id h9so13724568wrt.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIPy348rkZZiVPh95Imhce2HNMSkn2kK59cH0xc0lRQ=;
 b=RXBFsUeLl2iKBU1l75mntZeXOFt3ivvmefUFzUpvxcJ0UfuJCRts0giw8ESnlWzhC7
 IUfVzUpBhnrtcFByRokFbsZlhdeS75vssn+axnv27jjdSRZFEmIL1B0LehW24BPGBHsa
 iqchWhy7a65TbIJU+PhGWwdu+Pv7qsGgrLnjy8b2ylq57JDggcUn94P0ntrOfF2Txt8i
 6gJNRMBAZONeEsl6Y+Uc7dAmecL21zmh2Tsx90jIgeuqURnIrh4vG2IuZza4Da5wtB5Y
 W8Yq9viEoAWBo5GSzG1DdVFyab2h4VFze4cbOZVKft3JJgRyg+l5tnrYYBG9DCrku0ky
 locQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIPy348rkZZiVPh95Imhce2HNMSkn2kK59cH0xc0lRQ=;
 b=1yZk492amdIhlP8UCmjvLvDfjEigto1SCSRssFb6wUggu7oO0RQ9OR38EBvzDGw7qd
 Bj3fObn8TZRdJCdAuNzGrLpYjZHdwdYGHj1QGv08/GrYySDNbh3U/lsck/iEqCFsG7gm
 Z1ZihYIXdws9K3PERtpJDuv0vyYuYD6IBcj/kCS0r8seadOPvSVy4YRfQb3bIZbUAwnZ
 /dETD6sZt1zsBnVnRTUq4nEIlnEFMh5D/XmpRvSnbcDAmJUzxUvHu+tN7jWWS7bTVi++
 LfHYnfJbCJDEfS79awoSBZvFxYq7pQdNyg/6W/EyLjC3pkmZc8NW8J4pRYP1muXwXqRD
 qQIw==
X-Gm-Message-State: ACrzQf0218oekNiyBpcK5YBrUUzg/6I0I14m9UXscoxi59gCtbPDVOoq
 y0gt/eO/Q32eDN95hBxaLr6N+mReJwI5Bg==
X-Google-Smtp-Source: AMsMyM5snXftnHvHhuvO7vFcVZhJ9eJQUCRz7gh0/L3atkyCQEiteV5wDdpFt4YdacDglu9X7+/8RQ==
X-Received: by 2002:a5d:6147:0:b0:236:aa4:6eca with SMTP id
 y7-20020a5d6147000000b002360aa46ecamr6120136wrt.318.1667169226328; 
 Sun, 30 Oct 2022 15:33:46 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c182bef9sm5980174wmz.36.2022.10.30.15.33.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 46/55] hw/ide/piix: Introduce TYPE_ macros for PIIX IDE
 controllers
Date: Sun, 30 Oct 2022 23:28:32 +0100
Message-Id: <20221030222841.42377-47-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-9-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c     | 3 ++-
 hw/ide/piix.c         | 5 +++--
 hw/isa/piix4.c        | 3 ++-
 include/hw/ide/piix.h | 7 +++++++
 4 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/ide/piix.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7a55b9ca8e..0ad0ed1603 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -40,6 +40,7 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -259,7 +260,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
+        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index de1f4f0efb..267dbf37db 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -36,6 +36,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
@@ -202,7 +203,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix3_ide_info = {
-    .name          = "piix3-ide",
+    .name          = TYPE_PIIX3_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix3_ide_class_init,
 };
@@ -224,7 +225,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix4_ide_info = {
-    .name          = "piix4-ide",
+    .name          = TYPE_PIIX4_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix4_ide_class_init,
 };
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index c88d3bf3bf..e05e65d3bc 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -28,6 +28,7 @@
 #include "hw/irq.h"
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
+#include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
@@ -277,7 +278,7 @@ static void piix4_init(Object *obj)
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
+    object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
     object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
 
     object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
diff --git a/include/hw/ide/piix.h b/include/hw/ide/piix.h
new file mode 100644
index 0000000000..ef3ef3d62d
--- /dev/null
+++ b/include/hw/ide/piix.h
@@ -0,0 +1,7 @@
+#ifndef HW_IDE_PIIX_H
+#define HW_IDE_PIIX_H
+
+#define TYPE_PIIX3_IDE "piix3-ide"
+#define TYPE_PIIX4_IDE "piix4-ide"
+
+#endif /* HW_IDE_PIIX_H */
-- 
2.37.3


