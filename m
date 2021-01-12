Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDB2F3707
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:27:10 +0100 (CET)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNRl-0000Ky-Km
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzx-00021n-UZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzr-000745-Rk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k10so2518162wmi.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hljzW3VNw842X9fmZ052IHs9PJeCgTdh0vSWqneEEFc=;
 b=FgRfPcKuCzcBpnS91Uualu9dSOtdUfbIGp16FO//xXJ46iEAkZQsKwYWa/QeKWXmm2
 PFtUVQB9sqonqu58fgdHvuq0EORthSLzDH4xsYVzuDlJ/xDMISS7XEyKQEF1czI45TKs
 O/IdK+5O/RijVEIMSeSl8/uJFofOctFbzWtKjXCpFX6vv/ZTTf4Oui/Iflt+XoDHVlcL
 xDcJl2fQhIw/1oaPOAmOjnty4OpGBQ1xUR/lJGFiTui3Hx+gjbZaTfOVeKWxf629iY+a
 uB5fmCii2ZIslwvCaVLTDQn8drTa1uh773u4d3/xWrMMW3vBYAus9EkKuAnZXK3ZI2in
 oQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hljzW3VNw842X9fmZ052IHs9PJeCgTdh0vSWqneEEFc=;
 b=OSuxYcBuSXaMP3i3c3Afgs/NtEUsrljREx9W1Tk7v/Bjo0yYvFiNzKp+Zfib/VhbME
 7GQPAUrVZ7L/oSxlnROCyHDqgoIMYi+HSCsFSdljnibhSm5SZpAv1bv3zgHKR5pT0kyI
 ZYyGLaR6fOvRmOmcZx31VBcePKkogBLTPJ3fi0T8AaJNx4OEP1d+AVOujo+gyb57sH8H
 xDFIcVch/tYF4zfxw+X9bytloQ2/bPL+jj1m2vkF0UJuQUsCQyeE4zQZGetP7QGB0TBk
 1j1y3maufDB6+YcxXeHZwEUstF7HnzZlPe/WhqBv6OGdqQyMPjhlkKG9YE51mS9rjfnI
 UiGg==
X-Gm-Message-State: AOAM533PkCLezJPySZw+kD7TnCMNt8o1iw1OBZmdQCXoHuncZG5TYOgm
 vXrmXXCllbJLH4w3AqWSJpgOUSsGaCMXMw==
X-Google-Smtp-Source: ABdhPJy1h47HfhSswhDi++i1iwxyWYAHTI/wgFFvloXIJGHenZBseCgYdbeKWgf8am++2viSKEwIIQ==
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr193831wme.5.1610470698304;
 Tue, 12 Jan 2021 08:58:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] hw/*: Use type casting for SysBusDevice in NPCM7XX
Date: Tue, 12 Jan 2021 16:57:49 +0000
Message-Id: <20210112165750.30475-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Hao Wu <wuhaotsh@google.com>

A device shouldn't access its parent object which is QOM internal.
Instead it should use type cast for this purporse. This patch fixes this
issue for all NPCM7XX Devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210108190945.949196-7-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 2 +-
 hw/mem/npcm7xx_mc.c     | 2 +-
 hw/misc/npcm7xx_clk.c   | 2 +-
 hw/misc/npcm7xx_gcr.c   | 2 +-
 hw/misc/npcm7xx_rng.c   | 2 +-
 hw/nvram/npcm7xx_otp.c  | 2 +-
 hw/ssi/npcm7xx_fiu.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 306260fa671..3fdd5cab01d 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -82,7 +82,7 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = &nmc->parent;
+    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
index 0435d06ab44..abc5af56208 100644
--- a/hw/mem/npcm7xx_mc.c
+++ b/hw/mem/npcm7xx_mc.c
@@ -62,7 +62,7 @@ static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
                           NPCM7XX_MC_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->mmio);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
 }
 
 static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 48bc9bdda55..0bcae9ce957 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -913,7 +913,7 @@ static void npcm7xx_clk_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
                           TYPE_NPCM7XX_CLK, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static int npcm7xx_clk_post_load(void *opaque, int version_id)
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
index 745f6908097..eace9e1967a 100644
--- a/hw/misc/npcm7xx_gcr.c
+++ b/hw/misc/npcm7xx_gcr.c
@@ -220,7 +220,7 @@ static void npcm7xx_gcr_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_gcr_ops, s,
                           TYPE_NPCM7XX_GCR, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gcr = {
diff --git a/hw/misc/npcm7xx_rng.c b/hw/misc/npcm7xx_rng.c
index f650f3401f8..b01df7cdb25 100644
--- a/hw/misc/npcm7xx_rng.c
+++ b/hw/misc/npcm7xx_rng.c
@@ -143,7 +143,7 @@ static void npcm7xx_rng_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_rng_ops, s, "regs",
                           NPCM7XX_RNG_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_rng = {
diff --git a/hw/nvram/npcm7xx_otp.c b/hw/nvram/npcm7xx_otp.c
index b16ca530baa..c61f2fc1aa2 100644
--- a/hw/nvram/npcm7xx_otp.c
+++ b/hw/nvram/npcm7xx_otp.c
@@ -371,7 +371,7 @@ static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxOTPClass *oc = NPCM7XX_OTP_GET_CLASS(dev);
     NPCM7xxOTPState *s = NPCM7XX_OTP(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memset(s->array, 0, sizeof(s->array));
 
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 5040132b074..4eedb2927e7 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -498,7 +498,7 @@ static void npcm7xx_fiu_hold_reset(Object *obj)
 static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxFIUState *s = NPCM7XX_FIU(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
     if (s->cs_count <= 0) {
-- 
2.20.1


