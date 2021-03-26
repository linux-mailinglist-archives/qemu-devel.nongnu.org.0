Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AE349E0D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:38:31 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaUh-0005TQ-1q
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKW-0002g3-NS; Thu, 25 Mar 2021 20:28:00 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKV-00049e-4J; Thu, 25 Mar 2021 20:28:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id x7so3993326wrw.10;
 Thu, 25 Mar 2021 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vQI7A5hmQ3wSaUcxdAm+j6q3/KZqQAA4ivIYPpUB90=;
 b=U/dcfFBgWaAIgcCwfoiGO/eDt8K/1jMiXa/RXYJzdS9NYIL8P80pZrT0JSRSj1+vO4
 luO7ybcX4WdAiV4opZZdQyrVX3bmYyjws4dChRjp/v5rv9JsdGon6h2rz++HL0EeZebA
 cvJ1l5b1gRd0qAGbDMJuyMBvxrQHMYltJT9Vz4BRJdLquze3iSXCD40JTYb/QRgHISmO
 rwIZqvc80ctdAkq4E3ExL33eEeS552pISMqNBNG/mpSE28B1MlRhfgNqGI/4CtvfJdDa
 LHD4mMlALpniwsZWsoMHsGaVOoR5KJfUtwEqbtPlWRtiUU7o3X0rBk1x1cyjU1M8GdUY
 /Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9vQI7A5hmQ3wSaUcxdAm+j6q3/KZqQAA4ivIYPpUB90=;
 b=W5veSU2UW1MlB4mVRXKbe1chsttRszP1n6hctcUnwJdcHWmRj9Tp+0SpZ8z/c3OW1f
 kBFVOD+pwU/4TfXAEnTM+ZKc1C283qOTErioKYEaW9nZjExo6tYhyGU2nln+x7jp/RoD
 2bj+FEmWRXXIUhpa8t2Xc92kBxtaRd5vijzuQnUAnoFtErnQKYKZwP9snolEaRf7seGd
 /QUBRdF6fSONwrn/hX7OwGR1kh6vwXcscbkoUJOqUWeBncOC82GJG7EMGHQ+Olb4HHiz
 cm5Y4KuaTS2VJRJ3SdJHBmcNJU0wBXyBheYUQGxNbNZo75tiV/eUuuV3/ML4G1GlcAT4
 g2eg==
X-Gm-Message-State: AOAM533ExgZNB4+zZ80TM9nFUG3QBvp+MmWBYj9TNoKHd2pQF0nYwqT1
 Qwpzn1gpYd2iJ6rxEtruxKVVXFCBz+ooug==
X-Google-Smtp-Source: ABdhPJzJyn8qA/gDC2LjpGKi6r8FHjnf2MA7vcXj4XM4GYzPYEWOP4ddLgBme7pftkweiiKL7l4CFw==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr11705878wri.301.1616718476546; 
 Thu, 25 Mar 2021 17:27:56 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e17sm9844458wra.65.2021.03.25.17.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 05/10] hw/arm/digic: Map flash using
 memory_region_add_subregion_aliased()
Date: Fri, 26 Mar 2021 01:27:23 +0100
Message-Id: <20210326002728.1069834-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using a device specific feature for mapping the
flash memory multiple times over a wider region, use the
generic memory_region_add_subregion_aliased() helper.

There is no change in the memory layout.

* before:

  $ qemu-system-arm -M canon-a1100 -S -monitor stdio
  QEMU 5.2.90 monitor - type 'help' for more information
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000003ffffff (prio 0, ram): ram
      00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
      00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
      00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
      00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
      00000000f8000000-00000000ffffffff (prio 0, i/o): pflash
        00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        ...
        00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff

* after:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000003ffffff (prio 0, ram): ram
      00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
      00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
      00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
      00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
      00000000f8000000-00000000ffffffff (prio 0, i/o): masked pflash [span of 4 MiB]
        00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash [#0/32] @pflash 0000000000000000-00000000003fffff
        00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash [#1/32] @pflash 0000000000000000-00000000003fffff
        00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash [#2/32] @pflash 0000000000000000-00000000003fffff
        ...
        00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash [#29/32] @pflash 0000000000000000-00000000003fffff
        00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash [#30/32] @pflash 0000000000000000-00000000003fffff
        00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash [#31/32] @pflash 0000000000000000-00000000003fffff

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c | 8 +++++---
 hw/arm/Kconfig        | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index fc4a671b2e1..293402b1240 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -128,8 +128,7 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
                          FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
-    qdev_prop_set_uint8(dev, "mappings",
-                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
+    qdev_prop_set_uint8(dev, "mappings", 0);
     qdev_prop_set_uint8(dev, "big-endian", 0);
     qdev_prop_set_uint16(dev, "id0", 0x00ec);
     qdev_prop_set_uint16(dev, "id1", 0x007e);
@@ -140,7 +139,10 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
     qdev_prop_set_string(dev, "name", "pflash");
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    memory_region_add_subregion_aliased(get_system_memory(),
+                            addr, DIGIC4_ROM_MAX_SIZE,
+                            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0),
+                            FLASH_K8P3215UQB_SIZE);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index aa8553b3cd3..1a7b9724d6c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -42,6 +42,7 @@ config DIGIC
     bool
     select PTIMER
     select PFLASH_CFI02
+    select ALIASED_REGION
 
 config EXYNOS4
     bool
-- 
2.26.2


