Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BB55B83C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:34:54 +0200 (CEST)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jGn-0001rD-DO
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izW-0003iS-2s; Mon, 27 Jun 2022 03:17:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izS-0003ts-BB; Mon, 27 Jun 2022 03:17:01 -0400
Received: by mail-ed1-x532.google.com with SMTP id e40so11647284eda.2;
 Mon, 27 Jun 2022 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8v+otkILnaLVE4jysgeV47PF0Np5ww+CCUJXKRHwxJw=;
 b=kcQduIUWtTGR2Shh0+LXn7VqoXG3ebbunVgxeAvzvOz9j09SyIh0W+UkIkLJjsPXbq
 tjrX9wN+rXJCnqn5nwltWyfcv9wtEOO+gECCwWh+eWYHw+CBAATEEitrEl0ZJGlgjuKm
 xy9SKJVfis86UivA2TFf2cXXdExkyz3BHaEn9drV0YTEsbVPK2RgYyYJYivvITLTpC7j
 C2HJQjcO5xUre14EtO4EC9X8VcfwZMfYjd83cJzfr5nxFZzaUMy1Vd6lYlYDyMPLnTbR
 Csr0DzpbQYKjTJI2Z4VGlHhgK3tYxoTqxgID4VHUd1DOXGWG2P8mnjYTLcKA8yKxmuz1
 FimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8v+otkILnaLVE4jysgeV47PF0Np5ww+CCUJXKRHwxJw=;
 b=2ZRm6+DMdUqVWgOlCAnBB2iKL06+eQC6/hjUtYt2hdrVjXiD1blMo5F8s2V6rTxW01
 w6ZTafj1sRU8pMHRuCJqVhnLXni1q9Zaj5FEkIJQ9Lr2hrZGM9OWLPMDL8dj3miOsxe2
 JNUqa5su1mCMQuJGO5isnSLau6mNPITt6Sja3CI+/wdY/mY58pOYXJDVUHn97tzXSqv+
 LjKWDncUi/i/CH4Ki98Uc9/Bg1S2IfXtcOqqMwaGfYDkpATs/Xx5iqLET2eeA76khaqb
 hQDzLNFaVy59b+wrYWZMyrxvrmx+fqUjoNKwUSx8ww+C/aTjVnQpCAZ05+KKdzCeflmk
 BsuQ==
X-Gm-Message-State: AJIora/IVNN88OhF+6tMG7dsqL5ot63FcXP4o4nG5NXgc6gxe0uNgQgg
 NKtudeu2wN+ixwz195IhzueBckPX6XwEhA==
X-Google-Smtp-Source: AGRyM1sH48BmoYvqhS4IQ9UVTQ/M86BD7O3rC1lUoinJsaSgZy6NNtdq1cOjhsPeQdDI0ZT4BkZHUw==
X-Received: by 2002:a05:6402:5288:b0:435:ccbb:2a3a with SMTP id
 en8-20020a056402528800b00435ccbb2a3amr15091632edb.382.1656314210713; 
 Mon, 27 Jun 2022 00:16:50 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 07/10] hw/pci/pci: Introduce pci_register_portio_list()
Date: Mon, 27 Jun 2022 09:16:08 +0200
Message-Id: <20220627071611.8793-8-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

pci_ide_init_ioport() and pci_register_portio_list() are introduced which
mirror their ISA counterparts. But rather than asking for an ISADevice, the
functions ask for PCIDevice which can be used in hw/ide/piix which fixes
having to pass a NULL ISADevice which is not avialable there.

Passing NULL as ISADevice to pci_ide_init_ioport() also causes a NULL
ISADevice to be passed to isa_register_ioport(). Currently this function
always uses the isabus global. To fix this, we'll want to determine the
ISABus using isa_bus_from_device(), so no call-site must pass a NULL
ISADevice.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/ioport.c           | 14 ++++++++++++++
 hw/pci/pci.c              | 18 ++++++++++++++++++
 include/hw/ide/internal.h |  1 +
 include/hw/pci/pci.h      | 21 +++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index ed1f34f573..69e4fa15d4 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
+#include "hw/pci/pci_bus.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "sysemu/blockdev.h"
@@ -62,3 +63,16 @@ void isa_ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
                                  iobase2, ide_portio2_list, bus, "ide");
     }
 }
+
+void pci_ide_init_ioport(IDEBus *bus, PCIDevice *dev, int iobase, int iobase2)
+{
+    assert(dev);
+
+    pci_register_portio_list(dev, &bus->portio_list,
+                             iobase, ide_portio_list, bus, "ide");
+
+    if (iobase2) {
+        pci_register_portio_list(dev, &bus->portio2_list,
+                                 iobase2, ide_portio2_list, bus, "ide");
+    }
+}
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..3046dd5477 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1440,6 +1440,24 @@ pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
+void pci_register_portio_list(PCIDevice *dev,
+                              PortioList *piolist, uint16_t start,
+                              const MemoryRegionPortio *pio_start,
+                              void *opaque, const char *name)
+{
+    PCIBus *bus;
+
+    assert(dev);
+    assert(piolist && !piolist->owner);
+
+    bus = pci_get_bus(dev);
+
+    assert(bus);
+
+    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
+    portio_list_add(piolist, bus->address_space_io, start);
+}
+
 static void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 86ecc04ce4..4a375d3c09 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -625,6 +625,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
 void isa_ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void pci_ide_init_ioport(IDEBus *bus, PCIDevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..91b479d542 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -522,6 +522,27 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 pcibus_t pci_bar_address(PCIDevice *d,
                          int reg, uint8_t type, pcibus_t size);
 
+/**
+ * pci_register_portio_list: Initialize a set of io ports
+ *
+ * Several ISA devices have many dis-joint I/O ports.  Worse, these I/O
+ * ports can be interleaved with I/O ports from other devices.  This
+ * function makes it easy to create multiple MemoryRegions for a single
+ * device and use the legacy portio routines.
+ *
+ * @dev: the PCIDevice against which these are registered
+ * @piolist: the PortioList associated with the io ports
+ * @start: the base I/O port against which the portio->offset is applied.
+ * @portio: the ports, sorted by offset.
+ * @opaque: passed into the portio callbacks.
+ * @name: passed into memory_region_init_io.
+ */
+void pci_register_portio_list(PCIDevice *dev,
+                              PortioList *piolist,
+                              uint16_t start,
+                              const MemoryRegionPortio *portio,
+                              void *opaque, const char *name);
+
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
 {
-- 
2.36.1


