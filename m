Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9C6084FA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6KI-0005Oi-4E; Sat, 22 Oct 2022 00:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KD-0005OJ-Ru
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:33 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KC-0003j7-9s
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id s196so4269700pgs.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+vwGTfDGUfglEd+A+a9uNkSk8M5X1nPBLZPxAQj164=;
 b=sUBdSnHRlDEeVwMhCgWYsNI0QvMLEqxkgU+pu8XY1BjW2yGdOwCcC5615ZqmYm6Nwv
 ktIoEaxpkE5YQddrKjM5DscTjlOhBYFDvORS3geweqmmT0fVR3j8ne4yltJVc9D2XgXB
 OYFq3PrRm/4+9J1n4S7dtsQ1194cODcu0QBxbhuha4oSuW4kAoVzQfLKqZepc2vbGlHN
 pbQeN9h/wHH4+bVItDNlKKP+QhLx1kgWDKb/9qM9VBMvww+1L/3pNO4d/1bgMKwAsNNX
 H5N0yVONLukLT5U6ic+Ojo9im2S8zXB+P2wBN4p+kt9ocasDzDtHeR3BwxuX0wYyvQmG
 KsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+vwGTfDGUfglEd+A+a9uNkSk8M5X1nPBLZPxAQj164=;
 b=J8U1Ly/TtD6aKVvaKkS1eRwao/LN+56rGYs2ZdfQO2929PCOPhs9Mgf7y2vP4MMGkM
 aekkkIMi4rW7FErKzJ+bgk2Q++ZrHBhHVf7seA+kmOkml6FVu2UaAQe55oFsNb6HnvsB
 fsiJXkzO3MBBDaBBhrl2Tu2ADF5vhvQwqkQNL00NgGoxNDrC2UQX0JLLr1Bv+I4A1gFC
 p0VWNXesP2u99INdCRY6tqEXZR6ab7ok+Q1kToJaItOSr/FfapYvcJLQeqPsEuJCfsnm
 EIo0kkE+8TMdQVfaW3BhZ/I8d3ofZ7mqJCPOs2TwB1lBA4i+jU4Dn/laEMxnFTAf+Ckv
 05lQ==
X-Gm-Message-State: ACrzQf0uk+u0lHRykKFCcIrGTtdrD0IrOpvAT3vlIOA9WB3vM8b8Fb6H
 cLI4N3nhlAZnKsgyX0VmtoB8sQ==
X-Google-Smtp-Source: AMsMyM7kRIvuZyWXMRmjPHOEmcEz+FnGnM7R3uiuWoqhQLq8JNo2LJlW9zFYe/u4h8HTAcNEkuv2tA==
X-Received: by 2002:a63:5702:0:b0:44b:290:f24f with SMTP id
 l2-20020a635702000000b0044b0290f24fmr19105076pgb.558.1666413690163; 
 Fri, 21 Oct 2022 21:41:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:29 -0700 (PDT)
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
Subject: [PATCH v2 04/17] e1000e: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:40 +0900
Message-Id: <20221022044053.81650-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
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


