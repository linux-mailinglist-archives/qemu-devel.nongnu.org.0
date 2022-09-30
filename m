Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B135F0D5B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:21:19 +0200 (CEST)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGtC-0000o9-DQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org>)
 id 1oeGe4-0001hI-DA
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:05:40 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:48108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org>)
 id 1oeGe1-0003pB-Qe
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:05:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9201FB828F0;
 Fri, 30 Sep 2022 14:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1C3C433C1;
 Fri, 30 Sep 2022 14:05:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kgZym1BX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664546728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vep5nrxTm+IGrp39dQvVdZTB+ey0J1KFVywzWMSBFd0=;
 b=kgZym1BXIqDZk2VXY82rB/eT66zCEf61r/056J2tas2F6BPgm2+/LeFi2PtseIbzISgIGh
 yJGHgW9OwgpEc1oO6NvWqAmwq2BQcZpVJ+gg//l1ONgRmMeonujj7GgldpWyVopD2Nknfh
 Y4eQw33K8Iqx5YFbhquqvDFp+g6HSeQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4965eafb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 30 Sep 2022 14:05:28 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: f4bug@amsat.org, aurelien@aurel32.net, qemu-devel@nongnu.org,
 tsbogend@alpha.franken.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
Date: Fri, 30 Sep 2022 16:05:20 +0200
Message-Id: <20220930140520.576374-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org;
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

With the kernel patch linked below, Linux ingests a RNG seed
passed from the hypervisor. So, pass this for the Malta platform, and
reinitialize it on reboot too, so that it's always fresh.

Link: https://lore.kernel.org/linux-mips/20220930140138.575751-1-Jason@zx2c4.com/
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


