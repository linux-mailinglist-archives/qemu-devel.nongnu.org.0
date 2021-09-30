Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC041DDB2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:38:54 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy97-0006vz-Ll
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjV-0000NA-Cj
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjP-00044f-Ca
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id v127so4936824wme.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zBrqIS4U/yt/jAHt0whMwGGRWmZzZZu7ttseo1tsd6I=;
 b=xw3Awss35kvHr64MrazMEI7Hnh2dlBPiRQ1NE5uO1nLCTyyqWEGQE7zPulZe8pq9Nf
 Ibj1JMVDojVp+McXlxt4ecMcePt/jAMwJj2T8ZkUxVTHXe2qlU++a5DDaS5R5JpCCs2A
 ZH1TCXQJOy8I1TeJ+k76S+P411Rl+dgorzS3BnLZyak/ZzyfC3kATBqiCC56fyRV47IR
 Osb7ro+9Klu+cjZy7QB38mPHcXzmeEbHvHOBFevaBGyQJP+fSvLyjE+k+CW0V3oNnxGL
 L475UJSs8oGN5HRFzz1od7sx1ZB7vG0+Lh5VqADk3xlQp05L/Sxa6V+FUQbwVLOofFjb
 Es6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBrqIS4U/yt/jAHt0whMwGGRWmZzZZu7ttseo1tsd6I=;
 b=TEkFY9GKrYAOEL+ALD0KdsDbJmcn4uvBJKmv0cYQGL0We845h+r8UgbGVflafc0TlM
 sIgzBGtcmM3n7Z3gIwcktV5j8siss6vwZ/NnCg8MAtX1izpXqRQLhseiZgwe8R+tYhoa
 SALo0wQlgVslrJ6sPTxlKz9kZd3MI2NWJthgLTzBHA3l6OR94hb0uQy/kNwpOQ2H4Zmz
 EX2+uY8n4Nzd5J0dtEYcWfrngp3xgOfVF8WJ6xdRqEGveLUecB/QXJOIa/vj3nNNEP+X
 MimnsHBP+FYEK97uHk9a84Us6Pc/iF5j/3ak2EfoKPblULsPxC0Njph/t8mJGryU/tMa
 +xFw==
X-Gm-Message-State: AOAM53110Xg+quJ7s35UfOHaw8XslFEbByG88aMfHOiiSjY+Q1gdl1mg
 w4Bm+TFifyKjJNlA7c+hob0abYyPouaAkQ==
X-Google-Smtp-Source: ABdhPJxaVBCF4u9F2Aag6rdBuHuFt/UWCQpAHpB7iGlH7UrWe9RMIw7RWATvQDXrDYTDobK28PyZFg==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr6078059wmc.108.1633014737974; 
 Thu, 30 Sep 2021 08:12:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] pci: Rename pci_root_bus_new_inplace() to
 pci_root_bus_init()
Date: Thu, 30 Sep 2021 16:11:57 +0100
Message-Id: <20210930151201.9407-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the pci_root_bus_new_inplace() function to
pci_root_bus_init(); this brings the bus type in to line with a
"_init for in-place init, _new for allocate-and-return" convention.
To do this we need to rename the implementation-internal function
that was using the pci_root_bus_init() name to
pci_root_bus_internal_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20210923121153.23754-4-peter.maydell@linaro.org
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


