Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9B517AAE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 01:22:08 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlfMk-0000vM-Uj
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 19:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nlfLl-0000C7-FX
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:21:05 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:45198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nlfLj-00089e-7y
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:21:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4FBF6126B;
 Mon,  2 May 2022 23:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D66C385AE;
 Mon,  2 May 2022 23:21:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UGDpEgAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651533658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=drNnPwOIu75Uiln8TrQrWPM013fyoOXTJndTHgjnkMU=;
 b=UGDpEgAk/OLqCLdNIi9E9tuVQCO1H0AKBAzocH2CJ/lpY7y/DrC5nn84YYiqWoe31bKE0+
 e3c5HvX7bS+AYZgVSiqV7EqluvnlOtJaBM09j8UeBxP1A+pJbXGvShzdx4z96mx2Ebyyp+
 Cw6IxBDxV/NaP6MJWtxj+t21SnO/9ZA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e69bd9a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 23:20:58 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hw/openrisc: support 4 serial ports in or1ksim
Date: Tue,  3 May 2022 01:20:56 +0200
Message-Id: <20220502232056.248292-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org;
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

The 8250 serial controller supports 4 serial ports, so wire them all up,
so that we can have more than one basic I/O channel.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/openrisc_sim.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index bf434e9737..fe07db1cc5 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -71,6 +71,10 @@ enum {
     OR1KSIM_ETHOC_IRQ = 4,
 };
 
+enum {
+    OR1KSIM_UART_COUNT = 4
+};
+
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -239,11 +243,13 @@ static void openrisc_sim_ompic_init(Or1ksimState *state, hwaddr base,
 
 static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
                                      hwaddr size, int num_cpus,
-                                     OpenRISCCPU *cpus[], int irq_pin)
+                                     OpenRISCCPU *cpus[], int irq_pin,
+                                     int uart_idx)
 {
     void *fdt = state->fdt;
     char *nodename;
     qemu_irq serial_irq;
+    char alias[sizeof("uart0")];
     int i;
 
     if (num_cpus > 1) {
@@ -258,7 +264,7 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
         serial_irq = get_cpu_irq(cpus, 0, irq_pin);
     }
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(OR1KSIM_UART_COUNT - uart_idx - 1), DEVICE_NATIVE_ENDIAN);
 
     /* Add device tree node for serial. */
     nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
@@ -271,7 +277,8 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
 
     /* The /chosen node is created during fdt creation. */
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
-    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);
+    snprintf(alias, sizeof(alias), "uart%d", uart_idx);
+    qemu_fdt_setprop_string(fdt, "/aliases", alias, nodename);
     g_free(nodename);
 }
 
@@ -414,9 +421,11 @@ static void openrisc_sim_init(MachineState *machine)
                                 smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-    openrisc_sim_serial_init(state, or1ksim_memmap[OR1KSIM_UART].base,
-                             or1ksim_memmap[OR1KSIM_UART].size, smp_cpus, cpus,
-                             OR1KSIM_UART_IRQ);
+    for (n = 0; n < OR1KSIM_UART_COUNT; ++n)
+            openrisc_sim_serial_init(state, or1ksim_memmap[OR1KSIM_UART].base +
+                                            or1ksim_memmap[OR1KSIM_UART].size * n,
+                                     or1ksim_memmap[OR1KSIM_UART].size, smp_cpus, cpus,
+                                     OR1KSIM_UART_IRQ, n);
 
     load_addr = openrisc_load_kernel(ram_size, kernel_filename);
     if (load_addr > 0) {
-- 
2.35.1


