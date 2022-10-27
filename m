Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF060F084
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:43:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwaC-0007M5-BP; Thu, 27 Oct 2022 02:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX7-0005Up-8W
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX2-0003PF-Mm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:28 -0400
Received: by mail-pg1-x535.google.com with SMTP id h185so379344pgc.10
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=vZxLIom+CIEIN6ThtxW/0yHChzIqt0CtjArPO6y6yPIr39cpwRI9QPsNM4SbEGjnhj
 FT97iaMiP/Kyn2xaLdB28iBNB1r5kKd5e6uVrbRI4om+e+/u8UEd/Hl8fSEHHCVX7hL+
 BoUWn/dsDBNBap+2+bkXAjOXVqk514djg5BGJpL2DmjIonOL0pvzGt2W2MH2xGpzaBTg
 3y8IjuoDM1j2LM6zWjHeteBOrFpEW/mA5Y8MUD+WLNrBLq7u13ZnBBd/ZwERFTwl7rkj
 8o/N5JUWymFFpI9L55wFrK3oH1LIC7CvpXcuiralkIHRy9TVTOt+SA5mM3iERgf1ZruB
 DWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFfGOC+4AClp0N9VqAaA4RDzVVq2bpMfGkuUo72PR3Y=;
 b=NIghbZ/SV/xb8lMAFq01pNUGKjjLohXx026dk7RuZf25JHvcbfNUG+mXqOqFb7Nh+X
 IdM+it9OcQN+54jnnCqRqCpO0cLenuIdJ3gND4DeYeN/l/Q/2URgZww8PpihqnmdMa9R
 1xXtzLwM2xPeLmcEaS051GM8+XOYtaDL/7PHZpm6u8ZF1CRI1cf2jAnCa0qLpPYt8QFO
 wFdMhrQuzOFhwa63PWUbrnNARG1V/KRIipvDaJiWItrcu12m9KXppCNrs0wp2uaGPPwS
 2KqxmQ1vNX/hnYj/zqAbsw1bniKXiCKei5cnxkB2aeKK800pV37Aoi3jN2Lt3PD4MKP2
 0P3A==
X-Gm-Message-State: ACrzQf2CHoIAeKlcMjG9ELbw6CFQGa43p/BL411TyRmNAGAD1dgpT8Uw
 eshIy8WnDvZXfyDtObAcqjyrZw==
X-Google-Smtp-Source: AMsMyM4LGeYJ+HmJTRATTLoiMXi4IGoe/DOPPuhVIyJww7z9U1keY9hT4xL5O9uRspt4oxol/Yf1Jg==
X-Received: by 2002:aa7:96b6:0:b0:56c:8c22:78f0 with SMTP id
 g22-20020aa796b6000000b0056c8c2278f0mr2919981pfk.21.1666852702487; 
 Wed, 26 Oct 2022 23:38:22 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:22 -0700 (PDT)
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
Subject: [PATCH v4 13/17] pci/slotid: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:37:01 +0900
Message-Id: <20221027063705.4093-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
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
capabilities overlap. A caller of slotid_cap_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/slotid_cap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..5da8c82133 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -12,7 +12,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
                     unsigned offset,
                     Error **errp)
 {
-    int cap;
+    uint8_t cap;
 
     if (!chassis) {
         error_setg(errp, "Bridge chassis not specified. Each bridge is required"
@@ -24,11 +24,7 @@ int slotid_cap_init(PCIDevice *d, int nslots,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset,
-                             SLOTID_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(d, PCI_CAP_ID_SLOTID, offset, SLOTID_CAP_LENGTH);
     /* We make each chassis unique, this way each bridge is First in Chassis */
     d->config[cap + PCI_SID_ESR] = PCI_SID_ESR_FIC |
         (nslots << SLOTID_NSLOTS_SHIFT);
-- 
2.37.3


