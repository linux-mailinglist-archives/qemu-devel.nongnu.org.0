Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555F8568734
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:48:13 +0200 (CEST)
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93Vs-0003uv-0D
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93OM-0000vs-Nq
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93OG-0002vA-PA
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:24 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4A1h-1nQogj33Wj-0107xt; Wed, 06
 Jul 2022 13:40:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL 2/2] m68k: virt: pass RNG seed via bootinfo block
Date: Wed,  6 Jul 2022 13:40:13 +0200
Message-Id: <20220706114013.340537-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706114013.340537-1-laurent@vivier.eu>
References: <20220706114013.340537-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5zb4PeFuvjl3i9t5BWwSU2QH46nOfvkf3uGnA6qzbTr4K9SQYSL
 mTskucyti0USBxd3c86ct9oloEB3gbcE5lGZMdVQnRmrYItBtAPl7F1R9IIWQw0Ci15Ev1X
 w96d2wna+fy+ukE/mzwtWM6KhfjRp0nJDaD3oIN+BlpxwecAHmTJptQAKiJxctabwws4hOP
 9d8zvfzFDph0AO/KvETVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kFtP8JqEZ7Q=:mCfFWIy0MFBCB126lTDNMh
 570hGoXKZl6nbugaGLbfDHygVMlE5hJ9zePLV8cE2xum9kRalqiWeSpWmC28zM2d9UwK9Fu1S
 lgUTWuYTh5IBawgYy5kPf8JJtjqAQCuvCjzXKJr/z+bYVzVxlT6CBkUp1DwNCS/U1YQHYxou0
 Vt6f2MQdGcqidnEpXv4qXGbibwkIheAUje5M2r55c8FBqSz7b7dUXUIbLjHAtc9XOkoVpoe+W
 oGUv/W3JLtF45148kCFS/KdU+s/vJDJzYHLEwnYIJxsnb2XuHsCDz3yuSj3WGRgMT+MJNQqBK
 5gb5NLj2d35K2urbe+bYntqJog1S3A+P5867O9nHuF4xpJJJKNK6AxCYXrSr+F5ExYOxeE66f
 ZTneoUm6Qkjl+pXEw/DTrz29DDh15lI/sAxRc89BKq7bi5hYOAnEdpX61OfkD8z4MpOrdK/qb
 hknDMdsD1RqDB/BplvACb7TJ8cWzUc5Y172JW8bufOBHhc24lRuJnnppey5yq0S8Q7Yhx/Vql
 uEH82JUZw2y8aVawOmLPOh2QboTp/3Z0kXtqc5Gn14/6pvuHQXiUcnrYtD46ybpubfadu/NDJ
 EowdjJY435ZA7XYoLWK1sEytLni6Y3e4P1BA8uCtIzI03/VxeaOsnj7U+6J5PsYo/7h33qACG
 spOZfpMFWHVHiYP+bKSunFWjJfThXBsz4DwejBSE8bB+W6zwl+HpE+JKanp5gZWWA/TGWkCuW
 A+Zf8DC+s7SCMGfbe/jUnrB/+cs01uHfVuNtuA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
have their RNG seeded from the earliest possible time in boot, just like
the "rng-seed" device tree property on those platforms. The link
contains the corresponding Linux patch.

Link: https://lore.kernel.org/lkml/20220626111509.330159-1-Jason@zx2c4.com/
Based-on: <20220625152318.120849-1-Jason@zx2c4.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <20220626111804.330745-1-Jason@zx2c4.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/bootinfo.h                               | 16 ++++++++++++++++
 .../standard-headers/asm-m68k/bootinfo-virt.h    |  1 +
 hw/m68k/virt.c                                   |  7 +++++++
 3 files changed, 24 insertions(+)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index ff4e155a3cc8..bd8b212fd35c 100644
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
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 81be1e092497..1b1ffd4705d6 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,6 +12,7 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
+#define BI_VIRT_RNG_SEED	0x8006
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e215aa3d4217..0aa383fa6bda 100644
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
-- 
2.36.1


