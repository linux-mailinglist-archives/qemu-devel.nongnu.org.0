Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD1349E0E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:38:51 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaV0-00060C-Dp
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKy-0002vS-SW; Thu, 25 Mar 2021 20:28:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKx-0004M5-3L; Thu, 25 Mar 2021 20:28:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k8so4036913wrc.3;
 Thu, 25 Mar 2021 17:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ac0Y0HtO9B44DC7CRON+B/TUEAbi/V+Fv+F690K+iOg=;
 b=iqmAYl2jN3HWu/A7aUc/pSLgR/GC7FfqN3oJ/B6BTStageD5LUGX4gbKUI/dG/Ks82
 xfRU2YWlsh0jPYeGN3IQ9r6NwDQE3Gt8PBmIstFCsZd5ZXoGNblym8XUcizMEZ5OWbOp
 5ML7PCeKdNPjvyp5jiW+laBZsAPlI85pvMJxbNYzqOBqGbtp34vV/UXG/akuaZ6ih3EV
 X19KPH0ZGvdsOYSpOMJbMfqBt7Loki8qrltW4AlT0At5ksPR28G61rHpX89HJ08duCf2
 0TD/mvUMAqr1ayGfIgVFxEehSqLiUSmLCV1U4oH8iXNsqss9I+6YVMVkEEWtM0Sy6MGl
 kV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ac0Y0HtO9B44DC7CRON+B/TUEAbi/V+Fv+F690K+iOg=;
 b=ajerWKspy8nm5Lp7X3U9AGvFnQycitz0KJG8OhFprjTvr9rp/WSxnK2RqsAb30XNVX
 IVBWZgqcJP2gHFo+Ay0jJOxEi521YIUpZnxCU0EX8WgemWSbRa5GWzsriyCC4r5I+eOG
 0Eu9UhfCiu7tOFyjhEqGvchlS0gbIKol/vQ/tIJ+IN5D8dJl1adD7y9a3fQ+zznLxBDl
 0fJsrznQ5rURUz9adfDKyXTvp+4dc+/prL4TaQmfA8qNVj6Kf87Aap0Eo9mZgw0ibJaC
 B0G3Y8u6GypxfhKfgCByge2Lmk8L+vhbhI3ClAqQpliWvtgio6YSKfdp+CTEUXqjVxu8
 BQMQ==
X-Gm-Message-State: AOAM53192cxlaOmmftyztWurwuXnroYvOS8MBztwtlVt67qPUBJzOZoh
 0LWs1edoOpToE5PGH/kJWvxNE4iF4ImrxQ==
X-Google-Smtp-Source: ABdhPJwzfb/pc3AyVKBgvghDNvg21uDVkExx/Rm2ArpGHOtX8A77e1dWA5XXS0UPZCDGAa1ZGTkHNg==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr11417612wrx.96.1616718502178; 
 Thu, 25 Mar 2021 17:28:22 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a17sm7951026wmj.9.2021.03.25.17.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 10/10] hw/m68k/q800: Map MacIO using
 memory_region_add_subregion_aliased()
Date: Fri, 26 Mar 2021 01:27:28 +0100
Message-Id: <20210326002728.1069834-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the memory and flatview tree is huge, not very practical:

  $ (echo info mtree -f;echo q) \
    | qemu-system-m68k -M q800 -S -monitor stdio \
    | wc -l
  2073

Use the memory_region_add_subregion_aliased() helper to manage the
MacIO aliases under the hood.

- before:

  (qemu) info mtree
  address-space: memory
      0000000000000000-0000000007ffffff (prio 0, ram): m68k_mac.ram
      0000000040800000-00000000408fffff (prio 0, rom): m68k_mac.rom
      0000000050000000-000000005003ffff (prio 0, i/o): alias mac_m68k.io[0] @mac-io 0000000000000000-000000000003ffff
      0000000050040000-000000005007ffff (prio 0, i/o): alias mac_m68k.io[1] @mac-io 0000000000000000-000000000003ffff
      0000000050080000-00000000500bffff (prio 0, i/o): alias mac_m68k.io[2] @mac-io 0000000000000000-000000000003ffff
      ...
      0000000053f40000-0000000053f7ffff (prio 0, i/o): alias mac_m68k.io[253] @mac-io 0000000000000000-000000000003ffff
      0000000053f80000-0000000053fbffff (prio 0, i/o): alias mac_m68k.io[254] @mac-io 0000000000000000-000000000003ffff
      0000000053fc0000-0000000053ffffff (prio 0, i/o): alias mac_m68k.io[255] @mac-io 0000000000000000-000000000003ffff
      0000000060000000-00000000efffffff (prio 0, i/o): nubus-super-slots
      00000000f0000000-00000000feffffff (prio 0, i/o): nubus-slots
        00000000f9000000-00000000f9ffffff (prio 0, i/o): nubus-slot-9
          00000000f9001000-00000000f9400fff (prio 0, ram): macfb-vram
          00000000f9800000-00000000f9800fff (prio 0, i/o): macfb-ctrl
          00000000f9ffffe8-00000000f9ffffeb (prio 0, i/o): nubus-slot-9-rom
          00000000f9ffffec-00000000f9ffffff (prio 0, i/o): nubus-slot-9-format-block

- after:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): m68k_mac.ram
      0000000040800000-00000000408fffff (prio 0, rom): m68k_mac.rom
      0000000050000000-0000000053ffffff (prio 0, i/o): masked mac-io [span of 256 KiB]
      0000000060000000-00000000efffffff (prio 0, i/o): nubus-super-slots
      00000000f0000000-00000000feffffff (prio 0, i/o): nubus-slots
        00000000f9000000-00000000f9ffffff (prio 0, i/o): nubus-slot-9
          00000000f9001000-00000000f9400fff (prio 0, ram): macfb-vram
          00000000f9800000-00000000f9800fff (prio 0, i/o): macfb-ctrl
          00000000f9ffffe8-00000000f9ffffeb (prio 0, i/o): nubus-slot-9-rom
          00000000f9ffffec-00000000f9ffffff (prio 0, i/o): nubus-slot-9-format-block

  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   AS "dp8393x", root: system
   Root memory region: system
    0000000000000000-0000000007ffffff (prio 0, ram): m68k_mac.ram
    0000000040800000-00000000408fffff (prio 0, rom): m68k_mac.rom
    0000000050000000-0000000053ffffff (prio 0, i/o): masked mac-io [span of 256 KiB]
    0000000060000000-00000000efffffff (prio 0, i/o): nubus-super-slots
    00000000f0000000-00000000f9000fff (prio 0, i/o): nubus-slots
    00000000f9001000-00000000f9400fff (prio 0, ram): macfb-vram
    00000000f9401000-00000000f97fffff (prio 0, i/o): nubus-slots @0000000009401000
    00000000f9800000-00000000f9800fff (prio 0, i/o): macfb-ctrl
    00000000f9801000-00000000f9ffffe7 (prio 0, i/o): nubus-slots @0000000009801000
    00000000f9ffffe8-00000000f9ffffeb (prio 0, rom): nubus-slot-9-rom
    00000000f9ffffec-00000000f9ffffff (prio 0, i/o): nubus-slot-9-format-block
    00000000fa000000-00000000feffffff (prio 0, i/o): nubus-slots @000000000a000000

  FlatView #1
   AS "mac-io", root: mac-io
   Root memory region: mac-io
    0000000000000000-0000000000001fff (prio 0, i/o): via1
    0000000000002000-0000000000003fff (prio 0, i/o): via2
    0000000000008000-0000000000008fff (prio 0, rom): dp8393x-prom
    000000000000a000-000000000000a0ff (prio 0, i/o): dp8393x-regs
    000000000000c020-000000000000c027 (prio 0, i/o): escc
    0000000000010000-00000000000100ff (prio 0, i/o): esp-regs
    0000000000010100-0000000000010103 (prio 0, i/o): esp-pdma
    000000000001e000-000000000001ffff (prio 0, i/o): swim

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c  | 15 +++------------
 hw/m68k/Kconfig |  1 +
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 8f14e677077..4ca7e1af08e 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -40,6 +40,7 @@
 #include "standard-headers/asm-m68k/bootinfo.h"
 #include "standard-headers/asm-m68k/bootinfo-mac.h"
 #include "bootinfo.h"
+#include "hw/misc/aliased_region.h"
 #include "hw/misc/mac_via.h"
 #include "hw/input/adb.h"
 #include "hw/nubus/mac-nubus-bridge.h"
@@ -214,9 +215,6 @@ static void q800_init(MachineState *machine)
     int32_t initrd_size;
     MemoryRegion *rom;
     MemoryRegion *macio;
-    MemoryRegion *io;
-    const int io_slice_nb = (IO_SIZE / IO_SLICE);
-    int i;
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
@@ -258,15 +256,8 @@ static void q800_init(MachineState *machine)
      * Memory from IO_BASE to IO_BASE + IO_SLICE is repeated
      * from IO_BASE + IO_SLICE to IO_BASE + IO_SIZE
      */
-    io = g_new(MemoryRegion, io_slice_nb);
-    for (i = 0; i < io_slice_nb; i++) {
-        char *name = g_strdup_printf("mac_m68k.io[%d]", i);
-
-        memory_region_init_alias(&io[i], NULL, name, macio, 0, IO_SLICE);
-        memory_region_add_subregion(get_system_memory(),
-                                    IO_BASE + i * IO_SLICE, &io[i]);
-        g_free(name);
-    }
+    memory_region_add_subregion_aliased(get_system_memory(),
+                                        IO_BASE, IO_SIZE, macio, IO_SLICE);
 
     /* IRQ Glue */
     glue = qdev_new(TYPE_GLUE);
diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
index f839f8a0306..d2e588913b7 100644
--- a/hw/m68k/Kconfig
+++ b/hw/m68k/Kconfig
@@ -23,6 +23,7 @@ config Q800
     select ESP
     select DP8393X
     select OR_IRQ
+    select ALIASED_REGION
 
 config M68K_VIRT
     bool
-- 
2.26.2


