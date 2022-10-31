Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B686134FB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTNG-00052U-JI; Mon, 31 Oct 2022 07:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNE-0004zX-5T
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTN1-00056O-13
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id 5so6982887wmo.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/4JZmuQZ1gB1VY/86Ldup/MWy51zk8s66DoSoeNl6U=;
 b=YSLKwjAgFqL+u/XcX4wkDnPivk1mb/mw+jiwo6SyoHJebi/qiZcUEXGpUeXDVskRKY
 dSJy13kuGnowdavy/tHpnQVRt9aQ0aFzRfjMEQNxNWc+0c0Ck5uvLGK0s73rr2ZKaGrl
 8uT9Ozslfd7gvdafV+wEicz0i84Vdp6QyMEDBYJtCf4/YDOpqvSoBLudRNGYMDWzOnSM
 w8HyceXmtlmjiCHOtmixDtzWHj+BCI5vpeIKF+9KQwuf90KdLxTQeHjUsmk6POhgQuA2
 wL7Z/JDCoyzRBRj3YaNf1xviJvedNbJrlMJ5EcRylDn1hxx884UzyvCo9YPNpQY5rGJH
 VMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1/4JZmuQZ1gB1VY/86Ldup/MWy51zk8s66DoSoeNl6U=;
 b=khnUbjJOQvPl8r9o9NZRmR675HAqph6BSc/iaFxhjEhTQWq/h41xsVnslpOF3BG/As
 IzXe1egwAM7/oh39gEI6nCv8R75/JrCUTWoqS6eIyT39eRbAZw7/ffVxji2YlerKpntz
 FMXSltnMVI4QXnh11j9vJpmWMTvpCM8JM9e9NRq47r7T0EZFLZCjbZuWXpB501ayezcp
 vBeTTif0bNZ1jo+2e1g0ejuEf8qLR3lX0VVdLyA1h8evVYn16TNBne4rrwkZ/J4dpS50
 rVHiyO37RXUcG1dFSHvxUj2hvs4sebGx3ctNeMg5v46vEVhSJv9oclUiTv21yGAHjYr5
 lNOQ==
X-Gm-Message-State: ACrzQf1frgXVHylDuAQD185LWmLvGGREsW9XLoLiPBOH+sblDbVZnuM2
 /kINkZVbQUIVUtOg2bb20uefPmpVn08VoQ==
X-Google-Smtp-Source: AMsMyM7se0dB8f7rNew34GvZL1dTWRVdRSIPZLEXFunhvDMS9DQHKmApV3KXJVtcHnoVMgR0b2Q96Q==
X-Received: by 2002:a05:600c:5546:b0:3cf:5f20:3e13 with SMTP id
 iz6-20020a05600c554600b003cf5f203e13mr7545864wmb.155.1667217261572; 
 Mon, 31 Oct 2022 04:54:21 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b003c6f1732f65sm4757795wmq.38.2022.10.31.04.54.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 3/6] hw/block/pflash_cfi0{1,
 2}: Error out if device length isn't a power of two
Date: Mon, 31 Oct 2022 12:53:59 +0100
Message-Id: <20221031115402.91912-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


