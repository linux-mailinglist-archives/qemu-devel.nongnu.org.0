Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9D6084D8
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:01:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Kd-0005Yv-47; Sat, 22 Oct 2022 00:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KX-0005Xi-8n
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:53 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KR-0003l5-Pb
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id l4so4071649plb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMCYespmeOg3BBkL5WBcqPLvSzItOSN0B+fYLg73s3E=;
 b=mLyfvUGLY6abBkJnAtKcKlgMcwmR70JPY2RNcIMcLTgQnn9bzkD0xdgiB8b8RvqwjV
 iZHcKB8dfDKvEr4G32V1AGwakxGsragehef0CEJvakMrOvZ57gusWnAkki1yttVdUmrN
 PBgM8ZKMhIS96znHSxEALWs6PmHB2ds7ymopXLEowoHbJlJQoeKALWPNB6d39T2cVuOH
 SxbxSXMAyvRS8tEX1lEz2MA055aJlVsEwZH1K0UyNNFbOoLa1h/SR/se0VpBYU4vpMsN
 oneCZ6BfhEuMaj1mkxXyRhbJhMuU9EkX7XkhkmzCYgbgBVkwR07o7EADFBwQaal7y6Tq
 MQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMCYespmeOg3BBkL5WBcqPLvSzItOSN0B+fYLg73s3E=;
 b=bI8C8/GeqRQUjVb8YKTODARVQDiMzWjCrAKnClO31YKJCkd+vdye2GV63zNYYc64I9
 AewWZflJt/cnLRhGLWEu3WCUJntu85dh5Uin4mVvqaKXlp0t3v3WTMkurz8OKExhwDiw
 GOznMK3XUFVqxwP2aNQXM31wB3z+68gWhKtNtgPAHDecPE5rS28DnoWhM1sIU56hGhfz
 d31vR50xlJ7EqKwoeBbbjJ+Lf+DSqb0CLlwHIL+GhNMctIh7CQG6hlXjsWlKlCurFUb+
 +wvRVDQksMLfpSe9YO9Gaqe5HekplzTtvMRrduaHehLSfQhFyhuKW3g5Uat8UwOzwfhr
 +VqA==
X-Gm-Message-State: ACrzQf1jyZwcsce50RUUR92VXDYh9fFzugk5ey25iWTNgP1Mh4ZV/KVx
 GFV1aF/ZvdMed/vvcs/A8ZWqiw==
X-Google-Smtp-Source: AMsMyM7bJ12XpkAV7pHqjiZ+q4DWBxiAdrfkgnjbzHa8i1C5C5FVKnASrPKIV1WrxPSBDxXOb3A9xg==
X-Received: by 2002:a17:903:2442:b0:17f:8069:533a with SMTP id
 l2-20020a170903244200b0017f8069533amr22235913pls.46.1666413705938; 
 Fri, 21 Oct 2022 21:41:45 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:45 -0700 (PDT)
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
Subject: [PATCH v2 07/17] msi: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:43 +0900
Message-Id: <20221022044053.81650-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
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


