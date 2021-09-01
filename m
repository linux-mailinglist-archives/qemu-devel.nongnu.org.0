Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9DF3FD7F3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:45:44 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNkV-0004HM-As
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcA-0006pZ-Kv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc4-0005cp-Ko
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1563926wmi.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hrL7wY7FeSozFPbmJ1hgaWugx0ZzntiXknL52DAZLEI=;
 b=UGQHxkBimLl+WaYrpOfJ+i3UkzChwU6rCuaAsO63sINIMh9DrIn/PiVxh/OyBr28uY
 f1Uvy4hWT4C57k3m7yh1CCtZ3TlilDtjGms/22xcPmkM0bsjkwD6rvkhOVQCqi1zv5dP
 wtyfPJp/4NFyOemtGWyuVWf8+wk6TCWlGT3SxZMYgPNmBYTRxnYZAB5IEdq3AkV2fV86
 y+4yrubxlkx/NkegSizNyqwgerMGix0VA6C1M8eD4i7qY48ded/Jqm91kCC8jWMf8d5b
 M6P2HwG6LwVg3X9+qb+AU/li6x9yBCGBpwUz3pn5Xdx3IlBEmfvlD04/wX6Z+OINISFw
 2pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrL7wY7FeSozFPbmJ1hgaWugx0ZzntiXknL52DAZLEI=;
 b=a0Q624rekHJUOtfvQxYjzjL1V1dfM/5b0Fuyn8uVMLjwH/lx2a4ECC/AJPdqXHOsHK
 i5VIR9SVJZI3q6ixqM9ojhucZSwy9y5idDzw9F2/DibPvhMRu/6h6RzilHCJoaW727pM
 TDM4ROar/1ix0Xayi+0g4sRSpBWyt+1wJUi+iy5W82Ub82+/VFG7U/P9HxnGc4WNVmWB
 hi4PC14WT/XSeqxaWyUatnfMyeiLyEvMJ8NI4CIK2Xz5kgvGg742VbHxZwPO4UdC846o
 WUlw1yMYIylN6vN5YiPzf16kuWiG2OCDLMM5hcJTsm96AcSV3EFA6BAxmMX5ayvejvW9
 5Bxg==
X-Gm-Message-State: AOAM531ziwzZKH0WgdPOUchoLEAPhLhntcn6eDfgdsrCb6BELZcO1scl
 h2o2QeXal+s+qgsIspgZbymAz4x4yyFIdA==
X-Google-Smtp-Source: ABdhPJz9WppEH/auTLlrGUz6j6/7CCs/sgdFw/02jpa6XkEHfwlLxoghNNlamyu03uZePoA9WE7EVA==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr9116196wmh.2.1630492619070;
 Wed, 01 Sep 2021 03:36:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.36.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:36:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/51] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by
 booleans
Date: Wed,  1 Sep 2021 11:36:06 +0100
Message-Id: <20210901103653.13435-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Quoting Peter Maydell:

  These MEMTX_* aren't from the memory transaction API functions;
  they're just being used by gicd_readl() and friends as a way to
  indicate a success/failure so that the actual MemoryRegionOps
  read/write fns like gicv3_dist_read() can log a guest error.
  Arguably this is a bit of a misuse of the MEMTX_* constants and
  perhaps we should have gicd_readl etc return a bool instead.

Follow his suggestion and replace the MEMTX_* constants by
boolean values, simplifying a bit the gicv3_dist_read() /
gicv3_dist_write() handlers.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210826180704.2131949-3-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 201 +++++++++++++++++++++------------------
 1 file changed, 106 insertions(+), 95 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 7e9b393d9ab..5beb7c4235a 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -262,8 +262,21 @@ static void gicd_write_irouter(GICv3State *s, MemTxAttrs attrs, int irq,
     gicv3_update(s, irq, 1);
 }
 
-static MemTxResult gicd_readb(GICv3State *s, hwaddr offset,
-                              uint64_t *data, MemTxAttrs attrs)
+/**
+ * gicd_readb
+ * gicd_readw
+ * gicd_readl
+ * gicd_readq
+ * gicd_writeb
+ * gicd_writew
+ * gicd_writel
+ * gicd_writeq
+ *
+ * Return %true if the operation succeeded, %false otherwise.
+ */
+
+static bool gicd_readb(GICv3State *s, hwaddr offset,
+                       uint64_t *data, MemTxAttrs attrs)
 {
     /* Most GICv3 distributor registers do not support byte accesses. */
     switch (offset) {
@@ -273,17 +286,17 @@ static MemTxResult gicd_readb(GICv3State *s, hwaddr offset,
         /* This GIC implementation always has affinity routing enabled,
          * so these registers are all RAZ/WI.
          */
-        return MEMTX_OK;
+        return true;
     case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
         *data = gicd_read_ipriorityr(s, attrs, offset - GICD_IPRIORITYR);
-        return MEMTX_OK;
+        return true;
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
-static MemTxResult gicd_writeb(GICv3State *s, hwaddr offset,
-                               uint64_t value, MemTxAttrs attrs)
+static bool gicd_writeb(GICv3State *s, hwaddr offset,
+                        uint64_t value, MemTxAttrs attrs)
 {
     /* Most GICv3 distributor registers do not support byte accesses. */
     switch (offset) {
@@ -293,25 +306,25 @@ static MemTxResult gicd_writeb(GICv3State *s, hwaddr offset,
         /* This GIC implementation always has affinity routing enabled,
          * so these registers are all RAZ/WI.
          */
-        return MEMTX_OK;
+        return true;
     case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
     {
         int irq = offset - GICD_IPRIORITYR;
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
         gicd_write_ipriorityr(s, attrs, irq, value);
         gicv3_update(s, irq, 1);
-        return MEMTX_OK;
+        return true;
     }
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
-static MemTxResult gicd_readw(GICv3State *s, hwaddr offset,
-                              uint64_t *data, MemTxAttrs attrs)
+static bool gicd_readw(GICv3State *s, hwaddr offset,
+                       uint64_t *data, MemTxAttrs attrs)
 {
     /* Only GICD_SETSPI_NSR, GICD_CLRSPI_NSR, GICD_SETSPI_SR and GICD_SETSPI_NSR
      * support 16 bit accesses, and those registers are all part of the
@@ -319,11 +332,11 @@ static MemTxResult gicd_readw(GICv3State *s, hwaddr offset,
      * implement (ie for us GICD_TYPER.MBIS == 0), so for us they are
      * reserved.
      */
-    return MEMTX_ERROR;
+    return false;
 }
 
-static MemTxResult gicd_writew(GICv3State *s, hwaddr offset,
-                               uint64_t value, MemTxAttrs attrs)
+static bool gicd_writew(GICv3State *s, hwaddr offset,
+                        uint64_t value, MemTxAttrs attrs)
 {
     /* Only GICD_SETSPI_NSR, GICD_CLRSPI_NSR, GICD_SETSPI_SR and GICD_SETSPI_NSR
      * support 16 bit accesses, and those registers are all part of the
@@ -331,11 +344,11 @@ static MemTxResult gicd_writew(GICv3State *s, hwaddr offset,
      * implement (ie for us GICD_TYPER.MBIS == 0), so for us they are
      * reserved.
      */
-    return MEMTX_ERROR;
+    return false;
 }
 
-static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
-                              uint64_t *data, MemTxAttrs attrs)
+static bool gicd_readl(GICv3State *s, hwaddr offset,
+                       uint64_t *data, MemTxAttrs attrs)
 {
     /* Almost all GICv3 distributor registers are 32-bit.
      * Note that WO registers must return an UNKNOWN value on reads,
@@ -363,7 +376,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         } else {
             *data = s->gicd_ctlr;
         }
-        return MEMTX_OK;
+        return true;
     case GICD_TYPER:
     {
         /* For this implementation:
@@ -387,61 +400,61 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
             (0xf << 19) | itlinesnumber;
-        return MEMTX_OK;
+        return true;
     }
     case GICD_IIDR:
         /* We claim to be an ARM r0p0 with a zero ProductID.
          * This is the same as an r0p0 GIC-500.
          */
         *data = gicv3_iidr();
-        return MEMTX_OK;
+        return true;
     case GICD_STATUSR:
         /* RAZ/WI for us (this is an optional register and our implementation
          * does not track RO/WO/reserved violations to report them to the guest)
          */
         *data = 0;
-        return MEMTX_OK;
+        return true;
     case GICD_IGROUPR ... GICD_IGROUPR + 0x7f:
     {
         int irq;
 
         if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
         /* RAZ/WI for SGIs, PPIs, unimplemented irqs */
         irq = (offset - GICD_IGROUPR) * 8;
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
         *data = *gic_bmp_ptr32(s->group, irq);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_ISENABLER ... GICD_ISENABLER + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->enabled, NULL,
                                      offset - GICD_ISENABLER);
-        return MEMTX_OK;
+        return true;
     case GICD_ICENABLER ... GICD_ICENABLER + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->enabled, NULL,
                                      offset - GICD_ICENABLER);
-        return MEMTX_OK;
+        return true;
     case GICD_ISPENDR ... GICD_ISPENDR + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->pending, mask_nsacr_ge1,
                                      offset - GICD_ISPENDR);
-        return MEMTX_OK;
+        return true;
     case GICD_ICPENDR ... GICD_ICPENDR + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->pending, mask_nsacr_ge2,
                                      offset - GICD_ICPENDR);
-        return MEMTX_OK;
+        return true;
     case GICD_ISACTIVER ... GICD_ISACTIVER + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->active, mask_nsacr_ge2,
                                      offset - GICD_ISACTIVER);
-        return MEMTX_OK;
+        return true;
     case GICD_ICACTIVER ... GICD_ICACTIVER + 0x7f:
         *data = gicd_read_bitmap_reg(s, attrs, s->active, mask_nsacr_ge2,
                                      offset - GICD_ICACTIVER);
-        return MEMTX_OK;
+        return true;
     case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
     {
         int i, irq = offset - GICD_IPRIORITYR;
@@ -452,12 +465,12 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
             value |= gicd_read_ipriorityr(s, attrs, i);
         }
         *data = value;
-        return MEMTX_OK;
+        return true;
     }
     case GICD_ITARGETSR ... GICD_ITARGETSR + 0x3ff:
         /* RAZ/WI since affinity routing is always enabled */
         *data = 0;
-        return MEMTX_OK;
+        return true;
     case GICD_ICFGR ... GICD_ICFGR + 0xff:
     {
         /* Here only the even bits are used; odd bits are RES0 */
@@ -466,7 +479,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
 
         /* Since our edge_trigger bitmap is one bit per irq, we only need
@@ -478,7 +491,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         value = extract32(value, (irq & 0x1f) ? 16 : 0, 16);
         value = half_shuffle32(value) << 1;
         *data = value;
-        return MEMTX_OK;
+        return true;
     }
     case GICD_IGRPMODR ... GICD_IGRPMODR + 0xff:
     {
@@ -489,16 +502,16 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
              * security enabled and this is an NS access
              */
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
         /* RAZ/WI for SGIs, PPIs, unimplemented irqs */
         irq = (offset - GICD_IGRPMODR) * 8;
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
         *data = *gic_bmp_ptr32(s->grpmod, irq);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_NSACR ... GICD_NSACR + 0xff:
     {
@@ -507,7 +520,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
 
         if ((s->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
@@ -515,17 +528,17 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
              * security enabled and this is an NS access
              */
             *data = 0;
-            return MEMTX_OK;
+            return true;
         }
 
         *data = s->gicd_nsacr[irq / 16];
-        return MEMTX_OK;
+        return true;
     }
     case GICD_CPENDSGIR ... GICD_CPENDSGIR + 0xf:
     case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
         /* RAZ/WI since affinity routing is always enabled */
         *data = 0;
-        return MEMTX_OK;
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
@@ -537,26 +550,26 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         } else {
             *data = (uint32_t)r;
         }
-        return MEMTX_OK;
+        return true;
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
         *data = gicv3_idreg(offset - GICD_IDREGS);
-        return MEMTX_OK;
+        return true;
     case GICD_SGIR:
         /* WO registers, return unknown value */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read from WO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
         *data = 0;
-        return MEMTX_OK;
+        return true;
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
-static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
-                               uint64_t value, MemTxAttrs attrs)
+static bool gicd_writel(GICv3State *s, hwaddr offset,
+                        uint64_t value, MemTxAttrs attrs)
 {
     /* Almost all GICv3 distributor registers are 32-bit. Note that
      * RO registers must ignore writes, not abort.
@@ -600,68 +613,68 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
             s->gicd_ctlr &= ~(GICD_CTLR_EN_GRP1S | GICD_CTLR_ARE_NS);
         }
         gicv3_full_update(s);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_STATUSR:
         /* RAZ/WI for our implementation */
-        return MEMTX_OK;
+        return true;
     case GICD_IGROUPR ... GICD_IGROUPR + 0x7f:
     {
         int irq;
 
         if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
-            return MEMTX_OK;
+            return true;
         }
         /* RAZ/WI for SGIs, PPIs, unimplemented irqs */
         irq = (offset - GICD_IGROUPR) * 8;
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
         *gic_bmp_ptr32(s->group, irq) = value;
         gicv3_update(s, irq, 32);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_ISENABLER ... GICD_ISENABLER + 0x7f:
         gicd_write_set_bitmap_reg(s, attrs, s->enabled, NULL,
                                   offset - GICD_ISENABLER, value);
-        return MEMTX_OK;
+        return true;
     case GICD_ICENABLER ... GICD_ICENABLER + 0x7f:
         gicd_write_clear_bitmap_reg(s, attrs, s->enabled, NULL,
                                     offset - GICD_ICENABLER, value);
-        return MEMTX_OK;
+        return true;
     case GICD_ISPENDR ... GICD_ISPENDR + 0x7f:
         gicd_write_set_bitmap_reg(s, attrs, s->pending, mask_nsacr_ge1,
                                   offset - GICD_ISPENDR, value);
-        return MEMTX_OK;
+        return true;
     case GICD_ICPENDR ... GICD_ICPENDR + 0x7f:
         gicd_write_clear_bitmap_reg(s, attrs, s->pending, mask_nsacr_ge2,
                                     offset - GICD_ICPENDR, value);
-        return MEMTX_OK;
+        return true;
     case GICD_ISACTIVER ... GICD_ISACTIVER + 0x7f:
         gicd_write_set_bitmap_reg(s, attrs, s->active, NULL,
                                   offset - GICD_ISACTIVER, value);
-        return MEMTX_OK;
+        return true;
     case GICD_ICACTIVER ... GICD_ICACTIVER + 0x7f:
         gicd_write_clear_bitmap_reg(s, attrs, s->active, NULL,
                                     offset - GICD_ICACTIVER, value);
-        return MEMTX_OK;
+        return true;
     case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
     {
         int i, irq = offset - GICD_IPRIORITYR;
 
         if (irq < GIC_INTERNAL || irq + 3 >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
 
         for (i = irq; i < irq + 4; i++, value >>= 8) {
             gicd_write_ipriorityr(s, attrs, i, value);
         }
         gicv3_update(s, irq, 4);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_ITARGETSR ... GICD_ITARGETSR + 0x3ff:
         /* RAZ/WI since affinity routing is always enabled */
-        return MEMTX_OK;
+        return true;
     case GICD_ICFGR ... GICD_ICFGR + 0xff:
     {
         /* Here only the odd bits are used; even bits are RES0 */
@@ -669,7 +682,7 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
         uint32_t mask, oldval;
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
 
         /* Since our edge_trigger bitmap is one bit per irq, our input
@@ -687,7 +700,7 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
         oldval = *gic_bmp_ptr32(s->edge_trigger, (irq & ~0x1f));
         value = (oldval & ~mask) | (value & mask);
         *gic_bmp_ptr32(s->edge_trigger, irq & ~0x1f) = value;
-        return MEMTX_OK;
+        return true;
     }
     case GICD_IGRPMODR ... GICD_IGRPMODR + 0xff:
     {
@@ -697,16 +710,16 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
             /* RAZ/WI if security disabled, or if
              * security enabled and this is an NS access
              */
-            return MEMTX_OK;
+            return true;
         }
         /* RAZ/WI for SGIs, PPIs, unimplemented irqs */
         irq = (offset - GICD_IGRPMODR) * 8;
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
         *gic_bmp_ptr32(s->grpmod, irq) = value;
         gicv3_update(s, irq, 32);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_NSACR ... GICD_NSACR + 0xff:
     {
@@ -714,41 +727,41 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
         int irq = (offset - GICD_NSACR) * 4;
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
 
         if ((s->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
             /* RAZ/WI if security disabled, or if
              * security enabled and this is an NS access
              */
-            return MEMTX_OK;
+            return true;
         }
 
         s->gicd_nsacr[irq / 16] = value;
         /* No update required as this only affects access permission checks */
-        return MEMTX_OK;
+        return true;
     }
     case GICD_SGIR:
         /* RES0 if affinity routing is enabled */
-        return MEMTX_OK;
+        return true;
     case GICD_CPENDSGIR ... GICD_CPENDSGIR + 0xf:
     case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
         /* RAZ/WI since affinity routing is always enabled */
-        return MEMTX_OK;
+        return true;
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
     {
         uint64_t r;
         int irq = (offset - GICD_IROUTER) / 8;
 
         if (irq < GIC_INTERNAL || irq >= s->num_irq) {
-            return MEMTX_OK;
+            return true;
         }
 
         /* Write half of the 64-bit register */
         r = gicd_read_irouter(s, attrs, irq);
         r = deposit64(r, (offset & 7) ? 32 : 0, 32, value);
         gicd_write_irouter(s, attrs, irq, r);
-        return MEMTX_OK;
+        return true;
     }
     case GICD_IDREGS ... GICD_IDREGS + 0x2f:
     case GICD_TYPER:
@@ -757,14 +770,14 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
-        return MEMTX_OK;
+        return true;
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
-static MemTxResult gicd_writeq(GICv3State *s, hwaddr offset,
-                               uint64_t value, MemTxAttrs attrs)
+static bool gicd_writeq(GICv3State *s, hwaddr offset,
+                        uint64_t value, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -773,14 +786,14 @@ static MemTxResult gicd_writeq(GICv3State *s, hwaddr offset,
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
         irq = (offset - GICD_IROUTER) / 8;
         gicd_write_irouter(s, attrs, irq, value);
-        return MEMTX_OK;
+        return true;
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
-static MemTxResult gicd_readq(GICv3State *s, hwaddr offset,
-                              uint64_t *data, MemTxAttrs attrs)
+static bool gicd_readq(GICv3State *s, hwaddr offset,
+                       uint64_t *data, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -789,9 +802,9 @@ static MemTxResult gicd_readq(GICv3State *s, hwaddr offset,
     case GICD_IROUTER ... GICD_IROUTER + 0x1fdf:
         irq = (offset - GICD_IROUTER) / 8;
         *data = gicd_read_irouter(s, attrs, irq);
-        return MEMTX_OK;
+        return true;
     default:
-        return MEMTX_ERROR;
+        return false;
     }
 }
 
@@ -799,7 +812,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
                             unsigned size, MemTxAttrs attrs)
 {
     GICv3State *s = (GICv3State *)opaque;
-    MemTxResult r;
+    bool r;
 
     switch (size) {
     case 1:
@@ -815,11 +828,11 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
         r = gicd_readq(s, offset, data, attrs);
         break;
     default:
-        r = MEMTX_ERROR;
+        r = false;
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
@@ -829,19 +842,18 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
          * trigger the guest-error logging but don't return it to
          * the caller, or we'll cause a spurious guest data abort.
          */
-        r = MEMTX_OK;
         *data = 0;
     } else {
         trace_gicv3_dist_read(offset, *data, size, attrs.secure);
     }
-    return r;
+    return MEMTX_OK;
 }
 
 MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size, MemTxAttrs attrs)
 {
     GICv3State *s = (GICv3State *)opaque;
-    MemTxResult r;
+    bool r;
 
     switch (size) {
     case 1:
@@ -857,11 +869,11 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
         r = gicd_writeq(s, offset, data, attrs);
         break;
     default:
-        r = MEMTX_ERROR;
+        r = false;
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
@@ -871,11 +883,10 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
          * trigger the guest-error logging but don't return it to
          * the caller, or we'll cause a spurious guest data abort.
          */
-        r = MEMTX_OK;
     } else {
         trace_gicv3_dist_write(offset, data, size, attrs.secure);
     }
-    return r;
+    return MEMTX_OK;
 }
 
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level)
-- 
2.20.1


