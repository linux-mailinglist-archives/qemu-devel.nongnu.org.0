Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BA5FBCA6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:08:48 +0200 (CEST)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMUZ-0006l2-Ab
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9o-0004gg-DE
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:23 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9m-0001RP-UF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 665DEB811DC;
 Tue, 11 Oct 2022 20:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CB0C433D6;
 Tue, 11 Oct 2022 20:47:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="K5j5gYAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EkhBRNs3ukPCBFv1j1L2drncesLGhbPVoE8IvVGFYU=;
 b=K5j5gYAqLPT69sHMNpGPGDwxAAgtSKcyA+82lehoeynlHUSASabkuK7thhe2hW/yZ/lEiK
 EQNvi8p51Wuk8uP6QRZuWZ5fKXBq1g7ZKl3b8JyGd/9WHsbdC6+Ow4ohCdn+PPU4LHKAEq
 awSg7BDY2te4fV2xP4x0eKJu3uU5QBw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ebbc356
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:47:14 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 5/8] rx: re-randomize rng-seed on reboot
Date: Tue, 11 Oct 2022 14:46:42 -0600
Message-Id: <20221011204645.1160916-6-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/rx/rx-gdbsim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 8ffe1b8035..198d048964 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -25,6 +25,7 @@
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/reset.h"
 #include "hw/boards.h"
 #include "qom/object.h"
 
@@ -148,6 +149,8 @@ static void rx_gdbsim_init(MachineState *machine)
             dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
+            qemu_register_reset(qemu_fdt_randomize_seeds,
+                                rom_ptr(SDRAM_BASE + dtb_offset, dtb_size));
             /* Set dtb address to R1 */
             RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
         }
-- 
2.37.3


