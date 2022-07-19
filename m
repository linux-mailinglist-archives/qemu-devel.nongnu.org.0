Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E82579A1D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:10:58 +0200 (CEST)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm41-0004os-Hs
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDm26-0003CN-3n
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:08:58 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:42058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDm22-0001Eb-64
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:08:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 138C8B81B37;
 Tue, 19 Jul 2022 12:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64746C341CA;
 Tue, 19 Jul 2022 12:08:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="imhNcQVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658232528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Lb05Ba/T2F9BL0mRC3QwpHj3oy/QFJoGqEy1OTcJM4=;
 b=imhNcQVhNUPx278PoImlhLO9LXgAeF1VLIk6WP2yEGvEwVNkHUNzac/1CDGfNmYakMMCiS
 oZouDMkE1+qg190rjnM4rd82U71oDHFJzig5NEAhzYgf3AbmMvzjJKnHGjzyi9+LjTBt3R
 6LHUMNjkaRhWo6GTtX2RAYOIjIjkSO0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9307ff5c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 12:08:48 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/mips: boston: pass random seed to fdt
Date: Tue, 19 Jul 2022 14:08:43 +0200
Message-Id: <20220719120843.134392-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

I'd do the same for other MIPS platforms but boston is the only one that
seems to use FDT.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/mips/boston.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1debca18ec..d2ab9da1a0 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
@@ -363,6 +364,7 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
     size_t ram_low_sz, ram_high_sz;
     size_t fdt_sz = fdt_totalsize(fdt_orig) * 2;
     g_autofree void *fdt = g_malloc0(fdt_sz);
+    uint8_t rng_seed[32];
 
     err = fdt_open_into(fdt_orig, fdt, fdt_sz);
     if (err) {
@@ -370,6 +372,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
         return NULL;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     cmdline = (machine->kernel_cmdline && machine->kernel_cmdline[0])
             ? machine->kernel_cmdline : " ";
     err = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-- 
2.35.1


