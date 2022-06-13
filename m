Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB2548511
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:12:26 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ivh-0006I9-6o
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org>)
 id 1o0iiE-00069v-6d
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:58:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:59602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org>)
 id 1o0iiC-0005Eu-7J
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:58:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D24956066C;
 Mon, 13 Jun 2022 11:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B7BC34114;
 Mon, 13 Jun 2022 11:58:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fm7oK05U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655121503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ME8foANe4NGq9pIZB6M6Y18izeH/M38NnF1sNfInpVI=;
 b=fm7oK05U0KhIl1bUo6NJq87OU+FXJ5JHTfG7jmRTNIOyz6hZYdwwClIL3/QpGFfSLdOvBa
 QNb8WD4qn3Qao+phVZJgL5XbtCAZiPUfCRwARmUt6u5Jn8u0rzDJmGJ/ohnY0lKL+9eb9T
 fD5jEcHh1ec0wLIhiUjVDyzeazUVfx0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eafa095f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Jun 2022 11:58:22 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] hw/riscv: virt: pass random seed to fdt
Date: Mon, 13 Jun 2022 13:58:10 +0200
Message-Id: <20220613115810.178210-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org;
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
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Cc: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/riscv/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..368a723bf6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
@@ -998,6 +999,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
+    uint8_t rng_seed[32];
 
     if (mc->dtb) {
         mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -1046,6 +1048,10 @@ update_bootargs:
     if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
     }
+
+    /* Pass seed to RNG. */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-- 
2.35.1


