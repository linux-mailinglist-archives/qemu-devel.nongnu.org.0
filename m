Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F2C61500A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprmX-0005mO-EA; Tue, 01 Nov 2022 09:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmV-0005kk-7m
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:19 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmS-0003sJ-Vs
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:18 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k15so5469768pfg.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=uec6W+AveTWsuZadrEVxPz94mQ0T5yGhPmLKlZOocA8pxbofpkjV/wNQ7eCfx0KEP4
 TOXI/V5fK14hI6LrWwYOIn+2+3KI2EiQ8/KfTuqoggEXdloG74jrWROD8wpQJ5NoLWhL
 IbGg/U2TI+d9Dk21PD/Wp7mCIKBpmoULD/z65YXsV9O7OUPkmGDTXm8fYYeNi2YvtIQ2
 O+pOmimESfOIau6NQU4X835kd8aNliZVmXlhRcl2uIGhXkz7f/wkXnVTAvwMSjEjecRb
 j4jWj1p1JjJAijNq7Kvxx5DwIjkcLrzCKNo5NVsq6J/wVpzWkx3Y1Y/BbRi7JMDW8Kel
 +O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=3+kRD0H59V+qkdgK+dJxOjdXASoRDZsiRi6i0U3z04u5LqRUMah93REaTe+XWfxg/R
 aWCr1708jSYAP2Phv2fn4KLqEOQxdOHq6j5OaJvwt3luqxDTaEbgeO57adH1Q2HQsgv3
 CkCH6vS6XTzp9Tnoiqg4OuhITemANFGkKK8YUd8dUw2RW0lte1hTD6OlQS3s6p7iMIsQ
 aPwWExHH4iM72uDOQq+mFo0ah1Q+cltaDcYrWnTJ7eMqm21Jh/QU5I18lExFmf5NaIy2
 3BCknYFiufpAJVPgev2nC5Xqu9o35f+aDOtAp9Ru/wMIzVKah5nC5vMjsbkpm4bovtl+
 ofMQ==
X-Gm-Message-State: ACrzQf1ScKOEgbKQDDwwid/2RRbcRUHyyp23mJaWV5DQg4kcmrmel0K5
 J14RcXw9V6p3wWpRaBQ8hqh8++SdgYFfmKmt
X-Google-Smtp-Source: AMsMyM5lhiIwXWnLaB6qUO78rfrF9Y5hUbOEmon8k8uCbkhbo8ba8WyhciugFX2ckg6r2O814oS2NQ==
X-Received: by 2002:a63:a555:0:b0:46f:f363:635d with SMTP id
 r21-20020a63a555000000b0046ff363635dmr2167613pgu.212.1667311095288; 
 Tue, 01 Nov 2022 06:58:15 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:14 -0700 (PDT)
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
Subject: [PATCH v8 03/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:35 +0900
Message-Id: <20221101135749.4477-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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


