Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08420608518
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Ku-0005da-4F; Sat, 22 Oct 2022 00:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ko-0005d4-EF
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:10 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kl-0003rk-Ss
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:09 -0400
Received: by mail-pf1-x42e.google.com with SMTP id e4so515950pfl.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P456vDZvNHM/FODrG1z+/gsnFf1I6mbykD78iDuTXLo=;
 b=3qO3noBjD32v2hLct3xJUKTUW5hz3q762W51xK5zfwC0ekXkz70C5glEZJAaCOrdg/
 AdkP6uOlSp5W/k2b2mGNs8400GxdzmyAac8HZ9Opo1JdPCaEYymFRsDiZJZvAroDEsk2
 F5TQyEWUbVBIZ3FDtFhHk/sxhDitb0UN6VfRmmypgIIo8RqKYZlNa+V7DMgOs4ilPIXU
 cXiyYxe/7chDiNUmMbedLkGPQJdfwjzUWSgzVsXF54U3XdWE0zMBZth02zQqJXeFzs5Y
 BK/3HUUoz39SRAkuyDrlkC7D1Qs6nCr3eLtA5N/dRBjt6CZ/7U7zTedCac2SkpFTWAeV
 quJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P456vDZvNHM/FODrG1z+/gsnFf1I6mbykD78iDuTXLo=;
 b=2u/Qi+PWdwWMZDJCyqFQXFi4+AoRWI5zNrV+DIgoBxIoAAJIBU54AaLmg8jnwijNNT
 Bftb+HcSkFSDp+4hUGWIumeE58ClSx5YXWiXrbqnYXiFtr+LvPBWG3wGd1XLiZd/WdHM
 0eFMrLa9EjejO/rpPlCoVvB/MhiuaVTeZ7LBgBU7eau1JWL3Q47qwH+jWQvbnX/jSJ57
 LFepBZ+Lt3BJYNSfMFhffx0cgNgaXMIQEh5sPlbErZAzaHCWIYIMMnK334pQwDa65cnI
 4JHIq7vxZOCQYAQ8O/5+Fr0fDIHUn0OowOj74sNnO7uCoqUJnbcNGgkZLKJKqFpOs5fx
 vSHA==
X-Gm-Message-State: ACrzQf1KCOLCW8I5oAuqcytSiLbM36dauEKNF4RYSDnlDkOeGtAR5rlw
 DUC9r8WJtSsJbo3JpP/59GJ2ow==
X-Google-Smtp-Source: AMsMyM76W5hT7IdG2DKiucoRB5sY4yA4J4Gmhqvg0Q55w7M95iBh+rztPZtwSQ1SulJxt1O2mFIB0w==
X-Received: by 2002:a63:5b5c:0:b0:461:8ba9:457e with SMTP id
 l28-20020a635b5c000000b004618ba9457emr19304018pgm.218.1666413726676; 
 Fri, 21 Oct 2022 21:42:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:06 -0700 (PDT)
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
Subject: [PATCH v2 11/17] msix: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:47 +0900
Message-Id: <20221022044053.81650-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42e.google.com
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


