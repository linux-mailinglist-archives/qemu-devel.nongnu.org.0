Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1D526938
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:26:46 +0200 (CEST)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZzx-0003qr-Sh
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZk0-0004an-MM; Fri, 13 May 2022 14:10:16 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZjx-0007LO-5U; Fri, 13 May 2022 14:10:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id l18so17705060ejc.7;
 Fri, 13 May 2022 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBXAkFrCGs28BI30AzYWmYh3sIrQDSjFAmvH5xdAdFk=;
 b=Bgcy7jIh1t61wlZnBAq+JZld3nOesqYuWWAdJJQ0sl5bxUB9nsHbDiHngRu1OutYbW
 OG4VHmgNSqmhme8qgcCXmbEvIbIkbJDxxYz0+LuY/SJhWJjQ3/CYEQ9XFbgPX1dsLuxf
 XIGJ53kceKKUz2qVjgUC/cWmwF3HbLDV5msbnHnu8HPlavKmPUxicAXfXl2G0GqjwW32
 mYHwZUV1bTyn8D8pLeBFHjF+NFVyzw1boC9HcP8y/EX8ZZ4I4r3zhkHORo6RIDVJjr/l
 ESmOonSf3nBPpEBH/WkgN4DFFIGJVy2vYJJOgtj8wUkMscuLJRjrQ4/xw3nRhil/1CJL
 xNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBXAkFrCGs28BI30AzYWmYh3sIrQDSjFAmvH5xdAdFk=;
 b=ZuSKiO1nYPICvkKHxQwcoHmk9JnbkjfmdkOVQCBGlHXPBjmisWORyTHJqHdum4LuqJ
 fcKfIPeRWVsPZZqZOu9YhX5rzXwer+IHwWYm0bfnZcf7jayJAS2CbFOb7RyDd+XROaR/
 hToIM3GioeLcxaNY0TmJY0lz0wXDBZaLnUCkYVvUJn1wL6tFyqvxFkkuYDMGzQ2/UgTF
 EpvQeNebmD+RzjLADS90ctXVBDGzW0MI1l2MCB8qM4odq/BM0vEIUrRlXS5rNDpnsuge
 ZIyPmsS4bw7dko6z9ADCqltr1Rdc2rvdE7GIa/Ajid96iLcLFAdVvlkmrRelvl3vz5Q4
 JbKg==
X-Gm-Message-State: AOAM530BwePA//QBNimOq1kf9U2weQvTNgeZHLRLObzclzTQBxcG6M4U
 bIHg6eqwtecewAoOv5ctSZ1EQjIL6L0=
X-Google-Smtp-Source: ABdhPJzd1ozMHGZZFnRvVPDcf7J6MJFx90w5pAiPDrPJQobwuWQ40761pwClkT/3oeGExjerubnvSw==
X-Received: by 2002:a17:907:97c4:b0:6f8:5ec5:61e2 with SMTP id
 js4-20020a17090797c400b006f85ec561e2mr5456098ejc.559.1652465410414; 
 Fri, 13 May 2022 11:10:10 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Date: Fri, 13 May 2022 20:09:57 +0200
Message-Id: <20220513180957.90514-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

This function was declared in a generic and public header, implemented
in a device-specific source file but only used in xen_platform. Given its
'aux' parameter, this function is more xen-specific than piix-specific.
Also, the hardcoded magic constants seem to be generic and related to
PCIIDEState and IDEBus rather than piix.

Therefore, move this function to xen_platform, unexport it, and drop the
"piix3" in the function name as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 46 ------------------------------------
 include/hw/ide.h           |  3 ---
 3 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 72028449ba..a64265cca0 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
@@ -134,6 +135,51 @@ static void pci_unplug_nics(PCIBus *bus)
     pci_for_each_device(bus, 0, unplug_nic, NULL);
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
+static void pci_xen_ide_unplug(DeviceState *dev, bool aux)
+{
+    PCIIDEState *pci_ide;
+    int i;
+    IDEDevice *idedev;
+    IDEBus *idebus;
+    BlockBackend *blk;
+
+    pci_ide = PCI_IDE(dev);
+
+    for (i = aux ? 1 : 0; i < 4; i++) {
+        idebus = &pci_ide->bus[i / 2];
+        blk = idebus->ifs[i % 2].blk;
+
+        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
+            if (!(i % 2)) {
+                idedev = idebus->master;
+            } else {
+                idedev = idebus->slave;
+            }
+
+            blk_drain(blk);
+            blk_flush(blk);
+
+            blk_detach_dev(blk, DEVICE(idedev));
+            idebus->ifs[i % 2].blk = NULL;
+            idedev->conf.blk = NULL;
+            monitor_remove_blk(blk);
+            blk_unref(blk);
+        }
+    }
+    qdev_reset_all(dev);
+}
+
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 {
     uint32_t flags = *(uint32_t *)opaque;
@@ -147,7 +193,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-        pci_piix3_xen_ide_unplug(DEVICE(d), aux);
+        pci_xen_ide_unplug(DEVICE(d), aux);
         break;
 
     case PCI_CLASS_STORAGE_SCSI:
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index bc1b37512a..9a9b28078e 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,52 +173,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-/*
- * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
- * request unplug of 'aux' disks (which is stated to mean all IDE disks,
- * except the primary master).
- *
- * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
- *       is simultaneously requested is not clear. The implementation assumes
- *       that an 'all' request overrides an 'aux' request.
- *
- * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
- */
-int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
-{
-    PCIIDEState *pci_ide;
-    int i;
-    IDEDevice *idedev;
-    IDEBus *idebus;
-    BlockBackend *blk;
-
-    pci_ide = PCI_IDE(dev);
-
-    for (i = aux ? 1 : 0; i < 4; i++) {
-        idebus = &pci_ide->bus[i / 2];
-        blk = idebus->ifs[i % 2].blk;
-
-        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
-            if (!(i % 2)) {
-                idedev = idebus->master;
-            } else {
-                idedev = idebus->slave;
-            }
-
-            blk_drain(blk);
-            blk_flush(blk);
-
-            blk_detach_dev(blk, DEVICE(idedev));
-            idebus->ifs[i % 2].blk = NULL;
-            idedev->conf.blk = NULL;
-            monitor_remove_blk(blk);
-            blk_unref(blk);
-        }
-    }
-    qdev_reset_all(dev);
-    return 0;
-}
-
 static void pci_piix_ide_exitfn(PCIDevice *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
diff --git a/include/hw/ide.h b/include/hw/ide.h
index c5ce5da4f4..60f1f4f714 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -8,9 +8,6 @@
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
-/* ide-pci.c */
-int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
-
 /* ide-mmio.c */
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
 
-- 
2.36.1


