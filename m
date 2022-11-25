Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554463891C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGD-0005Yn-6Q; Fri, 25 Nov 2022 06:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGA-0005Up-Lg
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:46 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXG8-00038m-Sf
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id t4so3258677wmj.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOuixkaZOsz8kew6uKue8ojhSe9BS7w0yC1difWNjKs=;
 b=lfilWOLQOB3NIzj+/afjB3+GXq/10vQPKwV8F1dAUutcnLToFhU1Tkox11QoMvil/Q
 ny9v+ZFCAdO5+nlbzt2C5NBGZNkOwZPE6tkTOsJF/f2Obu/joL1SgxFouTTNUdlYQ3P7
 TOvjg557qtAiDpmNmI8LF+qbq8heed3zuS/VTXJQmOPSLp6wZ6IKCtkSG6Krux4FeqF2
 J5LmgwantD0mPgwUe3PjjXkXJ3zcThmwOgvvWbGerhW6nmU0CrjYKc0yTXBg1pg9o3IO
 6CjJny/Jj274nYiSjZQlVndaGHxWUtBtUAUfUS31bF8BEcABR/SX7leR26tbWrcH4ukG
 sg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOuixkaZOsz8kew6uKue8ojhSe9BS7w0yC1difWNjKs=;
 b=WBmtAZ1HmojveH8+ykbmVnLVaGMFoWdxzLoxQYa4uGmu4AJXI9VeAfj78agiI+zOnv
 CvtJYlJjXbzaZ/NC20zrkTnVc6eS7QUM0bVDQVwC4spqhAPgNUghVHsQgJWJMT8Pcx2d
 9WrN92hwAi6uk2dc6PKnie+JNJZUzXAbVRyNO1ldnG3/rET51w3lhfmQ8PPXRVmY+gup
 hAr9tu77RkHHNGqEASnBAlv7D6GsWvqCwJ7HaWBMNMOo70B9O0/LYgOgJhVxSOXk+U3A
 +lAjxhdAw1BXgZqljEkqs1mgEV1FbpEryLJjWIwIU0g2fVveAfxzUycUBmnBB5pafVy1
 lB2A==
X-Gm-Message-State: ANoB5pl32dn26AfP/f2vAmDZ8HAbTMtq8CsoVsvdRA0dgqee9SmlvIMD
 as7Li2sZPZLPXn28vKcfFu2jrYEswbs6hw==
X-Google-Smtp-Source: AA0mqf4ij+kOi6EcluKR9n2u5X7I0N/TEdNvhGJMmYmX2E5PGCkEY+3lrGKBDZBCmCbgGw5fzn+U8g==
X-Received: by 2002:a05:600c:1c12:b0:3c6:d8ba:eeb5 with SMTP id
 j18-20020a05600c1c1200b003c6d8baeeb5mr31232379wms.201.1669377163502; 
 Fri, 25 Nov 2022 03:52:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 1/7] hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase
 reset
Date: Fri, 25 Nov 2022 11:52:34 +0000
Message-Id: <20221125115240.3005559-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the TYPE_VIRTIO_PCI class to 3-phase reset.  This is
necessary so that we can convert the subclass TYPE_VIRTIO_VGA_BASE
also to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a1c9dfa7bb5..7873083b860 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2008,9 +2008,10 @@ static void virtio_pci_reset(DeviceState *qdev)
     }
 }
 
-static void virtio_pci_bus_reset(DeviceState *qdev)
+static void virtio_pci_bus_reset_hold(Object *obj)
 {
-    PCIDevice *dev = PCI_DEVICE(qdev);
+    PCIDevice *dev = PCI_DEVICE(obj);
+    DeviceState *qdev = DEVICE(obj);
 
     virtio_pci_reset(qdev);
 
@@ -2071,6 +2072,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     VirtioPCIClass *vpciklass = VIRTIO_PCI_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_props(dc, virtio_pci_properties);
     k->realize = virtio_pci_realize;
@@ -2080,7 +2082,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_bus_reset;
+    rc->phases.hold = virtio_pci_bus_reset_hold;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
2.25.1


