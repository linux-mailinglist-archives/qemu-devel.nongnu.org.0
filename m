Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B36EC874
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:09:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsB7-0007Qi-LG; Mon, 24 Apr 2023 05:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAw-00072v-Jc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAs-0001N8-Dl
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso26259877b3a.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327270; x=1684919270;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LfqOaz7aAsPVzjMgz29o/aWlCXr+hl2qJVzEF8n9SDM=;
 b=K9WRhQW8lMs5ej7gHJPH9i5WE2EaPcgMblRlWlK8blSTG8/PrjFHQ7/FV5WDxfJBGJ
 uvVfMulPuSj/KvvZ3BdlOphhE1ofl13dqJghGomN5np90dNdCu9dK3yPbB5G4FEvHPok
 gM8OsdKCKTgGjKvlZMDYI0PZn0t6g/8ep9QGMH62uKFKs1nH0FvvgXL8Ovs76VnOsfpB
 6HuefZm1kttHfPfvkatKOn7IJimbmGNhqSYwnWcjR6SudliV7/OtmDzkWgZX1ryMPmsJ
 zbWagt9iTJt8W2OHjmeh40zCmKvQycsSrQ6A0nNb+ZBumJOLAW66ruwIAbXwtvAJ321b
 aycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327270; x=1684919270;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LfqOaz7aAsPVzjMgz29o/aWlCXr+hl2qJVzEF8n9SDM=;
 b=TDAt+MFePX+0fDMsue53/riY18RtGFB8j0C9t9nohAlH84ZVrp6CRXXgGeLNJNYfSJ
 NRxBrVLkn1MVLLntqvV4gS9s91stBOK4swGLPbc4jMx2YkafyvXE0XCjC4ogvRqVpP75
 6a8nadMVIqmfzZI1nwGgxoU2y1EU98HZB51R/Heig5VH0w1wSrzg6zHeOT7zta8Cu705
 dTwZh0MmsdU3P4om1GsXYlt4GMVqBw4605NWBbhJolzu8fnzJ45rvOKqUhfZYobeWDbI
 Y2zlUFOnBVSva0KCahefnyVFruh0dOjX6wlS64O3Bj2Oz+VBvBjc93NtkweKib1PYF5U
 bMnA==
X-Gm-Message-State: AAQBX9d6fplIpTfqF34PkS9D1isRrc2YSGoC11YsknFUPLE8nK39yuXP
 oFN8ltX2NVcOMzlMkObtnZPBM0BURTKwQij/qM1D1scTIJBsal0zF6DbH8UrqqvWBgpiJvEbp2k
 JUxYpMnvmN8MpIYsifA4xHfgzHU+rSbJ3e/gtFETThHoalTuTwaU6JValIVTprEzdqZYInRJ2eT
 IY4Juz
X-Google-Smtp-Source: AKy350bJNU6o7tyGwCj78umZ7gHXAUnnmxocGhdyLxidlyXeCo5GWYqtBdWAnknFrv/Hmw905IeEAw==
X-Received: by 2002:a17:902:f814:b0:1a6:4770:8383 with SMTP id
 ix20-20020a170902f81400b001a647708383mr16587457plb.29.1682327270408; 
 Mon, 24 Apr 2023 02:07:50 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:50 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Stefan Weil <sw@weilnetz.de>, Jim Shu <jim.shu@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH 5/6] target/riscv: update APLIC and IMSIC to support KVM AIA
Date: Mon, 24 Apr 2023 09:07:07 +0000
Message-Id: <20230424090716.15674-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Do not set the mmio operations of APLIC and IMSIC when using KVM AIA
- Send interrupt signal to KVM AIA via KVM_IRQ_LINE API

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aplic.c | 19 +++++++++++++++----
 hw/intc/riscv_imsic.c | 16 +++++++++++-----
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cfd007e629..5f68900e9a 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -31,6 +31,7 @@
 #include "hw/irq.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define APLIC_MAX_IDC                  (1UL << 14)
@@ -479,6 +480,11 @@ static void riscv_aplic_request(void *opaque, int irq, int level)
 
     assert((0 < irq) && (irq < aplic->num_irqs));
 
+    if (kvm_irqchip_in_kernel()) {
+        kvm_set_irq(kvm_state, irq, !!level);
+        return;
+    }
+
     sourcecfg = aplic->sourcecfg[irq];
     if (sourcecfg & APLIC_SOURCECFG_D) {
         childidx = sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
@@ -814,9 +820,11 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
     aplic->iforce = g_new0(uint32_t, aplic->num_harts);
     aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
 
-    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
-                          TYPE_RISCV_APLIC, aplic->aperture_size);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+    if (!kvm_irqchip_in_kernel()) {
+        memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops,
+                             aplic, TYPE_RISCV_APLIC, aplic->aperture_size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+    }
 
     /*
      * Only root APLICs have hardware IRQ lines. All non-root APLICs
@@ -958,7 +966,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
     qdev_prop_set_bit(dev, "mmode", mmode);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (!kvm_irqchip_in_kernel()) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    }
 
     if (parent) {
         riscv_aplic_add_child(parent, dev);
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 4d4d5b50ca..9b2a442b40 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -32,6 +32,7 @@
 #include "target/riscv/cpu.h"
 #include "target/riscv/cpu_bits.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define IMSIC_MMIO_PAGE_LE             0x00
@@ -325,10 +326,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
     imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
     imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
 
-    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
-                          imsic, TYPE_RISCV_IMSIC,
-                          IMSIC_MMIO_SIZE(imsic->num_pages));
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+    if (!kvm_irqchip_in_kernel()) {
+        memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
+                              imsic, TYPE_RISCV_IMSIC,
+                              IMSIC_MMIO_SIZE(imsic->num_pages));
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+    }
 
     /* Claim the CPU interrupt to be triggered by this IMSIC */
     if (riscv_cpu_claim_interrupts(rcpu,
@@ -432,7 +435,10 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
     qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (!kvm_irqchip_in_kernel()) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    }
 
     for (i = 0; i < num_pages; i++) {
         if (!i) {
-- 
2.17.1


