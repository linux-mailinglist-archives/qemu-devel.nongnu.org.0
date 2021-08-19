Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E893C3F1E1B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:38:58 +0200 (CEST)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl4E-0002Cf-1n
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl0D-0002sP-ES
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl0B-00063w-Dk
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUbBguyXCVYJjhJZ+w9myvvn9hfolADVgWzdBMV8UY0=;
 b=KWNfi7kioYTuFjci9olhb9aLIm7ytT2zkS9mhWXBmM3kaqIey7T1sjem5H7HHizwkL7qsi
 4brTMFTzcteDfJhFVIDy+Nbwt0FzqwYmptcIS2dC8WZrtNrEhV3tISWgLrQGINe9OlP7Uh
 TVwvCzDY5dO8cCS1jVXm5/2ICRkpNL4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-AGiR8G4JOBisG9rUcdHbZg-1; Thu, 19 Aug 2021 12:34:44 -0400
X-MC-Unique: AGiR8G4JOBisG9rUcdHbZg-1
Received: by mail-wr1-f71.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso1860476wrm.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UUbBguyXCVYJjhJZ+w9myvvn9hfolADVgWzdBMV8UY0=;
 b=IJDKYayIyDqAvF4tmj0ozkdfpZ0Xl87lsQSRnYVGjZIFrKMWxqnHpwZUehNdNOwcla
 h2aOdYiPP+aeUCfpThzGM7M3e4eu24ReICcKVU4MMEX2yvMdXoWzaySPvnp9btSFme6A
 aVBl+/JOc1ZJT7sNSLWWGTJVGs0zcvL0qcXrQJ2n/T5e+Y0davpW2EsN97F9iz189KvG
 MekTCT/HohYPVNqmnjtjGL/lTbNiTCXDiW/7TQw3wyAbDk/WvJYU4FoGTfYOplO51StU
 vPnem2m734YSJR2Bwjbyeb9nqPVkZGR128bKgWVjVtDEJUl4xfSyvQsDGX5rrBSLjy7+
 Ii+A==
X-Gm-Message-State: AOAM531E1Py+JDSIPsVAnV0Xh7DjsuFEwwd1P/Ty3zf560Zr6ziQuLX5
 xueto8qen5p7CslYZ/v8zsnkiBl5gTL0MQgDrLbFV+UqQ65HxO40xw4h0+Gx1Nys5tX8JqCT9vj
 LGEFOHAYPrKRCtutzEcPgeI46vf1FEdu2bExsRbTRrkO5JmZXvNaBgrXlN7bqA2/j
X-Received: by 2002:a5d:610d:: with SMTP id v13mr4999052wrt.199.1629390882979; 
 Thu, 19 Aug 2021 09:34:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmaEtnCEXhfyBtiG7sklsRZFxJHkJPBiuZL3RTfmR91Y7klbwLTOR6Lg0tS+Od/Q+PGWTGyg==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr4999028wrt.199.1629390882797; 
 Thu, 19 Aug 2021 09:34:42 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b20sm3035140wmj.48.2021.08.19.09.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/dma/xlnx-zdma Always expect 'dma' link property to
 be set
Date: Thu, 19 Aug 2021 18:34:22 +0200
Message-Id: <20210819163422.2863447-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify by always passing a MemoryRegion property to the device.
Doing so we can move the AddressSpace field to the device struct,
removing need for heap allocation.

Update the Xilinx ZynqMP / Versal SoC models to pass the default
system memory instead of a NULL value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
2.31.1


