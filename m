Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2B6597C8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDfS-0006EU-9I; Fri, 30 Dec 2022 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfQ-0006E3-Q2
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfP-0003pk-6V
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id ja17so15006959wmb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOZfJuKjGnXyKynHrF0ryyVy+OVxkYOdTY6ayMGkBgk=;
 b=DBTZKCrqACtUO10TYcUd+HHcB8Ps4HcfHIsmuWpBIbGRaqi7NLiap7mXT/ieFhugrD
 cANS0EBLjBDYMaCI3s4ZDInps2efuEi4BGL/spIZTa5qm87KBaomho7LiJnpJwdCi4mJ
 jN3vHmzgnq8qklxPx5q6RRAPBOEjLPQE3JttJcC0rpzLGy0Zv/I9bz9HLxTHYyYZZTND
 opN0PUXSIW1yHOUkb7GZOhenp6SAL29UyAE630gXTKSWfQUMlyxE8qH1fWN2mNws6xet
 6NGIo/pFPNO0vJWFZnhOvUSEO8Bw8LzDEgebp4JUv0XlcH5ifNnDZr5LoYUlxUtAC2Uh
 wLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOZfJuKjGnXyKynHrF0ryyVy+OVxkYOdTY6ayMGkBgk=;
 b=rr7DU5CBMptN2duFU7OX5LnOEM8kkbMsTTiLbdbf10WulZGzjruC8VZI7WNcKz6Q2K
 YwGgP6E6ok0nRYN0J+2Sxhlb5M8oB0LybZOzZ29/gSbYqZ61RO8CpHciemBFUorZBZM+
 bM3EeQ/g7BDH+ePP623Tm48He6MnLaj6Dn86DP3V8cmui+4mamBPtCzauwpGhw7y7ZfF
 8z5LZZq4u2ckhsEuzeyZAV5z5syHFXaBkV78l7OFz5JY2bRT/IXN8f9YRD5JaPpQ+u19
 0Ps/+q5yJkGsRYuLyXb2lUywmKgU5C9tzMrrrRQLGQeCdyr9fIVSJQFtae9MFBGIQJaA
 AHrw==
X-Gm-Message-State: AFqh2kq7ZSIMueQupKCRkbqjC8bVOS3XljayCcrLZjn7ZUr4386sr5PI
 0m3cDfrrDrN3SLH+1YtQwfuytX+GIw8peDQH
X-Google-Smtp-Source: AMrXdXuxDPuQ1EoRouDzNwfoXFoSXDwxxFYzW55O5md4SM4Z9+5UvshIYNN6gHFXVqOo9/fza1SWWA==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id
 u37-20020a05600c4d2500b003d227badde0mr22902840wmp.33.1672400113415; 
 Fri, 30 Dec 2022 03:35:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iz17-20020a05600c555100b003d1e1f421bfsm31857528wmb.10.2022.12.30.03.35.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size as
 'iosize'
Date: Fri, 30 Dec 2022 12:34:54 +0100
Message-Id: <20221230113504.37032-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
While it is often the same, we can map smaller region sizes
at larger offsets.

Here we are interested in the I/O region size, so rename as
'iosize'.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c          | 2 +-
 hw/arm/aspeed_ast2600.c          | 2 +-
 hw/arm/aspeed_soc.c              | 2 +-
 hw/watchdog/wdt_aspeed.c         | 8 ++++----
 include/hw/watchdog/wdt_aspeed.h | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

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
index d753693a2e..958725a1b5 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2400 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
@@ -346,7 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2500 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xfffff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -369,7 +369,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2600 Watchdog Controller";
-    awc->offset = 0x40;
+    awc->iosize = 0x40;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -392,7 +392,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
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


