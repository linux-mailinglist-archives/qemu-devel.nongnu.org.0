Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C428BCDD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:47:47 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS038-00068Y-JG
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqK-0006yV-9m
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:32 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqI-0007JV-Dt
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:32 -0400
Received: by mail-wr1-x441.google.com with SMTP id t9so19675048wrq.11
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCPWjLYyI6z3WFhhXaeYUbi5QZIddcoWl6SEfIfuuFs=;
 b=jvkUIDRClN9EIrNy2RSdtWRPqcJKUB35LA78DZJ65CbJFay23p7wAmAtvMRKkwVIpq
 j0+GyMO3ekHx2NzlGH+Hu9wWt9FXxGLOUkDTVSKRJa0NV/JNJ9ggidTuULb8wMRJ1PPT
 8eJ07v5t77Q1eUb58VmOQX+TU6wbNttw1+v5rer4GpwhucVMJ8ppyh7oqaDwHEQQwvSa
 vyOaQVcjZeJsj9ggOBzoUk6D+QaRVIuPWHun2LKlWMnRvw0wfedq0OK5F85MgWPP7xMi
 T7iUDyv0Lo5qbZklcQQuOjlmBAkxZeNcK4t24SC0U7TEOGkq85EDlnUvHflXkC96g78r
 q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCPWjLYyI6z3WFhhXaeYUbi5QZIddcoWl6SEfIfuuFs=;
 b=QdEFd5QiXCQFU50kDamTGDLNWXokoxTqJ9Hkbl2Z86TmxfItOBOyWvi9JqBVNO+Zoz
 ogCOEVtDFz/DoPt9YRc0R8Bl+rH839loBKyC6Qs0RWxjBzLCwuwVr1aSZM7BgJcEQSeF
 Y/uk3eN7FqG0x2X6XFEAq8rZjjJP7MhWNVeJFZapL615IZjNt4VBasNPMdLWdazQy3gd
 qZ3Re2yzADyGxGxScO3r37Q3aRKiVVgh7K5a9guIiLtyRLi6RegVU8SJ1fU7Vq/y5vR5
 bz3HSDBxJbxqcTw+08W5/7bSNQSbDjbeJWqqfTxVsV2MK3YR7CABi/ZYCxqWEsiNx0f4
 UmFg==
X-Gm-Message-State: AOAM532f85ZdGYCu8HDTvAsRRczvHIyAv3/SRZDxwA4/5C5JV4XpVxtL
 eBeQVUPFpDqPzsRcL3trapsvWQ==
X-Google-Smtp-Source: ABdhPJw3rY3457BdxkO9G6YrxPMZWwl0qoCALdW6L3/dAggIH2iCcdauht8QaOmIHyjCkS2KNOMngQ==
X-Received: by 2002:adf:f841:: with SMTP id d1mr20555398wrq.297.1602516869112; 
 Mon, 12 Oct 2020 08:34:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Don't copy CPU's maintenance
 interrupt
Date: Mon, 12 Oct 2020 16:33:39 +0100
Message-Id: <20201012153408.9747-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In gicv3_init_cpuif() we copy the ARMCPU gicv3_maintenance_interrupt
into the GICv3CPUState struct's maintenance_irq field.  This will
only work if the board happens to have already wired up the CPU
maintenance IRQ before the GIC was realized.  Unfortunately this is
not the case for the 'virt' board, and so the value that gets copied
is NULL (since a qemu_irq is really a pointer to an IRQState struct
under the hood).  The effect is that the CPU interface code never
actually raises the maintenance in2Dterrupt line.

Instead, since the GICv3CPUState has a pointer to the CPUState, make
the dereference at the point where we want to raise the interrupt, to
avoid an implicit requirement on board code to wire things up in a
particular order.

Reported-by: Jose Martins <josemartins90@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---

QEMU's implementation here is a bit odd because we've put all the
logic into the "GIC" device where in real hardware it's split between
a GIC device and the CPU interface part in the CPU.  If we had
arranged it in that way then we wouldn't have this odd bit of code
where the GIC device needs to raise an IRQ line that belongs to the
CPU.

Not sure why we've never noticed this bug previously with KVM as a
guest, you'd think we'd have spotted "maintenance interrupts just
don't work"...
---
 include/hw/intc/arm_gicv3_common.h | 1 -
 hw/intc/arm_gicv3_cpuif.c          | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0331b0ffdb8..91491a2f664 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -153,7 +153,6 @@ struct GICv3CPUState {
     qemu_irq parent_fiq;
     qemu_irq parent_virq;
     qemu_irq parent_vfiq;
-    qemu_irq maintenance_irq;
 
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 08e000e33c6..43ef1d7a840 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -399,6 +399,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
     int irqlevel = 0;
     int fiqlevel = 0;
     int maintlevel = 0;
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
@@ -424,7 +425,7 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
-    qemu_set_irq(cs->maintenance_irq, maintlevel);
+    qemu_set_irq(cpu->gicv3_maintenance_interrupt, maintlevel);
 }
 
 static uint64_t icv_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2624,8 +2625,6 @@ void gicv3_init_cpuif(GICv3State *s)
             && cpu->gic_num_lrs) {
             int j;
 
-            cs->maintenance_irq = cpu->gicv3_maintenance_interrupt;
-
             cs->num_list_regs = cpu->gic_num_lrs;
             cs->vpribits = cpu->gic_vpribits;
             cs->vprebits = cpu->gic_vprebits;
-- 
2.20.1


