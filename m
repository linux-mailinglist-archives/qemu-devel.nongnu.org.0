Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6560F07C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:42:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwXW-0006ts-1M; Thu, 27 Oct 2022 02:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWV-0003CS-5b
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWD-00039r-An
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:48 -0400
Received: by mail-pg1-x52a.google.com with SMTP id b5so393766pgb.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/wVlNiEldgDVjsPjh0ol+nUZbcUyoFeavu4L0KDtJI=;
 b=JKAvN81haw9OiM+cIaFmly7Uco0yzxacXRWo43lOnWQ622t9haQc433WriVbYytZj9
 Lak+GNp7po9VLzTfmiu4zWrOilmJzybPpOyjYvJpF7uFmuVsSeyW1xCWMImP0sW1Clp5
 CM5cz20QQXM/PXYU1Xcwr42fv3IqOc9zzhZZwUqoHmuFXn55H9Md1UsHmsCcwwblZ2AD
 VIGOs5QIpVEXnyfevwdntgTqM+p9U7Y/We+AWqX8zi8uTNfiZntxfzhL4qwTiFHbz2sR
 BeY5ygTVRcJpZ9x5qk/pDHvXRm5rd1lojorWeNtFq6ZDB5Rtzjq5Ue1ltKpyjuQ1ZXbH
 3q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/wVlNiEldgDVjsPjh0ol+nUZbcUyoFeavu4L0KDtJI=;
 b=j6dGNsSCsLKl2/VA5i6zVhNA5f9EqTGC930dsNJe68MNBInp0gHt7eRWgxKwZK52oi
 BtSXa7lUkzZYyaicyB3YLXxHF822bfrxYrKOtBEtOqp26SMy5WAMOMaCSAvADPvMwD+s
 fW7U2Qm4LyFC6v/6bNo0rdo9x+qVkagtP6ikWvtHC0yNyKjtpitdNUg1iBLar+Qi13aD
 Nu/bdoH4eM3OOvKFFncX3Q/igSU4hSmPgvSbaF+HNj+gdcwWEkEfn81kJw5KANQNAHzI
 86OQos/Hy3s4WUCchsyA3v5Z51fMeQLRe/B6iug5dDgRkUr6mdJw2eFe8jsW2bw9B9T8
 tY7A==
X-Gm-Message-State: ACrzQf3dkn396h8hqMfCDNFkHcz7dK5YzNH/hwRCgpM8SwCWgasrJSIQ
 THGefDInEKs14lFfvjwSMtFRow==
X-Google-Smtp-Source: AMsMyM6W8FaBANVXZUafEKXVct48bG0QJMhjc6Go2t/SIIV1MJ6Seyp5J590VnoPfqw2BKvfuwPjQg==
X-Received: by 2002:a63:7909:0:b0:458:1ba6:ec80 with SMTP id
 u9-20020a637909000000b004581ba6ec80mr41503447pgc.414.1666852650427; 
 Wed, 26 Oct 2022 23:37:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:29 -0700 (PDT)
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
Subject: [PATCH v4 03/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:51 +0900
Message-Id: <20221027063705.4093-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
capabilities overlap. This behavior is appropriate here because all of
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


