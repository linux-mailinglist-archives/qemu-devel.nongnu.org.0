Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D8579999
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:05:08 +0200 (CEST)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlyI-0000BT-O6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDluy-0005SG-I7
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:01:37 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:34554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDlup-0000G5-W6
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:01:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 968EE616F7;
 Tue, 19 Jul 2022 12:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7DCC341C6;
 Tue, 19 Jul 2022 12:01:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ive/nGyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658232078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jZ5kTD2Mf2bJvwjR0NikatRL1MEqfTCkEepxsPTGPhw=;
 b=Ive/nGyhXN+PjO7YDTc8XZf2K3kBrngzeYh7F7e6P1FyD4CQYukH7vAD51jvF0JADBzXVv
 PMUp6l9K+1gKR/V8GnADY+FXlN2YUZWMr46hFWoSpQi9wbySBBLqw92COm9f3BrDwnHQo8
 UEXjTz7fZQgtJp9jkrIflyy5U6x4/K4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c6482847
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 12:01:17 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH] hw/nios2: virt: pass random seed to fdt
Date: Tue, 19 Jul 2022 14:01:13 +0200
Message-Id: <20220719120113.118034-1-Jason@zx2c4.com>
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

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/nios2/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 07b8d87633..21cbffff47 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -34,6 +34,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -83,6 +84,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     int fdt_size;
     void *fdt = NULL;
     int r;
+    uint8_t rng_seed[32];
 
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
@@ -91,6 +93,9 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
         return 0;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kernel_cmdline) {
         r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
-- 
2.35.1


