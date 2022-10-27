Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6EC60F098
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:48:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwaK-00084O-Hi; Thu, 27 Oct 2022 02:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXQ-0006Wm-84
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXI-0003Tt-Hm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:48 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso5329204pjz.4
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FkGOLeaEonfb8XEsVx6J57XrctBVTY4s5Nexnx7fj2M=;
 b=LxydjHzPZrF/FC1wiadR8+qzr6coLxJ1sOJinsUk68E/Hr1T0ymQCkqypePGCXIv/5
 wM5PrhotR1lrwDzPlawJrhS6+EW3ZVg3mWzQoFGBdoNLEZ0GYjwHuB/DyETh7CopebHP
 auar74X6Co2c+4fgqadVpyoZ8BTnIuWB8E/L7XGTUQoTCM9RI6Z4LnE9lP1U+LgZRc0e
 a/If43NCmupmQdr9E+LgeF2m8RiXohB4s/TfCxLjqOzzCMrrljBUuts0AAskNFVp3U0i
 vC1Yg88y/B6bwu8WM6k7r5DRtKRj/R2f7s4o7EKz53FVKtYVUsgqSzdxB/cpv7F53md7
 AyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkGOLeaEonfb8XEsVx6J57XrctBVTY4s5Nexnx7fj2M=;
 b=G9wkLin9CIckHy2WFQjIrdReFFIvE/a6n0B+F2I9kum9yt0OM+u/p2TMrEhcgdY69i
 NuX7BxU1tuEjLw9xbA30t1bzRAFaHRZTm2m1sWDbKX1RTMk59gIsNdRZJDPIU8RkfTvZ
 HHldeSCLrQG8wFPY7u5lqUk26BFCc/E7GYkZMhaVkfLg/kNo60bwjBu8p6CFkwzPqjlo
 PJre5UkRY5LhXTO+z8QVMUJT0TfISBOfwkEkC5buQNGl5AXt66ZtsAnXJi9zqSoB4Tbs
 KeuLOKlfACI36MDzx+2NNtNXVYrBVi3Q2T5tsxMayyjcp01BoIyAPvW+adPNRq90Jo8T
 cFMQ==
X-Gm-Message-State: ACrzQf2R0RR75sRgfp8HZsqMEhJ7fbmfg9vxaSwHcAI5yn21oXhdHGkR
 V3LmZWkWhsHJth6XDjvlhNlxew==
X-Google-Smtp-Source: AMsMyM7zJI8AHu+KZwQ4kE7bY6Zi/hJSsDzG45SQ721qfYnERXQgXGrKvH5ULpuyWVrRCD9io/KTtQ==
X-Received: by 2002:a17:90a:4607:b0:210:99f9:a915 with SMTP id
 w7-20020a17090a460700b0021099f9a915mr8472282pjg.62.1666852718293; 
 Wed, 26 Oct 2022 23:38:38 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:37 -0700 (PDT)
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
Subject: [PATCH v4 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:37:04 +0900
Message-Id: <20221027063705.4093-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 hw/virtio/virtio-pci.c         | 9 ++-------
 include/hw/virtio/virtio-pci.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c37bdc77ea..b393ff01be 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1154,8 +1154,7 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     PCIDevice *dev = &proxy->pci_dev;
     int offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1864,11 +1863,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
         pcie_endpoint_cap_init(pci_dev, 0);
 
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
 
         pci_dev->exp.pm_cap = pos;
 
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
-- 
2.37.3


