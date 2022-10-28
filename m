Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70492611160
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:30:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOTD-0003rJ-Qm; Fri, 28 Oct 2022 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSS-0002vL-Al
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSO-0003Nd-3A
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:30 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so9667172pjc.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=SoM9yT9mMMlxZBpJq/cPn0Mr+8FJv9m7GWMPNHQxXd6MjgfyMNcwnJZfy7dkMCOI21
 1RgqoIijr8jCEW2/k6UCLYM3Qdjvh34NbxW2t6Frs61mUDR5c+uWbvTfiG8JpjzVxTv1
 PEBH6xm2Nq4w6pkORTTM52bnuV00fBgYfOlAOGbUFwXXwBllc+kuq30j8JJXRxU1JBmw
 Fofv04cR8uczZS75j7DXHvqalyO+oxZZ/rR+VWld5IBw6qChktCmw1PP2AmQ5c94oim6
 mtqvkokT36ESrTz54TI4cz7utrhsspF4WlEgpYS8sZbpJBhJE8lbbdnbf9eSNkiKJHAU
 JVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=Z8kO8bDlh4aktlNz0XY711eoGtnMd3bD9Xx1Hz+MwClz+1GrE6BjM0BfXm5yneT8s+
 luuLw1hLPPNVTIUArWAVY+HrJkCJg1vgWxuHKOwr8jalUrYg2Lzyjy98oTsjV0h3+zQ3
 et16b1O6QfOMxUKz0KFo2Kf4H+Cx4c3blZqAYd+N8sZrlqFvWhhSYN1OsXhDVV13EJK7
 snqCgIQLqATnFdb8QHDak792YC9OVXS3pcgB+g2Q1jrWVPNxFDR9OO1mCEosRBEnE+OG
 ihHrRJspF8xem/qLJzIFZDlk6NoA9K2bjn9uvZDvygn6N9q6jBsuwoSxah+YrDw9nOWc
 AoqQ==
X-Gm-Message-State: ACrzQf1teupDunErLYDo5HvUJs3OUKb5Bv3LZEvi5IX0CQphqag/wHUp
 5QMemeiwh3myRUfWMCSNkcVmzQ==
X-Google-Smtp-Source: AMsMyM4jj/QruNB+O8OYmTsisCKb09/mFB5085g1qL38Bbv+zZhxt168lt5E1Y4Ybfn7+Y3ZGtyGEA==
X-Received: by 2002:a17:90b:1e0a:b0:212:c44b:fffb with SMTP id
 pg10-20020a17090b1e0a00b00212c44bfffbmr16320431pjb.113.1666960043478; 
 Fri, 28 Oct 2022 05:27:23 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:22 -0700 (PDT)
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
Subject: [PATCH v5 08/17] msi: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:20 +0900
Message-Id: <20221028122629.3269-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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
capabilities overlap. A caller of msi_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..5283a08b5a 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -194,7 +194,6 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     unsigned int vectors_order;
     uint16_t flags;
     uint8_t cap_size;
-    int config_offset;
 
     if (!msi_nonbroken) {
         error_setg(errp, "MSI is not supported by interrupt controller");
@@ -221,13 +220,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     cap_size = msi_cap_sizeof(flags);
-    config_offset = pci_add_capability(dev, PCI_CAP_ID_MSI, offset,
-                                        cap_size, errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
-
-    dev->msi_cap = config_offset;
+    dev->msi_cap = pci_add_capability(dev, PCI_CAP_ID_MSI, offset, cap_size);
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
     pci_set_word(dev->config + msi_flags_off(dev), flags);
-- 
2.37.3


