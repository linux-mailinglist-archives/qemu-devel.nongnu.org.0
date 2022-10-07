Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE65F7C2A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:21:12 +0200 (CEST)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogr27-0004uk-MM
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=JVfI=2I=zx2c4.com=Jason@kernel.org>)
 id 1ogqre-0003Uu-73
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:10:22 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:56690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=JVfI=2I=zx2c4.com=Jason@kernel.org>)
 id 1ogqrb-0006vF-Pg
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:10:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1987FB817AC;
 Fri,  7 Oct 2022 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53636C433C1;
 Fri,  7 Oct 2022 17:10:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FyRPl8il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665162612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9hqEEx2siLVp1468XZg3R6R+vgGc98IrPj6WZG5BgOY=;
 b=FyRPl8ilSbDNl+uWTwWPPObwwyTqdpOlA3jijHnMgaMOCAvIyVX7cydF+JK4Ldy2/F7CD7
 sfLwuIagObjbq0RyyEBbyfXa4mgY4RV4u+l+bQ+joMaQc+oua2YDX5MS2HOcemlLtl5DyM
 BkDpSSqJ26TfrMr64I4d73pQVTHtxQY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea080109
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 7 Oct 2022 17:10:12 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: f4bug@amsat.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3] mips/malta: pass RNG seed to to kernel via env var
Date: Fri,  7 Oct 2022 11:09:58 -0600
Message-Id: <20221007170958.181433-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=JVfI=2I=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

As of the kernel commit linked below, Linux ingests an RNG seed
passed as part of the environment block by the bootloader or firmware.
This mechanism works across all different environment block types,
generically, which pass some block via the second firmware argument. On
malta, this has been tested to work when passed as an argument from
U-Boot's linux_env_set.

As is the case on most other architectures (such as boston), when
booting with `-kernel`, QEMU, acting as the bootloader, should pass the
RNG seed, so that the machine has good entropy for Linux to consume. So
this commit implements that quite simply by using the guest random API,
which is what is used on nearly all other archs too. It also
reinitializes the seed on reboot, so that it is always fresh.

Link: https://git.kernel.org/torvalds/c/056a68cea01
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/mips/malta.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..9d793b3c17 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "qemu/bitops.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
 #include "hw/isa/superio.h"
@@ -1017,6 +1018,17 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
+static void reinitialize_rng_seed(void *opaque)
+{
+    char *rng_seed_hex = opaque;
+    uint8_t rng_seed[32];
+
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
+        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
+    }
+}
+
 /* Kernel */
 static uint64_t load_kernel(void)
 {
@@ -1028,6 +1040,8 @@ static uint64_t load_kernel(void)
     long prom_size;
     int prom_index = 0;
     uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
+    uint8_t rng_seed[32];
+    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
 
 #if TARGET_BIG_ENDIAN
     big_endian = 1;
@@ -1115,9 +1129,20 @@ static uint64_t load_kernel(void)
 
     prom_set(prom_buf, prom_index++, "modetty0");
     prom_set(prom_buf, prom_index++, "38400n8r");
+
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
+        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
+    }
+    prom_set(prom_buf, prom_index++, "rngseed");
+    prom_set(prom_buf, prom_index++, "%s", rng_seed_hex);
+
     prom_set(prom_buf, prom_index++, NULL);
 
     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
+    qemu_register_reset(reinitialize_rng_seed,
+                        memmem(rom_ptr(ENVP_PADDR, prom_size), prom_size,
+                               rng_seed_hex, sizeof(rng_seed_hex)));
 
     g_free(prom_buf);
     return kernel_entry;
-- 
2.37.3


