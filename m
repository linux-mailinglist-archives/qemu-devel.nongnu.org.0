Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF06117E2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:46:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSTD-00073S-FZ; Fri, 28 Oct 2022 12:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooST4-0005Rx-LY; Fri, 28 Oct 2022 12:44:26 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooST2-00015n-W2; Fri, 28 Oct 2022 12:44:26 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13bef14ea06so6900299fac.3; 
 Fri, 28 Oct 2022 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImJzp1hsWEWxn7RDCFu354pjfpcN6AfQsBKVOWXk+vQ=;
 b=h7JJ0wEmfXQQmpQnDCCbTzx83y477qmt9sxE6HvKEO6IuFdns3Nw/uALJO2MFhktSS
 SXQ/4H1rlVuoEmltq37cgtqf6k5oc5ASaNyRX4djNDxNz/eWXXpr9uUlxkSFtSgh9o/G
 2OMh9MPBm2d0Zwi/v/pus0/JwP85/43AmOYjl6p8ZWvTLkAhrWLpWj0Mr4j5t7N9x0MC
 2172lFLFZXFOwlkSKFuwcsKwC0gjuMO5/Gz2afWk0GLxHcqLeix7Fdy14aFywt+b5JhX
 UZdNg9iw4NahhDgZvTP2ohngz94+u/oYZ3Sl+rk5zqyMKIexF5107snBEly0VGoFXMi2
 0Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImJzp1hsWEWxn7RDCFu354pjfpcN6AfQsBKVOWXk+vQ=;
 b=Jhvsvz+SnWf/BgxbulvbLrT4JQLAIutb0X8A4I39IyJKMrob+jniYAhWDiqFXTjfeb
 QJMBMHFJc8OdQt6CVJ2WuHdZri1S8RRIlQf9Pp6BEjE4wyMrbgOCEb/JgG8A22sakBh1
 4k/QD6LRwXJTjhf9VKvO4fst/oY9+2xb4gV9wZtys5Wu/zrOK7X1gQet0z0UUME5lPyW
 MXemPHILwLmEsU86oFX7K3z/EkAWr7HQ5BTBy3FNCETCgSOgUZ2/J43aWp0e7f/eqEEU
 wdHOxU789a66zxS5B6n1KzgXtoVItkaKl17OwwEV76z/SM88bnDPG/pQ+HlQJj5zCRC2
 rH2Q==
X-Gm-Message-State: ACrzQf2oa2ZT7YzJQZVb690CDM92r/GYpM8BIiEppXkni8pW8tuTsQ0y
 /ELS8Hwre1dDJ/xRz4QFLyLDsyiuuzqamQ==
X-Google-Smtp-Source: AMsMyM4vB3zxqskMjPD8kmtHVGGzB6H8JlXB5HnGi4GO1ySmJHot7MMjD/RzvnhKvy2Zyw3wJKRhKQ==
X-Received: by 2002:a05:6870:e88a:b0:13b:6e13:a9a5 with SMTP id
 q10-20020a056870e88a00b0013b6e13a9a5mr31866oan.264.1666975463257; 
 Fri, 28 Oct 2022 09:44:23 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 59/62] hw/block/pflash_cfi0{1,
 2}: Error out if device length isn't a power of two
Date: Fri, 28 Oct 2022 13:39:48 -0300
Message-Id: <20221028163951.810456-60-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

According to the JEDEC standard the device length is communicated to an
OS as an exponent (power of two).

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221018210146.193159-3-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 hw/block/pflash_cfi02.c | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..9c235bf66e 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,6 +708,10 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
+    if (!is_power_of_2(device_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -865,7 +869,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl);
+    pflash_cfi01_fill_cfi_table(pfl, errp);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..ff2fe154c1 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -880,6 +880,11 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!is_power_of_2(pfl->chip_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
+
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
                                   pfl->chip_len, errp);
-- 
2.37.3


