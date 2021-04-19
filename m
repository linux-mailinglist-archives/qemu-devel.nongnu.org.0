Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE16363F2B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQXW-0007ag-JZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRV-00028B-Ji; Mon, 19 Apr 2021 05:43:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRU-00030Y-0A; Mon, 19 Apr 2021 05:43:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id e5so4612107wrg.7;
 Mon, 19 Apr 2021 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtPHGXi9+ZTv4ayRzYeSfqDe3/H34ya16cXAvGHk8ns=;
 b=B3X7/nLQKcvkVPTy6ZAaoTk8LefVhKIvifLMxHhKC1yR30pdWM/E5pv0Y15vJY8Y/A
 OGm7yQ9tzlDx/VfhmvfKhTnAcwcg3fHKOiklCtJ0nKiJkzMq9PRblY721B5B1lr78omQ
 Rf6zPPzs+cWSotRJ//eVjGbepATZnRS3kavHx2mOd69gGci1hdPIXn7j+PiZE+zlVR7s
 zZt0yZHvXEbuUQiwFoICjaE2+cMcJQX0IHXF2P2IVNkX9ojnMa5cntJnPKFGQBKr7ZaJ
 Pz7e2uFyZCoxunsw6z1fDFuLCrP39PidC+Hn2I7cOgKZW3YyYPxsnmsjBo1uqu9sZqVN
 6qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JtPHGXi9+ZTv4ayRzYeSfqDe3/H34ya16cXAvGHk8ns=;
 b=pB+eq9yyFKtshcUkVHybf3XvqXGt4uhsTYnbAES2iPRCIkVX/hjVEMHQc6i7Uo7aS2
 9RiLBG8By/rV4Z1IvziE0KRRc7+NUAnVKZiNiwdybFy2jdmRk+pB5S2tXl74trQbTT+e
 fWtgjU3QfXL74o98P07/sbi6Hpb3Tjraqp4P32S70u0kb8Spw1t2NeU8WBtHcuxEHPyW
 cgogHQqrx/5/BKla92jr8tN6JCpURUFdBLyPfnvkSnAWvGnJ/wMhxJi3FeBCzMfR7U92
 Nvri+cWFcbvmPSGf+ZBiSU1iWhjf/9TO5Jd19OTGks7gZ/zZtQaAii/8tuGM7S/kX9D+
 Wx/w==
X-Gm-Message-State: AOAM533JpnsDfUblkKbhVKs8SXR1H+WamCvyYtQD/cCLcQi+3m3VoqIf
 0vQNV1UZxN4Xtg/JWe4rbXTY99KtzGxKmw==
X-Google-Smtp-Source: ABdhPJzSGGgH0VOwusuxbv5aErzxPHvG6k3FVMbwvOpndYD6swr7R85i1z+6jZlKTq2wiYqFEqo3kA==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr13683276wrs.148.1618825421710; 
 Mon, 19 Apr 2021 02:43:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i12sm20510138wrm.77.2021.04.19.02.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] hw/arm/musicpal: Open-code pflash_cfi02_register() call
Date: Mon, 19 Apr 2021 11:43:24 +0200
Message-Id: <20210419094329.1402767-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to manually map the flash region on the main memory
(in the next commit), first expand the pflash_cfi02_register
in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9cebece2de0..8b58b66f263 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -1640,6 +1641,7 @@ static void musicpal_init(MachineState *machine)
     /* Register flash */
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (dinfo) {
+        static const size_t sector_size = 64 * KiB;
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
 
         flash_size = blk_getlength(blk);
@@ -1649,17 +1651,30 @@ static void musicpal_init(MachineState *machine)
             exit(1);
         }
 
+        dev = qdev_new(TYPE_PFLASH_CFI02);
+        qdev_prop_set_drive(dev, "drive", blk);
+        qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
+        qdev_prop_set_uint32(dev, "sector-length", sector_size);
+        qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
+        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
+        qdev_prop_set_uint8(dev, "big-endian", 0);
+        qdev_prop_set_uint16(dev, "id0", 0x00bf);
+        qdev_prop_set_uint16(dev, "id1", 0x236d);
+        qdev_prop_set_uint16(dev, "id2", 0x0000);
+        qdev_prop_set_uint16(dev, "id3", 0x0000);
+        qdev_prop_set_uint16(dev, "unlock-addr0", 0x5555);
+        qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aaa);
+        qdev_prop_set_string(dev, "name", "musicpal.flash");
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                        0x100000000ULL - MP_FLASH_SIZE_MAX);
+
         /*
          * The original U-Boot accesses the flash at 0xFE000000 instead of
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, 0x10000,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 0);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
-- 
2.26.3


