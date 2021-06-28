Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47753B61B8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:37:31 +0200 (CEST)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsOA-0001mT-Qz
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMg-0007dQ-3w
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMd-0000ce-GS
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id d1so8405507plg.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bHxD8qeEAlVIf2aUTicni+fSY9kjYBTFskhADVFY3eY=;
 b=IpErAsfOCy+nl7K9+Rran74y7ZCFhIeSoOglV5J7Pkb2Z9G5OPMGmqA2Rnb7kpAiis
 IXhc4+38TsjFvo1E69N9hBaxxxX18SW2bVTrT6D1SgM6+sHj6F0td4Js5Z9KrZPBPr4m
 cYXPNcs+uRtGXn+ksfNEntvt+r8KQcD+uPh09Pl3yvlxjJeMdats2wNCIYU0e/Hzyvmd
 IIPL8Gs4qi03ofMkCxSVaxdK4QJw619IVaEW8+qpNQal3zxRvfzJ2eYr3gNiBaoxh4re
 twQpb6yjvHGvNI2pEoXRkIzYK919aYwnDyTHcici5wLLpbYBr/ZAXDas7kRXSS+Arh4F
 jctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHxD8qeEAlVIf2aUTicni+fSY9kjYBTFskhADVFY3eY=;
 b=j3k1WMhSh8GCs0lx5lN/oKWa0LM9yadcC30oG1eYVbAgI959FY08rpKPSuXBoKtj4A
 c2m6WM7i7z2My34kf2Ndvoq0hgqy8fAmzDJtOfsu7YtxCnJMOZYqFtZgupyS/3cfJPzI
 qjyeVbgMmbLSd3nP/wrrVYjipdxV/4vwaBW0lhXMnCFOcwBAlVBESvAo9IKTgubib6pr
 3zUo9u2Ans+JhTDoUqttjSBqhilHs4EErxFDwQMb5ohyaQYP3xD3paPeG63kvW699l3w
 cowfhaDvGeiWlt7pPpOHj5ffpQPgIbQLCs9nZAa+KDdKWU412Kf26/aInpOiMoT23UUP
 RRDw==
X-Gm-Message-State: AOAM533rYOU2uA6MwepD1FRJ+6RYC+tbtgBahcrqCSP3RyHSdkUcyOhX
 RHVMP+dAK5GUr3N556dhb8VbzcO22n3/Gw==
X-Google-Smtp-Source: ABdhPJzTE6TceflJ5tPABx2KW/HX8svh0JZddUSvrbDScciQ+ZeF3a9apvkjgiDgoTkjqwbIH6kKpA==
X-Received: by 2002:a17:902:b198:b029:11b:2246:e374 with SMTP id
 s24-20020a170902b198b029011b2246e374mr23142896plr.17.1624890954219; 
 Mon, 28 Jun 2021 07:35:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k13sm72779pgh.82.2021.06.28.07.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:35:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] hw/alpha: Provide a PCI-ISA bridge device node
Date: Mon, 28 Jun 2021 07:35:49 -0700
Message-Id: <20210628143551.2870006-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628143551.2870006-1-richard.henderson@linaro.org>
References: <20210628143551.2870006-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Thorpe <thorpej@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Thorpe <thorpej@me.com>

- Move initialization of the ISA bus from typhoon_init() to clipper_init();
  this apsect of device topology is really associated with the individual
  model, not the core logic chipset.  typhoon_init() now returns the IRQ
  to use for the output of the ISA PIC.

- In clipper_init(), instantiate an i82378 instance, and connect its
  PIC output to the ISA IRQ input provided by typhoon_init().  Remove
  the explicit instantiations of i8254 and i82374, as these devices
  are subsumed by the i82378.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason Thorpe <thorpej@me.com>
Message-Id: <20210616141538.25436-1-thorpej@me.com>
[rth: Remove direct dependencies on i82374, i8254, i8259.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/alpha/alpha_sys.h |  2 +-
 hw/alpha/dp264.c     | 38 ++++++++++++++++++++++++++++++--------
 hw/alpha/typhoon.c   | 19 ++++---------------
 hw/alpha/Kconfig     |  4 +---
 4 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 4835b3d5ee..2263e821da 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -10,7 +10,7 @@
 #include "hw/intc/i8259.h"
 
 
-PCIBus *typhoon_init(MemoryRegion *, ISABus **, qemu_irq *, AlphaCPU *[4],
+PCIBus *typhoon_init(MemoryRegion *, qemu_irq *, qemu_irq *, AlphaCPU *[4],
                      pci_map_irq_fn, uint8_t devfn_min);
 
 /* alpha_pci.c.  */
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 316f0691cd..c78ed96d0e 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -15,9 +15,7 @@
 #include "qemu/error-report.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
-#include "hw/timer/i8254.h"
 #include "hw/isa/superio.h"
-#include "hw/dma/i8257.h"
 #include "net/net.h"
 #include "qemu/cutils.h"
 #include "qemu/datadir.h"
@@ -58,8 +56,10 @@ static void clipper_init(MachineState *machine)
     AlphaCPU *cpus[4];
     PCIBus *pci_bus;
     PCIDevice *pci_dev;
+    DeviceState *i82378_dev;
     ISABus *isa_bus;
     qemu_irq rtc_irq;
+    qemu_irq isa_irq;
     long size, i;
     char *palcode_filename;
     uint64_t palcode_entry;
@@ -90,14 +90,39 @@ static void clipper_init(MachineState *machine)
      * Init the chipset.  Because we're using CLIPPER IRQ mappings,
      * the minimum PCI device IdSel is 1.
      */
-    pci_bus = typhoon_init(machine->ram, &isa_bus, &rtc_irq, cpus,
+    pci_bus = typhoon_init(machine->ram, &isa_irq, &rtc_irq, cpus,
                            clipper_pci_map_irq, PCI_DEVFN(1, 0));
 
+    /*
+     * Init the PCI -> ISA bridge.
+     *
+     * Technically, PCI-based Alphas shipped with one of three different
+     * PCI-ISA bridges:
+     *
+     * - Intel i82378 SIO
+     * - Cypress CY82c693UB
+     * - ALI M1533
+     *
+     * (An Intel i82375 PCI-EISA bridge was also used on some models.)
+     *
+     * For simplicity, we model an i82378 here, even though it wouldn't
+     * have been on any Tsunami/Typhoon systems; it's close enough, and
+     * we don't want to deal with modelling the CY82c693UB (which has
+     * incompatible edge/level control registers, plus other peripherals
+     * like IDE and USB) or the M1533 (which also has IDE and USB).
+     *
+     * Importantly, we need to provide a PCI device node for it, otherwise
+     * some operating systems won't notice there's an ISA bus to configure.
+     */
+    i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(7, 0), "i82378"));
+    isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
+
+    /* Connect the ISA PIC to the Typhoon IRQ used for ISA interrupts. */
+    qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
+
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     mc146818_rtc_init(isa_bus, 1900, rtc_irq);
 
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-
     /* VGA setup.  Don't bother loading the bios.  */
     pci_vga_init(pci_bus);
 
@@ -106,9 +131,6 @@ static void clipper_init(MachineState *machine)
         pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
     }
 
-    /* 2 82C37 (dma) */
-    isa_create_simple(isa_bus, "i82374");
-
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_SMC37C669_SUPERIO);
 
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index fa31a2f286..bd39c8ca86 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -814,9 +814,9 @@ static void typhoon_alarm_timer(void *opaque)
     cpu_interrupt(CPU(s->cchip.cpu[cpu]), CPU_INTERRUPT_TIMER);
 }
 
-PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
-                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq,
-                     uint8_t devfn_min)
+PCIBus *typhoon_init(MemoryRegion *ram, qemu_irq *p_isa_irq,
+                     qemu_irq *p_rtc_irq, AlphaCPU *cpus[4],
+                     pci_map_irq_fn sys_map_irq, uint8_t devfn_min)
 {
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
@@ -844,6 +844,7 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
         }
     }
 
+    *p_isa_irq = qemu_allocate_irq(typhoon_set_isa_irq, s, 0);
     *p_rtc_irq = qemu_allocate_irq(typhoon_set_timer_irq, s, 0);
 
     /* Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
@@ -919,18 +920,6 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
     /* Pchip1 PCI I/O, 0x802.FC00.0000, 32MB.  */
     /* Pchip1 PCI configuration, 0x802.FE00.0000, 16MB.  */
 
-    /* Init the ISA bus.  */
-    /* ??? Technically there should be a cy82c693ub pci-isa bridge.  */
-    {
-        qemu_irq *isa_irqs;
-
-        *isa_bus = isa_bus_new(NULL, get_system_memory(), &s->pchip.reg_io,
-                               &error_abort);
-        isa_irqs = i8259_init(*isa_bus,
-                              qemu_allocate_irq(typhoon_set_isa_irq, s, 0));
-        isa_bus_irqs(*isa_bus, isa_irqs);
-    }
-
     return b;
 }
 
diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
index 15c59ff264..9af650c94e 100644
--- a/hw/alpha/Kconfig
+++ b/hw/alpha/Kconfig
@@ -3,9 +3,7 @@ config DP264
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply E1000_PCI
-    select I82374
-    select I8254
-    select I8259
+    select I82378
     select IDE_CMD646
     select MC146818RTC
     select PCI
-- 
2.25.1


