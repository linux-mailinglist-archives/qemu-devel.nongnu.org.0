Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284962EBD73
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:08:07 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7bi-00063N-5z
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Zc-0004d7-Ie; Wed, 06 Jan 2021 07:05:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57836
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZX-00029k-Pp; Wed, 06 Jan 2021 07:05:55 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZX-0006Sn-M1; Wed, 06 Jan 2021 12:05:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  6 Jan 2021 12:05:23 +0000
Message-Id: <20210106120526.29857-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
References: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 1/4] hw/timer/slavio_timer: Allow 64-bit accesses
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Yap KV <yapkv@yahoo.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the "NCR89C105 Chip Specification" referenced in the header:

                  Chip-level Address Map

  ------------------------------------------------------------------
  | 1D0 0000 ->   | Counter/Timers                        | W,D    |
  |   1DF FFFF    |                                       |        |
  ...

  The address map indicated the allowed accesses at each address.
  [...] W indicates a word access, and D indicates a double-word
  access.

The SLAVIO timer controller is implemented expecting 32-bit accesses.
Commit a3d12d073e1 restricted the memory accesses to 32-bit, while
the device allows 64-bit accesses.

This was not an issue until commit 5d971f9e67 which reverted
("memory: accept mismatching sizes in memory_region_access_valid").

Fix by renaming .valid MemoryRegionOps as .impl, and add the valid
access range (W -> 4, D -> 8).

Since commit 21786c7e598 ("memory: Log invalid memory accesses")
this class of bug can be quickly debugged displaying 'guest_errors'
accesses, as:

  $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio -d guest_errors

  Power-ON Reset
  Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid size (min:4 max:4)

  $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdio -S
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      ...
      0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
             ^^^^^^^^^                                 ^^^^^^^
                   \ memory region base address and name /

  (qemu) info qtree
  bus: main-system-bus
    dev: slavio_timer, id ""              <-- device type name
      gpio-out "sysbus-irq" 17
      num_cpus = 1 (0x1)
      mmio 0000000ff1310000/0000000000000014
      mmio 0000000ff1300000/0000000000000010 <--- base address
      mmio 0000000ff1301000/0000000000000010
      mmio 0000000ff1302000/0000000000000010
      ...

Reported-by: Yap KV <yapkv@yahoo.com>
Buglink: https://bugs.launchpad.net/bugs/1906905
Fixes: a3d12d073e1 ("slavio_timer: convert to memory API")
CC: qemu-stable@nongnu.org
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201205150903.3062711-1-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/timer/slavio_timer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 5b2d20cb6a..03e33fc592 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops = {
     .write = slavio_timer_mem_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-- 
2.20.1


