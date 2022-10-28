Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B340611164
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:30:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOSz-0003ex-Fa; Fri, 28 Oct 2022 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOS7-0002r0-2G
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:17 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOS5-0003Jv-GT
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:10 -0400
Received: by mail-pl1-x629.google.com with SMTP id v17so1688157plo.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9im1Kc9g5XlZqij06cd6/OXySKGlV0zzS1vFEiVRn4=;
 b=syQxPk3727bRaoArn3+ixu+LBdU28sXlkR4W09rZF9jYfuc5hyNMx5tveBdWfkoQg6
 2DBJ9hIbYgGf27MsG/8RNNW2JNPPgQ5yA67R04LzEFD7Ig3eiGsWXuUTxFC/kTTkHvf8
 IAZmy1/e5keyK3kMt6xWfDudyS6BAu82+0HEeyHDd50xtWndnUDbirnPHB5Bvfw1ZtN2
 JIQ7rHbaN6lcDdK8aBCv0d6Fm+M8OwzNT3sZfLXMXYgvOh1l1Vhp+gyTKYid+h6XsDTS
 7qmRwj0KmMqmdpeUIWcqFY+UPTA+9XdCugHuiFoMm6yikrg4S85dxUMFQOAR3lx6YNoz
 kzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9im1Kc9g5XlZqij06cd6/OXySKGlV0zzS1vFEiVRn4=;
 b=QrhykDZfDZX3TKbfh1x7LmZwtpnzAD2juIvohPxLR+5R7mInEawUb6QzxB30l84Z3u
 dgTwz5r7C/2jvcLyFUs6D8WRDC7becVWmTllhFzxbWSVv0xiknaLs2E0eni398cIVc9m
 vl6cviIt3uuKyCIK/lVCqN56zaB762LXDnj186GQo9nu2wKKJA5xuolZffNl6eWWnj0e
 7VPstUk/clRc9j86rDG8VnXFwezWikk9N/aBSQTo6IsQJxj8F5G08y52I2yjYDiwdJd4
 4ZulCPDorkSi39Qnz/gRd74+bJrtxU8TRuDbHq3OUiNgB5M5WFq94v74z2C2F6IAHHo/
 wzaw==
X-Gm-Message-State: ACrzQf1ZyG6puyhFOTabT3fPUHWs/RMYdmOOHPyOQou4uWq1GpHs3Ikv
 fUwVUOlxpbRYddTLbbzZ1WWAqg==
X-Google-Smtp-Source: AMsMyM6EGCojmWTtV7K5wTZ1C9LEmamet7oL5uQhl+kLfPz8ooNuOTRkHqyNS04wkVz/ycg+43NAHA==
X-Received: by 2002:a17:90a:7d13:b0:211:b993:8319 with SMTP id
 g19-20020a17090a7d1300b00211b9938319mr16452762pjl.139.1666960028002; 
 Fri, 28 Oct 2022 05:27:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:07 -0700 (PDT)
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
Subject: [PATCH v5 05/17] e1000e: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:17 +0900
Message-Id: <20221028122629.3269-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
 hw/net/e1000e.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ac96f7665a..e433b8f9a5 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -377,17 +377,10 @@ e1000e_gen_dsn(uint8_t *mac)
            (uint64_t)(mac[0])  << 56;
 }
 
-static int
+static void
 e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 {
-    Error *local_err = NULL;
-    int ret = pci_add_capability(pdev, PCI_CAP_ID_PM, offset,
-                                 PCI_PM_SIZEOF, &local_err);
-
-    if (local_err) {
-        error_report_err(local_err);
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pdev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_1 |
@@ -400,8 +393,6 @@ e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 
     pci_set_word(pdev->w1cmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_PME_STATUS);
-
-    return ret;
 }
 
 static void e1000e_write_config(PCIDevice *pci_dev, uint32_t address,
@@ -480,10 +471,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
         trace_e1000e_msi_init_fail(ret);
     }
 
-    if (e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                                  PCI_PM_CAP_DSI) < 0) {
-        hw_error("Failed to initialize PM capability");
-    }
+    e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset, PCI_PM_CAP_DSI);
 
     if (pcie_aer_init(pci_dev, PCI_ERR_VER, e1000e_aer_offset,
                       PCI_ERR_SIZEOF, NULL) < 0) {
-- 
2.37.3


