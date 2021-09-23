Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DE415E3A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:21:51 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNja-0006oZ-V0
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNaB-0008Fj-9g
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa7-00007z-P1
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id d6so16443315wrc.11
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYElJSRbcuOsZvzZcFV0uqO3MSH2O42EiYaZzwAUeRo=;
 b=Qkh/gs9Y1TXmyPPlgH0bCyDK8Jwex08Znxfs0zI1nlx26PCir9ysIIJAlUnGDx4H/s
 /qRH70M8D3L1rY1ODgcHpVaIt6/r2JO0QkBRmIIhxxeP5rNoFLVj1JlUt7+mAaw49vOn
 3fcrQkM51rE4mIvZLudqCqmkW9jYScj2NXkGa5kCI7JfCYBk8oAcvmXjs3PwNQyH6hY7
 910d5GPKdXXtLBRwu7qgTRcBKhl6aADdT5cB4VEU64is/dP8fOLnezhpMzdu+6UwH1ZF
 2wvvM3LqLzDkHhKIVh08+gvdw5Wx7M4oofvppoXMwFmVW0avtLO6SSmvsV6c/4sppqGP
 UE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYElJSRbcuOsZvzZcFV0uqO3MSH2O42EiYaZzwAUeRo=;
 b=uL5/1HzYs7vRJtAj8iqmnmE07vBNUdSIFMHcZBAjfl90OTu3r+0zTmebE6sireXf+H
 HiSs+TSCrrGFooxRI2U+WiHiDu1dGzblujC7UeBQyZo8iDWcMpadLPj7RRNr5JiNv21V
 TAvoIc4J9yFfd1ut5u84dh8VxJzMV9aiikhlurANC/mfsPFp6mIK+8B5aPytmg3n8Cpq
 S8Dx/TRx3GFMGTZj5Ena2l6C1fAH4vOQgLGuHzPX5aqVxZ0ZFCxW0MVALLyoQ8F6LVHp
 dbD8THi3O75Dn63LtCnoOkCHm4gPFFU2lwZ4KVlEpLyZ/8RF4ZrL6a0NRoyp76pa65Om
 H95Q==
X-Gm-Message-State: AOAM531PP7C7cSOiRmWk7BMFzbm0CfQa99qltK4TphEtTIhuQzMnJdB8
 Azo74eJBYtzMAgYcC8p+rtSVe2nVC21TlQ==
X-Google-Smtp-Source: ABdhPJww4RJdW4dmX/E3f28Z4sXNV2r+L4poetauTbMMJf0T2LN9NLAuOrZzFXzhfLQeFDtDQmDgfg==
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr4666660wrw.182.1632399119465; 
 Thu, 23 Sep 2021 05:11:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t22sm1382349wmj.30.2021.09.23.05.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:11:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] pci: Rename pci_root_bus_new_inplace() to
 pci_root_bus_init()
Date: Thu, 23 Sep 2021 13:11:50 +0100
Message-Id: <20210923121153.23754-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Rename the pci_root_bus_new_inplace() function to
pci_root_bus_init(); this brings the bus type in to line with a
"_init for in-place init, _new for allocate-and-return" convention.
To do this we need to rename the implementation-internal function
that was using the pci_root_bus_init() name to
pci_root_bus_internal_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I have not attempted to tackle a possible _named vs not
split here because a lot of callsites specify a name when
they arguably should not.
---
 include/hw/pci/pci.h    | 10 +++++-----
 hw/pci-host/raven.c     |  4 ++--
 hw/pci-host/versatile.c |  6 +++---
 hw/pci/pci.c            | 26 +++++++++++++-------------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266e372..7fc90132cf1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -403,11 +403,11 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 
 bool pci_bus_is_express(PCIBus *bus);
 
-void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState *parent,
-                              const char *name,
-                              MemoryRegion *address_space_mem,
-                              MemoryRegion *address_space_io,
-                              uint8_t devfn_min, const char *typename);
+void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
+                       const char *name,
+                       MemoryRegion *address_space_mem,
+                       MemoryRegion *address_space_io,
+                       uint8_t devfn_min, const char *typename);
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *address_space_mem,
                          MemoryRegion *address_space_io,
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 3be27f0a14d..6e514f75eb8 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -300,8 +300,8 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
-    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-                             &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
+    pci_root_bus_init(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
+                      &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
     memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 3553277f941..f66384fa02d 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -405,9 +405,9 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 4 * GiB);
     memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 4 * GiB);
 
-    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
-                             &s->pci_mem_space, &s->pci_io_space,
-                             PCI_DEVFN(11, 0), TYPE_PCI_BUS);
+    pci_root_bus_init(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
+                      &s->pci_mem_space, &s->pci_io_space,
+                      PCI_DEVFN(11, 0), TYPE_PCI_BUS);
     h->bus = &s->pci_bus;
 
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PCI_HOST);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2ab23..19881c84f23 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -432,10 +432,10 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
     return host_bridge->bypass_iommu;
 }
 
-static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
-                              MemoryRegion *address_space_mem,
-                              MemoryRegion *address_space_io,
-                              uint8_t devfn_min)
+static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
+                                       MemoryRegion *address_space_mem,
+                                       MemoryRegion *address_space_io,
+                                       uint8_t devfn_min)
 {
     assert(PCI_FUNC(devfn_min) == 0);
     bus->devfn_min = devfn_min;
@@ -460,15 +460,15 @@ bool pci_bus_is_express(PCIBus *bus)
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
 
-void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState *parent,
-                              const char *name,
-                              MemoryRegion *address_space_mem,
-                              MemoryRegion *address_space_io,
-                              uint8_t devfn_min, const char *typename)
+void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
+                       const char *name,
+                       MemoryRegion *address_space_mem,
+                       MemoryRegion *address_space_io,
+                       uint8_t devfn_min, const char *typename)
 {
     qbus_create_inplace(bus, bus_size, typename, parent, name);
-    pci_root_bus_init(bus, parent, address_space_mem, address_space_io,
-                      devfn_min);
+    pci_root_bus_internal_init(bus, parent, address_space_mem,
+                               address_space_io, devfn_min);
 }
 
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
@@ -479,8 +479,8 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
     PCIBus *bus;
 
     bus = PCI_BUS(qbus_create(typename, parent, name));
-    pci_root_bus_init(bus, parent, address_space_mem, address_space_io,
-                      devfn_min);
+    pci_root_bus_internal_init(bus, parent, address_space_mem,
+                               address_space_io, devfn_min);
     return bus;
 }
 
-- 
2.20.1


