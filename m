Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B24FE652
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 18:51:42 +0200 (CEST)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neJju-0003IG-7r
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 12:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neJho-0002O7-7f
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 12:49:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neJhm-0001Cf-Cd
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 12:49:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id p189so12302858wmp.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNZ/7Qi+rVOYiIDJ+luyeaIUoXcx0R3SL5ihlB2/PDs=;
 b=KLEwF6jj9JQX0KLMexm+qv2IES/iCwCZcDuroo4nYn1GpinXwbWdRr6cp569IEpOO6
 SgKt5Uqlm3PRWW4OzLZ/xDk+4flp9RYgREr+x+7MXYg1aYijhCZ244MxUGsWAb+fhE3H
 2FYeZwfSAAZV2nkIPiUPygPJZj1SLFUAHN5GIM7US1fEGpDFLfJOtp6AZ4L5b2ZWlTyJ
 XYrEu9ISq6SAKtWjhx78YmnlE7JAZDpWlj1o7t29hbZTkS9GB8gGliQwxtr1sw17/mWS
 NPIsW42RSCIRv2VU2RTzq4flA3F38bfV3XcTQ76rV+r1Miey/NQYeKikEs4PehmQQccU
 tuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNZ/7Qi+rVOYiIDJ+luyeaIUoXcx0R3SL5ihlB2/PDs=;
 b=MBoXISvtYCRpCjgvmK5Spql+GbgWE8MRgJpP0W7k9s4ieMTEgHSjo8Gz/Wz5XW+R2E
 DcdDcm2rjUxoa3270Es9uQalBlpyzGZaiSwzI3QY1/myGCUnepUjeF+Ly7JkG+xVq6T0
 erUimTIchTsVkNprQjBWgpc7f30HxvkxteQKL0u5fT0uM91DBj2RR/gFgTSHZsbmr8KE
 2FQfznuDrmV2PZDNHyjJFXWdPqWjeZybfJ+R8WJEB8eQQ3KkznMrCfAS1g4dgRIVNbp4
 kV8/sBj2HDfs/VtJ2TAf6q5E57TJmpBvGwORyfUFZcDSxZbtNKCzr+jokzFZTV5mraXp
 4RHw==
X-Gm-Message-State: AOAM532uAqm4vX864iWV8D8a+iCE/qHYwEiK9KoxBcK7ZHWA2auBMqoY
 mXH6RY3m5J2WKafUHyd+Z21aUGqpy7NOlA==
X-Google-Smtp-Source: ABdhPJztndgYNyWTASYHpTIbsjPW8zSA55WgWyhMBl2Do+dHzIomk6aeFSuGm7NDxcjoGEgHrDQg1g==
X-Received: by 2002:a7b:c0cb:0:b0:38e:bac7:3c40 with SMTP id
 s11-20020a7bc0cb000000b0038ebac73c40mr5099506wmh.6.1649782164458; 
 Tue, 12 Apr 2022 09:49:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a5d65c3000000b00207a63b9d3esm6108746wrw.105.2022.04.12.09.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:49:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
Date: Tue, 12 Apr 2022 17:49:21 +0100
Message-Id: <20220412164921.1685453-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
don't support DMA.  The core floppy controller code expects this to
be indicated by setting FDCtrl::dma_chann to -1.  This used to be
done in the device instance_init functions sysbus_fdc_initfn() and
sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
and accidentally lost the setting of dma_chann.

For sysbus-fdc this has no ill effects because we were redundantly
also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
this means that guests which try to enable DMA on the floppy
controller will cause QEMU to crash because FDCtrl::dma is NULL.

Set dma_chann to -1 in the common instance init, and remove the
redundant code in fdctrl_init_sysbus() that is also setting it.

There is a six-year-old FIXME comment in the jazz board code to the
effect that in theory it should support doing DMA via a custom DMA
controller.  If anybody ever chooses to fix that they can do it by
adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
(A QOM link property 'dma-controller' on the sysbus device which can
be set to an instance of IsaDmaClass is probably the way to go.)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/block/fdc.h |  3 +--
 hw/block/fdc-sysbus.c  | 14 +++++++++++---
 hw/mips/jazz.c         |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 1ecca7cac7f..35248c08379 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -10,8 +10,7 @@
 #define TYPE_ISA_FDC "isa-fdc"
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds);
+void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds);
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc);
 
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 57fc8773f12..6c22c3510da 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -94,8 +94,7 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds)
+void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds)
 {
     FDCtrl *fdctrl;
     DeviceState *dev;
@@ -105,7 +104,6 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     dev = qdev_new("sysbus-fdc");
     sys = SYSBUS_FDC(dev);
     fdctrl = &sys->state;
-    fdctrl->dma_chann = dma_chann; /* FIXME */
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_connect_irq(sbd, 0, irq);
@@ -138,6 +136,16 @@ static void sysbus_fdc_common_instance_init(Object *obj)
     FDCtrlSysBus *sys = SYSBUS_FDC(obj);
     FDCtrl *fdctrl = &sys->state;
 
+    /*
+     * DMA is not currently supported for sysbus floppy controllers.
+     * If we wanted to add support then probably the best approach is
+     * to have a QOM link property 'dma-controller' which the board
+     * code can set to an instance of IsaDmaClass, and an integer
+     * property 'dma-channel', so that we can set fdctrl->dma and
+     * fdctrl->dma_chann accordingly.
+     */
+    fdctrl->dma_chann = -1;
+
     qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
 
     memory_region_init_io(&fdctrl->iomem, obj,
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 44f0d48bfd7..14eaa517435 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -354,7 +354,7 @@ static void mips_jazz_init(MachineState *machine,
         fds[n] = drive_get(IF_FLOPPY, 0, n);
     }
     /* FIXME: we should enable DMA with a custom IsaDma device */
-    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds);
+    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
 
     /* Real time clock */
     mc146818_rtc_init(isa_bus, 1980, NULL);
-- 
2.25.1


