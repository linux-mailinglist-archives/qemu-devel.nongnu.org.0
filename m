Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE751ECEC
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 12:41:26 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nneLt-0001ko-EZ
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFr-0007D2-PV; Sun, 08 May 2022 06:35:11 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFp-0000HE-R4; Sun, 08 May 2022 06:35:11 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i19so21826754eja.11;
 Sun, 08 May 2022 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZESDsRAqJr62NbjfLmlIhWx0VhIvAD6ZfdFOEz5AGM=;
 b=Lhjll1RHi/Zb27lY0LdfC2NU0MTspGZ1g1IhCbSkCed92FikO2gusIN5/2mOnoS8ts
 3qfKOVB0ea3OYubzBcAI9dJysvzbq1FLfBfMZVrHqbZzjz7LxeNGS5qhIDeqUExvfDXw
 JGZ3M2DkWsZ1ndlmaCtghQDAhf6vcIvS0E+NRiwt69aS1OCgkp5CoyhYlBfM7Yd/HznJ
 sjz+HBiO+WVNOOMvzaJMvt8Z34fUqJP9Fehci0Kg8oiZxEUzpduv/3JXwizp+pvA3dUi
 cPxtBCqj3cetBfERSL+QjG4166uDWnNHy/pYxcavOEJcA0L616xIENxW3lEYR5HOVTHt
 AIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZESDsRAqJr62NbjfLmlIhWx0VhIvAD6ZfdFOEz5AGM=;
 b=0D3el+3xM8FxuhYmSVEMp7t+iE8JzoF2jnioYJADjZL/83OIF/+PeyL9hV01sXdPoM
 OaJBxJYOB66bZ/WAEvhEnRp5o6N5TV/cMBeNVimEUw/ui2ygGKZR3IgfTYvvH/Zrws+U
 CYa0KqdVy899si5Lc8uMpzERe/c9gvZyJ099oQ768vDU9rTAibTq5axUChk45kTuPQRy
 7gStoYezhj/3PyZCJ7kOvA5x5XGAcWxFCwCxHif4sHwKSq5KQtM3HEXnRocIJvGnjXOW
 tooRj9juW02FAC9+aGToKSeay1ijHV6m5DBEB1ZsqR8IoAOKir8x7KYMD1nNeflVLSs5
 5Fwg==
X-Gm-Message-State: AOAM532ndA5BvLFk99cFHXFeg214s0yCL0L+2iJmVjNCGyQ5Mf0E+0zB
 wmh4GeHfgaX6f776EehvNYzgG0X9z5ngaw==
X-Google-Smtp-Source: ABdhPJxpuoUCVG1Of7nUDSnSqtIVgca7LxruEMKeb6HMzXsxsDKU6VJS9VNAAgpHZB/iksxQp35r6w==
X-Received: by 2002:a17:907:4c8:b0:6f3:beac:260c with SMTP id
 vz8-20020a17090704c800b006f3beac260cmr10182629ejb.321.1652006104817; 
 Sun, 08 May 2022 03:35:04 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-246-161.77.183.pool.telefonica.de. [77.183.246.161])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f388f6f927sm3901948ejc.1.2022.05.08.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:35:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device class
Date: Sun,  8 May 2022 12:34:30 +0200
Message-Id: <20220508103432.14874-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220508103432.14874-1-shentey@gmail.com>
References: <20220508103432.14874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
generic class init function' already resolved redundant code which in
turn rendered piix3-ide-xen redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 +--
 hw/ide/piix.c     | 7 -------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4c185c72d0..27dfde4917 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -244,8 +244,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
-                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..2345fe9e1d 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -241,12 +241,6 @@ static const TypeInfo piix3_ide_info = {
     .class_init    = piix3_ide_class_init,
 };
 
-static const TypeInfo piix3_ide_xen_info = {
-    .name          = "piix3-ide-xen",
-    .parent        = TYPE_PCI_IDE,
-    .class_init    = piix3_ide_class_init,
-};
-
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 static void piix4_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -272,7 +266,6 @@ static const TypeInfo piix4_ide_info = {
 static void piix_ide_register_types(void)
 {
     type_register_static(&piix3_ide_info);
-    type_register_static(&piix3_ide_xen_info);
     type_register_static(&piix4_ide_info);
 }
 
-- 
2.36.1


