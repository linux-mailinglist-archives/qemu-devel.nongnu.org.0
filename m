Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2E5B1915
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:44:23 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWE58-0004Xi-NV
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=K6vw=ZL=zx2c4.com=Jason@kernel.org>)
 id 1oWE1n-0000kK-23
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:40:56 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=K6vw=ZL=zx2c4.com=Jason@kernel.org>)
 id 1oWE1k-00049P-Qg
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:40:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA18461BEA;
 Thu,  8 Sep 2022 09:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AAFC433D6;
 Thu,  8 Sep 2022 09:40:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bXEOXoPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662630040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkSJnWAy7oEZHF4xKCLLejYSRsGJOcH5xU9lXCRibJU=;
 b=bXEOXoPyeYydCXeFsPdVbauAn/hMZTdP83H3NclSCQAAYKS5iPgqsBdpA8+VlgkoJk/mg9
 HyvNbUNAxIrZF0x69ZO5vtswOggPrKdlqjnFCHDprKyUoNCBbdq7Sz9O4z+a/Egqz8mVMn
 9AHdgwOhvgAsRVbl4GZ2K20g7wD51l4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 467704bc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 8 Sep 2022 09:40:40 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH RESEND] hw/microblaze: pass random seed to fdt
Date: Thu,  8 Sep 2022 11:40:30 +0200
Message-Id: <20220908094030.189665-1-Jason@zx2c4.com>
In-Reply-To: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
References: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=K6vw=ZL=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/microblaze/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..25ad54754e 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -30,6 +30,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,
     int fdt_size;
     void *fdt = NULL;
     int r;
+    uint8_t rng_seed[32];
 
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
@@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,
         return 0;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kernel_cmdline) {
         r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
-- 
2.37.3


