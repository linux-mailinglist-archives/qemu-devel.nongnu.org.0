Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BD658E52
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAukv-0001DG-Tm; Thu, 29 Dec 2022 10:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukt-0001Ci-FF
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukp-0007pZ-LZ
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so13378078wms.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5k8c2DRnpfQPYlpLD03/aEWvlkNTpIk4NrXQ2VnKoc=;
 b=KAXUD+S6funDczbi9FbIdpDfC4u3ZWSi3L+UUNhF1M24LDCw/EJT6kHGy3F7mvv/ju
 59wmRLIuxJDvXl9c6JLi5VMIw+4cBG2TXEwuuMdT6V0hEwMXj+qN7YDde/KVx/ohvqrj
 MYWXnKEd9FMr5VbZR2C9v2jpT6vq34Bw7rlpk6Wx30b4NtcjSJpNSfE1aNO8JIvSt+0E
 1CRXG4qcMqZfa1AsVgivIIGPPLfHLGSrfZ7vgEk9Lv42/33loVRNdq1b3/mYyNfk+8D4
 CsDXDHM4VmPU/Hv6HyZk1pgwmmbRhSASRMj9+VHGO1aUNV86+Ih2KaXfl7x9/cUt6ukh
 uMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5k8c2DRnpfQPYlpLD03/aEWvlkNTpIk4NrXQ2VnKoc=;
 b=IQ01gL2v9AvhFauhB/usmHPF4H2HGep9bvJx20IbFB8eUTJGxmyD1SVipmZ1d9EBS4
 nH0UA0ktCwHAvEflr+wdmKR4xNan1xjqvPaIvYGdHFil+IhNvs8/9PiesKtJiy5H2Xy5
 Kj1vpzuOviQpWMDHPQIKd5OzckqbbELmJNeXVrhLf2fTwlK5arBnP8pxKTaUycP2zrWJ
 v56wVmbCwsPFJOQRH742hscSgDrO/reLt/1uQc+rLUc4r3drONJqiAaPgO8fRdacGJ3l
 QWDoFBOB1cQqLZGvQJxB8tvjMmjjD6jUThkGLJdL4aE7kZoz4aHe8FNlmGKj9SrTl2y1
 +G5A==
X-Gm-Message-State: AFqh2kqJeLmoVKqDURu/r85l4iCbbEdicXqFvoSbItwpMFBc0KmYIrwT
 /JvhMgSFu4ZMcXYi5IGU2Fy0eZfIHQSGYSL1
X-Google-Smtp-Source: AMrXdXtRsXBqlzlYQTkCLxRqCIqvuJ/CA3HXvSlioKumYp1NkrwC1wWFXolrByZkh2XX+abYS86q7Q==
X-Received: by 2002:a1c:3887:0:b0:3d2:26cd:3b1e with SMTP id
 f129-20020a1c3887000000b003d226cd3b1emr20234600wma.28.1672327414020; 
 Thu, 29 Dec 2022 07:23:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003d997e5e679sm5428138wmn.14.2022.12.29.07.23.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 1/9] hw/watchdog/wdt_aspeed: Map the whole MMIO range
Date: Thu, 29 Dec 2022 16:23:17 +0100
Message-Id: <20221229152325.32041-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Avoid confusing two different things:
- the WDT I/O region size ('iosize')
- at which offset the SoC map the WDT ('offset')
While it is often the same, we can map smaller region sizes at
larger offsets.

Here we are interested in the I/O region size. Rename as 'iosize'
and map the whole range, not only the first implemented registers.
Unimplemented registers accesses are already logged as guest-errors.

Otherwise when booting the demo in [*] we get:

  aspeed.io: unimplemented device write (size 4, offset 0x1851a8, value 0x030f1ff1)
  aspeed.io: unimplemented device write (size 4, offset 0x1851ac, value 0x03fffff1)
  aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1)
  aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)

[*] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c          |  2 +-
 hw/arm/aspeed_ast2600.c          |  2 +-
 hw/arm/aspeed_soc.c              |  2 +-
 hw/watchdog/wdt_aspeed.c         | 12 +++++++-----
 include/hw/watchdog/wdt_aspeed.h |  2 +-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 4d0b9b115f..122b3fd3f3 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* GPIO */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..a79e05ddbd 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* RAM */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b05b9dd416..2c0924d311 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
             return;
         }
         aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
     }
 
     /* RAM  */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d753693a2e..c1311ce74c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
 
     assert(s->scu);
 
@@ -270,8 +271,9 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
      */
     s->pclk_freq = PCLK_HZ;
 
+    assert(awc->iosize >= ASPEED_WDT_REGS_MAX * 4);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
-                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
+                          TYPE_ASPEED_WDT, awc->iosize);
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
@@ -309,7 +311,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2400 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
@@ -346,7 +348,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2500 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xfffff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -369,7 +371,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2600 Watchdog Controller";
-    awc->offset = 0x40;
+    awc->iosize = 0x40;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -392,7 +394,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 1030 Watchdog Controller";
-    awc->offset = 0x80;
+    awc->iosize = 0x80;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index dfa5dfa424..db91ee6b51 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -40,7 +40,7 @@ struct AspeedWDTState {
 struct AspeedWDTClass {
     SysBusDeviceClass parent_class;
 
-    uint32_t offset;
+    uint32_t iosize;
     uint32_t ext_pulse_width_mask;
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
-- 
2.38.1


