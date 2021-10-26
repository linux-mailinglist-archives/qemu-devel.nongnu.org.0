Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B543B3A8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:10:13 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfN9X-0001hs-Vq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mfN2v-0005CW-Dr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:03:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:34924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mfN2s-0004HA-8j
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:03:20 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2D8D721C73;
 Tue, 26 Oct 2021 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635256992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BqclJZZRg15FIuYnk00yxsNXqQTtRX4Wtzc4xTVBaTI=;
 b=xedduzFCook7E1M/uXPjsBJkMt5mF/sgYLpGTcz15FV/07+7Q7KhzmlkqjRhtoqPx+xqwT
 ULrHSsxuFhVV5KZBBqB91NHDRuavp0QDigyKdWqb3aBj6330Bup3Vpa/GBvWvoI9sUhEAo
 z+Wx8qqImDbYunMgBYMGH+LbzxDZUuI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: 
Subject: [PATCH v2] generic-loader: check that binary file target location
 exists
Date: Tue, 26 Oct 2021 16:03:11 +0200
Message-Id: <20211026140311.158151-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When loading a binary file, we only check if it is smaller than the
ram_size. It does not really check if the file will be loaded at an
existing location (if there is nothing at the target address, it will
"fail" silently later). It prevents loading a binary blob bigger than
ram_size too even if the target location is big enough.

Replace this check by looking for the target memory region size and
prevent loading a bigger file than the available space.

Get rid of "hw/boards.h" include, since we needed it only to access
`current_machine`.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Hi,

This is an updated version implementing what we discussed in v1.

This can be tested easily, eg, using opentitan machine which has a 64K ram
located at 0x10000000.

the following works (we a blob corresponding to the whole ram)
| $ dd bs=1K count=64 if=/dev/zero of=blob.bin
| $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10000000,file=blob.bin

but this command fails because we load a blob which is too big
| $ dd bs=1K count=64 if=/dev/zero of=blob.bin
| $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10001000,file=blob.bin
| qemu-system-riscv32: -device loader,addr=0x10001000,file=blob.bin: Cannot load specified image blob.bin

and this command fails too (we load a blob at an unmapped location)
| $ dd bs=1K count=64 if=/dev/zero of=blob.bin
| $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x0,file=blob.bin
| qemu-system-riscv32: -device loader,addr=0x0,file=blob.bin: Address 0x0 does not exists

Thanks,
Damien

v2:
 + instead of disabling the ram_size check, look for the target

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01077.html

See also the original discussion about generic-loader:
https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html
---
 hw/core/generic-loader.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index d14f932eea..88d3f9fd56 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -34,7 +34,6 @@
 #include "hw/core/cpu.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -153,8 +152,23 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         }
 
         if (size < 0 || s->force_raw) {
-            /* Default to the maximum size being the machine's ram size */
-            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
+            MemoryRegion *root = as ? as->root : get_system_memory();
+            MemoryRegionSection mrs;
+            uint64_t avail = 0;
+
+            mrs = memory_region_find(root, s->addr, 1);
+
+            if (mrs.mr) {
+                avail = int128_get64(mrs.mr->size) - mrs.offset_within_region;
+                memory_region_unref(mrs.mr);
+            } else {
+                error_setg(errp, "Address 0x%" PRIx64 " does not exists",
+                           s->addr);
+                return;
+            }
+
+            /* Limit the file size to the memory region space */
+            size = load_image_targphys_as(s->file, s->addr, avail, as);
         } else {
             s->addr = entry;
         }
-- 
2.33.0


