Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8FF641F24
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLh-0002Mw-4v; Sun, 04 Dec 2022 14:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLa-0002Jw-B8; Sun, 04 Dec 2022 14:08:18 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLX-0001cz-5I; Sun, 04 Dec 2022 14:08:17 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x22so707617ejs.11;
 Sun, 04 Dec 2022 11:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2G8Tsllzj6S51HuhLVwsjyhrUHUMi3Ppw0ZqoAxDRc=;
 b=WJyN3DXs+l0e7zP7JaV5PK9bNwG5us2rEzalzvtBv0iXNs2NQuXn+jqre5w7tWKxIJ
 /OcgIiuOySB+9zjgcYGwq8vBZvb0sYaLFBMVv5P3K+M06TUADmLDBqxMwH/+nXL3mPhg
 NSi5BnCIz2bmDbJwZotnOB8Tdpmu/C+PoYW3UAQY1Z00P729LAXdWRO6vauxitrnJ+B4
 mBXWG4InaQ72ljPI4gVn+YDhaXr/L9i51iqDVLjZdZXBej4/Fm5hcjUgeJyXB+UN0HoC
 l5uDw588vqXi4mm/LpyRQgXcsJvCuRLD6WpKTzIn67xqAEHBectg4AxyX54OInK7rIEl
 67sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2G8Tsllzj6S51HuhLVwsjyhrUHUMi3Ppw0ZqoAxDRc=;
 b=0xNnE7OagBkXqh6+pgWfr/ssyuenE1pWgaL2r18FLJl8xjMFG7GfUECDzylPNZp/kY
 b0cgvLOZ170vwrP9fX/XqANoZvellRsgFA2bHH/gIH3P4X3ek4W3C8/nC5BH6CGBKzby
 j7BKtmeGMS+hcP9pH8FllJF7BalnOmgFws/PAALU2ME5f2L1EWo9fUZwh4v8CgPvBzX3
 bLkXldYw+l3e/P5yVFlaTRV9JM7PAjHfpD6jGfs4MAub4HEyyWYF7OPKkgfuOe0EwA6V
 9042IlCd5umJwNhs9f0Az7XMEBNSBsOcQ3tQDZRgI9Q3xjnB5LtC72NdNa/g9HsSHS4R
 6Pvw==
X-Gm-Message-State: ANoB5plctU5zLKjdl5oQVj/cYhXL/XLFgxSFEDCgZq899fcvD0YC04O4
 oHzVcZZ9cTa79lzT+/gCMMTWZqWsBLU=
X-Google-Smtp-Source: AA0mqf56ev5b1UaisO7P+Oz0JE2jHiMLeTtTiRdn8CYhlisLpafRgpdI2rrF1qoyiBmHv0nTj85MiA==
X-Received: by 2002:a17:906:6a8e:b0:78d:a136:7332 with SMTP id
 p14-20020a1709066a8e00b0078da1367332mr66004261ejr.355.1670180893967; 
 Sun, 04 Dec 2022 11:08:13 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 32/32] hw/isa/piix: Drop the "3" from the PIIX base class
Date: Sun,  4 Dec 2022 20:05:53 +0100
Message-Id: <20221204190553.3274-33-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Now that the base class is used for both PIIX3 and PIIX4, the "3"
became misleading.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-43-shentey@gmail.com>
---
 hw/isa/piix.c                 | 8 ++++----
 include/hw/southbridge/piix.h | 6 ++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 70fe1166c1..84b27b36ea 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -469,7 +469,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix_pci_type_info = {
-    .name = TYPE_PIIX3_PCI_DEVICE,
+    .name = TYPE_PIIX_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix_init,
@@ -519,7 +519,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_info = {
     .name          = TYPE_PIIX3_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_class_init,
 };
@@ -559,7 +559,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix3_init,
     .class_init    = piix3_xen_class_init,
 };
@@ -608,7 +608,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
 };
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index a489f52d1b..65ad8569da 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -72,11 +72,9 @@ struct PIIXState {
     bool has_usb;
     bool smm_enabled;
 };
-typedef struct PIIXState PIIXState;
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
+#define TYPE_PIIX_PCI_DEVICE "pci-piix"
+OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-- 
2.38.1


