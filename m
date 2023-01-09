Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9D6626C8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqz4-0000cB-BK; Mon, 09 Jan 2023 07:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyn-0000US-NT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:19 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyj-00075j-Te
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id z5so6873536wrt.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQ5ASrGaNWsN6DpEPRppXsFKltp3KdI23QpZkfV//Sk=;
 b=upJZb1eD8JaPoGdmoCWTf0TpmPHJ0MC9/P7h+KSI6ZV0vN2oWKamdQaOJCir2QR/8+
 nxb/KxoseEqdtvqdTn7GwEvleaggxf1k/cGOQbPJ8p7ebV/pWYL1HRE290g2eXMZlO+Q
 Om+hZB88tCjZnQvVCBGTEFqXX6ZDWGgmra9jDmHIzetUHtqlevzxK+h8orWsNgsw0Rn2
 HzRr67mUZTBMOgYE7xn+o7PAcvJdM14JTKGfIoQQV7qfPKTF+FRhl8pQg6ga53ZR5U08
 om8q3OMdtubU7AKKZS3MYwHIqLOxB1j8HzjtNtMqes9LP6ZykdoiBb1vwAvefSRPPy63
 j2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQ5ASrGaNWsN6DpEPRppXsFKltp3KdI23QpZkfV//Sk=;
 b=VVKluF0/tnFAaWUyrsdNIFES5D/hYV16MuO4yfJ2mA7E8LcYT4H2O9vnQ3nujeLgtE
 l0naIw2UFijlNMtNetlEBOTANi3ViXk9F1MpgT/b57r2h2O3xofqjcaxR9ST6vqDuEJt
 8Qgb71RU2reHvlB4BBVafQ390Am71+mDaYAcmXDMpal1gL5xM6raxr2EhCEr252RAu7o
 bA1HswOTmXTU+1mkn/XahguogJyWzw5gSUKSdqws5ZV4eIv2KL7V/zirKJ8j+xGWlaXo
 UKxJzIrdHC1CxkLQs47iuteA3G5ho6FUoxqY6wl9f7FhZ9lhAsXXsmsCHaWy8N5haAMB
 jIWA==
X-Gm-Message-State: AFqh2kqbRIqckIKsCxOdKYcJrPLgFSIPqb/OT6kDi2LUsuaQnaRk6oLA
 oWCqTnHKzprnycst+Dz1kSWGfUSCvhJsPQyV
X-Google-Smtp-Source: AMrXdXtr2775RJAVW6TqSye0zyvW030j3hIOSFpBphhzJFf6VW7paWmJF7TAGp+Ai4/FzB4TXedzuA==
X-Received: by 2002:a5d:4f05:0:b0:28c:6430:c1bc with SMTP id
 c5-20020a5d4f05000000b0028c6430c1bcmr23392843wru.3.1673266211224; 
 Mon, 09 Jan 2023 04:10:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a5d457a000000b0028e8693bb75sm9712113wrc.63.2023.01.09.04.10.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:10:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 20/21] hw/block: Remove unused pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:08:32 +0100
Message-Id: <20230109120833.3330-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

We converted all caller of pflash_cfi01_register() by open
coding a call to pflash_cfi01_create() followed by an explicit
call to sysbus_mmio_map(); we can now remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi01.c  | 31 -------------------------------
 include/hw/block/flash.h | 10 ----------
 2 files changed, 41 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 866ea596ea..4e74c9e0d9 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -953,37 +953,6 @@ static void pflash_cfi01_register_types(void)
 
 type_init(pflash_cfi01_register_types)
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int bank_width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be)
-{
-    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
-
-    if (blk) {
-        qdev_prop_set_drive(dev, "drive", blk);
-    }
-    assert(QEMU_IS_ALIGNED(size, sector_len));
-    qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
-    qdev_prop_set_uint64(dev, "sector-length", sector_len);
-    qdev_prop_set_uint8(dev, "width", bank_width);
-    qdev_prop_set_bit(dev, "big-endian", !!be);
-    qdev_prop_set_uint16(dev, "id0", id0);
-    qdev_prop_set_uint16(dev, "id1", id1);
-    qdev_prop_set_uint16(dev, "id2", id2);
-    qdev_prop_set_uint16(dev, "id3", id3);
-    qdev_prop_set_string(dev, "name", name);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return PFLASH_CFI01(dev);
-}
-
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
 {
     PFlashCFI01 *fl = PFLASH_CFI01(dev);
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index aeec4a369b..20e5424525 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -11,20 +11,10 @@
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
-
 /* nand.c */
 DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id);
 void nand_setpins(DeviceState *dev, uint8_t cle, uint8_t ale,
-- 
2.38.1


