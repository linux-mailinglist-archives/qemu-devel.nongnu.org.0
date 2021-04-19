Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E18363F2C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:50:13 +0200 (CEST)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQXk-0007pM-Sa
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRl-0002Jq-3X; Mon, 19 Apr 2021 05:44:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRj-00039e-Gf; Mon, 19 Apr 2021 05:44:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id w186so13269766wmg.3;
 Mon, 19 Apr 2021 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGahhPByYM3/GV4I+MipmLSfFtBrhhdK0pNeulGHnOg=;
 b=rLqVoY70nGRtxd4t+4gNmXqpZ501xpYtqx0+gTRHJl+q/TDR0WKwomF7AX+z/GnYA3
 hYIIroyGfy1UEKVnpKE2dozXwLhPy/JGv6lODL5jR3R0IKk1me304GZUXefeZRN5ll3w
 JhCLWCg52Zq6fAw+a40LxUlS70mJH4wCU7DkUM3pSxtd1ddcrX0OCosPT90ToBHqg71P
 I0v1Kqv63i0qqZc+qUJfpn2HZ9qwpW3kMm/c0QpWzsO4Wen4vrnPlyq+CuYXHGpefi2v
 XIUkSK5DWAtjycgzK/L476Z10jjjxoGs5Cl4m1qiqGFpatAWa1sU61l1wnIBc68RHNWO
 levw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wGahhPByYM3/GV4I+MipmLSfFtBrhhdK0pNeulGHnOg=;
 b=iNHCqYnyNZmy0cz1FYFq+9A+/Z4wgzdT95bZKXKncVZi62jFHKuDDcIQpQ5q6F3BfU
 ZkO5EARnvEn9krpT6cZE+dsRIZg1VzdkYhaZGV14Bia86lDwcbz+yvE65SfHO0oATxea
 r83quTQVOx+Zda7unhqVYwwDGyCkc1Bnr1k5CQm7TH1GAe8AuWZcW+DJ2175ZhCyW0XD
 oKAD7Sl4cb9t55rTVN8sH7iZnZFIe7K6nhPW8Ko61BJuCLpBUACiYuVS501M6Abn3IIZ
 05lN2XlgtVNDTpdcA0UUns55OusDKKhzwGr84SDYtzjJCFba8JrdyWcspyvrKSFXI3xy
 jOHw==
X-Gm-Message-State: AOAM533WiDsgUAZjW7xrGDwAxeecrXayfWljhCt3JeDxJpawSBgXXIq3
 SqmVbyO3cigMUNqsa690gTLXxIfGIcUSJQ==
X-Google-Smtp-Source: ABdhPJwyl3Kv8/bu34lp44ExPoJfa7wZXEs40FRUbTvz4VoCDL6IJT4GpScDCUg8QveyKI/+c4Ho6g==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr20924525wmc.150.1618825436271; 
 Mon, 19 Apr 2021 02:43:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm8780039wri.41.2021.04.19.02.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] hw/arm/digic: Map flash using
 memory_region_add_subregion_aliased()
Date: Mon, 19 Apr 2021 11:43:27 +0200
Message-Id: <20210419094329.1402767-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
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
2.26.3


