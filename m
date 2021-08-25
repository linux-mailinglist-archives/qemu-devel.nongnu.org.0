Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579733F741D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:10:26 +0200 (CEST)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqnZ-0006FV-5e
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGW-0004xR-Vu
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:17 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGS-0005fl-6c
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id u16so35670739wrn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=us54UYZLQN0nQhY4FPVzcNyu00zb835SaV13XZLLvmk=;
 b=K5ZwMOSURXmIFiSqaz4L0uqQUKyj9m1qtPzVcdp/hGyIsQgv9G1ygf9fBM8SIUJSEX
 5h8K02eVmO/J2ub/VTM5MQ7llI1sV2dBY17U/VRXdaNDFHL0tqn4TMtAUcBMHpL0v/E1
 5iUImVpyNn1Bf/0J7In1fSF28ajxe9Icva6KkLY02/m08h1jY1d3DE7WMzJF47ecEpn9
 8wFLmhW2D/kc4/1b8BzJATSqJw8fsjlU9L4IlHZmodCirReu7YP4MFBEwO8dhfspMj4R
 yH7u8zF2VvbIYCc/pIJwK6plJZaNe730t5afFL3MFfWL8+bup4ObWzNXU4bIh6i+L3/P
 lWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=us54UYZLQN0nQhY4FPVzcNyu00zb835SaV13XZLLvmk=;
 b=fywTKbOMtMhI1/qYBdBE9P4OxHcJP0mZyYVYG+4NFS7HCVfnEX5ROVaFIj0GDrlEsA
 +o/G0Nk91wmZ8uilNxuLHgyLejF4KtVnyNMkMvJ9Ws6X7hxGNqKkKzpoOjRKWsBp1W6p
 dJF/9xX7fkAttJm9iBi8o6F07OvvyFCuu5X7/zP9EyC7BHDGBzoJLg6QP0n04JBHwJEA
 9WYUqRMwuMGppEyI8+5Tnc0Mjx2EJQuSUOaCtNFAoNwtC13s1xatNenRdRsh7DuXvgnI
 kWXSWnxnr+Bon4g2/083UPS6/63RJ/BbZNWN4tjMu3jB5sqfoQNVTm7JBy7nJ7cD31rM
 Ho8g==
X-Gm-Message-State: AOAM533lUtzgqPhFn/gJXDZeKkoMBuJKqajwdhAjMZKdx6CgGX+F402c
 dF6vWRIX/6dFA/FNP0PcAMNCp0jjdUbk9Q==
X-Google-Smtp-Source: ABdhPJzDz9jfxS7suraODR3eTRaYkOrTDw013khmC8uJbKx4Eww8CxKbWttcnpi0XJ/xpbvXuE6ghA==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr24452687wrv.370.1629887770929; 
 Wed, 25 Aug 2021 03:36:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/44] hw/dma/pl330: Add memory region to replace default
Date: Wed, 25 Aug 2021 11:35:31 +0100
Message-Id: <20210825103534.6936-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>

Add property memory region which can connect with IOMMU region to support SMMU translate.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/exynos4210.c  |  3 +++
 hw/arm/xilinx_zynq.c |  3 +++
 hw/dma/pl330.c       | 26 ++++++++++++++++++++++----
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 5c7a51bbad7..0299e81f853 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -173,6 +173,9 @@ static DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,
     int i;
 
     dev = qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                             OBJECT(get_system_memory()),
+                             &error_fatal);
     qdev_prop_set_uint8(dev, "num_events", nevents);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 245af81bbb7..69c333e91b1 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -312,6 +312,9 @@ static void zynq_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
 
     dev = qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                             OBJECT(address_space_mem),
+                             &error_fatal);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  4);
     qdev_prop_set_uint8(dev, "num_events",  16);
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 944ba296b08..0cb46191c19 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -269,6 +269,9 @@ struct PL330State {
     uint8_t num_faulting;
     uint8_t periph_busy[PL330_PERIPH_NUM];
 
+    /* Memory region that DMA operation access */
+    MemoryRegion *mem_mr;
+    AddressSpace *mem_as;
 };
 
 #define TYPE_PL330 "pl330"
@@ -1108,7 +1111,7 @@ static inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)
     uint8_t opcode;
     int i;
 
-    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
+    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1);
     for (i = 0; insn_desc[i].size; i++) {
         if ((opcode & insn_desc[i].opmask) == insn_desc[i].opcode) {
             return &insn_desc[i];
@@ -1122,7 +1125,7 @@ static inline void pl330_exec_insn(PL330Chan *ch, const PL330InsnDesc *insn)
     uint8_t buf[PL330_INSN_MAXSIZE];
 
     assert(insn->size <= PL330_INSN_MAXSIZE);
-    dma_memory_read(&address_space_memory, ch->pc, buf, insn->size);
+    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size);
     insn->exec(ch, buf[0], &buf[1], insn->size - 1);
 }
 
@@ -1186,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
     if (q != NULL && q->len <= pl330_fifo_num_free(&s->fifo)) {
         int len = q->len - (q->addr & (q->len - 1));
 
-        dma_memory_read(&address_space_memory, q->addr, buf, len);
+        dma_memory_read(s->mem_as, q->addr, buf, len);
         trace_pl330_exec_cycle(q->addr, len);
         if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
             pl330_hexdump(buf, len);
@@ -1217,7 +1220,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
             fifo_res = pl330_fifo_get(&s->fifo, buf, len, q->tag);
         }
         if (fifo_res == PL330_FIFO_OK || q->z) {
-            dma_memory_write(&address_space_memory, q->addr, buf, len);
+            dma_memory_write(s->mem_as, q->addr, buf, len);
             trace_pl330_exec_cycle(q->addr, len);
             if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
                 pl330_hexdump(buf, len);
@@ -1562,6 +1565,18 @@ static void pl330_realize(DeviceState *dev, Error **errp)
                           "dma", PL330_IOMEM_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
+    if (!s->mem_mr) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    } else if (s->mem_mr == get_system_memory()) {
+        /* Avoid creating new AS for system memory. */
+        s->mem_as = &address_space_memory;
+    } else {
+        s->mem_as = g_new0(AddressSpace, 1);
+        address_space_init(s->mem_as, s->mem_mr,
+                           memory_region_name(s->mem_mr));
+    }
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, s);
 
     s->cfg[0] = (s->mgr_ns_at_rst ? 0x4 : 0) |
@@ -1656,6 +1671,9 @@ static Property pl330_properties[] = {
     DEFINE_PROP_UINT8("rd_q_dep", PL330State, rd_q_dep, 16),
     DEFINE_PROP_UINT16("data_buffer_dep", PL330State, data_buffer_dep, 256),
 
+    DEFINE_PROP_LINK("memory", PL330State, mem_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


