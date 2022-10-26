Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A160EA24
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:17:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmp2-0001We-5k; Wed, 26 Oct 2022 16:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmob-00015p-N1
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoZ-00031x-Ug
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g129so14406156pgc.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=we1LIWDhFOYx+MThE4M8weJq3invtldY/4oKMH6LsVY=;
 b=JTTpWCrOlWSf2rTw75PcFRuSF2CQz3R3SBZVAYOZWO09wznLe8eOxo6qIAcaV7etjQ
 nppZ5l5N7tQ+CwE2YmCFLqn48sfh/M67joHRcPWa6Y9h6YXD0SlwbXZcdhWCF6VoTupD
 YrVuNiwNCWqar19mTBQieaXkMvg1FiJTH/5MaqpC30WswvwJ34Ty8ueX1lj70WLBK3wW
 JConjwkHCpn5AhNMzHLIoe3Hj05TJU1JNR+7Tto/lalrpu4t/jA5GX5Ciqb9z8HOVV52
 7Ekxq3grzCqJNMrbzKpwcCn+MrpAl5QukwkNHVUHrHBTKmLyL+u9Mnv43T1niCiwXhf2
 5q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we1LIWDhFOYx+MThE4M8weJq3invtldY/4oKMH6LsVY=;
 b=yQmVe1MZfST5EK3zBxJx43/LtIJ/aC5dWTjg8IbFqc1mEBnZAMjY/6Imi+PVAtiHpb
 eUymS1IWWCrd4qR8z/rY9GJAdywnXlsrTun9D+/nIIM51qij1YWLZq/7gaXQ5qaePBTg
 UVp92SHd3WFJUEC1yPpzCn9+wNgYf41nkW6qy39P5mWeXsLYn8VfQz5u10HEaEHHXW1z
 I0y9vCrV7zUgEw663ZWLkKOIWaS7zKzj2dKh1hUez+fO7zY3HqnMMClsRmKhQOFgpyoE
 HSs8fFkzqUwTuMf8oywnDGkfZn4yiaLh87chTbGPIH8N084fDFez7YGE9Hp+piKK2atX
 Srlg==
X-Gm-Message-State: ACrzQf1ogfGCj7iWWT2LCqw1lwB3x4NXd5o8cTKmSGqegdOq6dTSWZ7P
 nW7uRN3BiDjHbjR0s6MKdMk0lQ==
X-Google-Smtp-Source: AMsMyM6WCG4PjWnThmD2N/6X+D/UP9vm8sa6zGFBmyLMchbv/a3vQ3kOUv1GDttBujHNNRkaO41RJg==
X-Received: by 2002:a63:5643:0:b0:44d:b691:1da1 with SMTP id
 g3-20020a635643000000b0044db6911da1mr39846347pgm.450.1666815350621; 
 Wed, 26 Oct 2022 13:15:50 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:15:49 -0700 (PDT)
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
Subject: [PATCH v3 02/16] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:13 +0900
Message-Id: <20221026201527.24063-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52f.google.com
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

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/i386/amd_iommu.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..8a88cbea0a 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1539,7 +1539,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
 
 static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
-    int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
@@ -1553,23 +1552,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    s->capab_offset = ret;
+    s->capab_offset = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
+                                         AMDVI_CAPAB_SIZE);
 
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0, AMDVI_CAPAB_REG_SIZE);
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0, AMDVI_CAPAB_REG_SIZE);
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
-- 
2.37.3


