Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0B614279
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfco-0004K0-P6; Mon, 31 Oct 2022 20:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcl-0004JC-UX
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcj-0005eE-Pu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b29so12113472pfp.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=gX0P49+afReSpaN1wkS3JZPp++wUYooNVI4fUxWpQnInRQezQlE46Amyk8h79IQXzj
 H1/NAABCJ+O8vkyD9+5hVezdSl6iyczx5f4hRKUHBcME9K4dE7KFRR5hafuP9TzU1Dr8
 4EEVJ6SOGLe0MU3yzwXp7i4UBa9p3f8DU9RS4Q2dAPNjMcPU3nzh6PYpouKprKG+Bz1A
 i4N1t4g9oxP4hkCoJd7vU05dZspQxHHEuPA+t+sXts5HK8lUhdNakC4CrsViNnfXaCtD
 AfL51EY+xYz97VS2pyimWdPogR2AnJEYQoxpHmdUPV2MP9RHEJckKXtvnpFJl8grRDy4
 De0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=6AyvyJZCkNFND+tHFl6sVfurWOTm6nKrGBWkoRYun1od92CWrmE7CS/+RQyIW7sbtv
 00V82J90D/SiPYI1dTjX1I8sZpcHb1Zw/J+lPpiN30JSGU+epWE0UCx6d1rmb/kXKRRf
 HfCDA2J+tYON7CZw22eM+CiRJLdQxY7Bm1RDg/0JN/FbYA71bftqZBcD1NVE6AQN7Pgh
 c9OxDyXqdfQPSk/ZCvfVb927uQvmsA+urp4UfzV6g1QOYacEgfNfMmI61EegWIuv+YE/
 v2EdFg7puiIxVvMRx2ZsXe4qb6F/5P0GWjRI0JRnEi/xcZhwaIi1qLepCAhgEPZOHRHE
 6F3A==
X-Gm-Message-State: ACrzQf3Xvg8qF+mmLshZan1oxHhg0oRhz9le8zAfWw5TrIcTgiXHUMmp
 MTZws6oruFzdc9MS5PBav5KB6P3XXjZjLfAi
X-Google-Smtp-Source: AMsMyM4NP6yG6SKN2NI37jpbinjhVHCLW9tLcUWehHPuDbekNonYznoc1jyMd5ph79eeVfPNS5U8SA==
X-Received: by 2002:a62:a102:0:b0:56d:5de0:1017 with SMTP id
 b2-20020a62a102000000b0056d5de01017mr9797365pff.10.1667264364233; 
 Mon, 31 Oct 2022 17:59:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:23 -0700 (PDT)
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
Subject: [PATCH v7 03/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:45 +0900
Message-Id: <20221101005859.4198-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
2.38.1


