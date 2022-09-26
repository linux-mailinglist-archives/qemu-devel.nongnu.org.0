Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAE5EA575
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:03:24 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmpX-0008Kv-A6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocmSM-0006Jo-DS
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:31 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:49146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocmSI-0003Ci-Hp
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A814BB802C5;
 Mon, 26 Sep 2022 11:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA535C433D6;
 Mon, 26 Sep 2022 11:39:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fHlehfB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664192347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lXzhIDK1RBL2t6Qq2MJruzYDdSGZCUBvejE11s/SNqw=;
 b=fHlehfB28A6cHR2RA/QhrJgaDqai6dgDRSyF8gHF7aq6ii7eY1bnfEvrPe3iNudKipuh9Y
 Pm/M2oZNI7KDUnUuMxVOgqFc47vRpAGGooOg1TCzV/rdrXB3n7sHasE0+VbH+CUW31ZZF4
 VZztWpLa9r16pLUnW0ruPjJ+cTqIKtA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a0590cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 26 Sep 2022 11:39:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-m68k@lists.linux-m68k.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH qemu v2 1/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Date: Mon, 26 Sep 2022 13:38:59 +0200
Message-Id: <20220926113900.1256630-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
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

Following a change on the kernel side (see link), pass BI_RNG_SEED
instead of BI_VIRT_RNG_SEED. This should have no impact on
compatibility, as there will simply be no effect if it's an old kernel,
which is how things have always been. We then use this as an opportunity
to add this to q800, since now we can, which is a nice improvement.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Link: https://lore.kernel.org/lkml/20220923170340.4099226-3-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/q800.c                                    | 7 +++++++
 hw/m68k/virt.c                                    | 2 +-
 include/standard-headers/asm-m68k/bootinfo-virt.h | 4 +++-
 include/standard-headers/asm-m68k/bootinfo.h      | 8 +++++++-
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 101ab0f803..9106382066 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -385,6 +386,7 @@ static void q800_init(MachineState *machine)
     NubusBus *nubus;
     DeviceState *glue;
     DriveInfo *dinfo;
+    uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
 
@@ -634,6 +636,11 @@ static void q800_init(MachineState *machine)
                         kernel_cmdline);
         }
 
+	/* Pass seed to RNG. */
+	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+	BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+		     rng_seed, sizeof(rng_seed));
+
         /* load initrd */
         if (initrd_filename) {
             initrd_size = get_image_size(initrd_filename);
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 2f3ffc0de6..7180325e54 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -250,7 +250,7 @@ static void virt_init(MachineState *machine)
 
 	/* Pass seed to RNG. */
 	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
+	BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
 		     rng_seed, sizeof(rng_seed));
 
         /* load initrd */
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 1b1ffd4705..75ac6bbd7d 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,7 +12,9 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
-#define BI_VIRT_RNG_SEED	0x8006
+
+/* No longer used -- replaced with BI_RNG_SEED -- but don't reuse this index:
+ * #define BI_VIRT_RNG_SEED	0x8006 */
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
diff --git a/include/standard-headers/asm-m68k/bootinfo.h b/include/standard-headers/asm-m68k/bootinfo.h
index 7b790e8ec8..b7a8dd2514 100644
--- a/include/standard-headers/asm-m68k/bootinfo.h
+++ b/include/standard-headers/asm-m68k/bootinfo.h
@@ -57,7 +57,13 @@ struct mem_info {
 					/* (struct mem_info) */
 #define BI_COMMAND_LINE		0x0007	/* kernel command line parameters */
 					/* (string) */
-
+/*
+ * A random seed used to initialize the RNG. Record format:
+ *
+ *   - length       [ 2 bytes, 16-bit big endian ]
+ *   - seed data    [ `length` bytes, padded to preserve 4-byte struct alignment ]
+ */
+#define BI_RNG_SEED		0x0008
 
     /*
      *  Linux/m68k Architectures (BI_MACHTYPE)
-- 
2.37.3


