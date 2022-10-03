Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FD5F2EEB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:40:18 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIrx-0004bF-2z
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofIoc-0000WW-65
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:36:50 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofIoZ-0002Zd-Vy
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:36:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3AC8B81049;
 Mon,  3 Oct 2022 10:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C629BC433D7;
 Mon,  3 Oct 2022 10:36:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="m7aazLT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664793394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWpTi6KXCYsZeLyOVNUk5wppfEu/zvy60LaU2Vg9PJI=;
 b=m7aazLT6O+O0spQEbFjdG58rbVYdUTRoF1v62WzPDK0B5SO4i/a8fcf9oDl/8oh60ORzky
 RRKdtq+VS+HyxLuSgOw7ANT3F6ARlRUlArmGgvOIxRHOvUr5lTBYb3bUpGXO0rvsClHl2J
 +FgZ+2FXjr2vj36gomYoIQyhvZ62pKI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e5db381
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 3 Oct 2022 10:36:34 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
Date: Mon,  3 Oct 2022 12:36:27 +0200
Message-Id: <20221003103627.947985-1-Jason@zx2c4.com>
In-Reply-To: <YziPyCqwl5KIE2cf@zx2c4.com>
References: <YziPyCqwl5KIE2cf@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org;
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

As of the kernel commit linked below, Linux ingests an RNG seed
passed from the hypervisor. So, pass this for the Malta platform, and
reinitialize it on reboot too, so that it's always fresh.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Link: https://git.kernel.org/mips/c/056a68cea01
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v1->v2:
- Update commit message.
- No code changes.

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


