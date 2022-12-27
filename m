Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F0656791
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 07:50:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA3ll-0006ID-Ho; Tue, 27 Dec 2022 01:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pA3lV-0006FN-Mk
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:48:45 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pA3lQ-0006fe-K5
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:48:45 -0500
X-QQ-mid: bizesmtp64t1672123697thbo5cky
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:17 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: XBN7tc9DADIRk/EtqDKOgSAS6ATohMLjAfCgeI0Fhk0tR7+d9x9ZWLHa1TUgH
 75NA1SQZJVH90gdAFbKulBC/mquWK1nS2Gk4uztVIEzn98IC1ep2ApcyuRPXESwXs4w/wPP
 z6UGl4c3GcGVEh2Iv8mAquO9Z9/d7huubKq/6ZFeyub05kZ+UlYCkHe1BWN7eIvYdaBRx2Q
 DN/qopV1MOEMEexy1cKwN25CJX9ofDYU6eBsmYE0qJ3W1zkhyHKTqRAJd6IWVmnjPC/kJ7E
 bOpwQiJCaDkZj+mMHpjPseXAFblObNFqTuZpRHpD+bLD+OcjRFQll/ayenVL4Xeg9OTM/y2
 Qy9hmOMN3N0wJ8ZzQP9pWFDRby2qPVy2X06BNsq
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] hw/char: riscv_htif: Avoid using magic numbers
Date: Tue, 27 Dec 2022 14:48:01 +0800
Message-Id: <20221227064812.1903326-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227064812.1903326-1-bmeng@tinylab.org>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Spike HTIF is poorly documented. The only relevant info we can
get from the internet is from Andrew Waterman at [1].

Add a comment block before htif_handle_tohost_write() to explain
the tohost register format, and use meaningful macros intead of
magic numbers in the codes.

While we are here, corret 2 multi-line comment blocks that have
wrong format.

Link: https://github.com/riscv-software-src/riscv-isa-sim/issues/364 [1]
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/char/riscv_htif.c | 72 ++++++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 6577f0e640..088556bb04 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -38,6 +38,16 @@
         }                                                                      \
     } while (0)
 
+#define HTIF_DEV_SHIFT          56
+#define HTIF_CMD_SHIFT          48
+
+#define HTIF_DEV_SYSTEM         0
+#define HTIF_DEV_CONSOLE        1
+
+#define HTIF_SYSTEM_CMD_SYSCALL 0
+#define HTIF_CONSOLE_CMD_GETC   0
+#define HTIF_CONSOLE_CMD_PUTC   1
+
 static uint64_t fromhost_addr, tohost_addr;
 static int address_symbol_set;
 
@@ -81,9 +91,11 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
         return;
     }
 
-    /* TODO - we need to check whether mfromhost is zero which indicates
-              the device is ready to receive. The current implementation
-              will drop characters */
+    /*
+     * TODO - we need to check whether mfromhost is zero which indicates
+     *        the device is ready to receive. The current implementation
+     *        will drop characters
+     */
 
     uint64_t val_written = htifstate->pending_read;
     uint64_t resp = 0x100 | *buf;
@@ -110,10 +122,30 @@ static int htif_be_change(void *opaque)
     return 0;
 }
 
+/*
+ * See below the tohost register format.
+ *
+ * Bits 63:56 indicate the "device".
+ * Bits 55:48 indicate the "command".
+ *
+ * Device 0 is the syscall device, which is used to emulate Unixy syscalls.
+ * It only implements command 0, which has two subfunctions:
+ * - If bit 0 is clear, then bits 47:0 represent a pointer to a struct
+ *   describing the syscall.
+ * - If bit 1 is set, then bits 47:1 represent an exit code, with a zero
+ *   value indicating success and other values indicating failure.
+ *
+ * Device 1 is the blocking character device.
+ * - Command 0 reads a character
+ * - Command 1 writes a character from the 8 LSBs of tohost
+ *
+ * For RV32, the tohost register is zero-extended, so only device=0 and
+ * command=0 (i.e. HTIF syscalls/exit codes) are supported.
+ */
 static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
 {
-    uint8_t device = val_written >> 56;
-    uint8_t cmd = val_written >> 48;
+    uint8_t device = val_written >> HTIF_DEV_SHIFT;
+    uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
     uint64_t payload = val_written & 0xFFFFFFFFFFFFULL;
     int resp = 0;
 
@@ -125,9 +157,9 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
      * 0: riscv-tests Pass/Fail Reporting Only (no syscall proxy)
      * 1: Console
      */
-    if (unlikely(device == 0x0)) {
+    if (unlikely(device == HTIF_DEV_SYSTEM)) {
         /* frontend syscall handler, shutdown and exit code support */
-        if (cmd == 0x0) {
+        if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
             if (payload & 0x1) {
                 /* exit code */
                 int exit_code = payload >> 1;
@@ -138,14 +170,14 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
         }
-    } else if (likely(device == 0x1)) {
+    } else if (likely(device == HTIF_DEV_CONSOLE)) {
         /* HTIF Console */
-        if (cmd == 0x0) {
+        if (cmd == HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such */
             htifstate->pending_read = val_written;
             htifstate->env->mtohost = 0; /* clear to indicate we read */
             return;
-        } else if (cmd == 0x1) {
+        } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
             qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
             resp = 0x100 | (uint8_t)payload;
         } else {
@@ -157,15 +189,15 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
             " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
     }
     /*
-     * - latest bbl does not set fromhost to 0 if there is a value in tohost
-     * - with this code enabled, qemu hangs waiting for fromhost to go to 0
-     * - with this code disabled, qemu works with bbl priv v1.9.1 and v1.10
-     * - HTIF needs protocol documentation and a more complete state machine
-
-        while (!htifstate->fromhost_inprogress &&
-            htifstate->env->mfromhost != 0x0) {
-        }
-    */
+     * Latest bbl does not set fromhost to 0 if there is a value in tohost.
+     * With this code enabled, qemu hangs waiting for fromhost to go to 0.
+     * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
+     * HTIF needs protocol documentation and a more complete state machine.
+     *
+     *  while (!htifstate->fromhost_inprogress &&
+     *      htifstate->env->mfromhost != 0x0) {
+     *  }
+     */
     htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
     htifstate->env->mtohost = 0; /* clear to indicate we read */
 }
@@ -196,7 +228,7 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 
 /* CPU wrote to an HTIF register */
 static void htif_mm_write(void *opaque, hwaddr addr,
-                            uint64_t value, unsigned size)
+                          uint64_t value, unsigned size)
 {
     HTIFState *htifstate = opaque;
     if (addr == TOHOST_OFFSET1) {
-- 
2.34.1


