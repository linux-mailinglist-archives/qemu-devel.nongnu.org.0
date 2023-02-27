Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E56A447B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAT-00006E-HG; Mon, 27 Feb 2023 09:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeA3-0007kt-Dr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:35 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeA1-0000FS-Kh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so6368926wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sD8nMOvl9XnKQqeIn+DUxNqc5UOPoGaD9olkVeLlkv0=;
 b=oU5viHelvs8Z/BYMPZCeCpbPBzzy6Npi/jpNZYeek1YFNJZ3+lY4rrumvtNEqV9GdV
 dzkit7Q84hAQQcd7V1a388GfHAOQOC9w023oRCwkPaeadQKjiVCwilBISvV9vemUmlqH
 oGexPU4ibepG7FLNbj8HKhzfkwd6afumuW1PFr4INxwxzJMc3p78ibWF3DD3wfYdCxUJ
 U9upmfr0/zh/pSkXe2aDoQZZtO3kGMp19J6SL1y0hXQqp5jX5FLzwPm6yp5M2lzUVrHf
 kIOl8g59Nm1mzDCtmMhiqRXAJsyA+I+bGeZWBB6JOEWnhgIwAyHzwyVyJCcKWaDKxBLa
 /MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sD8nMOvl9XnKQqeIn+DUxNqc5UOPoGaD9olkVeLlkv0=;
 b=T6H8/3xEX6ZyEiQzkUdl/MxeVjuYSjJnn7czS0a+8ntntnbtfBV7wscKIIaEEdvDAJ
 SrxS/mal4FRNjixAzOUNsyUvWAKl2fi01j9eG+Z9QlPsZ7Iz62zskXbbRYs9DK5misgP
 am4hr/V34c77NvrdIjDgHsjldh00Rs7Xk9UOMJCs0/7AWAlD0VQmPQvzXjeZGsly/rQy
 FaZQ9bCij/mt6fFmnWVGSMwxVKd5P41RZvezl9t0j5EjoqVIkUV67+WisPCWoZKUsMCo
 BAiy8JIwXfFriqYziVK7RkH7dJk9+LFrdQ2Pkyjd/YTt8KhO7drSRXni/CGhW5zivvZv
 6/KQ==
X-Gm-Message-State: AO0yUKUNDL8g6el/FFTGxon0Y2Q3bwIXaGi25kHK/C1md3NaMU/gj5vI
 SUBET4NDVuW+lwFjuZPK0fUijEmhHGprIPZn
X-Google-Smtp-Source: AK7set8rsm8MhVFNl90tLpBfKwSHGUXiwBvAeoJzJMRT3zhWyiRhzw2XE8D01nGINgp4biyQdBxb3A==
X-Received: by 2002:adf:fdc5:0:b0:2c7:dec:77ac with SMTP id
 i5-20020adffdc5000000b002c70dec77acmr14119105wrs.21.1677506837997; 
 Mon, 27 Feb 2023 06:07:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b002c70bfe505esm7149901wrr.82.2023.02.27.06.07.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 065/126] hw: Replace isa_get_irq() by isa_bus_get_irq() when
 ISABus is available
Date: Mon, 27 Feb 2023 15:01:12 +0100
Message-Id: <20230227140213.35084-56-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230215161641.32663-4-philmd@linaro.org>
---
 hw/audio/cs4231a.c       | 5 +++--
 hw/audio/gus.c           | 5 +++--
 hw/audio/sb16.c          | 7 ++++---
 hw/block/fdc-isa.c       | 5 +++--
 include/hw/timer/i8254.h | 3 ++-
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index ec066fcd89..5c6d643732 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -668,16 +668,17 @@ static void cs4231a_initfn (Object *obj)
 static void cs4231a_realizefn (DeviceState *dev, Error **errp)
 {
     ISADevice *d = ISA_DEVICE (dev);
+    ISABus *bus = isa_bus_from_device(d);
     CSState *s = CS4231A (dev);
     IsaDmaClass *k;
 
-    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(d), s->dma);
+    s->isa_dma = isa_bus_get_dma(bus, s->dma);
     if (!s->isa_dma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
     }
 
-    s->pic = isa_get_irq(d, s->irq);
+    s->pic = isa_bus_get_irq(bus, s->irq);
     k = ISADMA_GET_CLASS(s->isa_dma);
     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
 
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 2a08a0f7d7..787345ce54 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -236,11 +236,12 @@ static const MemoryRegionPortio gus_portio_list2[] = {
 static void gus_realizefn (DeviceState *dev, Error **errp)
 {
     ISADevice *d = ISA_DEVICE(dev);
+    ISABus *bus = isa_bus_from_device(d);
     GUSState *s = GUS (dev);
     IsaDmaClass *k;
     struct audsettings as;
 
-    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(d), s->emu.gusdma);
+    s->isa_dma = isa_bus_get_dma(bus, s->emu.gusdma);
     if (!s->isa_dma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
@@ -282,7 +283,7 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
     s->emu.himemaddr = s->himem;
     s->emu.gusdatapos = s->emu.himemaddr + 1024 * 1024 + 32;
     s->emu.opaque = s;
-    s->pic = isa_get_irq(d, s->emu.gusirq);
+    s->pic = isa_bus_get_irq(bus, s->emu.gusirq);
 
     AUD_set_active_out (s->voice, 1);
 }
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index ae745c7283..535ccccdc9 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1398,17 +1398,18 @@ static void sb16_initfn (Object *obj)
 static void sb16_realizefn (DeviceState *dev, Error **errp)
 {
     ISADevice *isadev = ISA_DEVICE (dev);
+    ISABus *bus = isa_bus_from_device(isadev);
     SB16State *s = SB16 (dev);
     IsaDmaClass *k;
 
-    s->isa_hdma = isa_bus_get_dma(isa_bus_from_device(isadev), s->hdma);
-    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(isadev), s->dma);
+    s->isa_hdma = isa_bus_get_dma(bus, s->hdma);
+    s->isa_dma = isa_bus_get_dma(bus, s->dma);
     if (!s->isa_dma || !s->isa_hdma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
     }
 
-    s->pic = isa_get_irq(isadev, s->irq);
+    s->pic = isa_bus_get_irq(bus, s->irq);
 
     s->mixer_regs[0x80] = magic_of_irq (s->irq);
     s->mixer_regs[0x81] = (1 << s->dma) | (1 << s->hdma);
diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index a5f07b668d..7ec075e470 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -86,6 +86,7 @@ static const MemoryRegionPortio fdc_portio_list[] = {
 static void isabus_fdc_realize(DeviceState *dev, Error **errp)
 {
     ISADevice *isadev = ISA_DEVICE(dev);
+    ISABus *bus = isa_bus_from_device(isadev);
     FDCtrlISABus *isa = ISA_FDC(dev);
     FDCtrl *fdctrl = &isa->state;
     Error *err = NULL;
@@ -94,11 +95,11 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
                              isa->iobase, fdc_portio_list, fdctrl,
                              "fdc");
 
-    fdctrl->irq = isa_get_irq(isadev, isa->irq);
+    fdctrl->irq = isa_bus_get_irq(bus, isa->irq);
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         IsaDmaClass *k;
-        fdctrl->dma = isa_bus_get_dma(isa_bus_from_device(isadev), isa->dma);
+        fdctrl->dma = isa_bus_get_dma(bus, isa->dma);
         if (!fdctrl->dma) {
             error_setg(errp, "ISA controller does not support DMA");
             return;
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 3e569f42b6..8402caad30 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -56,7 +56,8 @@ static inline ISADevice *i8254_pit_init(ISABus *bus, int base, int isa_irq,
     qdev_prop_set_uint32(dev, "iobase", base);
     isa_realize_and_unref(d, bus, &error_fatal);
     qdev_connect_gpio_out(dev, 0,
-                          isa_irq >= 0 ? isa_get_irq(d, isa_irq) : alt_irq);
+                          isa_irq >= 0 ? isa_bus_get_irq(bus, isa_irq)
+                                       : alt_irq);
 
     return d;
 }
-- 
2.38.1


