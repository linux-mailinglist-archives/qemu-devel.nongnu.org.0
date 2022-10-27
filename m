Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3B60F07D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:42:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwaS-0000Be-35; Thu, 27 Oct 2022 02:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXZ-0007Pf-SL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXX-0003bH-6N
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pb15so633704pjb.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=sdq72ZweU+PBeyMHvX2FwQNome9qIOvhtfbJJ6Nqtp8tYc1Z+8JlM8IsWzfTdDLXao
 zHMNNFf330P1+xW9rs0KLb/3rWH7puGQXGTmcx0QHf/PJ6HwiqXFKT3v7EWC+I7m2uAa
 BtOYZQBLLjNbR0Rj8MSibOOtbVGmf3umyvn+/3gXftwhPM3N29KxqKZAD6/DcQtN89k1
 mNAVOmaL7fBAadRyqnglqYTFh6NWHVUeicd7f7LZmCavvSr9//pzo63hLifTHXHTpU7+
 CRCiTGN2bSTtkaNvLGTnG17AaiCfDc8REu1NtoNWyPeaAUYJy2k1PdMlT9Tj6Udc2Bdx
 5lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=TkUIWm4ILZk7VudvF+ZzEFs6HxwvwulecZTg2xnRqT4sKrYD9Mn+I9Osb8/PtP17kA
 /c1LrNWqpFVd0ddCjLM88kWxrfIJ+Afzr6mT/OucaIfuVR6MKGZpyYZLqJLIVimxoUtc
 DCqyY5cuMzRDtmbBD//GgO8Fua4/OfXRxZs5uj/wx4SAbioR/yn/Ofe1nH2/aZb9vToV
 fZ70s3DtqW5M4cHkytGZfUTWDtEOAvUZMexF65LYTNivQ/y0sJc8cXpDBY/GnQSq5nFY
 moJQt6C7riNhm+IL7M80ELB9U31JKzC8AtJQkKpwrydljnaTkq1H5lBIWsJgFHZynwDx
 lFag==
X-Gm-Message-State: ACrzQf1M2lBRHAD4G8h6Guloh6FIitsxEW81VvrOaKwvzSr7Qsz1ymVM
 cy/k5DQWXJwTEmkbgNxBxold5TywT1bVJIDM
X-Google-Smtp-Source: AMsMyM47y+jJSdwWKxfeYTAl6uZ6qiHZgJJ1f8NyH8LZDyLF+5PcNl60dCeJK8tYHA4X1J9DbuxWmw==
X-Received: by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id
 p4-20020a056a000a0400b00534d8a640cemr48752103pfh.15.1666852723495; 
 Wed, 26 Oct 2022 23:38:43 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:43 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 17/17] pci: Remove legacy errp from pci_add_capability
Date: Thu, 27 Oct 2022 15:37:05 +0900
Message-Id: <20221027063705.4093-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 29 +++++++----------------------
 include/hw/pci/pci.h | 12 ++----------
 2 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8ee2171011..8ff71e4553 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2513,38 +2513,23 @@ static void pci_del_option_rom(PCIDevice *pdev)
 }
 
 /*
- * On success, pci_add_capability_legacy() returns a positive value
- * that the offset of the pci capability.
- * On failure, it sets an error and returns a negative error
- * code.
+ * pci_add_capability() returns a positive value that the offset of the pci
+ * capability.
  */
-int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
-                              uint8_t offset, uint8_t size,
-                              Error **errp)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size)
 {
     uint8_t *config;
-    int i, overlapping_cap;
+    int i;
 
     if (!offset) {
         offset = pci_find_space(pdev, size);
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
+        /* Verify that capabilities don't overlap. */
         for (i = offset; i < offset + size; i++) {
-            overlapping_cap = pci_find_capability_at_offset(pdev, i);
-            if (overlapping_cap) {
-                error_setg(errp, "%s:%02x:%02x.%x "
-                           "Attempt to add PCI capability %x at offset "
-                           "%x overlaps existing capability %x at offset %x",
-                           pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
-                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
-                           cap_id, offset, overlapping_cap, i);
-                return -EINVAL;
-            }
+            assert(!pci_find_capability_at_offset(pdev, i));
         }
     }
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 51fd106f16..2a5d4b329f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -391,15 +390,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
-int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
-                              uint8_t offset, uint8_t size,
-                              Error **errp);
-
-#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
-    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
-
-#define pci_add_capability(...) \
-    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size);
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
-- 
2.37.3


