Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AE614FF5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsh9-0006w7-5K; Tue, 01 Nov 2022 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsh6-0006vW-Sy
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsh5-0003dH-Ef
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so13123456pjd.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=IsAkAciC9mOzcZM0bSvLQQCtXlAR2bRRd8WLMVjDSgZg+IpAy+X1aFSLvhlNx1p5b7
 jgaj01Vfch/4r33q3L1JmJT+SkeJSycYd3NRGaxYRCxCW2vuqSKvlnLTGjqlnoZpHmw2
 Bsyn15wEHiRIGhwQbGxGd92lqNFmPXYhdGou3Ozq1A11YQsonIvFkgbYJAbI0P3dF3GN
 uGgEVD+nTzok9RYkvnJplbvfxkYzqA8KvFqmXHGz6Inrbf22Cfmrju0jqqz2dNfvOWwN
 aVP/wUm673ys+LwtwHVamdbQpqgRX9qDaHpCSalAOAYEvCNONaxGVdTh1egou0kRWP1b
 ok3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=5uFARj6o6YsgisR5NRKHtfT/aUw1OA1EI+xVJX38TkGqPfMVHe7Rxq+fjJcjayHBVC
 NYwW6S7jIEr8vGBrAmFFcWko11s7OJqQNdtLU9Umjre0RVqMWmzpNzvcez6NrrmkNbIn
 oLu4IxMVClu8lLr+1epDWHsXC/sFIgtXbbtYRzBmX+QndN3q6IfY2Y49wzFsYZGJW4M1
 5Vv2pnA4ysz/+k8egAPNLwhcC4+XIQDhUmR1XG+VThyD+Atdf30kJzN0hg4FaLnpqzK+
 sKq0Vf2L3rhsefsnwDD+bK0lBq6x/LwPGjZtR65wxCs8dYTplgPwCZgNLFC0tzSYcFUU
 d6AQ==
X-Gm-Message-State: ACrzQf3aMajj3bnTxhIhEqLFFqfBw7WmqEI8QnhlIruOWe1nG+8LSKWM
 tOvILh7SaF/ocbhUzWMgg1VCrctytno76z+H
X-Google-Smtp-Source: AMsMyM6jmi01GVQIroe2vCnhZhu8qQqxilOr4ut5gNrpUttDSaDtdTHje0XLn2x7Mb5bPkFiOLEBkA==
X-Received: by 2002:a17:90b:128a:b0:213:26c2:2c06 with SMTP id
 fw10-20020a17090b128a00b0021326c22c06mr36897854pjb.26.1667314605555; 
 Tue, 01 Nov 2022 07:56:45 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:44 -0700 (PDT)
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
Subject: [PATCH v9 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:48 +0900
Message-Id: <20221101145558.3998-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..ff4e2beea6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7325,17 +7325,9 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
                               PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
 }
 
-static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
+static void nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 {
-    Error *err = NULL;
-    int ret;
-
-    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
-                             PCI_PM_SIZEOF, &err);
-    if (err) {
-        error_report_err(err);
-        return ret;
-    }
+    pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_2);
@@ -7343,8 +7335,6 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
                  PCI_PM_CTRL_NO_SOFT_RESET);
     pci_set_word(pci_dev->wmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_STATE_MASK);
-
-    return 0;
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.38.1


