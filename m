Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478ED55B17C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 13:20:20 +0200 (CEST)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5QJP-0007T9-CT
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 07:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7stR=XB=zx2c4.com=Jason@kernel.org>)
 id 1o5QHf-0006ll-DH
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 07:18:31 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7stR=XB=zx2c4.com=Jason@kernel.org>)
 id 1o5QHc-0001vu-91
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 07:18:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1ABA6B80B70;
 Sun, 26 Jun 2022 11:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D75DC34114;
 Sun, 26 Jun 2022 11:18:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NbAA5UI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656242300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzfgHlIFeuW1D38diEU/bncFCWc1XJBbHQtgtN+yKR0=;
 b=NbAA5UI/mdmv02fRLmFjplfSrzw2waO0Df3mDImv4xkBoWjflravhzfOVDmyVXD9YVN+dV
 6MMEs8ULOKeQQaJbMAfow37cphGowbJwtCOR5UuwD58P1T6+YEeJaUldYfXcJxL2TLmDHA
 jiRftgsAAOR/3kcEi/qo3jHw0I/FZeg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0c28cd4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 26 Jun 2022 11:18:20 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] m68k: virt: pass RNG seed via bootinfo block
Date: Sun, 26 Jun 2022 13:18:04 +0200
Message-Id: <20220626111804.330745-1-Jason@zx2c4.com>
In-Reply-To: <9df7a700-0744-3a9f-f925-48de994ba70e@vivier.eu>
References: <9df7a700-0744-3a9f-f925-48de994ba70e@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=7stR=XB=zx2c4.com=Jason@kernel.org;
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

This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
have their RNG seeded from the earliest possible time in boot, just like
the "rng-seed" device tree property on those platforms. The link
contains the corresponding Linux patch.

Link: https://lore.kernel.org/lkml/20220626111509.330159-1-Jason@zx2c4.com/
Based-on: <20220625152318.120849-1-Jason@zx2c4.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/bootinfo.h                               | 16 ++++++++++++++++
 hw/m68k/virt.c                                   |  7 +++++++
 .../standard-headers/asm-m68k/bootinfo-virt.h    |  1 +
 3 files changed, 24 insertions(+)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index ff4e155a3c..bd8b212fd3 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -56,4 +56,20 @@
         stb_phys(as, base++, 0); \
         base = (base + 1) & ~1; \
     } while (0)
+
+#define BOOTINFODATA(as, base, id, data, len) \
+    do { \
+        int i; \
+        stw_phys(as, base, id); \
+        base += 2; \
+        stw_phys(as, base, \
+                 (sizeof(struct bi_record) + len + 3) & ~1); \
+        base += 2; \
+        stw_phys(as, base, len); \
+        base += 2; \
+        for (i = 0; i < len; ++i) { \
+            stb_phys(as, base++, data[i]); \
+        } \
+        base = (base + 1) & ~1; \
+    } while (0)
 #endif
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e215aa3d42..0aa383fa6b 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/guest-random.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -120,6 +121,7 @@ static void virt_init(MachineState *machine)
     hwaddr io_base;
     int i;
     ResetInfo *reset_info;
+    uint8_t rng_seed[32];
 
     if (ram_size > 3399672 * KiB) {
         /*
@@ -245,6 +247,11 @@ static void virt_init(MachineState *machine)
                         kernel_cmdline);
         }
 
+	/* Pass seed to RNG. */
+	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
+		     rng_seed, sizeof(rng_seed));
+
         /* load initrd */
         if (initrd_filename) {
             initrd_size = get_image_size(initrd_filename);
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 81be1e0924..1b1ffd4705 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,6 +12,7 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
+#define BI_VIRT_RNG_SEED	0x8006
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
-- 
2.35.1


