Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3996960F07F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:43:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwYr-0003hW-I3; Thu, 27 Oct 2022 02:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWc-0003ga-Vb
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:01 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWH-0003AS-01
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id pb15so631406pjb.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=MeHfhgZUvAA+DefOhUFBIHvAOfdOBGXYrbFiAocNz5xmSa/Ljc76E8FFCeYhg0jzGm
 hcq5w37ilZFHtIesmvmudogCpg4hhP651pTBLvglgOlQY6Rgk5xM+hJNuJSCLludCw00
 LmHes1ITW9ldIWM4wx/TcntP1w3RkTfa4h89hK0MM1c8oOZ8BfXA2UeBPck7KumP6J9L
 me5sEy4me3T16WKTaZvPmbH/NxmFBy1PeytmsztDtc06VdzDMyDsUhdSDj366fJc/0Zt
 0CUpf4dlMPFHJP+mtuHFu/6S4cIDVaxi0SKzJ51Xct37T8JiDb+RwC0b4403zHUs5e/9
 DjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=cH8j1u34jVdQaVa2JfM26aKHMvikmjB2lbciGJorF/DqtHBDOPzNn4Xdq0yi3j1UW9
 D/O7GusJ0vQ0cmZCkkj4FU6c5HEpu6n/NHRcDUL8Bg1YWd5i0VSK6p447ZGG5mmXDnGB
 4NP6TMY5bAy2+0UWYAAPfE0v1Sjtk009j2TJy/1/+T6cJYOoZY3TGiqaDKwapN5z20G5
 bf5Ku00tdTfI2t0q314neVze3y4rXFOYq/SBBcXNItn0dSfHKTJ1F5G/WcQA0Dp+BdL3
 /A0yuPgTrAnEevFVDxER5uLJnBxerLw6rCmGDEgkHqeQc0U0UnFiIV9F356jhDnFUuKr
 +rgg==
X-Gm-Message-State: ACrzQf1jOLWGyTnsLs4UwBQHtcU7wP1cuZsT7yh/OP38QWuoOvSUHxUm
 S+Tx47tZ83ZYgPmSFFxvZo5XsA==
X-Google-Smtp-Source: AMsMyM5d12t5pIY1wKHh7yBPhyhSo3thUHP6A+nOqPEKvdHCHBNpcPs6klI3wuB8OfmmzxmQcDNqEQ==
X-Received: by 2002:a17:902:d4c5:b0:183:6e51:503 with SMTP id
 o5-20020a170902d4c500b001836e510503mr47557684plg.84.1666852655687; 
 Wed, 26 Oct 2022 23:37:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:35 -0700 (PDT)
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
Subject: [PATCH v4 04/17] ahci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:52 +0900
Message-Id: <20221027063705.4093-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 hw/ide/ich.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 1007a51fcb..3b478b01f8 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -106,7 +106,7 @@ static void pci_ich9_ahci_init(Object *obj)
 static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 {
     struct AHCIPCIState *d;
-    int sata_cap_offset;
+    uint8_t sata_cap_offset;
     uint8_t *sata_cap;
     d = ICH9_AHCI(dev);
     int ret;
@@ -130,11 +130,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
                      &d->ahci.mem);
 
     sata_cap_offset = pci_add_capability(dev, PCI_CAP_ID_SATA,
-                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE,
-                                          errp);
-    if (sata_cap_offset < 0) {
-        return;
-    }
+                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE);
 
     sata_cap = dev->config + sata_cap_offset;
     pci_set_word(sata_cap + SATA_CAP_REV, 0x10);
-- 
2.37.3


