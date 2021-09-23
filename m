Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622FB415DF8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:16:36 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNeV-0002RX-D3
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNaB-0008F0-9O
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa7-00006d-Jf
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so16598251wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hveLEdA+sdzfjh3b2QjPTxzFWqeMryq8cwWocCTW/OE=;
 b=j1fNH08s2uBrT8LvoxbJvVWN8c/5DWkj+rLsOrs0zXiX+Ve14tLa4SRc7rJOjLXAJt
 6a4WEfCpd00A0DMFRLfisT7B97VBHaeXeOkUGudMN1+5bp0QGosp23EU08QUJlgnsCKm
 fSAzM69H10fs/0KL8qrVwRNFkLxFrOjBnZ1BalxG7TuPBT9Rgkk4mSduYy+p1H70no+E
 CZ5eWyYBXINT9DCkwLXFX4B+HBVwsVM1Tp7h7pBsXG6aBEe2a/OeLKxNwBKPHJLR2v+a
 QbKU5oszyN+dj1qn/MSm4SE5d1KCmHrf5B7+oFkSNDAVlOw+1ywxUQ5d05s/jLGMRpnc
 RO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hveLEdA+sdzfjh3b2QjPTxzFWqeMryq8cwWocCTW/OE=;
 b=N9wBSuvPEWnKs99W/NJ3O5angllz1KuOs+4SLEXYfS7zj317mDpok0rwBInz6xH570
 cehQvve0n6GXSeg4xaWKi62i0TEqYotf9YeIWWURaPIT+DJcP6fnRh2SAOriTJVqYJq0
 APH+IP0pd3sU3lVTaCoFG7olkYjiEbXcioNY1SR03O8Be1uqxqScbfjFFeOOVBfPsuEu
 hUViFhcCR9tObY6Gnl2dkh0YxIyYXxFhXx7Zhny6R4YcLusyYwLI/1+rXk+YDTQQ6E3U
 gTVYIjIsZHOk4RQkBu9Wlp2mtlSo3aYN0hLe2j0KrBzvFLDBi6+45OdI+ZDLchztl55T
 HAyA==
X-Gm-Message-State: AOAM5301q0JNbI6PiVB1+XwFnORAk9a4HSrCoyEUyPg7M26//WAJ1YyS
 WPy8kPnsJoq+nZCp5W49uZl2kdozWCUcCg==
X-Google-Smtp-Source: ABdhPJzw0m0XrDO2vV8Vl19H8gZwUzAj0Jpb6uihj2MwYhR9c1RlHDNa0b7cLhDeUY0z0lcZoi2Hxg==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr4009549wmc.181.1632399118452; 
 Thu, 23 Sep 2021 05:11:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t22sm1382349wmj.30.2021.09.23.05.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:11:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
Date: Thu, 23 Sep 2021 13:11:49 +0100
Message-Id: <20210923121153.23754-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename ipack_bus_new_inplace() to ipack_bus_init(), to bring it in to
line with a "_init for in-place init, _new for allocate-and-return"
convention.  Drop the 'name' argument, because the only caller does
not pass in a name.  If a future caller does need to specify the bus
name, we should create an ipack_bus_init_named() function at that
point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ipack/ipack.h |  8 ++++----
 hw/ipack/ipack.c         | 10 +++++-----
 hw/ipack/tpci200.c       |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index 75014e74ae1..cbcdda509d3 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -73,9 +73,9 @@ extern const VMStateDescription vmstate_ipack_device;
     VMSTATE_STRUCT(_field, _state, 1, vmstate_ipack_device, IPackDevice)
 
 IPackDevice *ipack_device_find(IPackBus *bus, int32_t slot);
-void ipack_bus_new_inplace(IPackBus *bus, size_t bus_size,
-                           DeviceState *parent,
-                           const char *name, uint8_t n_slots,
-                           qemu_irq_handler handler);
+void ipack_bus_init(IPackBus *bus, size_t bus_size,
+                    DeviceState *parent,
+                    uint8_t n_slots,
+                    qemu_irq_handler handler);
 
 #endif
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index f19ecaeb1cf..d28e7f6449e 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -30,12 +30,12 @@ IPackDevice *ipack_device_find(IPackBus *bus, int32_t slot)
     return NULL;
 }
 
-void ipack_bus_new_inplace(IPackBus *bus, size_t bus_size,
-                           DeviceState *parent,
-                           const char *name, uint8_t n_slots,
-                           qemu_irq_handler handler)
+void ipack_bus_init(IPackBus *bus, size_t bus_size,
+                    DeviceState *parent,
+                    uint8_t n_slots,
+                    qemu_irq_handler handler)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_IPACK_BUS, parent, name);
+    qbus_create_inplace(bus, bus_size, TYPE_IPACK_BUS, parent, NULL);
     bus->n_slots = n_slots;
     bus->set_irq = handler;
 }
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index d107e134c4e..1f764fc85ba 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -611,8 +611,8 @@ static void tpci200_realize(PCIDevice *pci_dev, Error **errp)
     pci_register_bar(&s->dev, 4, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las2);
     pci_register_bar(&s->dev, 5, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las3);
 
-    ipack_bus_new_inplace(&s->bus, sizeof(s->bus), DEVICE(pci_dev), NULL,
-                          N_MODULES, tpci200_set_irq);
+    ipack_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev),
+                   N_MODULES, tpci200_set_irq);
 }
 
 static const VMStateDescription vmstate_tpci200 = {
-- 
2.20.1


