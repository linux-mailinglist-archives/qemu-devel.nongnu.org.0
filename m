Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F26923D2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWix-0003Wa-3G; Fri, 10 Feb 2023 11:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWiv-0003WP-67
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWit-0003yg-G6
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:08 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so5669747wrv.7
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=df58h/AdXCUfIsw29990QJNsnEG6zfozV6HUit6iE6U=;
 b=baQQBiPUjALYohVGxuzk+/A3Hgk6QMeIa+Z2rsRjxes5IzhIhMcbsdORUxzqHIWhwj
 ANS9+VkJ904OZr5IEJBo9pe1qQtPr1eaSeXTqYGL6Ii/kFxNpw/x49+RsONvpdTO9jgi
 TchM1y6xd81wkcLAifeLarDgPdRuMWA1kk/INhTMu30PudXyuP88aAeK4CF9vt90bR1M
 g1xFcVHzqe3pYzFD+QNW3VDdYUwz/OEeT09BT5/W8RV3BJK4Ae3Q7ddOaBIqJImjfx0m
 zfX2gZAdcKdbovMprF2a9k1QwI4SjRuJZbC39Z1AK+ga5xP2agKLhM1scDcxqb32Ytae
 kvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df58h/AdXCUfIsw29990QJNsnEG6zfozV6HUit6iE6U=;
 b=5zxOIPLLNfM3YtkrUr+vj9P6G5lDK4hTDILDA6UQ9w6Cbpn8fT7qmafxOzo01dS4MM
 lt6BiJd7MgPDqlJP+fIVHsInG4jdIZuMzBi0/0E7vO9mti631DKIkeWgEYHXGxzNvxNQ
 /YQfyds2wG9kyWy95hrE3rToVD3/fdmlVzQwZf7bdLPfS+hGxhCSBQib/JnJ1g9vc0Ye
 ogRLty3ofRxmuwE0ssGwsDYt2SzCREroVYL6C8BfcKU4b+FqUeZZrHQ59iIetIYSclL5
 eOSSpeIbU2SU/EZTxY3dateK0IyPp5B4OpoNTC98lQpaZGdYy+cGIgcDOt6ALRKO4Sp/
 t30A==
X-Gm-Message-State: AO0yUKWaJ/FNtwER340PT0iGP1t4BlKyhAawv/+xqP27wSJTgNHf3UVp
 x7XkWYlFNsTqcy389KNsW8r4TIa7cUvJafmI
X-Google-Smtp-Source: AK7set8Y1J/DkqZ7lxO/MSxJ0q0/wCKafERHeWM0OO8nNxrXzpWhvKoVypXHO+LcEGG237BJWkitLg==
X-Received: by 2002:a5d:62c8:0:b0:2bf:d7b9:270 with SMTP id
 o8-20020a5d62c8000000b002bfd7b90270mr13845166wrv.3.1676048285941; 
 Fri, 10 Feb 2023 08:58:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a5d6201000000b002c3ea5ebc73sm3996388wru.101.2023.02.10.08.58.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:58:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/4] hw/isa/piix: Batch register QOM types using
 DEFINE_TYPES() macro
Date: Fri, 10 Feb 2023 17:57:52 +0100
Message-Id: <20230210165754.34342-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210165754.34342-1-philmd@linaro.org>
References: <20230210165754.34342-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

See rationale in commit 38b5d79b2e ("qom: add helper
macro DEFINE_TYPES()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix3.c | 53 +++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a9cb39bf21..0ee94a2313 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -346,19 +346,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-static const TypeInfo piix3_pci_type_info = {
-    .name = TYPE_PIIX3_PCI_DEVICE,
-    .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
-    .abstract = true,
-    .class_init = pci_piix3_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { TYPE_ACPI_DEV_AML_IF },
-        { },
-    },
-};
-
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -382,12 +369,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
     k->realize = piix3_realize;
 }
 
-static const TypeInfo piix3_info = {
-    .name          = TYPE_PIIX3_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
-    .class_init    = piix3_class_init,
-};
-
 static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -416,17 +397,27 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
     k->realize = piix3_xen_realize;
 }
 
-static const TypeInfo piix3_xen_info = {
-    .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
-    .class_init    = piix3_xen_class_init,
+static const TypeInfo piix_isa_types[] = {
+    {
+        .name           = TYPE_PIIX3_PCI_DEVICE,
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(PIIX3State),
+        .class_init     = pci_piix3_class_init,
+        .abstract       = true,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { TYPE_ACPI_DEV_AML_IF },
+            { },
+        },
+    }, {
+        .name           = TYPE_PIIX3_DEVICE,
+        .parent         = TYPE_PIIX3_PCI_DEVICE,
+        .class_init     = piix3_class_init,
+    }, {
+        .name           = TYPE_PIIX3_XEN_DEVICE,
+        .parent         = TYPE_PIIX3_PCI_DEVICE,
+        .class_init     = piix3_xen_class_init,
+    }
 };
 
-static void piix3_register_types(void)
-{
-    type_register_static(&piix3_pci_type_info);
-    type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
-}
-
-type_init(piix3_register_types)
+DEFINE_TYPES(piix_isa_types)
-- 
2.38.1


