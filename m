Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8653613687
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU0m-0005lH-Dw; Mon, 31 Oct 2022 08:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzn-0003Wh-Cd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzS-0004Oc-Q5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id y13so10547214pfp.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=YL4bwsZmnxpyPYCtY9tofpKF1/UMhKk2qNGaZNU0jwP2M/YFZDSB5g9+l9dU9w2RrU
 8zenL6waVp7evsxkfyxYAO61bjM2ibikHKEjrp4nVlIJ/Qj7mWtqwbh26IBONMfY/f8G
 Jk/QywsRe6575yubshrU2qzOgJ7q35ifHQ4qWL4yRjWdkvEZTZDg9I7kjDcEpmzcHPDS
 E8VmZmqnIlXSRGYlwCtOdCoYIs7SlGnrTHqyZOhDw91vNfBgfnFT0qG6xbJa6uk+NM54
 BD45TdUm3St24ChtyPtTPKYTDfIbtR7T1GSxAjq+eoYzzsNkroTk80dsAYetKL6WIIu4
 3YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=lJcp0mMK2YTGAxD9yn9QodhlLr+uJR7iTKX4XSlS7YWMx2wKWJ3iv6kALNS/7k/aBU
 0ehxROjmmNjfDSJ0l++PI75okFJPJIntyUA/giPUgYpVjTB+tYkzlG2T/nZjsPfRETRO
 P7PHJZupzZUPmIdyLeCTCtNJOPO//1GICjF5pX5MBHnUY9sgv7jV78ghizIxaFzvX0eD
 vggjn3TZHrDFaRWXMP9mxuTXJQPkHuoBWQ45bxMHROTHCQpksfFtayEBMgxmgBOffwNA
 zsItG7rYL7tSSKQQ1xP89sP7m3L6mqr99M4WQ/uJIeh6517NRv5W+Z7kVI/fevbAx/bv
 E9UA==
X-Gm-Message-State: ACrzQf3p4Ou9r4ufvwNf4udcdPkQHHIcBxNUH0QBIqWYAPaUpZxh7few
 W80lIO6d+q9VDf63lyqSglfsjcCJYZcF20yo
X-Google-Smtp-Source: AMsMyM4SeDgSgKz9HH2bNIMdXd0ca00QgTUKBVXOM9H+rncdodiwuJHozJy8ig4tZ4G/40LPsJGFdg==
X-Received: by 2002:a05:6a00:1d89:b0:56c:a2b:f1c2 with SMTP id
 z9-20020a056a001d8900b0056c0a2bf1c2mr14509734pfw.45.1667219644277; 
 Mon, 31 Oct 2022 05:34:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:03 -0700 (PDT)
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
Subject: [PATCH v6 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:09 +0900
Message-Id: <20221031123319.21532-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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


