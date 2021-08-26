Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64783F8CB9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:09:11 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIsI-0000Ka-Vj
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImf-00057Y-WB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImZ-0008Hc-HJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id f5so6089744wrm.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=edu7yXEsds87c0fEWhTabD3K7GBv5VOGHbQoii2mmig=;
 b=sJQSqGQZ7I/49k+6RELf551LQU9sIv3VWLg+Ud+A6P3iC9WSy7sBnO0n1SQ3lR9EDc
 ii3ZAGP7WHsz29bgQwPFtCk27faR9cjzyTtUFCqdC7uAlpwclglEi4qem8yQ4fNZdfUy
 br/9EJhpcGbcqmc1bUrMbAmgJ8TLfn/8YmzLLrztv+AvWnuEh5Ejkzeh8fNhDnR4zkmz
 pj0xKOCB6UWFNNZ1d7KR9QteW1FgasHK4gxiK4zInys4M5NodlifSeCJxOam7gVH+AtS
 GDlqrDo1UFSKwmiHSZWZpVQok2TWv144HYDItdfwpP+YR+PeUp678Hd6JecMXtbQX7MR
 NwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edu7yXEsds87c0fEWhTabD3K7GBv5VOGHbQoii2mmig=;
 b=cUeYVA5280wbI0kQuGWxAJfWuh51Q0epCf6gYA/I3qUti9w05z8Uxp3kXmiWhgEHX6
 vOnnT45rb2uO9SP288PBmyuQs9/+KP5Sjk8jdb2ugz6ZXo7eccfW4lUytrbdRnwxB/5d
 XW47ICrc0MXbzstsBud1YgeEUBwN7SxwehSnT4D+Gk+a/vPo4NftaY/kXAUSwPjv9tGH
 9OhH4YQdQc5QRJSrChou1gNfWU8nW2QI2RJXZYPFOkRRog823oepAwS93D4vqng3AcAN
 UBNysNaWlTUbZOBVJYyumeMkllUD8nUFhuzgnFL1KZaEuSp4QTmW6siJQpnu+WMwmH9+
 xXFg==
X-Gm-Message-State: AOAM532c/E8ebjAzOnbRH4NRyXk1A+zW9m+qvP9DrSv9Hl+1N919NN3o
 d5Dyzu8+s2DxvKboBnNVHvzqF98mc5hXIA==
X-Google-Smtp-Source: ABdhPJxRVDGxvKgy3WzZUEINtpNjfBbgj8M9lD9iMazUwRMWgnLcROVSu+goTMPupxjftwiVCHFgpg==
X-Received: by 2002:adf:fdd2:: with SMTP id i18mr5276492wrs.406.1629997394193; 
 Thu, 26 Aug 2021 10:03:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/37] hw/dma/xlnx-zdma Always expect 'dma' link property to be
 set
Date: Thu, 26 Aug 2021 18:02:34 +0100
Message-Id: <20210826170307.27733-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Simplify by always passing a MemoryRegion property to the device.
Doing so we can move the AddressSpace field to the device struct,
removing need for heap allocation.

Update the Xilinx ZynqMP / Versal SoC models to pass the default
system memory instead of a NULL value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210819163422.2863447-5-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx-zdma.h |  2 +-
 hw/arm/xlnx-versal.c       |  2 ++
 hw/arm/xlnx-zynqmp.c       |  8 ++++++++
 hw/dma/xlnx-zdma.c         | 24 ++++++++++++------------
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/hw/dma/xlnx-zdma.h b/include/hw/dma/xlnx-zdma.h
index 6602e7ffa72..efc75217d59 100644
--- a/include/hw/dma/xlnx-zdma.h
+++ b/include/hw/dma/xlnx-zdma.h
@@ -56,7 +56,7 @@ struct XlnxZDMA {
     MemoryRegion iomem;
     MemTxAttrs attr;
     MemoryRegion *dma_mr;
-    AddressSpace *dma_as;
+    AddressSpace dma_as;
     qemu_irq irq_zdma_ch_imr;
 
     struct {
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7e..d60eb4fb184 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -218,6 +218,8 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
                                 TYPE_XLNX_ZDMA);
         dev = DEVICE(&s->lpd.iou.adma[i]);
         object_property_set_int(OBJECT(dev), "bus-width", 128, &error_abort);
+        object_property_set_link(OBJECT(dev), "dma",
+                                 OBJECT(get_system_memory()), &error_fatal);
         sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
 
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4344e223f2d..6cfce26210d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -601,6 +601,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                                       errp)) {
             return;
         }
+        if (!object_property_set_link(OBJECT(&s->gdma[i]), "dma",
+                                      OBJECT(system_memory), errp)) {
+            return;
+        }
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->gdma[i]), errp)) {
             return;
         }
@@ -611,6 +615,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
+        if (!object_property_set_link(OBJECT(&s->adma[i]), "dma",
+                                      OBJECT(system_memory), errp)) {
+            return;
+        }
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->adma[i]), errp)) {
             return;
         }
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index fa38a556341..a5a92b4ff8c 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -320,9 +320,9 @@ static bool zdma_load_descriptor(XlnxZDMA *s, uint64_t addr,
         return false;
     }
 
-    descr->addr = address_space_ldq_le(s->dma_as, addr, s->attr, NULL);
-    descr->size = address_space_ldl_le(s->dma_as, addr + 8, s->attr, NULL);
-    descr->attr = address_space_ldl_le(s->dma_as, addr + 12, s->attr, NULL);
+    descr->addr = address_space_ldq_le(&s->dma_as, addr, s->attr, NULL);
+    descr->size = address_space_ldl_le(&s->dma_as, addr + 8, s->attr, NULL);
+    descr->attr = address_space_ldl_le(&s->dma_as, addr + 12, s->attr, NULL);
     return true;
 }
 
@@ -354,7 +354,7 @@ static void zdma_update_descr_addr(XlnxZDMA *s, bool type,
     } else {
         addr = zdma_get_regaddr64(s, basereg);
         addr += sizeof(s->dsc_dst);
-        next = address_space_ldq_le(s->dma_as, addr, s->attr, NULL);
+        next = address_space_ldq_le(&s->dma_as, addr, s->attr, NULL);
     }
 
     zdma_put_regaddr64(s, basereg, next);
@@ -421,7 +421,7 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
             }
         }
 
-        address_space_write(s->dma_as, s->dsc_dst.addr, s->attr, buf, dlen);
+        address_space_write(&s->dma_as, s->dsc_dst.addr, s->attr, buf, dlen);
         if (burst_type == AXI_BURST_INCR) {
             s->dsc_dst.addr += dlen;
         }
@@ -497,7 +497,7 @@ static void zdma_process_descr(XlnxZDMA *s)
                 len = s->cfg.bus_width / 8;
             }
         } else {
-            address_space_read(s->dma_as, src_addr, s->attr, s->buf, len);
+            address_space_read(&s->dma_as, src_addr, s->attr, s->buf, len);
             if (burst_type == AXI_BURST_INCR) {
                 src_addr += len;
             }
@@ -765,6 +765,12 @@ static void zdma_realize(DeviceState *dev, Error **errp)
     XlnxZDMA *s = XLNX_ZDMA(dev);
     unsigned int i;
 
+    if (!s->dma_mr) {
+        error_setg(errp, TYPE_XLNX_ZDMA " 'dma' link not set");
+        return;
+    }
+    address_space_init(&s->dma_as, s->dma_mr, "zdma-dma");
+
     for (i = 0; i < ARRAY_SIZE(zdma_regs_info); ++i) {
         RegisterInfo *r = &s->regs_info[zdma_regs_info[i].addr / 4];
 
@@ -777,12 +783,6 @@ static void zdma_realize(DeviceState *dev, Error **errp)
         };
     }
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
     s->attr = MEMTXATTRS_UNSPECIFIED;
 }
 
-- 
2.20.1


