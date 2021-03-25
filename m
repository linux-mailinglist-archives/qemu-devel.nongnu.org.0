Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B167B3491A9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:13:28 +0100 (CET)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOrf-0005JU-Qv
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOnx-0002tJ-NI; Thu, 25 Mar 2021 08:09:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOnv-0004Y0-Ll; Thu, 25 Mar 2021 08:09:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2950337wmy.5; 
 Thu, 25 Mar 2021 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zthFndrHM90uXxVlKArqDHUMBufeNV9n6j9hp9i1NSI=;
 b=Cgch3h0vxvrnROici56adJ/Pq1JHh5d00EwPRiE9Iis0KkLZ7dd/gcAyyTq9So8DLO
 C8HKwCwVHFLywpNT/QYAl7QSc74i93zehlycyfdrlwWFfPoZWeo8lYPtYpI9PixGeZpD
 IOp45kKJSpaOKmHJyrnkCTiItgOvoNq7cvz5N+EJujMvOuv1c6qFL1BEW2C+uTGVBSbQ
 fqKxdby1ywC74UCGwYIt4cwddTE+TSPFosJJwF8nNem9OOezgcBAZyAEAtwASvyTBw9F
 A0IBk1bsGaB8fElVD4EI17/cAGfOb8SohiIwtNmhquRfVC7eom+ZElWu1osq/sHAkUCK
 POKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zthFndrHM90uXxVlKArqDHUMBufeNV9n6j9hp9i1NSI=;
 b=GPwd2VMXlRci6C4CPqV9EvkM4IAkxzUWeJhfeBGV/0wDSadCxUYQHNvCqmklL8omoK
 CKM6vL+YKRfUGvKsYFVgQSgypObQR5saIFdkrjfkL23F4PgEqjjiDUwJjZVUX/za/br3
 w+J69/WhLYQ3zxzvdTIq20YXwFESLyeAdU3GxEXVJaZf4QWEu5cm5G3ZmKVy5YYHzzJE
 Jr7K2m+mdBeFRG97ou8uYQ8nFTnC+wsag8VIgxIwFM3FgKotYKb9E1MBAlLQV0D6j2/o
 yZwlYpawuGPeFKLvsctdhpJLXwdAJiTlY4fn2K7mHic6bCx2rEPBGZsRKk1qW3v0cmah
 Qang==
X-Gm-Message-State: AOAM533krdMWZz69vjwhh2Af83j6zCzh+0fQwAShf2T2C4OUVEkqSzWz
 hjrHjYC0ppPp77OXhV63jFF73fYCLushrw==
X-Google-Smtp-Source: ABdhPJx4BNu1OiNs7JVdcsEY0jyquN7HOC8QSbFKSCYaH/B+Ol7S0IcSLEWIOc+JSt1PtzP9YKcVeA==
X-Received: by 2002:a1c:600a:: with SMTP id u10mr7693491wmb.139.1616674172571; 
 Thu, 25 Mar 2021 05:09:32 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w22sm6129608wmi.22.2021.03.25.05.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:09:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 2/2] hw/block/pflash_cfi02: Do not create aliases when
 not necessary
Date: Thu, 25 Mar 2021 13:09:21 +0100
Message-Id: <20210325120921.858993-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210325120921.858993-1-f4bug@amsat.org>
References: <20210325120921.858993-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When no mapping is requested, it is pointless to create
alias regions.
Only create them when multiple mappings are requested to
simplify the memory layout. The flatview is not changed.

For example using 'qemu-system-sh4 -M r2d -S -monitor stdio',

* before:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000000ffffff (prio 0, i/o): pflash
        0000000000000000-0000000000ffffff (prio 0, romd): alias pflash-alias @r2d.flash 0000000000000000-0000000000ffffff
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   Root memory region: system
    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram

* after:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   Root memory region: system
    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi02.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 35e30bb812c..02c514fb6e0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -917,8 +917,12 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pfl->rom_mode = true;
-    pflash_setup_mappings(pfl);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    if (pfl->mappings > 1) {
+        pflash_setup_mappings(pfl);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    } else {
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
+    }
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->status = 0;
-- 
2.26.2


