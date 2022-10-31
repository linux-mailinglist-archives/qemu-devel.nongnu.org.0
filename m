Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6C613695
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU0s-0006Gg-Uc; Mon, 31 Oct 2022 08:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzv-0003ni-UQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:36 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzt-0004Sw-Ce
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:35 -0400
Received: by mail-pj1-x1029.google.com with SMTP id m2so10263526pjr.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=ftnYt/0fDgjS0EKUSqUIqx61YJHzGLpuTcVHaUlKt8tKNyDLkzAkU8Atbh8+6p/hMC
 Ewm/WDLAQMIsn4KaJqjmsQJseBhAqF28CPnhve6jC74tPwzDnDH7iaWbPAZU579ShDAH
 LGqOg62B4B/Vvp+7AOiwZdNI79ODUPsNdK2oSmsm7HYsamzG/s66yYggXsdHWvt0sbu/
 kvMzUF98O1jE21bryhNLpkRBBzmwjFx2ajgpxbVZpLnu+VEpF5LGPe6vEh5oXLBA5wTC
 Dzn+tr73ttQxOXUvn+Q2aZpeKwJPRPncSsz+KSQJTuwQ0wXPwzO4MOX6x0GGpb9gdhjG
 205A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=GUvSJybQ0VGBPD398lXpdCWlOcsKNSrePaZO7GS981y4GwJAM4dqXatqhAKNqympxT
 iHEBo75z0FxJK47DEavhKJRRVaZdMPZBBKd5CW/0GtzGDtHZabJyVBg5l54HpY+CtoUv
 sjL3EIrtDbiotuYIb2a4OqUvKVc1O6P182UPWtnT4Nkp3dyfh7d6/AOUDii2m8tjpnkw
 AJ+YCFdjFj3kVnSJwpjRCpZXXv8cDaLGX4zcXxmO+R+RUHgMa2joiVu5QzCCBn7MPSFR
 DFDY9HZ6F2Ru6dBqpKBurNmNbjGBHn23Vmt/X+ZqGxMtclkbSPlbTIDiMl1cEwh5QDMS
 nQ8Q==
X-Gm-Message-State: ACrzQf3zIgS3VOgJy89MxdN2kmfviEO8HMqUUDDMuWDQgemGuS+r23DH
 csx8XXlKKgICcdO+Gt4z+ZHsfmHZzuDqF2+U
X-Google-Smtp-Source: AMsMyM5UhGtSDVCMrW0GUdiXLIMQ8ZyU5G3L8l6R3WcEK6V6gLUEgAz3lto4ES8//kIpfnKAuc+dVw==
X-Received: by 2002:a17:90b:1918:b0:213:d97c:c6c9 with SMTP id
 mp24-20020a17090b191800b00213d97cc6c9mr6522557pjb.198.1667219671930; 
 Mon, 31 Oct 2022 05:34:31 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:29 -0700 (PDT)
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
Subject: [PATCH v6 12/17] msix: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:14 +0900
Message-Id: <20221031123319.21532-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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
2.38.1


