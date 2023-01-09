Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C6662565
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqyB-0000Ff-11; Mon, 09 Jan 2023 07:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqy8-0000FF-GL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqy5-00065p-RL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso2156944wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXP1F7lSakDxBjs/lpI6jI9ho7Qb2JPzan4/9u1RAoM=;
 b=tJJnj7We1DXEUx6PXgyaHglsKQLNF5WCK/hHjEr1JYDcQfZ7qlzaF/ieeqEI+29u9q
 CRwcIT9h+TN+ty5MVW1O1W6kA/PMpzmhv7SB4lrhn5Qi6lgPTQ2g/anbmwbQvmDUClFZ
 X66Lu5GANnBt/edUrzWTvpFK64PcT/LbJJei3cbQwTqxh0t8y31WhhsmCEcVYOwAet0q
 fjf5SYmySxOIB/UalenF7wbiWeqzK6UHW94FzSDlYTPMyd2U/GqTziC/aDT7W2L7ShKj
 f+nBHFvr6ErADL4hLdK3CFauCmRMpdarhYmckLZw86zVKHvj6DJxyzAh3MwUrDj5NWNx
 aFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXP1F7lSakDxBjs/lpI6jI9ho7Qb2JPzan4/9u1RAoM=;
 b=Jo7DwYfQehdeZrjQ56nfSVQ4V/92UpejEwM05/P+gjdvy6KvRtN0oIarvK/uc0Rzai
 dLjZNxuGtLhSTxDNxQ5Bu2yepMRzTzyj2hxxTC2QF3YdcDR2xDl/88NtIqjnjNjzBwuh
 sXPeeXGuV2woaY7VZY1lsJCnqqI5ObKlQLOr4Tj+MvZjKPaI3hoWgbp9hgsQG/mK9pOk
 jBvbygjCz74YPcIMHLoWcxz5kzr6BOLQondi01BidiToRlXHI/t9d0k7GDZcL0YZbwV1
 TUlr4nXsQtKCnpQ7me8F/x9XE83xT6U+MqEWH9QBZc70wzt8LGmQtiXEAVAuqMeQbMIX
 gphg==
X-Gm-Message-State: AFqh2kqUHKsNq/x1UJszP92/bFat1CxHUwmNy0TAYzBnOw2qQ4eT72Gt
 ZmxbpkKx9UDA7kayRtzFkqUqN4HNnRi9FdfX
X-Google-Smtp-Source: AMrXdXtYlD4nd9L3HIdCkCrugvoGyl5mvIAv9cL5b98e/0XLZWcQFbu2P1IcRkP49rtgl1BU36vrww==
X-Received: by 2002:a05:600c:a13:b0:3d0:2485:c046 with SMTP id
 z19-20020a05600c0a1300b003d02485c046mr45569859wmp.27.1673266172325; 
 Mon, 09 Jan 2023 04:09:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d534a000000b00272c0767b4asm8393000wrv.109.2023.01.09.04.09.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/21] hw/arm/musicpal: Open-code pflash_cfi02_register()
Date: Mon,  9 Jan 2023 13:08:24 +0100
Message-Id: <20230109120833.3330-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi02_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 73e2b7e4ce..b5f2b9d9de 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1278,12 +1278,21 @@ static void musicpal_init(MachineState *machine)
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, FLASH_SECTOR_SIZE,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 0);
+        dev = qdev_new(TYPE_PFLASH_CFI02);
+        qdev_prop_set_string(dev, "name", "musicpal.flash");
+        qdev_prop_set_drive(dev, "drive", blk);
+        qdev_prop_set_uint32(dev, "num-blocks", flash_size / FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
+        qdev_prop_set_uint8(dev, "device-width", 2);
+        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
+        qdev_prop_set_uint8(dev, "big-endian", false);
+        qdev_prop_set_uint16(dev, "id0", 0x00bf);
+        qdev_prop_set_uint16(dev, "id1", 0x236d);
+        qdev_prop_set_uint16(dev, "unlock-addr0", 0x5555);
+        qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aaa);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                        0x100000000ULL - MP_FLASH_SIZE_MAX);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
-- 
2.38.1


