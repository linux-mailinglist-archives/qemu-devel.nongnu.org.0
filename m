Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B6611162
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:30:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOTV-0004j9-TN; Fri, 28 Oct 2022 08:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORt-0002mN-JJ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORq-0003Gw-JH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:26:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so4643940pfc.11
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=yRLR7VqFY4R2t504OuxBL2i6e6/EfeFrW1m8OCLmSDqbUcIj7KykRumaGHDDhC2ns7
 Bust8hubcmExPGZ52osDPmnOpZAYT1/vZ5yYrdKK3DjgcaMhWPFBEbZoGw50C+Ncuz0y
 LY1HJuNpDKzKXPG09YP3yjb+MsYg4rO/a3jmH964XZJ2gemW++Nb8RyTL0eRyzvicRDF
 wbYZmFXU7ktKCTo/ue/jHpeTKVpuYIxbaEIlfpwwQAM5RKldcR50YlFULxm/0qtMU7sB
 w16mIYfm8TjhI9LBHB7YWgGyUeuSUDtYMkLgNCjBp2DdugM5R7RnlNn9zi9IAxI5UjJj
 YVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=b+YGqzei74P21Jz0hzT7hbPPkRWPYMmv544P4GhRazYSxdTxEIVckP/6rXKmyolreb
 gDCLjb4nvNpHtibihwMI8Ilmq4V83WoxBVKauPFA2LoDn+cPlhi9qplv4gvQ97B3TKJ8
 L50IkyvXRZH9Zo8CJjWk/AdecJRcQK3VGGnv1ZGaaUYy+LifmWWNktPyTswjKEJdWZFq
 e78SUUoXZgHVLdfNHLbSQik+bmsOWoMmsZ+mJcCcIHkEkKdojG4BgUEc60acn3kltMW3
 eR3K+ObbqBa/ht5tnd+GxqL5103i95CwOxBr6QVYQB8sYj6tpcvpDdyjQoxgBUygIxS+
 pjCQ==
X-Gm-Message-State: ACrzQf2kojd6syXe8TfAaIbxEzE9PY2PfkDe02wZoKyNK7XSDCzDhjMV
 Z655JAfMp9oUMG73RftsdJD8nA==
X-Google-Smtp-Source: AMsMyM4/84bTzRbSJRcC+QGde+/kwYrzE75Ij72lPXXd4Brfy+O0bAIWjC692i5ArGnXXzlrobEGRA==
X-Received: by 2002:a63:cc:0:b0:463:6cb7:4f5d with SMTP id
 195-20020a6300cc000000b004636cb74f5dmr45579042pga.489.1666960012625; 
 Fri, 28 Oct 2022 05:26:52 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:26:52 -0700 (PDT)
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
Subject: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:14 +0900
Message-Id: <20221028122629.3269-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

Such an implementation of pci_add_capability will not have errp
parameter. However, there are so many callers of pci_add_capability
that it does not make sense to amend all of them at once to match
with the new signature. Instead, this change will allow callers of
pci_add_capability to omit errp as the first step.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         |  8 ++++----
 include/hw/pci/pci.h | 13 ++++++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..8ee2171011 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2513,14 +2513,14 @@ static void pci_del_option_rom(PCIDevice *pdev)
 }
 
 /*
- * On success, pci_add_capability() returns a positive value
+ * On success, pci_add_capability_legacy() returns a positive value
  * that the offset of the pci capability.
  * On failure, it sets an error and returns a negative error
  * code.
  */
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp)
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp)
 {
     uint8_t *config;
     int i, overlapping_cap;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..51fd106f16 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,6 +2,7 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp);
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp);
+
+#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
+    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
+
+#define pci_add_capability(...) \
+    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
-- 
2.37.3


