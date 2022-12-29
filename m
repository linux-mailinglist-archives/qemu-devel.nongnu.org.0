Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B33658AD6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:19:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp45-0008CS-PL; Thu, 29 Dec 2022 04:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp40-0008BB-LS
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:00 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp3x-0006oW-OP
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:19:00 -0500
X-QQ-mid: bizesmtp73t1672305513tbxjiz58
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:32 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: uGhnJwy6xZIM6DLkhjUrQSCT2ezTrpXz15PXApyyWV9/G8+pWECuQ8q/nwWbX
 8Ehnkpjad1Vs3qBnmcyUmkhojurCE2eDuk9H5/reTYZd9BijtF9bqBhLAaYQXcKpdTBE7fh
 oeX5GoFRL3cTDY+m4i2skS13WIcw5RMcZnc58cBlSOPWEO/IKTvMser7vtDm7QlyT+suBae
 6WUDwvmv6ug9LedonSuyDnCsuWxT1LDLCV5cVrPgZP/jiFIIwmFheZpeeBPvjx7q1W/ad6X
 0LTSujLSlyFRKjCkYXgJtsHG+yx+H8l1LyX95D99DerDO8APgsvIEOnj7T555AXr6YeztMk
 PJXzwDnPTsA2lI9ltDIFDeYnGxyfbqoUDlLQwgyWMzhkopkQ/c=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/12] hw/char: riscv_htif: Avoid using magic numbers
Date: Thu, 29 Dec 2022 17:18:17 +0800
Message-Id: <20221229091828.1945072-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
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
the tohost register format, and use meaningful macros instead of
magic numbers in the codes.

While we are here, correct 2 multi-line comment blocks that have
wrong format.

Link: https://github.com/riscv-software-src/riscv-isa-sim/issues/364#issuecomment-607657754 [1]
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- fix 2 typos in the commit message

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


