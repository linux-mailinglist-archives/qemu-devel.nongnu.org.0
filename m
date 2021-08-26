Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1173F8CB2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:08:00 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIr9-00051g-6B
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-00052h-IY
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImY-0008Gu-O5
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id f10so2259470wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JxrPIrv+BafNnBdy7gYwocYvuCT9Z/KLIIcRd1zGVj0=;
 b=BVLpAxxJu4X4wE/BaHKlLeaJ1zhBTmhKNE79zOJ7FdqfEsd25Ao1QyDIMg2QM3qUfk
 /4euEbURTO/xaiIHWthTDED2QM3LR5h7+W3jId/zT8uO4CtRt6uN+JSf1b/LnnmOpTLx
 0CJ1QDey+8Q5h3uf8dlVlXdGKHizOQhf3/Mx4TBSVcZlzrafR6VzYcvLW043N8qpu9TK
 EhPtagCfgXFBPUWeN3K1kZyRk7oNUgjoeIVZoMC+c934cgfK4JkXyBQfFbKDqSRAyF0D
 yB/OmCJyMsc8hsZ7vijfx4kejA9fNu/d2XP1Oc6cqIZNGIVnl6NuZ9gEkczfDOd0tAlC
 yB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxrPIrv+BafNnBdy7gYwocYvuCT9Z/KLIIcRd1zGVj0=;
 b=Q11d6H63GlLoc5341l4JmXO7QNgRWVqsBnPWRy/oLCQE2jTrM8gSTy9rz5MRnme3QC
 WhS8/1oIe9pycLv+3h/N10NmESYSX3wbIofGrqweA3gMaDsXM6n7ttwCnXgzbiCnenBz
 vA+7i+9GKw5kzBaXrb8DGOTFBxOTaeu/FKFkVyFLfC56/WOy+LiDI8zigK1lGOFplN0I
 YaeD912CqLN5j7b64F7mIQJzsRvIXY8vrzm4gywFk+hdS8Zu3Or0LLvtJ1kdyJ/YO42+
 SVeLp33p5m8WKFui1YnAXTmiLkV8Yj87M/lF7b7KSpE0VxHPFKBpHUfWVRq8MlmRrj3+
 64Eg==
X-Gm-Message-State: AOAM531msxVQ/1T+/e6RMBDj3TYwmq3DhkoCMYgLTNxAObuFXzq3DrCu
 e8gjKs1F+cxh8qj7SChisk47DixeewoG1A==
X-Google-Smtp-Source: ABdhPJwToJNmwt2jFCACAdmI1Nvhw85EN/mPyav1ysaCe4Aj2AGUZ7+t+WO0xc/W58b5VJjjX6RWKQ==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr15118635wmq.58.1629997393297; 
 Thu, 26 Aug 2021 10:03:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/37] hw/dma/xlnx_csu_dma: Always expect 'dma' link property
 to be set
Date: Thu, 26 Aug 2021 18:02:33 +0100
Message-Id: <20210826170307.27733-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Update the Xilinx ZynqMP SoC model to pass the default system
memory instead of a NULL value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210819163422.2863447-4-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx_csu_dma.h |  2 +-
 hw/arm/xlnx-zynqmp.c          |  4 ++++
 hw/dma/xlnx_csu_dma.c         | 21 ++++++++++-----------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 204d94c6737..9e9dc551e99 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -30,7 +30,7 @@ typedef struct XlnxCSUDMA {
     MemoryRegion iomem;
     MemTxAttrs attr;
     MemoryRegion *dma_mr;
-    AddressSpace *dma_as;
+    AddressSpace dma_as;
     qemu_irq irq;
     StreamSink *tx_dev; /* Used as generic StreamSink */
     ptimer_state *src_timer;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9724978761b..4344e223f2d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -620,6 +620,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[adma_ch_intr[i]]);
     }
 
+    if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
+                                  OBJECT(system_memory), errp)) {
+        return;
+    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
         return;
     }
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 2d19f415ef3..896bb3574dd 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -201,11 +201,11 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf + i, mlen, false);
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, false);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, false);
     }
 
     if (result == MEMTX_OK) {
@@ -232,12 +232,12 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf, mlen, true);
             buf += mlen;
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, true);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, true);
     }
 
     if (result != MEMTX_OK) {
@@ -631,6 +631,12 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!s->dma_mr) {
+        error_setg(errp, TYPE_XLNX_CSU_DMA " 'dma' link not set");
+        return;
+    }
+    address_space_init(&s->dma_as, s->dma_mr, "csu-dma");
+
     reg_array =
         register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
                               XLNX_CSU_DMA_R_MAX,
@@ -648,13 +654,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
-
     s->attr = MEMTXATTRS_UNSPECIFIED;
 
     s->r_size_last_word = 0;
-- 
2.20.1


