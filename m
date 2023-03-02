Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8656A8C16
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrdi-0001kv-52; Thu, 02 Mar 2023 17:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrde-0001gE-Qg
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:02 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdd-0000EZ-6l
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id j3so581404wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=df58h/AdXCUfIsw29990QJNsnEG6zfozV6HUit6iE6U=;
 b=h4Knyj0Z8KTC4eV7VdLnn//y14JwUcX97mrkVBCnvrPzpEOHB1aKjYljpr1NJXF9hk
 kVK1E1sj4Tyhv0DoIdeVK6m4aNUCa7vmdzWdWadYCUpg29DMmynTW6y337ROV0Uf7v2s
 2q1iVCVnNvePBisQfuthkddW8khK//3wPdseVSfVNLFB1FmcSEKA3LRxyXGw4Bh/6Yr5
 GUu26AVdnNiUZRl8jUu9nV0PUUNlNOoJEzJYIXQJeiLlrFrI7jFdP3N9WnSFq1LmctW4
 PIC6xxJmurjAIMbmIJt+m0+luNXX16UxtoATp569jG3eoK1eh2FcboEJWlIeZaAWPhty
 kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df58h/AdXCUfIsw29990QJNsnEG6zfozV6HUit6iE6U=;
 b=OorIkeXApoO64NBvwlO0BpcecJqCkoEBL+y+gAeGYsPA75Dqe9KSbzWOo3/E4uliIW
 P+/IsMc5YdBhVOZLTogKvEzkzG8gKwr5iSsCUHIkbLeYifPhKCAc04BIgoKU23WcZ7JE
 olRr2a9hzNWBAeJTIXiw6e3QLcQ104sXuOVZYUvuZqMgwRuRS7lJRdQaW/rG2QoGEXgS
 WldnoPKsWFl1YDr7V5V+PMgIjBq9z3+8L4uL3+8FprVR8GyTkXxmbpSQOpXp1x7E7T/C
 YKHiEvMNez9FCYOQyBw2l5+LVjQWNtU1coLIQARYNA2c1pEB1SxeJbfhjWi0ztqZFfus
 DzhA==
X-Gm-Message-State: AO0yUKUqaX/CRg/o265NLVpgyS4tGe4G1yAo3idR7YhNYR4UzIUXOu/O
 TmoCWgp0nfjwkrdNQhJ3oQm4kqdzrrgseQTZ
X-Google-Smtp-Source: AK7set/a5oV4t7DqaYekSgx5/4yd5r8jZ0HDP5xQZ979b3ZNUsFI/COYk7vjjm2Ckg5ZuuKuK3zOlA==
X-Received: by 2002:a05:600c:1708:b0:3ea:c100:f18d with SMTP id
 c8-20020a05600c170800b003eac100f18dmr8587990wmn.9.1677796980304; 
 Thu, 02 Mar 2023 14:43:00 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003daf672a616sm719382wme.22.2023.03.02.14.42.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 16/18] hw/isa/piix: Batch register QOM types using
 DEFINE_TYPES() macro
Date: Thu,  2 Mar 2023 23:40:56 +0100
Message-Id: <20230302224058.43315-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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


