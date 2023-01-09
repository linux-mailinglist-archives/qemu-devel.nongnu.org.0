Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D081566254B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqis-0002t8-AX; Mon, 09 Jan 2023 06:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqid-0002re-Iq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqib-00082Z-Ss
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6480301wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kABC6Dg8afXn22QWktdCfTPtG/Bv98gX9IL+lt9WyQQ=;
 b=MpY4iZiX5WIaoEoozJxdF8cC26tBpsQTe6o+9CeNBtAyqsEBH1emKIrLxEM+A8qBBw
 QyHaQUQBSRie0wFHpyW+VKScOudKrvYGYqLsAuRksLZOJW0P51NGY8IbaTeZ62npMLXS
 LNOo6JNc4fxZr7Mc23wmUr7x0O16A/ldOp5f3VwLM/MfTy0TWi6A1m20kN1O2kddPNEB
 FetHlSO5ayv7NSwc5OqG6yThPjgMWdmMe3/FvIlDX4OUWWR0+Q3lzTik74w5xtLeDBjK
 i6O/NixQs7CvhX24quiwoAnDde6cMqCW4DstQk8V9ZQHjPsus115ytlwQ8mJHIgTAtgq
 3hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kABC6Dg8afXn22QWktdCfTPtG/Bv98gX9IL+lt9WyQQ=;
 b=6sY0LS0HhJ03Mtv/1QVt63uJSsn6ALLlyKhTL12PYlxYtp97QBk9L43WDqxc5scUNF
 jO0LjQtmFCrdIobkuMIxbyhZfAyj2iH0e+IPbPX+y+CogyUbkInBt30LIJw3cNyVHpMo
 CBmo9iLxkfovgPkNSBpJe71youJ+r6CoYtNLkvV++Lkm98TZuwtnUHfYyuhwx4NAXHui
 15csl5qwQ6hIzf2fieqHR4+DsevJGvT4cCdethPtkNmqCPLLKCf1thXOkeRfhYcNiyKq
 4hUgT/YGfRxf8nH8lI1fl5pYpIIaNekHFa0jAPushH94Uqd+wZllyS1iUwf9wLt38Nah
 LeEw==
X-Gm-Message-State: AFqh2kpjEZuhj/pP8pJ0CZquaKIqWuewV3M0pRzzbAg8hDH6z8nBKHAL
 AUhtP5rQgbeMAKeU1nWKwaoMwweILPZ2yHEw
X-Google-Smtp-Source: AMrXdXtT60/8GtRWd8hZMJF0++piRHnN0vKyOb7Gtm8wuqt8/65BiJwdpLnCYqQBiXaNt6xnJ2B4bQ==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id
 o15-20020a05600c4fcf00b003d1d3961ademr45806891wmq.9.1673265212398; 
 Mon, 09 Jan 2023 03:53:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm10568247wmp.11.2023.01.09.03.53.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/13] hw/arm/collie: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:06 +0100
Message-Id: <20230109115316.2235-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
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

IEC binary prefixes ease code review: the unit is explicit.

Add definitions for RAM / Flash / Flash blocksize.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e2793..d59c376e60 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -20,6 +20,10 @@
 #include "cpu.h"
 #include "qom/object.h"
 
+#define RAM_SIZE            (512 * MiB)
+#define FLASH_SIZE          (32 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 struct CollieMachineState {
     MachineState parent;
 
@@ -31,7 +35,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CollieMachineState, COLLIE_MACHINE)
 
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
-    .ram_size = 0x20000000,
+    .ram_size = RAM_SIZE,
 };
 
 static void collie_init(MachineState *machine)
@@ -52,14 +56,14 @@ static void collie_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
+    pflash_cfi01_register(SA_CS0, "collie.fl1", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", 0x02000000,
+    pflash_cfi01_register(SA_CS1, "collie.fl2", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
@@ -75,7 +79,7 @@ static void collie_machine_class_init(ObjectClass *oc, void *data)
     mc->init = collie_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("sa1110");
-    mc->default_ram_size = 0x20000000;
+    mc->default_ram_size = RAM_SIZE;
     mc->default_ram_id = "strongarm.sdram";
 }
 
-- 
2.38.1


