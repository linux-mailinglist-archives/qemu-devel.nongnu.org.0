Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D11F363F2D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:50:56 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQYR-00006x-E9
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRp-0002Mt-CJ; Mon, 19 Apr 2021 05:44:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRn-0003Bl-9f; Mon, 19 Apr 2021 05:44:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so33245390wrw.10;
 Mon, 19 Apr 2021 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqJkbva3nWlGVisZauccBxQqniG/+dNtVwIMgiK+D8E=;
 b=ScDU8W3y7FWGoQwe6oNdG5PGWV26vCKPJnrM+JgNAUKVEuVFzwDxoiErhqOeddpMXz
 Bt+TGbJbU8jZm16KP7/u/54rFLelgE7a12kYy18rePaqQzXY57IDKH6T9Xir35akER8C
 UPrU+6zZNeviPglxy45BrGBImFJfcWeBTU778i1B7HFA8l18Syqgs9KWTxXDtzEcjyl/
 kxIKir0YIyEBzazSOQgKNOmpLSZLypvU/cKJ5rqqHZsLeFUb1I4ijt13n1hpEnUQGmzw
 V4k82i4zarLfotUa0pT3Int1Swy7XMg34nUplr7QqQrOhiEbn0KiyLIdK08r5iDHeP67
 X1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XqJkbva3nWlGVisZauccBxQqniG/+dNtVwIMgiK+D8E=;
 b=Ow7ur6dpXD8AFZ0aYACCRseJaFbcOATHgzw5w5obz8w+eSRQnhpBSVOnSg01ZtrEGt
 KQ9iG7DT0Wvf8Uc2Q2z3ArH578YL7d2UBQKNJ3cHfWLTQCFCe280DxAf9/WtGkJk2sAm
 Mn+qj6jBq7zLG9CRLIIzW/Lo7QSSkQk0uWiqEjlJtTOm5mIDFpeA7+5B+bK+ytjHiCHY
 Wdv53J3LN6GXq/PbU8xg4M9en3owoN8sPolXIbZuZCSK8e1diENw2zKXOGDEUMwP8Fn2
 kLRnj4xeE+ndhLLilIxt4gCcPs7Aj0H+aRYHjXltO51WoBUJvET7Ivy1AdYQTw+DOxD4
 wmqA==
X-Gm-Message-State: AOAM531jyPKbZFNMh5ykDonoIT1qrZGvqmv1rvdbLNwwNai5sMU64c8S
 jg9yX/opI1GqDcUxXV3EwRVdJLWHB5YVsA==
X-Google-Smtp-Source: ABdhPJxDNzAie/xkljMs8nVK1paL6FhtNGmapR42BXWOW/csOVeM4tGLEh01VW+IjzMId+CHcQLnOA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr13740886wrr.118.1618825441124; 
 Mon, 19 Apr 2021 02:44:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h17sm21813663wru.67.2021.04.19.02.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:44:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] hw/block/pflash_cfi02: Remove pflash_setup_mappings()
Date: Mon, 19 Apr 2021 11:43:28 +0200
Message-Id: <20210419094329.1402767-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org,
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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
2.26.3


