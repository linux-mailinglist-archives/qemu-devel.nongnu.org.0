Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A251ECED
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 12:42:08 +0200 (CEST)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nneMZ-0002GZ-Qd
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 06:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFs-0007Em-Qr; Sun, 08 May 2022 06:35:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFq-0000HV-2R; Sun, 08 May 2022 06:35:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id m20so21825944ejj.10;
 Sun, 08 May 2022 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ij5oGJCJI6PW/a2beKsWQ2NZIiZzUBei2wkeohldNg0=;
 b=qy1+i0Nrp7bat4BckqAb7DFru/UJobFqUCSHUm86RtfvAfhDDeVdEUFGwgyJcMBNMd
 ysRMszci8ba/1p6p4KzMGdnlcGqn9uukof7N0Zd3IaK7gq2jLk+XzRgIc/QPdH+DYeAN
 BitjM5O/pasuYw7o+1OD+1BPYa5jcqWsxOJo1wHXzm1xNTSXOK9rU6mWBWmNF9sEJpRD
 6PSzw4TDbbxM9wK1WvAjg+poctNAhSV1ZMdliQMnSGMuC79VgWYQ3C5rljxjljJg0TcP
 BQcsXHoC5WJJjYEoCmlczUgj84ZX5S+0gj2QwAAlNBftxigkqrhBA1fE06FuEoorMg8C
 3sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ij5oGJCJI6PW/a2beKsWQ2NZIiZzUBei2wkeohldNg0=;
 b=wQzxps4KLGWhfFwBeTxTiehYXnXxM1sXfqvjvS/sMteuf3W6XVffn2xPWKWVpm6vwP
 INAQvYbSVY1i8nG9bBfRjDbTH1KD6fUT33gynU8FbTLY4PqDx4xqvzi1gydQSXwNzCj7
 xpV2+kE8BxfFLpzSZaH6DuRs+60+VQjEEEgl8uX7xCQO0YeQoldB4Eyyi0s6hZjMJNW9
 7n13++4FXJoGwkdrZTmT/pfT0r/oXn9ISRl0xuBKNVDdkF9nirsKM6CDT1LyCqq2npKj
 3qzuJTMSL6+14d5gkrhA/nPrB1/3Jubv8GnIWLTZsijKEu8IZrc12xGvuYEPY1uVA92O
 Wfvw==
X-Gm-Message-State: AOAM532gftwO+LP/AXGp7zv2RWYWzd1QgnNFfh/fGOLt2dvfkwzvwyRF
 Ry+NX/pISH7owF0TVR5pxuwtNCElAlleEw==
X-Google-Smtp-Source: ABdhPJz2AmiXieVCbzTsOl+b158iSqM9IPIh52EIWcA9jlMcRkM1lrjwbjNUt1QadDAhCun39mirMQ==
X-Received: by 2002:a17:907:7f14:b0:6f4:2a57:e1df with SMTP id
 qf20-20020a1709077f1400b006f42a57e1dfmr10348828ejc.18.1652006107890; 
 Sun, 08 May 2022 03:35:07 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-246-161.77.183.pool.telefonica.de. [77.183.246.161])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f388f6f927sm3901948ejc.1.2022.05.08.03.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:35:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Date: Sun,  8 May 2022 12:34:32 +0200
Message-Id: <20220508103432.14874-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220508103432.14874-1-shentey@gmail.com>
References: <20220508103432.14874-1-shentey@gmail.com>
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

This function was declared in a generic and public header, implemented
in a device-specific source file but only used in xen_platform. Given its
'aux' parameter, this function is more xen-specific than piix-specific.
Also, the hardcoded magic constants seem to be generic and related to
PCIIDEState and IDEBus rather than piix.

Therefore, move this function to xen_platform, unexport it, and drop the
"piix3" in the function name as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen_platform.c | 49 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 46 -----------------------------------
 include/hw/ide.h           |  3 ---
 3 files changed, 48 insertions(+), 50 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 72028449ba..124ffeae35 100644
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
@@ -134,6 +135,52 @@ static void pci_unplug_nics(PCIBus *bus)
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
+static int pci_xen_ide_unplug(DeviceState *dev, bool aux)
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
+    return 0;
+}
+
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 {
     uint32_t flags = *(uint32_t *)opaque;
@@ -147,7 +194,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
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


