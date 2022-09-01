Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FD5A9DAF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:05:24 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnd4-0004RX-Hs
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2l-0002Wm-5L
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0001VH-Fc
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id fy31so35424965ejc.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AkljPujigU8S/7kwtCdy6cHE8xZl8+jlT5bTs99iIFM=;
 b=k9R+VPq1jyUcnZXSwUgVhhyamkjrL45XL0cWpTf08m63Zkn5bkGoVv+xxqwdD5YBB/
 xTYMnBo+CJo3cldGCIkLewbK4haEtT8O8bF3Ntpu45dy3tDlNCvjLJFx6bmp6vqJTAYp
 bL1cao2Uh3jmqezZycOtK6k186jwdwP+nax0grMsvN0pvBA77GqNsxvYC5WJUIatdo1r
 R9r19rA8wPWSnEXqZdLMphW9ktxIL2EyMPKt/S1wHsGwFBQ5wtG6uo0geLYRSXhrDeNl
 2We8I9iL6li2mcpx3g1nKbJ7asqWOeoYm6Y4T/Pgnq2YwNzVveY1WoxyYYM5wUqHe7Jn
 xznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AkljPujigU8S/7kwtCdy6cHE8xZl8+jlT5bTs99iIFM=;
 b=YFxWGWlcCW5vdO1KZB7AcndTMbkK+H1npg9MgpCEOMqzJvd8upDeOWk1acH4TnIAKJ
 HmfYMJbaq8ORApHU1hvtRxQY1SzXUiCsFF85eYKkiJpA9NuGVKaPgmX9bmLZri9sLAia
 uAbkpSxZxuiTvr0CbAIa9bYDiDeOsmushlXpN8jeMO3NlCfYfr7BbZ7meLcdguHQfMfU
 SKNtEk0kA66B3lEbc05PRgk4qCRIlG9lcVG6PHIh6kSl9LjzlYqdvkF/6Sxm8zXA2GjJ
 UDP4u0ARAq9K64A8M7iLpm3PrwsfgMGe8qyaps3Yu5PBjXXA7NDEJv11R7uGzYnyOQG7
 4zuQ==
X-Gm-Message-State: ACgBeo1V6r0mAtupiK9e8uNkZrTHcymwRoAO5eNx1cBKn5hRtdvevMjU
 Rfcl6guKI6GoistWt8CkQozn6DV3aO0=
X-Google-Smtp-Source: AA6agR6eVzzAneKJnXdeTFhT4vEz06RSfukopChV+UT2bH8ovmq3Xc0WB6I2jHp4FQL58+u4vZiQPA==
X-Received: by 2002:a17:907:a410:b0:741:386b:17e4 with SMTP id
 sg16-20020a170907a41000b00741386b17e4mr19362050ejc.46.1662049652394; 
 Thu, 01 Sep 2022 09:27:32 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 41/42] hw/isa/piix: Drop the "3" from the PIIX base class
Date: Thu,  1 Sep 2022 18:26:12 +0200
Message-Id: <20220901162613.6939-42-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now that the base class is used for both PIIX3 and PIIX4, the "3"
became misleading.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c          |  2 +-
 hw/isa/piix.c                 | 10 +++++-----
 include/hw/southbridge/piix.h |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0355bd3dda..8af75b1e22 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1276,7 +1276,7 @@ static void build_piix4_isa_bridge(Aml *table)
      * once PCI is converted to AcpiDevAmlIf and would be ble to generate
      * AML for bridge itself
      */
-    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
+    obj = object_resolve_path_type("", TYPE_PIIX_PCI_DEVICE, &ambiguous);
     assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 25b86ddf17..f70855541b 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -90,7 +90,7 @@ struct PIIXState {
 typedef struct PIIXState PIIXState;
 
 DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
+                         TYPE_PIIX_PCI_DEVICE)
 
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
@@ -514,7 +514,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix_pci_type_info = {
-    .name = TYPE_PIIX3_PCI_DEVICE,
+    .name = TYPE_PIIX_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix_init,
@@ -564,7 +564,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_info = {
     .name          = TYPE_PIIX3_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_class_init,
 };
@@ -604,7 +604,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_xen_class_init,
 };
@@ -653,7 +653,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
 };
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0edc23710c..60ff6d222a 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -24,7 +24,7 @@
  */
 #define PIIX_RCR_IOPORT 0xcf9
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
+#define TYPE_PIIX_PCI_DEVICE "pci-piix"
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-- 
2.37.3


