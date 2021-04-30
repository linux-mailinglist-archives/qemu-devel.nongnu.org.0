Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDE36F8F8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:13:20 +0200 (CEST)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR5D-0007OS-6j
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUY-0007yf-G2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUL-0001QQ-5L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1383924wmi.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sdqS0yyWxOc4e8zr39heD6oB/Twh6FeMcv9FfbnuPVY=;
 b=W8pSxENSFL7sZyrHOTdLmdObzjMpk4jpsQPZc8lxO34xFm63a+QUFP+BJI0yJQU5gd
 XUXhYQrFmM68I37eXa5RcTL3JB9T0RCcL+tt4j5zfrEcaCNK7e/ir06voGFovmTcw91j
 YLG9NWCyUANni5fuvF+swc454duBAPHhvyrO0QjSJki75QpakH49q7bL5jsktHwMKzFA
 Lc8vgjnjxU4ppXvbkTdRlAaN2m9DYtaGy54WAalH2V+rNiyDikwB9nQaxQgWwgNe25y+
 SR1cnzGdYhdG6jrsTi5nWMnGF6KKRbWr63xPUiBodLmcWzbOo6yNZPJt85+eCC7GIRF6
 4Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdqS0yyWxOc4e8zr39heD6oB/Twh6FeMcv9FfbnuPVY=;
 b=OfDk9ewE2zeviDHzE1w8mIo/z1h44K6FeS6ZtZGTu+/ERGKhCSACw/fHkFpqem79Mq
 NEf/fIC8WCkzc3CuFsVadjwhvJ83RlN4IsuA+y4pjpIFD4I+Tcob3KXBp+Bt5D9XH9EP
 IW1+jOVS8LU7vZC+NDO3YiJBVrOA14LMQuS8QBq1STs8fpuikLVOanr/hvD4AcYICWRy
 0KP2yxynPX1Pb/Ul0EtKLjjunT/ISEgVHmnRZU7RMP3arPYocSfgRSV7nE5caYmR4mUG
 s8zcQZ/v20UAl3l+cf1qS9ODxKCvjHSLCqmBxRzXyH8t1Nze8GYwjr0qe4wpozcIStjl
 WHfg==
X-Gm-Message-State: AOAM533Rcbl4AxYXzgTM2CaHXFHx1ebwqtXyxttwthKeoCCVrcGa7QuZ
 dACfMKhmqlMtRyJuEajE+MGEEbjvT2FoNaT5
X-Google-Smtp-Source: ABdhPJw+/YGZ6stgUlDNjfZHmdWF5HT7s9pQ6/fJWVIPyQqGR2Gjk7k62RHSND7kE/lmgdwCkpi3Ag==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr5341299wmc.126.1619778910160; 
 Fri, 30 Apr 2021 03:35:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/43] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
Date: Fri, 30 Apr 2021 11:34:37 +0100
Message-Id: <20210430103437.4140-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
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
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20210325163315.27724-1-peter.maydell@linaro.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/pci-host/gpex.h |  4 +++
 hw/core/machine.c          |  4 ++-
 hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 60 insertions(+), 4 deletions(-)

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
index cebcdcc3511..0f5ce43d0c2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,7 +36,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_0[] = {};
+GlobalProperty hw_compat_6_0[] = {
+    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
+};
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
 GlobalProperty hw_compat_5_2[] = {
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


