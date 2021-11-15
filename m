Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C454B45150A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:21:55 +0100 (CET)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmiUE-00007g-DM
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSI-0006Oy-1V
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:55 -0500
Received: from [2a00:1450:4864:20::42b] (port=43701
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSF-0001wU-1I
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t30so32984124wra.10
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4haQNMdKffh7OjKsAsA/oYe151uxHGwe0eJSkXUzfg=;
 b=Rvis4gDxILf1UZPj1gNRar/m44O6hbE4gdlPMj8wvvIxvdxnYW9kGvLI9+1r/h2/3R
 vlmiW030zacaPc8cmuvpmPIAqBmW3x2L5+lss7swn7RzWseVwIgoeRvTEA0ZErwjWp54
 dYIQqKm9dCMVD4OkDqUdx4BB6enmGN7FxRkfISoFyQkoTOeZr8knejFhh+G5bhbRIq5f
 7gtE3KSHD62B7W77eC8MDL5Rm8/3HcB5XWRuTVtdXDduaSEB9d9HSxh6Pa2AFhHwV4AM
 Ddpa7wZhT33G8PeIr0FuDdpA2GfQQvShyHvrwTCJNby3ebsUO8V6wmwX3Zrox3ZxiGqw
 266g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4haQNMdKffh7OjKsAsA/oYe151uxHGwe0eJSkXUzfg=;
 b=TlIY6as/S2tQKQ+7HRWNiwHrXjHwseITbqzlNfiLtSg8Jy+2HTJM1rilfHDfpMwj0X
 UOjfIfA0kHfMgM6hvBoB/5/qlv/cEt5jlHoB3Sno7H1pSh03J1VLPnRrHtSVuvI9+kGt
 apD8eff8+1HOI1YU88xElN0j8iveb/t6Wmkee78K3+LWNos+pfDVVenD0cZ8DMEbWzau
 EiWDOh11jZrGkNbc/7TgLjd2deLecrobAasFsmsbW9Yv0fTFdZO3HoTpa4dzLXXlUfiP
 NoETzERNGAU/yKJ3EoQm8RzxJfPz26HysLwcG0mhkC1LMDCpLyBZR2+zO3pVs7oqxhxJ
 fNrA==
X-Gm-Message-State: AOAM531jriz2JdgVu6j/8BjIy1gwxeHY+PxzIdUGBwpe+a6MdmMXrQyz
 wk7kDvXrac+qr1jNoFvl6jb0VfMVd1sEAw==
X-Google-Smtp-Source: ABdhPJzKYTOBCDWTVGptwlRKeFUhXJ8A/1MREBGCmAj2MRLXoaTePmrh1xZY5RQAiCumsmT+vn5sAw==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr2282432wri.222.1637007588874; 
 Mon, 15 Nov 2021 12:19:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm15419033wrs.48.2021.11.15.12.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:19:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw/intc/arm_gicv3: Move checking of redist-region-count to
 arm_gicv3_common_realize
Date: Mon, 15 Nov 2021 20:19:43 +0000
Message-Id: <20211115201946.327770-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115201946.327770-1-peter.maydell@linaro.org>
References: <20211115201946.327770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3 devices have an array property redist-region-count.
Currently we check this for errors (bad values) in
gicv3_init_irqs_and_mmio(), just before we use it.  Move this error
checking to the arm_gicv3_common_realize() function, where we
sanity-check all of the other base-class properties. (This will
always be before gicv3_init_irqs_and_mmio() is called, because
that function is called in the subclass realize methods, after
they have called the parent-class realize.)

The motivation for this refactor is:
 * we would like to use the redist_region_count[] values in
   arm_gicv3_common_realize() in a subsequent patch, so we need
   to have already done the sanity-checking first
 * this removes the only use of the Error** argument to
   gicv3_init_irqs_and_mmio(), so we can remove some error-handling
   boilerplate

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/arm_gicv3_common.h |  2 +-
 hw/intc/arm_gicv3.c                |  6 +-----
 hw/intc/arm_gicv3_common.c         | 26 +++++++++++++-------------
 hw/intc/arm_gicv3_kvm.c            |  6 +-----
 4 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index aa4f0d67703..cb2b0d0ad45 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -306,6 +306,6 @@ struct ARMGICv3CommonClass {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops, Error **errp);
+                              const MemoryRegionOps *ops);
 
 #endif
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 3f24707838c..bcf54a5f0a5 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -393,11 +393,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
 
     gicv3_init_cpuif(s);
 }
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 223db16feca..8e47809398b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -250,22 +250,11 @@ static const VMStateDescription vmstate_gicv3 = {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops, Error **errp)
+                              const MemoryRegionOps *ops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
-    int rdist_capacity = 0;
     int i;
 
-    for (i = 0; i < s->nb_redist_regions; i++) {
-        rdist_capacity += s->redist_region_count[i];
-    }
-    if (rdist_capacity < s->num_cpu) {
-        error_setg(errp, "Capacity of the redist regions(%d) "
-                   "is less than number of vcpus(%d)",
-                   rdist_capacity, s->num_cpu);
-        return;
-    }
-
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
      * GPIO array layout is thus:
      *  [0..N-1] spi
@@ -308,7 +297,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
-    int i;
+    int i, rdist_capacity;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -350,6 +339,17 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    rdist_capacity = 0;
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        rdist_capacity += s->redist_region_count[i];
+    }
+    if (rdist_capacity < s->num_cpu) {
+        error_setg(errp, "Capacity of the redist regions(%d) "
+                   "is less than number of vcpus(%d)",
+                   rdist_capacity, s->num_cpu);
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 5c09f00dec2..ab58c73306d 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -787,11 +787,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
-- 
2.25.1


