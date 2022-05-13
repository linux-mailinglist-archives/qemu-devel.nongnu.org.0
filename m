Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C3526945
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:29:14 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa2L-0000db-8J
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZk0-0004au-NF; Fri, 13 May 2022 14:10:16 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZjw-0007L5-6a; Fri, 13 May 2022 14:10:13 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ch13so17667801ejb.12;
 Fri, 13 May 2022 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/cQH/1Zw9GFUPtTbC8zhxsJeeQwE0nxDRipyyaTmMk=;
 b=nJbHxWaET9J2XSZE+M5dxA8DbQG9coK769SMpj9GQeA6B5MYfqK0lpTZcTTjHsEoB2
 YsduPUN8KjpCjR1DlXYGnacXqjJvn7IpxP4QJwwabsXwlB2JehTlehcQWwm8++WmkHfw
 zMKKJEq7lkxDz9bynvEtBKYjR8DZFnZ0q1rIZLCNHjl5MEiaHmg2/Pua8eTz0e5i/K0s
 O35/MwMsvzGnN1SNER3JYxYIq1A0gTWG/4Mf4U0UOVAfyKazUT1wcSm0RnH/KlFTIpPO
 ezpSVliTQlXlbntvSNatMSPlv39fsevETfJV20FcGkLi7qNZ1UwkQcUejQEj+ufSI0cT
 RTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/cQH/1Zw9GFUPtTbC8zhxsJeeQwE0nxDRipyyaTmMk=;
 b=2Ezdu8BCcVYa5Co13ch80MPDyGgKeLHAkx2FtYUnZYr8ZMvggG+SGwsEBSoBOxKWEl
 Zx+snoWsGVypl8C35Kp7HNaJpSJ4jX8AeIzfmGuNaiG1ZfXSyyWM5AkmLby+69b+Jgx9
 3SNCTZHWsDjmq6bRuGAFyHKPxS1CMETTt5euiMlDCnHJqpftfQVG7VhgdJGsIoepoyj3
 nDsNzjy+vyOrEyPGQpDrQ1Ao49m9xEC8J35DYmz4wS5gxzW5NewzXftEPgBKJsWizhon
 20jdf7oYWdlIloVkFcOAF8fkU8FODUdKjBogeJC0BDTJ3D1FRyYXU1NtNk2PfA7UvytH
 Rmvg==
X-Gm-Message-State: AOAM530Oeqn+kGkyK+G/gYMqT5XqpYCZEjGc/q5PnIMWby4jwK2+80Qz
 6NKoPF8BeTvbPom8KoL9ACxMADk9UUw=
X-Google-Smtp-Source: ABdhPJzCkBRWOB3k5QAtg0VncyWPkLbOceUIGxvuo0vGktR8YMH06iLzsWamhF0MqDhovZ65RgZoVQ==
X-Received: by 2002:a17:907:2064:b0:6f4:3f07:c76e with SMTP id
 qp4-20020a170907206400b006f43f07c76emr5383734ejb.462.1652465408332; 
 Fri, 13 May 2022 11:10:08 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device
 class
Date: Fri, 13 May 2022 20:09:55 +0200
Message-Id: <20220513180957.90514-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
index f843dd906f..c2bf33d2f1 100644
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


