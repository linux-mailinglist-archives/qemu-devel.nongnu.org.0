Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7C5FF20F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:12:11 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNIA-00083Y-8t
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1ojNG2-0004cU-BN
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:09:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1ojNG0-0002D4-Lg
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:09:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so5159142pjb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQhCtG0LSDoHC41wc00jALxE9mIoAyIGcS6BRlQrN7M=;
 b=kRdUE3Am8RVXn0cY1pX5Z9UyGmE0EeZie0+PwlReliB9d/BHeM0F78JdK7tPYTAMcN
 S6pvRiNP4pNoyQbBxzz3HWA8yjYpqrfKFfWJeCxj+Mce+Njr+aZ8SJsknAXOnSQatS88
 JftADYf41uoOxgNaG3HbzF2bl84ZuxZDdVxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQhCtG0LSDoHC41wc00jALxE9mIoAyIGcS6BRlQrN7M=;
 b=n1xCszMWsrNLCHNdawDyCO/xKKs6EUw+QLhFNX0lUhC1zdsN0x++SP11hWb0e+AT3h
 3751ZscG99Xod2WTdfnoO9DbQzV6bDUfh7exFfPBTn6qawAPN5pyFf0tusHUKKgFXLtF
 TttOduuDEZ0AuDZ/aFeEaJiX2u2rJciBFc+tX/BYG7OTGo2oIVW2Nbrl6y5vMvtnDHuQ
 wq7jEvLFgEWH5J9uFQ1qZ8IAqmOyr9HWutcpzVwoPiwNHJVZurHnLnKZxEQVo1Fd7sGV
 XnQS4kTsn7inbN0WpvBRI+INKa5SY5Lq+cwwp96ykfIee3BvxbYnNZGIroQWpc1b1c6n
 srtw==
X-Gm-Message-State: ACrzQf3E5Bc1EXGg1bkRtaODN5ecswH1fuQbg1lxzz0hINaGywBzNtsX
 8BbcYTrB+DnU9Ykc44wXkkvrx+pRT15n8EBl
X-Google-Smtp-Source: AMsMyM4yPykrYDjgFJPZA4hp7eCIZNTumpuC6Lc1APK2WL1V9nM20hI7F24YIhil7xQLocGPux5Wdg==
X-Received: by 2002:a17:902:a502:b0:180:e637:a934 with SMTP id
 s2-20020a170902a50200b00180e637a934mr6138518plq.64.1665763794463; 
 Fri, 14 Oct 2022 09:09:54 -0700 (PDT)
Received: from localhost.localdomain (m194-158-70-1.andorpac.ad.
 [194.158.70.1]) by smtp.gmail.com with ESMTPSA id
 b5-20020a63cf45000000b0044e8d66ae05sm1668633pgj.22.2022.10.14.09.09.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Oct 2022 09:09:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
Subject: [PATCH] virtio-rng-pci:  Allow setting nvectors, so we can use MSI-X
Date: Fri, 14 Oct 2022 18:09:47 +0200
Message-Id: <20221014160947.66105-1-philmd@fungible.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philmd@fungible.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Daney <david.daney@fungible.com>

Most other virtio-pci devices allow MSI-X, let's have it for rng too.

Signed-off-by: David Daney <david.daney@fungible.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
---
 hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 151ece6f94..6e76f8b57b 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -13,6 +13,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-rng.h"
+#include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -31,11 +32,23 @@ struct VirtIORngPCI {
     VirtIORNG vdev;
 };
 
+static Property virtio_rng_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&vrng->vdev);
 
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 2;
+    }
+
     if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
         return;
     }
@@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
     pcidev_k->class_id = PCI_CLASS_OTHERS;
+    device_class_set_props(dc, virtio_rng_properties);
 }
 
 static void virtio_rng_initfn(Object *obj)
-- 
2.37.3


