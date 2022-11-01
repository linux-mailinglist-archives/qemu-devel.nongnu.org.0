Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A5615009
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsgs-0006rJ-2F; Tue, 01 Nov 2022 10:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgq-0006qe-6R
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgo-0003KN-Bm
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k7so4068281pll.6
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=AXB9x/Y7h+5KZ+gCk2YgTJwYFCVklZej/1XyCO4lrnU3ZFAKc68zoYK8ru8pg15Qyx
 sMxkREbLTf7BHlYMbV+Ee4w62hcs8S2VRdSMBif1FxgucndV0t6sYhY8168GLdUViW+W
 0ifAj6BlwWigAdYlbnl9LuGGqaZhWtJDBaepKIWhehMoUe5dN/5/2nKpoMaDJKkc2QE8
 fwlbJP2szYHYzWpEOSjeKXpSKRCOgm6eKbQaJsXrfyxSuaXg4OQOSv/AApDUZhCao48D
 w3Fd06+86BTsMUzer+zZ2ohUCfPrY+Io6elleCSaA6t+vIJW0YPGS8bqvG/KS+e2j+Z+
 O+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=SJoIiYG/nHwchYgyJtzKg3bHnH/vb4JqvWmyciLnV7oCH9RgzRyKyXqEyek+2jZPGB
 +nxnk4xX1JfwxACQAQmiTVgNqrTuawDroVcGL0lRAqx6KhjzoCWewhMN8JS82pRVckK2
 KgXwmhiX3z9ljk+q/Z6+hI9q3w3Gp24H89b2wt6kPTzFLD8RaVnXS2wGaCBxqkydGTeZ
 S70JhN/K4Jh04ymspcsGBMOGC2ur1G1fgRvFkaXbWEwxQZlYSKIcUL1XZPViiiCM0qW4
 1ijEKQIAGSOi1OoMM9qFw5SiK40zHO88WSN3hBCCJ3mO7ftIKXwhEtYkB5Z24J/fQD4M
 4+/Q==
X-Gm-Message-State: ACrzQf2C9f7tkCklZcvsjYuwIJFSif3dFCGHbURlPDoYOz1NJgLurpgA
 QAFCaXI0ZLiRPZbywkTfpLmBcA9EFqq+hd5+
X-Google-Smtp-Source: AMsMyM7F+tDDapsSEGKqYSxdeC+AsqO6dC5Kf7BGsTnIsTUos11vBxDDrRCnItTM24HNtZWUxgFqAQ==
X-Received: by 2002:a17:903:c3:b0:17a:aca0:e295 with SMTP id
 x3-20020a17090300c300b0017aaca0e295mr146588plc.3.1667314588645; 
 Tue, 01 Nov 2022 07:56:28 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:27 -0700 (PDT)
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
Subject: [PATCH v9 04/17] ahci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:45 +0900
Message-Id: <20221101145558.3998-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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
2.38.1


