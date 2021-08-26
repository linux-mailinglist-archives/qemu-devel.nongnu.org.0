Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB063F8DC4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:21:28 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJK0F-0003HY-8D
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmf-0003fJ-Kh
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJma-0000U5-95
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630001239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UeA6PdglE6wY86lrN/FXDAYFAzUV/D1nakMN0ezsWcU=;
 b=URO70r/oz9NFWCvZI7yehCFsCpIzomqCq+V6IZwKiw8Q+XxQePN3l0SicKZLLwBBs4bCxt
 mNSH3y832lTG45Ie6+A/IrH4zSsQp8Xv5awbRPD03zLj3MM/QfRhTv1ETD1pAr2Gl8Ae4f
 8hpk74C/j4SkMax+cmnL2lw6r3nEvwc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-1PFgw5OmNV-1B50kpSFqVg-1; Thu, 26 Aug 2021 14:07:17 -0400
X-MC-Unique: 1PFgw5OmNV-1B50kpSFqVg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so1113224wrv.14
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UeA6PdglE6wY86lrN/FXDAYFAzUV/D1nakMN0ezsWcU=;
 b=rkOftSD575SRBEBU5bW96bc/SGOqTMoSsMhBpNjLPSMeF/FpCYeKmbocLUt6wYiE5A
 YSqG/C8tVXK6B296zzivWgz9S1G2Hp9idfoZla+Rn8BwzJouTOKKsS9OhWaQX/Op7xko
 NQyaDejXWniH4yfQtkMX0OY0HwG5B0xwYH0S2F9dBmCI2uCgkrxkmOj7HtzyqkN5l5VT
 ZICOr42szl5vs38ZuU6nRsh9Pk5PtDGBpZXBhgQ/TguwSu9npI39/WkmfZ2dPpIZTUgH
 8ge2jNhfEAyiG96fkRJYERkfnTW49TXHMf6MU6vEiSkSwdAgGlpHQ3r4YgnYlckEOqkT
 WaGw==
X-Gm-Message-State: AOAM531tl68mQATGXaDAntO9ysVTPe89WxghaS6JGF16j6P9o3zunltE
 491MA8Z6Us0PH2ooFYMrzN7jK5UiuL29TucfNPCWZe2NtM8jhisW0bqjSmgEqq4xOsq1F/ys5DG
 bTjSF0qCTNAmUB3Io9T+jr0mSwJ25aDAYl55gKc9opQ/9SA0XNjlsZP3FRWnP39w1
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr15677124wmq.179.1630001235292; 
 Thu, 26 Aug 2021 11:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSxsgjIyMcNJd5fPc/HZB/XWUVuBQG7XfddONL8GXi0XIjhttYnAE2RVAb/qDMCHC/EkrgUA==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr15677070wmq.179.1630001234595; 
 Thu, 26 Aug 2021 11:07:14 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 i17sm2213101wrc.38.2021.08.26.11.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:07:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by
 booleans
Date: Thu, 26 Aug 2021 20:07:04 +0200
Message-Id: <20210826180704.2131949-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826180704.2131949-1-philmd@redhat.com>
References: <20210826180704.2131949-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.31.1


