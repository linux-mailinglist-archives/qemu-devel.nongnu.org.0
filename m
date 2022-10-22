Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C394F6098EC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:35:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhpu-0003JB-RU
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG64-0007SU-GD; Sat, 22 Oct 2022 11:07:36 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG63-0002RB-0g; Sat, 22 Oct 2022 11:07:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id m16so16008351edc.4;
 Sat, 22 Oct 2022 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E57FSihNbISBftUwaVHx2vzMv5aAceyilcvohXrEorc=;
 b=WMKYBgZ+QcjTx0vHRYKd1auPMXlEzItfzAl7i9zQTD5RLV77qCxZeTDGgVpTRI5HNp
 dghm4Gl7+pW/CaWW8+G+ymoDm72dmD9sOH+39Oe7S6DSOmnAPmRdLL0mRoPFWFHvy5Un
 wHKffutd/pgQlBPU+lTTImkMSGZe5BKHy4znIAuBC6K+8cL5zCOD3MhIJzIhc8ktfTEh
 9mxJyYP7jaNPJd3x4uKuyXSImRGxGCManKqoqP2rqvRChUanu1lZHch7ZAdi6cBdB9or
 fI25iI81GHhb8apzhqaRD/g+ybNIJgHTO1wWvj90XbvGFRoFge1Dva6asXBf2v5m5ZCQ
 DIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E57FSihNbISBftUwaVHx2vzMv5aAceyilcvohXrEorc=;
 b=geNEVuD1NEuWEAFxkeL6OqrCsCdja0pirez620Gm9ZN1oZYg2MKsJ8ACceGOWtzEOz
 ztzL+8C4yYgBs76L5fGHoVoGFTCuD71t+ekT+Vd/YPld5A1GyNYvJRX2bjFqUUs3eEJY
 R2XmoBVveIoZz8OzIgDn/OizERfx2oACgVvo4Oqm6hvrCjS8Z23AXgRJCuNmGSlTS0QT
 A9kxs+UMzJ8JKFT2yzS/GoSZ1iOMjUS7e5K5qL1kL4oT6Z7CxxK9TocGNMbKItrMiqEi
 wDdCugV6Lo/mgo04Rfd6ptycspg2EpC43O/HL0DGGSF02vMZpfq2K/s8L+pKm20goYtZ
 KR2g==
X-Gm-Message-State: ACrzQf3buMClk75k/o6BDu1N3Djp2tMgJ2cjq8hSoqClTFQWKnzBclK6
 qDVsEZ5H0ZssIXx9vLcaW0ch8TuIKIa5sw==
X-Google-Smtp-Source: AMsMyM5kdZnZQFiFmF25pYtg8ByxjKydUnncvgZeu2iqzi5ri8Q1WAzL3DfQxLTjXMJ9pEiBkLVrWg==
X-Received: by 2002:a17:907:7215:b0:791:a61f:56b3 with SMTP id
 dr21-20020a170907721500b00791a61f56b3mr17413416ejc.331.1666451253120; 
 Sat, 22 Oct 2022 08:07:33 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 42/43] hw/isa/piix: Drop the "3" from the PIIX base class
Date: Sat, 22 Oct 2022 17:05:07 +0200
Message-Id: <20221022150508.26830-43-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the base class is used for both PIIX3 and PIIX4, the "3"
became misleading.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c          | 2 +-
 hw/isa/piix.c                 | 8 ++++----
 include/hw/southbridge/piix.h | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f54b61904..c006db72e8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1298,7 +1298,7 @@ static void build_piix4_isa_bridge(Aml *table)
      * once PCI is converted to AcpiDevAmlIf and would be ble to generate
      * AML for bridge itself
      */
-    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
+    obj = object_resolve_path_type("", TYPE_PIIX_PCI_DEVICE, &ambiguous);
     assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index c8c1a99bf1..a361261940 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -463,7 +463,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix_pci_type_info = {
-    .name = TYPE_PIIX3_PCI_DEVICE,
+    .name = TYPE_PIIX_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix_init,
@@ -513,7 +513,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_info = {
     .name          = TYPE_PIIX3_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_class_init,
 };
@@ -553,7 +553,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_xen_class_init,
 };
@@ -602,7 +602,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
 };
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index c9fa0f1aa6..c21b69e2be 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -75,9 +75,9 @@ struct PIIXState {
 };
 typedef struct PIIXState PIIXState;
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
+#define TYPE_PIIX_PCI_DEVICE "pci-piix"
 DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
+                         TYPE_PIIX_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-- 
2.38.1


