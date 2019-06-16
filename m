Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6547544
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 16:43:33 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcWNZ-0007iL-29
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 10:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36367)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9Y-0005L2-8M
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9W-0002Mz-Sn
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:04 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:60457)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9W-0002A5-II
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:02 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 6783044545;
 Sun, 16 Jun 2019 23:28:50 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 25263240086;
 Sun, 16 Jun 2019 23:28:50 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Sun, 16 Jun 2019 23:28:29 +0900
Message-Id: <20190616142836.10614-18-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190616142836.10614-1-ysato@users.sourceforge.jp>
References: <20190616142836.10614-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
Subject: [Qemu-devel] [PATCH v20 17/24] target/rx: Move rx_load_image to
 rx-virt.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/rx/rx-virt.c | 22 ++++++++++++++++++++++
 target/rx/cpu.c | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/rx/rx-virt.c b/hw/rx/rx-virt.c
index ed0a3a1da0..4cfe2e3123 100644
--- a/hw/rx/rx-virt.c
+++ b/hw/rx/rx-virt.c
@@ -32,6 +32,28 @@
 /* Same address of GDB integrated simulator */
 #define SDRAM_BASE 0x01000000
 
+static void rx_load_image(RXCPU *cpu, const char *filename,
+                          uint32_t start, uint32_t size)
+{
+    static uint32_t extable[32];
+    long kernel_size;
+    int i;
+
+    kernel_size = load_image_targphys(filename, start, size);
+    if (kernel_size < 0) {
+        fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
+        exit(1);
+    }
+    cpu->env.pc = start;
+
+    /* setup exception trap trampoline */
+    /* linux kernel only works little-endian mode */
+    for (i = 0; i < ARRAY_SIZE(extable); i++) {
+        extable[i] = cpu_to_le32(0x10 + i * 4);
+    }
+    rom_add_blob_fixed("extable", extable, sizeof(extable), 0xffffff80);
+}
+
 static void rxvirt_init(MachineState *machine)
 {
     RX62NState *s = g_new(RX62NState, 1);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index e3d76af55d..ea38639f47 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -215,25 +215,3 @@ static void rx_cpu_register_types(void)
 }
 
 type_init(rx_cpu_register_types)
-
-void rx_load_image(RXCPU *cpu, const char *filename,
-                   uint32_t start, uint32_t size)
-{
-    static uint32_t extable[32];
-    long kernel_size;
-    int i;
-
-    kernel_size = load_image_targphys(filename, start, size);
-    if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
-        exit(1);
-    }
-    cpu->env.pc = start;
-
-    /* setup exception trap trampoline */
-    /* linux kernel only works little-endian mode */
-    for (i = 0; i < ARRAY_SIZE(extable); i++) {
-        extable[i] = cpu_to_le32(0x10 + i * 4);
-    }
-    rom_add_blob_fixed("extable", extable, sizeof(extable), 0xffffff80);
-}
-- 
2.11.0


