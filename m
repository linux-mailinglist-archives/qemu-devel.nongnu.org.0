Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB434971A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:43:39 +0100 (CET)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPT58-0005XE-3O
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSvE-00066A-8K
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:33:25 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSvA-0003ug-V4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:33:23 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so3446681wmd.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKeVcoHdrGWQXLe7BiJjwqwzRYmaI2JkcCfSkfd7wjs=;
 b=t1hZGrSNzLoH/KNRSrictlHway6Wq87li3aytSbOQjHOYQHBaSgOO3xJwq6XMzYPGp
 QIqrDlKycXBjdA5uT41Es3akNvpWPmqQiLtLANUlHRaRt/qEcZp7Jq4JtkYzdIlZkA1B
 8nnv5JNv33DAtyUnghMgGTihyXNaRR85A46P8Qy8zq4WBCHscpOOGyjSe0eByW/SiM/K
 tLbV7/oxZPPJ+cw7M7Vt+bnQehURqQwygE652AXehAlD5VV0HctO/+d7sh92Oa0rUqa3
 wQrikBxZrWdzMfJL5cZBrQsUEhcBJB5s+cEEkOzRym6WHRKy4p94tlaPAuR01hoCFNnd
 PvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKeVcoHdrGWQXLe7BiJjwqwzRYmaI2JkcCfSkfd7wjs=;
 b=gMd6nyEsV0gxBhjfmWjUP2pF+D4zyiBMKJr3ws1fto/Sn/I362Us7yyKAfpWv2+Hv8
 IH4uEqQOk9KobW5HcgrMk4A7KDyw02YOYfWMBX6lIakGbttWhtZQeQjYpLaMaEzWmxZW
 wcyaE0w4ppvBtl5cr9lOy8ENcIt6ZVm4RfnAFxHDh7p5W3huaxFAMpdiflnZl9kAqd8g
 TQFksxqMN7HqGBf2pjJw+FQK4QiE8psFglW3AmDygjvZoecKwXxftgDhDhSrgahZIOKX
 kcCHW6n7EmfHY4eDKIalJmMicTC0X3pLRJPeUXDzcgZHI/qOGAicXZgZG+KodVRj+UjW
 /elQ==
X-Gm-Message-State: AOAM5337aYNafjE8VCqZvR303iZxMNB2uiV5XwWPgq7+hzwMGf5+IKSM
 t1pWIbI3xh1vl8ZRLaaO1QvbSA==
X-Google-Smtp-Source: ABdhPJx5Fd0yJhK3EEw4gJsejk7xkVp4gFItq4g2q3u3EvR6NBcUknOkm4S0zgUJI+Wj/ckqoIydpA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr8971547wmi.186.1616689998297; 
 Thu, 25 Mar 2021 09:33:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i11sm8167130wro.53.2021.03.25.09.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 09:33:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped parts
 of MMIO and PIO windows
Date: Thu, 25 Mar 2021 16:33:15 +0000
Message-Id: <20210325163315.27724-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: qemu-riscv@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the gpex PCI controller implements no special behaviour for
guest accesses to areas of the PIO and MMIO where it has not mapped
any PCI devices, which means that for Arm you end up with a CPU
exception due to a data abort.

Most host OSes expect "like an x86 PC" behaviour, where bad accesses
like this return -1 for reads and ignore writes.  In the interests of
not being surprising, make host CPU accesses to these windows behave
as -1/discard where there's no mapped PCI device.

The old behaviour generally didn't cause any problems, because
almost always the guest OS will map the PCI devices and then only
access where it has mapped them. One corner case where you will see
this kind of access is if Linux attempts to probe legacy ISA
devices via a PIO window access. So far the only case where we've
seen this has been via the syzkaller fuzzer.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2 changes: put in the hw_compat machinery.

Still not sure if I want to put this in 6.0 or not.

 include/hw/pci-host/gpex.h |  4 +++
 hw/core/machine.c          |  1 +
 hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d48a020a952..fcf8b638200 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -49,8 +49,12 @@ struct GPEXHost {
 
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
     qemu_irq irq[GPEX_NUM_IRQS];
     int irq_num[GPEX_NUM_IRQS];
+
+    bool allow_unmapped_accesses;
 };
 
 struct GPEXConfig {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 257a664ea2e..9750fad7435 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-net-pci", "vectors", "3"},
+    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..a6752fac5e8 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     int i;
 
     pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
+    sysbus_init_mmio(sbd, &pex->mmio);
+
+    /*
+     * Note that the MemoryRegions io_mmio and io_ioport that we pass
+     * to pci_register_root_bus() are not the same as the
+     * MemoryRegions io_mmio_window and io_ioport_window that we
+     * expose as SysBus MRs. The difference is in the behaviour of
+     * accesses to addresses where no PCI device has been mapped.
+     *
+     * io_mmio and io_ioport are the underlying PCI view of the PCI
+     * address space, and when a PCI device does a bus master access
+     * to a bad address this is reported back to it as a transaction
+     * failure.
+     *
+     * io_mmio_window and io_ioport_window implement "unmapped
+     * addresses read as -1 and ignore writes"; this is traditional
+     * x86 PC behaviour, which is not mandated by the PCI spec proper
+     * but expected by much PCI-using guest software, including Linux.
+     *
+     * In the interests of not being unnecessarily surprising, we
+     * implement it in the gpex PCI host controller, by providing the
+     * _window MRs, which are containers with io ops that implement
+     * the 'background' behaviour and which hold the real PCI MRs as
+     * subregions.
+     */
     memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
     memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
 
-    sysbus_init_mmio(sbd, &pex->mmio);
-    sysbus_init_mmio(sbd, &s->io_mmio);
-    sysbus_init_mmio(sbd, &s->io_ioport);
+    if (s->allow_unmapped_accesses) {
+        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "gpex_mmio_window", UINT64_MAX);
+        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "gpex_ioport_window", 64 * 1024);
+
+        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+        sysbus_init_mmio(sbd, &s->io_mmio_window);
+        sysbus_init_mmio(sbd, &s->io_ioport_window);
+    } else {
+        sysbus_init_mmio(sbd, &s->io_mmio);
+        sysbus_init_mmio(sbd, &s->io_ioport);
+    }
+
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
@@ -108,6 +147,16 @@ static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
     return "0000:00";
 }
 
+static Property gpex_host_properties[] = {
+    /*
+     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
+     * (discarding writes and returning -1 for reads) rather than aborting.
+     */
+    DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
+                     allow_unmapped_accesses, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gpex_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
     dc->realize = gpex_host_realize;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
+    device_class_set_props(dc, gpex_host_properties);
 }
 
 static void gpex_host_initfn(Object *obj)
-- 
2.20.1


