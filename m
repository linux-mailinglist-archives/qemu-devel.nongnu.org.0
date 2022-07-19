Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC3579AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:22:06 +0200 (CEST)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmEn-0008KM-9q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDmDU-0006vl-8W
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:20:44 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:52006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDmDS-0003CK-Cc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:20:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6533A6158C;
 Tue, 19 Jul 2022 12:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46D6C341CA;
 Tue, 19 Jul 2022 12:20:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fbW0uINw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658233239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kUxOG0c6xR3PlPaWiKzu4kgsZ22wZWNFEtZFCWtbGvE=;
 b=fbW0uINw6HLHzKdR3VDlktxp0Gn06LDzCicmiKmsLPVZ6KISRqcK+f7kkJ6JzWO+k9y8Gy
 raIrwjJm/otg3rHCkFOrhXrkQKAQ0bLukM5ZOArPlVGYlizqG+1L6VV5oyLbJ7DaNXYXvj
 UJEVuY83fWMJ/p8cyWJLLByT0lgUsQU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ead9de90
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 12:20:39 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH] hw/rx: pass random seed to fdt
Date: Tue, 19 Jul 2022 14:20:33 +0200
Message-Id: <20220719122033.135902-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/rx/rx-gdbsim.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index be147b4bd9..8ffe1b8035 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
@@ -83,6 +84,7 @@ static void rx_gdbsim_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     const char *kernel_filename = machine->kernel_filename;
     const char *dtb_filename = machine->dtb;
+    uint8_t rng_seed[32];
 
     if (machine->ram_size < mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -140,6 +142,8 @@ static void rx_gdbsim_init(MachineState *machine)
                 error_report("Couldn't set /chosen/bootargs");
                 exit(1);
             }
+            qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+            qemu_fdt_setprop(dtb, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
             /* DTB is located at the end of SDRAM space. */
             dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
-- 
2.35.1


