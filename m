Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C695A2FB45E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:41:36 +0100 (CET)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mZz-00058q-SJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVY-0008Il-9e
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:00 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:56298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVW-0003Uf-Nh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:00 -0500
Received: by mail-wm1-f44.google.com with SMTP id c124so15681756wma.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=glVtI5cyV9govITmJ39bqSL+NJwToQB6R6WAWUrnoKU=;
 b=O/4SKCx6oISAQU5AIioQSoLyrRjhCCFUv7oycTMKq4hYxulr7NxnSOVxq/dD7+8ezG
 7+XcoqF5BMj3W0FuR08Vi8gP8m/6eqZQQrI0SvDiOdn+XhA/JKZb2GHstHyvxnKNkw/m
 M3LqgfaTz1yePnGM1r7q6NW8JUPZ24mFwpdyOh4mSXp/hyIIy596O+eEVi4o0t+SUuj1
 XZmIQ5EmiEGS/0Q+SFRov3e1eIsrHLPeMQIoMpfk+2b0E+qA/Q/+i7/5EUymx/DzrpOu
 xri69q1BFaTMoesaOxu71w7Yfwis1uJcZ7XdHTgXUNhIF4ruk5j1bJlV/2nvt6c5umRt
 TA/g==
X-Gm-Message-State: AOAM530M8C0u2NTR19f1klvzqfkKO/4DvtTCO5V1wxR75MFHX1xBx4n4
 3saMmLfWXTy9+zSPsqrcGoMIe3VSuJs=
X-Google-Smtp-Source: ABdhPJyQgd4aRnxoXwQ58uQU/d+BKsH7Er3s7qgYivE73+2k/chrm2XPMAGHzlqwm/YivS0eNGeZFw==
X-Received: by 2002:a05:600c:210b:: with SMTP id
 u11mr3033958wml.16.1611045417368; 
 Tue, 19 Jan 2021 00:36:57 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:57 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/11] hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC
 device
Date: Tue, 19 Jan 2021 09:36:13 +0100
Message-Id: <20210119083617.6337-8-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.44; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

Make the next_irq function be GPIO inputs to the NEXT_PC
device, rather than a freestanding set of qemu_irq lines.

This fixes a minor Coverity issue where it correctly points
out the trivial memory leak of the memory allocated in the
call to qemu_allocate_irqs().

Fixes: CID 1421962
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-8-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c         | 21 ++++-----------------
 include/hw/m68k/next-cube.h |  3 ++-
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 9b9b051231..7dcd39aab9 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -735,10 +735,6 @@ static const MemoryRegionOps dma_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/*
- * TODO: set the shift numbers as values in the enum, so the first switch
- * will not be needed
- */
 static void next_irq(void *opaque, int number, int level)
 {
     NeXTPC *s = NEXT_PC(opaque);
@@ -839,19 +835,8 @@ static void next_irq(void *opaque, int number, int level)
     }
 }
 
-static void next_serial_irq(void *opaque, int n, int level)
-{
-    /* DPRINTF("SCC IRQ NUM %i\n",n); */
-    if (n) {
-        next_irq(opaque, NEXT_SCC_DMA_I, level);
-    } else {
-        next_irq(opaque, NEXT_SCC_I, level);
-    }
-}
-
 static void next_escc_init(DeviceState *pcdev)
 {
-    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, pcdev, 2);
     DeviceState *dev;
     SysBusDevice *s;
 
@@ -867,8 +852,8 @@ static void next_escc_init(DeviceState *pcdev)
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_connect_irq(s, 0, ser_irq[0]);
-    sysbus_connect_irq(s, 1,  ser_irq[1]);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(pcdev, NEXT_SCC_I));
+    sysbus_connect_irq(s, 1, qdev_get_gpio_in(pcdev, NEXT_SCC_DMA_I));
     sysbus_mmio_map(s, 0, 0x2118000);
 }
 
@@ -887,6 +872,8 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
     NeXTPC *s = NEXT_PC(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
+    qdev_init_gpio_in(dev, next_irq, NEXT_NUM_IRQS);
+
     memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
                           "next.mmio", 0xD0000);
     memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,
diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index 5a56c354b8..d38c52d540 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -39,7 +39,8 @@ enum next_irqs {
     NEXT_ENRX_DMA_I,
     NEXT_SCSI_DMA_I,
     NEXT_SCC_DMA_I,
-    NEXT_SND_I
+    NEXT_SND_I,
+    NEXT_NUM_IRQS
 };
 
 #endif /* NEXT_CUBE_H */
-- 
2.29.2


