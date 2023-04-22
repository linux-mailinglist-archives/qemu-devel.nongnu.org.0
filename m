Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4A6EB9DF
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq9-0001yV-IG; Sat, 22 Apr 2023 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq7-0001xn-Mq; Sat, 22 Apr 2023 11:07:51 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq2-0005B8-7N; Sat, 22 Apr 2023 11:07:51 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f109b1808so478829366b.1; 
 Sat, 22 Apr 2023 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176064; x=1684768064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ac6rnd6O3NToOPL92H7GEcmzdyjmEd8HqRhpxrkLxI=;
 b=CK5y8VznBPInfhaAh2UgCZVWfUs6wpc1hvGV/NI51u4xH560uMLR1P4ywNnW9H1HIv
 YvR2Ph7SlZAz3/LYe0qOwYN3/Q0nCWR5+hRJF3LtlLOr9x4E7TTXXbJa0Scse9caFsof
 0TUwzaWhppH6CquxbqdxsdIKZQrb8JUmDTIeV0W7+yu2g8tc3UBbY2T7Lh6agjk8oeLt
 bBUuqp3fHakZPebntFR9xhEdH1lClAwCOCx33DWDjffznt6CIGzBmBPcir+hHmoEkhnx
 v0MYwu3Ln/2JGjDY1YAt9g/YKLSVup3Wlc4Gs/z2D33vKIfv9jhahnIvjtEsbmx5oUa7
 euyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176064; x=1684768064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ac6rnd6O3NToOPL92H7GEcmzdyjmEd8HqRhpxrkLxI=;
 b=bbRGQoqI/tchPx/3Vz+5TTzDrQvRjjHH7HdkjT0fl7WEfYPkihAAWdhY71pJBgv+8k
 c9upzifXkCV64c8RbMTimxJm+8zCQz03Z54LX46Jz/ldOo8QwZ9JoQOXg8ETtrGODbKP
 tOKyVWQVZwSwV6LrtN7LJ4SBLSStpo8QbiWSuVDyxbdSIs8e99INz09as7rzy6V1Nz0j
 rBtLbn/HAz/J5VAUxQpYz8lErwy8HRuAbEQoQmiDPPBm5ssA2nwbtHkWvGMCT6Of2Usu
 GvCEOfdd7pvrzi9ngPiWrLQGX1YefBwr1o/pbDBZXAUSmqp7EfBzzVRgvV6HLZEN01ge
 6z7g==
X-Gm-Message-State: AAQBX9fR0QUU73GN+grPoXVVW46ajUeh9Jvuw8ixLSadV32c9Wta/+hB
 SHHbPkIhiYLzCtCcmeQQY47Ui7ypaJQ=
X-Google-Smtp-Source: AKy350beKPUB8uGhKWG3jEJmhxdz2FPbHzPBk51oivZz1nfO0nnMVj/mBqSpfqXqKi5DDlH4FRKj4A==
X-Received: by 2002:a17:906:3549:b0:94a:6c0a:63e7 with SMTP id
 s9-20020a170906354900b0094a6c0a63e7mr5938000eja.54.1682176063639; 
 Sat, 22 Apr 2023 08:07:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/13] hw/ide: Extract pci_ide_{cmd,
 data}_le_ops initialization into base class constructor
Date: Sat, 22 Apr 2023 17:07:22 +0200
Message-Id: <20230422150728.176512-8-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

There is redundant code in cmd646 and via which can be extracted into the base
class. In case of piix and sii3112 this is currently unneccessary but shouldn't
interfere since the memory regions aren't mapped by those devices. In few
commits later this will be changed, i.e. those device models will also make use
of these memory regions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/cmd646.c | 11 -----------
 hw/ide/pci.c    | 10 ++++++++++
 hw/ide/via.c    | 11 -----------
 3 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 6fd09fe74e..85716aaf17 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -251,20 +251,9 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     dev->wmask[MRDMODE] = 0x0;
     dev->w1cmask[MRDMODE] = MRDMODE_INTR_CH0 | MRDMODE_INTR_CH1;
 
-    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
-                          &d->bus[0], "cmd646-data0", 8);
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
-
-    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
-                          &d->bus[0], "cmd646-cmd0", 4);
     pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
-
-    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
-                          &d->bus[1], "cmd646-data1", 8);
     pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
-
-    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
-                          &d->bus[1], "cmd646-cmd1", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
     bmdma_init_ops(d, &cmd646_bmdma_ops);
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 65ed6f7f72..a9194313bd 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -543,6 +543,16 @@ static void pci_ide_init(Object *obj)
 {
     PCIIDEState *d = PCI_IDE(obj);
 
+    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
+                          &d->bus[0], "pci-ide0-data-ops", 8);
+    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
+                          &d->bus[0], "pci-ide0-cmd-ops", 4);
+
+    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
+                          &d->bus[1], "pci-ide1-data-ops", 8);
+    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
+                          &d->bus[1], "pci-ide1-cmd-ops", 4);
+
     qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
 }
 
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 40704e2857..704a8024cb 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -154,20 +154,9 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     dev->wmask[PCI_INTERRUPT_LINE] = 0;
     dev->wmask[PCI_CLASS_PROG] = 5;
 
-    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
-                          &d->bus[0], "via-ide0-data", 8);
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
-
-    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
-                          &d->bus[0], "via-ide0-cmd", 4);
     pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
-
-    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
-                          &d->bus[1], "via-ide1-data", 8);
     pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
-
-    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
-                          &d->bus[1], "via-ide1-cmd", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
     bmdma_init_ops(d, &via_bmdma_ops);
-- 
2.40.0


