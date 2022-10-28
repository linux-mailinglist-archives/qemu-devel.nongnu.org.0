Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3F611175
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:31:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOWH-0000k7-HB; Fri, 28 Oct 2022 08:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSi-00030u-5d
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSg-0003RD-20
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso4321308pjc.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=PuazsYoweWFhqVNvjGKsprNjn7Tn2usjbLqYRt8kGodHBUxXv15u14eLswb5qFIAEj
 kQzYjAuK0lo8TuAKiCANwf069WhIcxHctiD2BTpqSy1jjbeGUs+4Dq2aCDzeEEuuOV/S
 AEiCTA6j7eL2bnmiYOWcpugxm7j9OS4Xc+5qQVlXG7UI5bA79oQeTHfNFyZdV8cdb8n3
 kYeTSewD6+V3ZjBjGL83/EEQHw2li4GfUmdyY7IcqRehvEvQynQYPgxDOCInI0U680Ts
 T61ahZTGcxMYNSKeekX0Y35P+IjrDq7n6va0myUCZHIyksJGC+YdgmpWaFZLAsWoi+yg
 pIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=blbMeRh1D0CTQT6rtZBD8N6vF5qajipQ8RaKimwrHfoyYJ0rnsAmdw9qlhGm31CIlW
 6zqhMWBMwmeyMZOmYU5wQuM3JRoOt92q0E72dlP7SjPoPl53hCe+K9OqGPEUVEuXKdn/
 /WNA6ObrEsbaekIdbZwCgkLCARlqbpBGEi+7kzCmAVxtFuciUQJmaVOl9pyq/9+Mnitj
 eJeDMys5B6Q9w26u073wpF16tQSrIV43LTxY2Hp3s1NYn3jLcYpSQe00W2R+zPipsf5C
 9iGg8H/fiD/dNmVBjWbAc5ORIJP4Yhg8RfI2d8v1XX7WyV6x3AI3+aXQJgc1UncXNiEU
 277g==
X-Gm-Message-State: ACrzQf3LVToXkManvjgQv0z+i8IZP/1Cgi5aaPAPKVyzDCxFP++Ha5oB
 lm3gU16Lzz2/s/eOKSzlH7ukCQ==
X-Google-Smtp-Source: AMsMyM4wST+U0nQgGhIgclMExB6bwKrxkQJpNNZbY91dL1G9+TRC1eitI4+dV3eLlK9c/vz4usTVcA==
X-Received: by 2002:a17:90b:38cf:b0:212:e4c8:6263 with SMTP id
 nn15-20020a17090b38cf00b00212e4c86263mr16302786pjb.82.1666960064354; 
 Fri, 28 Oct 2022 05:27:44 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:43 -0700 (PDT)
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
Subject: [PATCH v5 12/17] msix: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:24 +0900
Message-Id: <20221028122629.3269-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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
capabilities overlap. A caller of msix_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msix.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 1e381a9813..28af83403b 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -311,7 +311,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
               uint8_t pba_bar_nr, unsigned pba_offset, uint8_t cap_pos,
               Error **errp)
 {
-    int cap;
+    uint8_t cap;
     unsigned table_size, pba_size;
     uint8_t *config;
 
@@ -340,11 +340,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX,
-                              cap_pos, MSIX_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX, cap_pos, MSIX_CAP_LENGTH);
 
     dev->msix_cap = cap;
     dev->cap_present |= QEMU_PCI_CAP_MSIX;
-- 
2.37.3


