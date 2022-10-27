Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90F60F07B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:42:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwaD-0007YD-RX; Thu, 27 Oct 2022 02:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXF-0005hU-QP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWw-0003NO-Sa
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:36 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso566295pjc.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=Nz0SYvdmIiwXg7Cb9Wo0M38Ly9GRSTvONwUS4roXrD347lB9+jv5BJ8ypzr4MtMqLu
 tYsnMm08q3J5sqNK93PlseZI8G0QN0lw/7f3nYzr+n0peZZ7CvO44gk5XuSZn7yJI07d
 ZoDBQ04fB8RIEaVnDWw/c4nQrKGp+WRHcSRAh84DCF9O3EmPYPy60u2cpDDnI7GBeyX1
 pvFbNjVVFxtpc1qP0Odl3W3q6EA+kdL+6284D8QkG/4p9BlMsbRvxVWWhzM8xQTGZolb
 56AVuVrMrhm0PxO6AlPk9OxVE1WTk00ctChgWUQpUBShdXTvPzUt7E+UwveUku2SNOu9
 V2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BpmH1EK9gEiQYluMG2rP/Xfl8vYE39j2KicJvnukhs=;
 b=7gQV/DK3ycaaetgHYWvGmiVLw9bgvLg88rBFO/6angTBZNZ6P3gPc6BWVMgb/ZTRse
 XuIiUomhLDC4MmyaV8+k5iqb2vf4ajUBlli402jRT2JAmeLlIe5+Lzvz67lcfAccuUov
 cmA1UxdHd4DuU2OPDc18pxIYDTs5uQU/Z3u/1X056XACmzHqHSvF9SauX/7OhSmYYpCX
 2DRozDk1K2YfWA2dQRW6OAez6JeM+HRke+/+L0NYk0TIQcF+8KkZ4jnoztrQB/y4KOgB
 7QuZmYlHSYo8VpR9nPn2ZN7i2h5heJRcG5PX32noekBQnjUhHDuDj/d/D12DreMe7k3W
 SufA==
X-Gm-Message-State: ACrzQf3nkxoQrpn8IBGqGC1/dyOGbjInZhPZjnrM3XwhzjNdCm14X23z
 uyJXQmmZ2W0erhVrDjcu4PGQCw==
X-Google-Smtp-Source: AMsMyM4gVOY6kjDA9yy3Io5aUyB4hLC5TVLhY9wMutEmY7+I/co+fOqNbl31gdC82D7po0O/B2+5sA==
X-Received: by 2002:a17:90a:e7c1:b0:212:e2e6:ca2d with SMTP id
 kb1-20020a17090ae7c100b00212e2e6ca2dmr8317557pjb.125.1666852697327; 
 Wed, 26 Oct 2022 23:38:17 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:16 -0700 (PDT)
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
Subject: [PATCH v4 12/17] msix: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:37:00 +0900
Message-Id: <20221027063705.4093-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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


