Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F6363F14
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:46:33 +0200 (CEST)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQUC-00041n-Bi
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRf-0002H4-Ll; Mon, 19 Apr 2021 05:43:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRd-00036q-Fx; Mon, 19 Apr 2021 05:43:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id a4so33283818wrr.2;
 Mon, 19 Apr 2021 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmR3JkBwNqN9aB8s6qQPXTp8v3g1pCResCZWxmCdWQU=;
 b=paa2swu2/dF1gOusHim2I7d654iDzYt10AJKRcYEBYbvqU83rCT1gOmg96WzUfDE58
 w9OOKdcKnNTa5ZgrYE4Tu0Uos7TiIsHqyCJuJUBsKZsbDZH6zj2P+KINIoHzA3JlzT15
 WulLJHbuSDY+SN/H5F6Q7DWs9UNyvPl37vNRPT0EQlrgtfNTl0XxzPYpyA9XbdWGJHs4
 p/1Q4mFL7jCpgbNmbTOC8CJxvl1OkJCWYDbmVx5F7FHrzgm7MzoUUHOHx1qaAi4i8exZ
 8rHSMKRouAOeAxffZX6NuA52pN2f7cWMnreSe2mRpUCTsGkgwI0H4vtMeUNW7Rvm8gD1
 s6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XmR3JkBwNqN9aB8s6qQPXTp8v3g1pCResCZWxmCdWQU=;
 b=P1EwNC8HkK7KNGID8ICSlk3+N9uYOlA+TxBZgR72W2tUMA0UTCYtcTXu7Iy+2dcAJg
 PLJkH/T0/BYDkZSGtjelNQ7XBGbWSep54X4WSqT128Y9wXynW7Rr5lLUhFtKnTVJc902
 4pN2KbXvVDDPb46J6vZNZtRm5EpJ1P/BDzEZsIl2BB3HQcmuUcTRkQdYyCUS0NoURTfa
 TS5nJGrJeeUbp0Q78Sj3Tli1PhL1b1FlYGvOj/IusQJVZTtFYZSKDEtICKTZwEfGA3JR
 5QVjdf2tNOtkQncjCsHoohAI0MMHBScpPW5ME3oq7JsoMxXyzDsa5RR89VEuNj8pn7Rk
 1aqw==
X-Gm-Message-State: AOAM533awFgoxh7by/7v5IGc6drlGwtNiFTQIJ9dm8tYkOzcDhF/LkYj
 YcHqNiAXlzv2pndTKbL/unrl7wdruf/oKg==
X-Google-Smtp-Source: ABdhPJwqI9LMO/iniVc7gwzU+EAMkH5J2aswK4xO8yxVwTFROaPLStInXbZCBThfGZPwPpePvwrMiQ==
X-Received: by 2002:adf:f504:: with SMTP id q4mr13539548wro.304.1618825431429; 
 Mon, 19 Apr 2021 02:43:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q19sm19005354wmc.44.2021.04.19.02.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] hw/arm/digic: Open-code pflash_cfi02_register() call
Date: Mon, 19 Apr 2021 11:43:26 +0200
Message-Id: <20210419094329.1402767-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

To be able to manually map the flash region on the main memory
(in the next commit), first expand the pflash_cfi02_register
in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 6cdc1d83fca..fc4a671b2e1 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -31,6 +31,8 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/aliased_region.h"
 #include "hw/arm/digic.h"
 #include "hw/block/flash.h"
 #include "hw/loader.h"
@@ -120,12 +122,25 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
 
-    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
-                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
-                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
-                          4,
-                          0x00EC, 0x007E, 0x0003, 0x0001,
-                          0x0555, 0x2aa, 0);
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
+
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
+    qdev_prop_set_uint8(dev, "mappings",
+                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
+    qdev_prop_set_uint8(dev, "big-endian", 0);
+    qdev_prop_set_uint16(dev, "id0", 0x00ec);
+    qdev_prop_set_uint16(dev, "id1", 0x007e);
+    qdev_prop_set_uint16(dev, "id2", 0x0003);
+    qdev_prop_set_uint16(dev, "id3", 0x0001);
+    qdev_prop_set_uint16(dev, "unlock-addr0", 0x0555);
+    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
+    qdev_prop_set_string(dev, "name", "pflash");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
-- 
2.26.3


