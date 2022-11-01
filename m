Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8161429B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:06:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opff6-00070A-Hk; Mon, 31 Oct 2022 21:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfeB-0005Ug-Gp
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:56 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdu-0006YL-Sh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:54 -0400
Received: by mail-pg1-x535.google.com with SMTP id b5so12142465pgb.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRQTorWjTOPm3hdswdPN9yJh6/SSUlrMzBdFF2tp1l4=;
 b=ACTAWMj41wFb/KM5H0nFpOokYTmdj2o3LEPV+cuBu44vm+zvN+b/5XzQ/Ln/nqO71V
 ay05JcNX20Mqif/bAq8UoaIzAiUmCheE7sigmeRxiirzCVTkfBMxrdyykeGnPVuSxXwA
 odevizu6zaEJD56TMICa1UZQnU1EJsoU3RlzcP9QJ62yUPSKNQjOL79I2jWaHxUHpo5n
 ZuCwv9J5Ic6Bn1QL9ZfPYrUhRK8UzbL8DesO71X8NBKzbq9kPsIQw2gitzNa08Xt1m92
 pJjLYT7JSWeOL4PidHuraJ5/4JIqqK7VQvAjqJDN4a6bnzbQIIIR0ySR9s+1wl7fEONY
 wJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRQTorWjTOPm3hdswdPN9yJh6/SSUlrMzBdFF2tp1l4=;
 b=bZ5UU7y0BgkSaReBqbB/sNMdhFX+yQ14kWbN/D8/HaJnWmuaXKGM7KhfA64TtpCNky
 8RosmDjlB9410hiqF8Ncs3pJ+5va5fYQusoig7wBka4LtIJeHAGs5vGB/J9f95aRUmYu
 4ciRf1SqSX7cMzugNxEyomXQG0+Z6Yf7fR0AjCq23QZoN1N9C3mtfZOD0dd3VnFgBkyz
 h7+Tw+zTa+M9eEMO+15maxHAJUl7OO6/wpylFAI0n6Mw+s2WrBHOeEcZcu3QJNIrxHBS
 EIqkr5Ab5pNPIbA1E6CX7RdqDG5H0bEVPc9AjHd5ftXu0cp0iNtxCk3Mn9bq0MdUmSgX
 aV1Q==
X-Gm-Message-State: ACrzQf1I3LXPu3Lb28R+0DKFapZm9Km+0ZD7scKHxUlxIe8ikSe5Gekq
 6uWQu6fQ/ZYtTKyFPNPNk3ckS8LfeBibzwfq
X-Google-Smtp-Source: AMsMyM7kMp/RdaKYm5SSp84Yq4qPv3N2NT52DHIAZqlhkMB8aROyJlJ2B0FD/gjKhDxGaLhQFcu8zA==
X-Received: by 2002:a62:b40a:0:b0:56c:6c63:fdb2 with SMTP id
 h10-20020a62b40a000000b0056c6c63fdb2mr17141154pfn.4.1667264435450; 
 Mon, 31 Oct 2022 18:00:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:34 -0700 (PDT)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 17/17] pci: Remove legacy errp from pci_add_capability
Date: Tue,  1 Nov 2022 09:58:59 +0900
Message-Id: <20221101005859.4198-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 20 +++++---------------
 include/hw/pci/pci.h | 12 ++----------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9e62c8e75d..b352a9c732 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2530,14 +2530,11 @@ void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
@@ -2546,14 +2543,7 @@ int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
-        pci_check_capability_overlap(pdev, cap_id, offset, size, errp);
-        if (errp) {
-            return -EINVAL;
-        }
+        pci_check_capability_overlap(pdev, cap_id, offset, size, &error_abort);
     }
 
     config = pdev->config + offset;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4f3e1e2558..f0a1a47f11 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -394,15 +393,8 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
-- 
2.38.1


