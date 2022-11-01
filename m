Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668AD6150A6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:28:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsi8-0007Ag-OQ; Tue, 01 Nov 2022 10:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsi6-0007AU-P9
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:50 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshy-00043D-IT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:50 -0400
Received: by mail-pg1-x535.google.com with SMTP id 78so13614671pgb.13
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrgNSVqTDbuEanLstNZKWa5su0x6ybIEgUvgtm8IN1U=;
 b=FGUMxBkhQyYJQ6J4IWXifllETidG6MLi6svQtt/0r+KIg2Tx9IQugmsJK8ywHRgRZ1
 W6wmbMLXeiXQoHu8cSXd1Q3lY/ac/efevh+V9TeKJZwZmyTakB/ZlG9hYdQf4vr0Ys9o
 r0UklPpH1Q7O/Q48GEPpICfRR4ko/gwZlHyiBc/32iqkURFWck69kjMFERQOgRqHC8vn
 RhM4yl9Payukyd6ylZJ0cGNEyIADB/BMBUyc36FrVwmZy2BF6N6KmA0rlwswL3VvAWQN
 EidhuFdO46BBeOc1TxzFaatABhkFeMPSHz9DDBTzPqRm3fNYuRBpquD4QXWlVCvq1T1N
 l8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrgNSVqTDbuEanLstNZKWa5su0x6ybIEgUvgtm8IN1U=;
 b=7sDf+ecdKAMSQ2DrR2vy4TiOMCeCYuP+pSAkoYYAJJhwawZfbLfCD1u89tK20XeIde
 veNLruDR3eJPumh0Og/Q2YO51cezdA2GjyicqFFm4cM0KrhaO/+L8Ag18U1NsJl+rE/3
 J9gzsgog8BRXSdnwj0G0Ztb43mdCyb/hi1zIEzio0/EgsYuh7zd3HXNAA244AS2P9y9/
 5v/uJUWsA+l3EcoeoAdWNqSe5+ydCdVzYYmXMypHXlw33c8YAqFiio4iBH6bTMalBx2H
 j+ha+h1ijXFkvmym1gt66y41nxmS30NitYJRI72F3hBj76O7VueVa5egyX9GOiuHnrnP
 DrLw==
X-Gm-Message-State: ACrzQf1nQC5UVd96vLneR55Dc0H7w2xwF8YA9xNWYgpjoP/mJwhg+A85
 cHX91XY35KDSTG3vrfhtj9UmysFadWMC8qNn
X-Google-Smtp-Source: AMsMyM7D3/byBEyhO+gW14+7FSOqott48uSGBB2L6FsgiSDKtzFMd/rlkXITDvxAH/BBCJIFAUsbEg==
X-Received: by 2002:a63:fb01:0:b0:440:6e9b:1e86 with SMTP id
 o1-20020a63fb01000000b004406e9b1e86mr17248921pgh.26.1667314660975; 
 Tue, 01 Nov 2022 07:57:40 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 17/17] pci: Remove legacy errp from pci_add_capability
Date: Tue,  1 Nov 2022 23:55:58 +0900
Message-Id: <20221101145558.3998-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/pci/pci.h | 12 ++----------
 hw/pci/pci.c         | 18 ++++--------------
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 555ac03010..da414dc728 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -398,15 +397,8 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
                                   uint8_t offset, uint8_t size, Error **errp);
 
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
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5f77ca581a..41ec69ea7c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2532,14 +2532,10 @@ bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
 }
 
 /*
- * On success, pci_add_capability_legacy() returns a positive value
- * that the offset of the pci capability.
- * On failure, it sets an error and returns a negative error
- * code.
+ * Return: offset of the pci capability.
  */
-int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
-                              uint8_t offset, uint8_t size,
-                              Error **errp)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size)
 {
     uint8_t *config;
 
@@ -2548,13 +2544,7 @@ int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
-        if (!pci_check_capability_overlap(pdev, cap_id, offset, size, errp)) {
-            return -EINVAL;
-        }
+        pci_check_capability_overlap(pdev, cap_id, offset, size, &error_abort);
     }
 
     config = pdev->config + offset;
-- 
2.38.1


