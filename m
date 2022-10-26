Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9A60EA2B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:22:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqJ-0003BR-O2; Wed, 26 Oct 2022 16:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmp2-0001cu-6d
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoz-0003BW-On
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id l6so11552175pjj.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=kkO4DBwqFD5a8xdmVKueAI9JMFzgKI+4zAeQhqHfOJ3+deRvEEua6j/GYxWDb8oSjJ
 91Lwl4VWIpsBYeTeRau9CqMyBWGQBGf0eIpRHOJxB1+eXStcq8NWexY6+NHEBcTgGV2M
 rgeBuIDLwtnBkjh42fL563JwO6f9KFv5sFHZPQa+RwsAzVH9e3tbbYXWI8hwm1slvbXW
 xbYlX3QvM+z6aDBef7TRSuGuiZ475nUBdPSx8G/zPRWHfwN0ggzplTr/exKMA9tJJ+5m
 8pAV1CywwD8mv3yMd/JDFmXSDMiYQ3XW9n3+nOQpLgR+UZHK/3Zz/XbjnxSNUGSLIpUY
 ZHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=Bf44SXJ++Jx4274w+UUCDsUhtKdqY0/scwKSh332K4meuDlJ6qaiNTelCF3ySiLWKh
 iBqSFQ/f7IbxFvX9xC0CzTe79d5tFbo8XY9NU7maYHN7Nwd1TatNT/B3J+W0irweiwEK
 GSC/aEHsg1hgT6DAyfYupVlribDpNQfw2ooJOKkaDwDlKCoxac4Ccfv0dJ5TXAPS/t+P
 mpbr8ilRzJBcul49TPwKeMoxx/ogeOoWKFaTc7t3FprZ34jg6tLcJPINPv3H4reM8KWb
 oF1YlISXbHXzuPdyerITIJKQXzgzw9aJCQqDaAQRYGlxF2Is1oqTQcodM/57VXhRtZbJ
 YGoA==
X-Gm-Message-State: ACrzQf0tpuenWjcA6N8TbMz4e0/Zlzv5DV/ha1F33SBlbfeT7bHmHVts
 POfRWoyPswAZ1BaN3aZd63mHpQ==
X-Google-Smtp-Source: AMsMyM7rpgGr5YspheUalErppOgKMZxQEHP6Yf5tLO5+XdaMl7CvEVWrZ6lHxamg9mDY6iH+fNb18A==
X-Received: by 2002:a17:902:968f:b0:180:a7ff:78ba with SMTP id
 n15-20020a170902968f00b00180a7ff78bamr5193977plp.87.1666815376515; 
 Wed, 26 Oct 2022 13:16:16 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:16 -0700 (PDT)
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
Subject: [PATCH v3 07/16] msi: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:18 +0900
Message-Id: <20221026201527.24063-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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


