Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44160EA25
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:19:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqT-0003Oh-8t; Wed, 26 Oct 2022 16:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpN-0001lZ-2K
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpK-0003Dq-JF
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:40 -0400
Received: by mail-pl1-x630.google.com with SMTP id io19so10336152plb.8
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=SBMgb4hlM/YGNfBUNlrmyksMpq8jtT6uk10BwzB6RtEfXxZ2CCy45zrdnQewtlaqKh
 Z6spmXW/UjF44hYMI05NUQF21ZH73zBgnsUqus0VazWGaq3zS2fLWwElyxYxd/2ZBG8q
 /Cp85AUwWKaZfVbsblyiHhKma3tnxGo5HYIU8RIXYy/bsBkMEi/qUEYLLODXWLN3eYSD
 HkrIRtFUGxi49Q8lceaxNHjLS7kMGgV1D3NSKUQj6Iv0v8uJNSh+mn3flN8J3w78FBzh
 K6LSdLj/Dx6oqJCAjSO0Rqk3tDYDvcwXBNbL+IGVw056Ih+TeG67KamkOveEegQHGjiE
 drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=4DznXJe0ew0V7aLCeJkfwwbwtFcBQ6jrs9RUSh+GAKpcG82jAA/WpduHgeGPYWnDgl
 KBRhZGyniJtjDidJ5Vp5Rt+BrvM8m4GFZiJZmdXIh084R1vLcd7cfM2J94gzw5GIE4hI
 YA5Q/soT+ZpzV8YymzWTbUsQZSnszFyb3aMMBBDllRRbtnZrQBED3SHIMHLa3xdBD/AM
 sX5kUTVDNkhXmDd8+tTULOCVokVgnh9HLKWdB3QDEIEn8RmpPYRorVHhEdS358OFzxJo
 RIxqOmnAspv+0YHh5vzsEdsdQbsDDs/YzZTm3+Gjm0mvFaq3MgldfF//IkLDVlrmmKH3
 /MxQ==
X-Gm-Message-State: ACrzQf2HWhwmZQatiJcDFFAe71xIT/kbzZJd9ic80fIdzkHmp/bcTGju
 pFYdzCpQ4b85qDGe3Gh1iKZJ2A==
X-Google-Smtp-Source: AMsMyM7QwJMgV8DvKuPNszfsIlXYm55Pn2CWLi/bHM0M1E+F6l/+F9uU1VGiz0idcwmvjFAzqsvMog==
X-Received: by 2002:a17:90a:5915:b0:20a:d6d5:31bd with SMTP id
 k21-20020a17090a591500b0020ad6d531bdmr6017376pji.15.1666815397228; 
 Wed, 26 Oct 2022 13:16:37 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:36 -0700 (PDT)
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
Subject: [PATCH v3 11/16] msix: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:22 +0900
Message-Id: <20221026201527.24063-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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


