Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C813A0FDF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:02:28 +0200 (CEST)
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv2Z-0000vp-JB
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzV-00059Y-Au
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:17 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzR-0002vM-NG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:17 -0400
Received: by mail-lf1-x130.google.com with SMTP id m21so21390791lfg.13
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9YEjAoaXL5qJgDsb/3cVBnG9BkTzCCeb0C1KOR56Zg=;
 b=IYDdER4UFtsSLPvXbipjGqc5ideXbwdOL/iw4tb9mb2x9Hs0pMjnwnR/6na6y5ZnFl
 hYKXUnqUuFUpzbup2fLJfrRd+9PNFBaWET9mtZDcdlXF+TFcIl84j8jwLXssR1UhZD1y
 gLUMoAJXXzjHEnbzYpRnfuGi4Qi2oDprOFcStkyUYYiXH7LKdFUqpRVKWvMZIdKoXemL
 bjVD7MRfXsBOlZ7qUunWufRVrMzksOhN2n+hCH7/nTJb5ajXQ87vu1JKby2qHc5FeTh0
 8Pi2Cv31ByPZ3eC1SiFoNaSA0lhzWpGkQ/A7WbFDeZjMe21VRT7NWBq+Nx9svbE+bmvf
 PVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9YEjAoaXL5qJgDsb/3cVBnG9BkTzCCeb0C1KOR56Zg=;
 b=Tfe5Duc2JF55D6YEE5WmVwwaXu7JieNh3ogXBBQjRLAmM3N0tZN9jjT2WOSHpzb7pF
 P0SHiG1yMl2Etw0B1LgHsl6nVpoN2cgY9v3gTyNgvF7eq/FKczqq1fBtwkT9AqRYuKRj
 vkYRENVJduurfp4/MALZupdfpJhTphx4Hqf/YS+Vk+HtCKfabDQCkrDpZwuZHYlFDTZp
 9jAqiLmSXGG6m5ZfxFIeT5vtL1i0hsPWW1QAm2uBW6wkolBPkUF0k5bW/5eXK04Z5qgV
 Ek/v1WME8d3mwORXaanANAUMpP03+hHNNdnzAu8Iy9GBDWiOmWW+ekfQI2E1ZShd2n0X
 piUw==
X-Gm-Message-State: AOAM5323zThcQ5bNxWgKHQMv4z8qdCqymwVNzlEM2wLcipDO2J4eW7jW
 GNIVw8eIAWezyKYWbPvsTdLeNA==
X-Google-Smtp-Source: ABdhPJykOFs1vdPAfNpGuyil+wy2hjsoMwtCoFYg28rgNvrEE9iUAqLVr0egyE+jCdUKMK+vONpqEg==
X-Received: by 2002:a05:6512:681:: with SMTP id
 t1mr10632340lfe.640.1623232752361; 
 Wed, 09 Jun 2021 02:59:12 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q6sm218751lfj.88.2021.06.09.02.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:59:12 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH 3/3] virtio-pci: Changed return values for "notify",
 "device" and "isr" read.
Date: Wed,  9 Jun 2021 12:58:43 +0300
Message-Id: <20210609095843.141378-4-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609095843.141378-1-andrew@daynix.com>
References: <20210609095843.141378-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added check for "notify" memory region. Now reads will return "-1" if a virtio
device is not present on a virtio bus.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 186b7bc0f6..447f13beae 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1348,6 +1348,11 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
 static uint64_t virtio_pci_notify_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
+    VirtIOPCIProxy *proxy = opaque;
+    if (virtio_bus_get_device(&proxy->bus) == NULL) {
+        return UINT64_MAX;
+    }
+
     return 0;
 }
 
@@ -1385,7 +1390,7 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
     uint64_t val;
 
     if (vdev == NULL) {
-        return 0;
+        return UINT64_MAX;
     }
 
     val = qatomic_xchg(&vdev->isr, 0);
@@ -1406,7 +1411,7 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
     uint64_t val;
 
     if (vdev == NULL) {
-        return 0;
+        return UINT64_MAX;
     }
 
     switch (size) {
-- 
2.31.1


