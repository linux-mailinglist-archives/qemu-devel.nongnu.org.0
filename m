Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CEC349E1C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:39:54 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaW1-0007K5-KJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKc-0002n3-8f; Thu, 25 Mar 2021 20:28:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKa-0004Bb-Mg; Thu, 25 Mar 2021 20:28:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso4035332wmq.1; 
 Thu, 25 Mar 2021 17:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJbcGY6sOvOVraPquf/gluBsf0D+iYUyhVli41P2iL8=;
 b=QavHjpPUU/2FTrNGn+BNIYCIvSckEOAjdO1WvSBeaip7H1mVUFLLisbh1i/Z0/73gP
 3GfhCvlwYq1zpN5UtUW2Cvc8Bo4R+FbIVaconwCJZYTkfUJRkhFfXz41v60Aaopnh+0A
 wKpcAkarUjmjvn+uP4OExdtLGJ+iaaB0j69Qx3JnFFGP38SGGWZu22Wvqhp+msEnxOOz
 4XT/3m/wChvdP3fYiML2p3JHQoOgie3VeqcSJOcA5gk9vHCvsfj+2qxFVj2jtVtDbX7g
 jd34gix/Q+at6nXkHgrV90bQ4ZCHjSRYEDG4lvk5HwD8VpRV+oVNc7MXKkaxje2ZNxka
 t8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dJbcGY6sOvOVraPquf/gluBsf0D+iYUyhVli41P2iL8=;
 b=geRLiHGzu4OIh/hvmB5KKGjUBnIPsnC2GzPqij3tZxHmiyBWGUpQuGMEthgtrI2IOP
 yYCV0h0hOJl+7ar9rFyV3+AnNEJQP+zpDPMpwrFwWu1YseFQU+hvhoiipJjDGsJj0cva
 O0FATam3hohFAHc82fLurAhgRJkny//Q3n7ZF29YYQRW0ApLp3I9JTQac5H/PbYB4Ms3
 QcRVmGne3ow+PJk6j5jQRaVH6D3VlO18b1tDhz8PbzrPRZf7aKNWGFe/Gf1EpqOQf0GB
 oKjtzcJEhQexFDHe4uu44EGa0gReCRTNGg+c/pqllf2FHPb65DcKhzEiPO02krfqAgTw
 b2vQ==
X-Gm-Message-State: AOAM532QLeTGvhGIpsv+Ijzrl+bbgF/MWV2FyGZwQOV1WCLfrp3J1D+G
 k9uvVESmTIxZMir5ltRiL32zsegbZlUT0A==
X-Google-Smtp-Source: ABdhPJzAxyJzBhSmyfeQ71RrGp7Fb6STCrZIx7mGw3rdXekioUzmFk44J8ZOW7GI0HCYiSPxwUd1NQ==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr10654555wmh.152.1616718481720; 
 Thu, 25 Mar 2021 17:28:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a13sm9524931wrp.31.2021.03.25.17.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 06/10] hw/block/pflash_cfi02: Remove
 pflash_setup_mappings()
Date: Fri, 26 Mar 2021 01:27:24 +0100
Message-Id: <20210326002728.1069834-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All boards calling pflash_cfi02_register() use nb_mappings=1,
which does not do any mapping:

  $ git grep -wl pflash_cfi02_register hw/
  hw/arm/xilinx_zynq.c
  hw/block/pflash_cfi02.c
  hw/lm32/lm32_boards.c
  hw/ppc/ppc405_boards.c
  hw/sh4/r2d.c

We can remove this now unneeded code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi02.c | 35 ++---------------------------------
 1 file changed, 2 insertions(+), 33 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 02c514fb6e0..6f4b3e3c3fe 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -75,7 +75,6 @@ struct PFlashCFI02 {
     uint32_t nb_blocs[PFLASH_MAX_ERASE_REGIONS];
     uint32_t sector_len[PFLASH_MAX_ERASE_REGIONS];
     uint32_t chip_len;
-    uint8_t mappings;
     uint8_t width;
     uint8_t be;
     int wcycle; /* if 0, the flash is read normally */
@@ -92,13 +91,6 @@ struct PFlashCFI02 {
     uint16_t unlock_addr1;
     uint8_t cfi_table[0x4d];
     QEMUTimer timer;
-    /*
-     * The device replicates the flash memory across its memory space.  Emulate
-     * that by having a container (.mem) filled with an array of aliases
-     * (.mem_mappings) pointing to the flash memory (.orig_mem).
-     */
-    MemoryRegion mem;
-    MemoryRegion *mem_mappings;    /* array; one per mapping */
     MemoryRegion orig_mem;
     bool rom_mode;
     int read_counter; /* used for lazy switch-back to rom mode */
@@ -158,23 +150,6 @@ static inline void toggle_dq2(PFlashCFI02 *pfl)
     pfl->status ^= 0x04;
 }
 
-/*
- * Set up replicated mappings of the same region.
- */
-static void pflash_setup_mappings(PFlashCFI02 *pfl)
-{
-    unsigned i;
-    hwaddr size = memory_region_size(&pfl->orig_mem);
-
-    memory_region_init(&pfl->mem, OBJECT(pfl), "pflash", pfl->mappings * size);
-    pfl->mem_mappings = g_new(MemoryRegion, pfl->mappings);
-    for (i = 0; i < pfl->mappings; ++i) {
-        memory_region_init_alias(&pfl->mem_mappings[i], OBJECT(pfl),
-                                 "pflash-alias", &pfl->orig_mem, 0, size);
-        memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
-    }
-}
-
 static void pflash_reset_state_machine(PFlashCFI02 *pfl)
 {
     trace_pflash_reset(pfl->name);
@@ -917,12 +892,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pfl->rom_mode = true;
-    if (pfl->mappings > 1) {
-        pflash_setup_mappings(pfl);
-        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-    } else {
-        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
-    }
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->status = 0;
@@ -950,7 +920,6 @@ static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
     DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
     DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
-    DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
     DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
     DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
     DEFINE_PROP_UINT16("id1", PFlashCFI02, ident1, 0),
@@ -1008,6 +977,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
 
+    assert(nb_mappings <= 1);
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk);
     }
@@ -1015,7 +985,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint32(dev, "sector-length", sector_len);
     qdev_prop_set_uint8(dev, "width", width);
-    qdev_prop_set_uint8(dev, "mappings", nb_mappings);
     qdev_prop_set_uint8(dev, "big-endian", !!be);
     qdev_prop_set_uint16(dev, "id0", id0);
     qdev_prop_set_uint16(dev, "id1", id1);
-- 
2.26.2


