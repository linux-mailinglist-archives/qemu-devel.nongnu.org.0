Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AC92F8675
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:17:24 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VX9-0002JP-EA
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSG-0005uj-2X
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSE-0008If-B1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id v184so4429093wma.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5z3pjzGRytH16qZkplw8pjDFH2MUg1wej/HifHKVc/k=;
 b=YsDn/oMyFDnaqA3IJQXcIukFZgZu1cC9UKzzR/IimgpwC7mDv3B6Tn2mh0QcYUpZaU
 aNZX6y2QksPBh7Abzuc1TvuzWYVF2lc3J0ovojG8mj9LOeq+KW5CItAAdQQWoLyKZ2Ls
 Q3xUZlbjiqCqXWV60TiSMJu+xOaDtGJQ3ISmvvqKnTqA/K7O6ZS+mlMYOQ44QhpGliqx
 AE2wHEwHbgkMA+174psm2Nbdfvh1Ki1exMCFLql4pNVbMPppy1SGhZ6qJmpNbg3kai9W
 TxPIezjvMotqhZGEof9JVt5jHf0e0xKe7c/DHaPsvCdQxWoXFsMOpjC7AqnO71isXB11
 +IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5z3pjzGRytH16qZkplw8pjDFH2MUg1wej/HifHKVc/k=;
 b=RqOBSVIdhWdkTSDvRb5gVZnr3ohKuF95Vm1yWjdXruqLpFlcPYbKlhtStZ4+uB2h56
 7Ja2kxdUghEbjhQGHrEXXcf7W4Kf55Gev/0bdlhwmuobPLowshZ6vzmKKTnzukkdHedc
 Zcj/ke5Yr/75NpiNistm2HhPXNKj/+MEWBg/Sv0+2/FM2xBQhAP9+8idH5yxghYmRl++
 y2+IfbYqCabHHotxMfJZxNEIgLTdl+bjF4fRbUDVJP6+3cG9cRiWHAKv9oAKKkcRcTGH
 fiZp4DSuHVTLaXl9+5i20DNGFeGOO4AnhjGk5K/AmjLSsUqJ9nS8g8oSGPHOU3+fLDxS
 v6dQ==
X-Gm-Message-State: AOAM533w/7a7YcOY7Dot4VLTOXVRvp85uiIYVZf3ozKZXTrbmFAJGWtR
 F6nCi+CFjbt7Hu7ql5JAze0k0j5+ywNaSA==
X-Google-Smtp-Source: ABdhPJywhHhOSk/78/KXTBOVpTFY7TlZHKzMdN3NAbtmHfs3lVgpjKtBBoFfRI0Cl0jaQSIm8QdFrA==
X-Received: by 2002:a05:600c:21c7:: with SMTP id
 x7mr10108768wmj.75.1610741536803; 
 Fri, 15 Jan 2021 12:12:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC
 device
Date: Fri, 15 Jan 2021 20:12:02 +0000
Message-Id: <20210115201206.17347-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the next_irq function be GPIO inputs to the NEXT_PC
device, rather than a freestanding set of qemu_irq lines.

This fixes a minor Coverity issue where it correctly points
out the trivial memory leak of the memory allocated in the
call to qemu_allocate_irqs().

Fixes: CID 1421962
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/m68k/next-cube.h |  3 ++-
 hw/m68k/next-cube.c         | 21 ++++-----------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index 5a56c354b8e..d38c52d540d 100644
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
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 6b4bcfd4b9b..5a8fc24ed35 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -734,10 +734,6 @@ static const MemoryRegionOps dma_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/*
- * TODO: set the shift numbers as values in the enum, so the first switch
- * will not be needed
- */
 static void next_irq(void *opaque, int number, int level)
 {
     NeXTPC *s = NEXT_PC(opaque);
@@ -838,19 +834,8 @@ static void next_irq(void *opaque, int number, int level)
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
 
@@ -866,8 +851,8 @@ static void next_escc_init(DeviceState *pcdev)
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_connect_irq(s, 0, ser_irq[0]);
-    sysbus_connect_irq(s, 1,  ser_irq[1]);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(pcdev, NEXT_SCC_I));
+    sysbus_connect_irq(s, 1, qdev_get_gpio_in(pcdev, NEXT_SCC_DMA_I));
     sysbus_mmio_map(s, 0, 0x2118000);
 }
 
@@ -886,6 +871,8 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
     NeXTPC *s = NEXT_PC(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
+    qdev_init_gpio_in(dev, next_irq, NEXT_NUM_IRQS);
+
     memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
                           "next.mmio", 0xD0000);
     memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,
-- 
2.20.1


