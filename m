Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C763EA261
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:47:48 +0200 (CEST)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7JT-0002CJ-SP
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76V-0005vl-0R
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0007zy-LT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2590217wma.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imRDz2WYhnYhneAl1HiaVMr6cnP1w4n/2P4u8XAGN8c=;
 b=nzQlu9UbuecwMnDj1dD9HLhEgjf3SegmOh3BR4BCfZD+NCH/YYTzlnjSzaEOw7agZI
 FioZxYTi+e5WXz7uI8epar175x+SVjPyhtV9N1fRGeyUXUkSwCTZb+u7vm59k+1Duuz1
 1K1cLJrFV2Vpta8t836ZFZQYOb5egnRQTC/QpIAI/ED87C3z/eYYVVcSSem2vRpw5ccL
 Mg3CQsj3JQ4MofloffFqLd4UZ6LwfyZzYre4YDHAmdIOV/dEfR/fOjjAI7nr/3N+6vPS
 MzAlQT5oj0V4N3xFrUorwr19o/AYTGqE5TDAmksVb8IVrmv/GiV+tTClIC98rPiJqsVY
 t/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imRDz2WYhnYhneAl1HiaVMr6cnP1w4n/2P4u8XAGN8c=;
 b=T0v5IDSYTUX8wqpwtpcP8WkFYIqTJuo9/UIcAU/JmCoDqHD1CsRyWk6vexB7akINJd
 UWNWR8NuP9a3A5v52+GGwRc3usrosg9NNuT97x14TuMv5h5A3BjKOkheLblZ6lCqMPDk
 sWg51zmWw50VVKlFUH773k6IKBWf0QhYH2nw2sZHOCOzlz9/tLl6id9wfnvKgJMjnOGK
 t05en4BRAy0m9M96WHeSlWFmugqvN3tdnWgnqsFhISS5S2KPjFfEwYPAtWKznm1O6E7m
 KxHJJbGd90uStE8wSQMe1r/tXupAvbka30LdblXPvsJTvQzH6r4JTVukXWnGlv1TWq4O
 WHXQ==
X-Gm-Message-State: AOAM532B/HrPoTNx3xwwV4KwHL3xBNO4rbzRqPMQppgf8t+uTSfmZiul
 bAp4n9fjRntzbjd0ia+vENijAA==
X-Google-Smtp-Source: ABdhPJwCQF097XnMMyn9H36kTzz1Y3iWuZTVOHVuvtWcLiWhiY6mDt1uKizjgqkg8PmaeiZDKPkvkw==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr11762646wmc.112.1628760856135; 
 Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 18/25] hw/arm/msf2_soc: Don't allocate separate
 MemoryRegions
Date: Thu, 12 Aug 2021 10:33:49 +0100
Message-Id: <20210812093356.1946-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the realize method of the msf2-soc SoC object, we call g_new() to
create new MemoryRegion objects for the nvm, nvm_alias, and sram.
This is unnecessary; make these MemoryRegions member fields of the
device state struct instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/msf2-soc.h |  4 ++++
 hw/arm/msf2-soc.c         | 17 +++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index d4061846855..38e10ce20aa 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -65,6 +65,10 @@ struct MSF2State {
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
     MSF2EmacState emac;
+
+    MemoryRegion nvm;
+    MemoryRegion nvm_alias;
+    MemoryRegion sram;
 };
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 5cfe7caf834..f36788054b3 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -83,11 +83,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     int i;
 
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *nvm = g_new(MemoryRegion, 1);
-    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
+    memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
      * On power-on, the eNVM region 0x60000000 is automatically
@@ -95,15 +92,15 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
      * start address (0x0). We do not support remapping other eNVM,
      * eSRAM and DDR regions by guest(via Sysreg) currently.
      */
-    memory_region_init_alias(nvm_alias, OBJECT(dev_soc), "MSF2.eNVM", nvm, 0,
-                             s->envm_size);
+    memory_region_init_alias(&s->nvm_alias, OBJECT(dev_soc), "MSF2.eNVM",
+                             &s->nvm, 0, s->envm_size);
 
-    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
-    memory_region_add_subregion(system_memory, 0, nvm_alias);
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, &s->nvm);
+    memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
 
-    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
+    memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
-- 
2.20.1


