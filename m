Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3A658B12
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp60-0000nP-43; Thu, 29 Dec 2022 04:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp5h-0000f3-3g
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:49 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pAp5e-0001RU-ST
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:20:44 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp73t1672305531tygke2oe
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:50 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 07/12] hw/char: riscv_htif: Support console output via
 proxy syscall
Date: Thu, 29 Dec 2022 17:18:23 +0800
Message-Id: <20221229091828.1945072-8-bmeng@tinylab.org>
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

At present the HTIF proxy syscall is unsupported. On RV32, only
device 0 is supported so there is no console device for RV32.
The only way to implement console funtionality on RV32 is to
support the SYS_WRITE syscall.

With this commit, the Spike machine is able to boot the 32-bit
OpenSBI generic image.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/char/riscv_htif.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 3bb0a37a3e..1477fc0090 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -48,6 +48,9 @@
 #define HTIF_CONSOLE_CMD_GETC   0
 #define HTIF_CONSOLE_CMD_PUTC   1
 
+/* PK system call number */
+#define PK_SYS_WRITE            64
+
 static uint64_t fromhost_addr, tohost_addr;
 static int address_symbol_set;
 
@@ -165,7 +168,19 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
                 int exit_code = payload >> 1;
                 exit(exit_code);
             } else {
-                qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
+                uint64_t syscall[8];
+                cpu_physical_memory_read(payload, syscall, sizeof(syscall));
+                if (syscall[0] == PK_SYS_WRITE &&
+                    syscall[1] == HTIF_DEV_CONSOLE &&
+                    syscall[3] == HTIF_CONSOLE_CMD_PUTC) {
+                    uint8_t ch;
+                    cpu_physical_memory_read(syscall[2], &ch, 1);
+                    qemu_chr_fe_write(&s->chr, &ch, 1);
+                    resp = 0x100 | (uint8_t)payload;
+                } else {
+                    qemu_log_mask(LOG_UNIMP,
+                                  "pk syscall proxy not supported\n");
+                }
             }
         } else {
             qemu_log("HTIF device %d: unknown command\n", device);
-- 
2.34.1


