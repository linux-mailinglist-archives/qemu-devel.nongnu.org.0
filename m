Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94861427F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:01:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfdD-0004RV-GP; Mon, 31 Oct 2022 20:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcw-0004M8-NP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcu-0005i2-10
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c2so12203551plz.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=QK6XEkQeerSyByLHe9KG40tpCpw2IVl+9z0AXUGhKeFpw8bQh7Nsr6Q67CG1B1IkvQ
 g0q6Fzl2LTuCTATMJmbdbpa3qR+oRW8y1LoqAUtWtZmzs1rzeOARrnkuVn/e4gSTDlyt
 855GIUfY4ZL3J5gAFdUh2gpWJpR1z/1N3p8M5Nd6eEzvlYbgOnsXYKppBuedRl+S64l1
 o+lGAaoTFPD3I9X/ap67p1YzTM8B4Gpi74nXm3bGi9PhYyq2FopeRpkEbtUu8TXxRHvr
 uDdryPEE9L0QxU+CqoKbwQq96Ods3s56ls8JFExbMOye4bnUl4tUnFc89gBnUxN1CgR1
 WuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=C/xDao34BhA0Tmazd2QKvriBi7I2fWeHXQKC5s37AgU5tl3Fksy9khgRneBa1NvPdi
 y7eN+5erMqGkLYy/6qer2xi1yXjfrzouKkTzqL+1I+QrmKM9ZkRswKV1IFHV31+aFlNr
 Izys+A3i42pu7LVeVFO+XmL1pypZpvrm1SOvxEU+bILZX7OYtsDt93YUlY4xaN2rHmZz
 tOdUx9jU7mKjxRE5Ir1P2ABucrrJ48dp9vG/NsOptB1/PbxPf+aLr93t9XpChhoN3J/z
 lrBcw1wxQqBRTaR0eY3DQi94Ri1KSItL22YEzl02xfoDvobPwLC8Jeaby4tjPkz/xMun
 9ylA==
X-Gm-Message-State: ACrzQf1tEIJlHeFd3A7ofDWNOm/vcGrg10rkyvP6ZZZy7B46yXao4irH
 xq5dztr/DyBRNpI9SeIaah1TErreKyImeBi7
X-Google-Smtp-Source: AMsMyM75MymOqHRfNOrEc9Pr3MhKVHqmLhH0KzLT7nBagw3AKu5hoT8WT7Rvc6pTc432Gk+5s81bGw==
X-Received: by 2002:a17:90a:1097:b0:213:d7d3:ab8 with SMTP id
 c23-20020a17090a109700b00213d7d30ab8mr9681883pja.91.1667264374134; 
 Mon, 31 Oct 2022 17:59:34 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:33 -0700 (PDT)
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
Subject: [PATCH v7 05/17] e1000e: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:47 +0900
Message-Id: <20221101005859.4198-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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
2.38.1


