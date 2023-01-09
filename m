Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E4166251B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:10:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqyJ-0000Hp-Bt; Mon, 09 Jan 2023 07:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyG-0000Gv-Pj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyF-0006FV-4t
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id m7so7920743wrn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AR2ZUwcAh0vmjYEOu0eNTVNMoV0yrhbxAqfFJUy1vo=;
 b=px3MEXgValMVaRZ/dR0QBv3hiWqXhFErKyPpV+/Y62pefAwG02tZfLyC41YNykXSKI
 P9YHUxjE6iBqlVNHN3zrK69l34MDwxHsv5vSjiWq+K/VrxlxOVzzeEBrq/wYWEEMbiNT
 oyLfM2wbn9KPzaK5Eb0Eag4qhSR7c6PhtWh41iWjb+avIXNGezde+zgSsFyn4aJ1O/si
 olCzVHYaocX06vgwvYd9xbCv0Z+/LjTPIte6xhLWnZYIM5JISZuOVwQ4fImoxuHIRXxX
 7gFZi0HKS5VtN/GNysN/qXyaIFtSeRCbIQMUxiX60LCf0JSwOIAEb3besMJwBeJX1DGW
 qLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6AR2ZUwcAh0vmjYEOu0eNTVNMoV0yrhbxAqfFJUy1vo=;
 b=ulILAjXGpMLmn2vGAFf6CuwpFhR5mA1ZnUQMcMa+ABJPo64OEBpv8soUJW6qUyFRdJ
 J4tT9Wb2zyUkn1eeQrwT0JFrmSezj1EKrzTXpHq/ptp3rDgTd30LwqyffPQ0CcnSALAj
 oZX3ZfK15wx//K3cs2MsnbXdtE8k3j0ZhaN4SUQbt0tSVgyCri9D9FxLHG6nwOPZmVKd
 QrE3GAZotGnYivDqpQG7SCHJRTfaKtuRtAPA1/JH/Ad+pCouqS8P9UkVmo3eOXnsElop
 1tnzjsNiW5waiFwWpXr91fxXWFHxwNTI8jEHle/jLgXOuU2ihk5+eBsWuXw5Ks0VlVhs
 FMxA==
X-Gm-Message-State: AFqh2koHgC7ePcMv0YoxqmAlJ6ZMsivIXDholSVsAifhI/K0pivJB8Kt
 f0GVSVzF2jVqox5H4uVDQeN8ce8NpqWcQq1j
X-Google-Smtp-Source: AMrXdXsK7ha3I0ZyZG8LorSCL4xtaPfab0aV72jGoA4wIxfya4TpwolmWihdxmpT9Ca55+ABUNVzCA==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id
 r7-20020adff107000000b0028450505e59mr29079963wro.29.1673266181579; 
 Mon, 09 Jan 2023 04:09:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b002b6667d3adfsm8426733wrb.80.2023.01.09.04.09.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 14/21] hw/block: Remove unused pflash_cfi02_register()
Date: Mon,  9 Jan 2023 13:08:26 +0100
Message-Id: <20230109120833.3330-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

We converted all caller of pflash_cfi02_register() by open
coding a call to pflash_cfi02_create() followed by an explicit
call to sysbus_mmio_map(); we can now remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi02.c  | 36 ------------------------------------
 include/hw/block/flash.h | 13 -------------
 2 files changed, 49 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 55ddd0916c..6168e66d7e 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -993,39 +993,3 @@ static void pflash_cfi02_register_types(void)
 }
 
 type_init(pflash_cfi02_register_types)
-
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int nb_mappings, int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   uint16_t unlock_addr0,
-                                   uint16_t unlock_addr1,
-                                   int be)
-{
-    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
-
-    if (blk) {
-        qdev_prop_set_drive(dev, "drive", blk);
-    }
-    assert(QEMU_IS_ALIGNED(size, sector_len));
-    qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
-    qdev_prop_set_uint32(dev, "sector-length", sector_len);
-    qdev_prop_set_uint8(dev, "device-width", width);
-    qdev_prop_set_uint8(dev, "mappings", nb_mappings);
-    qdev_prop_set_uint8(dev, "big-endian", !!be);
-    qdev_prop_set_uint16(dev, "id0", id0);
-    qdev_prop_set_uint16(dev, "id1", id1);
-    qdev_prop_set_uint16(dev, "id2", id2);
-    qdev_prop_set_uint16(dev, "id3", id3);
-    qdev_prop_set_uint16(dev, "unlock-addr0", unlock_addr0);
-    qdev_prop_set_uint16(dev, "unlock-addr1", unlock_addr1);
-    qdev_prop_set_string(dev, "name", name);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return PFLASH_CFI02(dev);
-}
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 25affdf7a5..d615bf6a53 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -31,19 +31,6 @@ void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
 
-PFlashCFI02 *pflash_cfi02_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int nb_mappings,
-                                   int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   uint16_t unlock_addr0,
-                                   uint16_t unlock_addr1,
-                                   int be);
-
 /* nand.c */
 DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id);
 void nand_setpins(DeviceState *dev, uint8_t cle, uint8_t ale,
-- 
2.38.1


