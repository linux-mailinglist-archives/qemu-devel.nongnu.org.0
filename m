Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770912E0A0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jan 2020 23:00:07 +0100 (CET)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imm29-0000iv-J6
	for lists+qemu-devel@lfdr.de; Wed, 01 Jan 2020 17:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jason@zx2c4.com>) id 1imm1M-0000DV-32
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 16:59:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jason@zx2c4.com>) id 1imm1L-0000sP-0E
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 16:59:16 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:42933)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Jason@zx2c4.com>) id 1imm1K-0000rr-PX
 for qemu-devel@nongnu.org; Wed, 01 Jan 2020 16:59:14 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87978453;
 Wed, 1 Jan 2020 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=mail; bh=auhmAWnYAPQMIKl+85pQj+CnBmw=; b=twsNE1tXdQdwd2Vipdav
 okbaYFrv5ZpLI1cgzIX5vEMUMhZ8rGPbY/T1SJao46TgIKJVkxbUkjowFQ+JVfSb
 kIuNkEufTL+7PS23thQmeRXzCC3bWEJ1bQP1JTp1/gs1dcJpPJnh1VElxgsxyYGZ
 SD0fP6Vy4u80S+X2bclgOlpfReKH0xcYJcevoHKzfsrmKNGG4C0XTeGyr6us+IVD
 CEEjlSvjeXS2L8s02oZnx5FQXYs03oLl4ZperYh+L4FV/FTWv+K5bDJU/7FO7aeo
 niVMUjrp1NUcfrOfuFp6rAjGZysxTvvyZeyegqg0cZe3cDmxxKD+oQcD/40v8Hl6
 eQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 82aa3d3c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 1 Jan 2020 21:00:48 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Subject: [PATCH] q800: map reset function to poweroff of some random kernel
Date: Wed,  1 Jan 2020 22:59:05 +0100
Message-Id: <20200101215905.121298-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.95.5.64
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is intentionally ridiculous. Currently calling
`reboot(RB_AUTOBOOT);` in Linux will result in arch/m68k/mac/misc.c's
mac_reset function being called. That in turn looks at the rombase (or
uses 0x40800000 is there's no rombase), adds 0xa, and jumps to that
address. In the kernels I'm building for build.wireguard.com, I'm using
-no-reboot, which means that reboot=poweroff for me. And on these
kernels, the mac_poweroff function winds up being at 0x7252. So, this
patch here hard codes 0x7252-0xa=0x7248 as the rombase, so that the
reset function calls the poweroff function. The poweroff function then
calls into the working via2 hook. Sorry if this absurd hack offended
your sensibilities. Probably a better solution would be actually mapping
in a real rom and providing something at the 0xa offset, perhaps adding
some reset functionality to via2 and sticking some code there to tinker
with it, or something else.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/q800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4ca8678007..bd75dd3141 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -339,6 +339,7 @@ static void q800_init(MachineState *machine)
         BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW,
                   (graphic_width * graphic_depth + 7) / 8);
         BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
+        BOOTINFO1(cs->as, parameters_base, BI_MAC_ROMBASE, 0x7248);
 
         if (kernel_cmdline) {
             BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
-- 
2.24.1


