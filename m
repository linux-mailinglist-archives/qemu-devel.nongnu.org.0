Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07045658AF4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp8P-0003cz-4X; Thu, 29 Dec 2022 04:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp89-0003ZX-Ch; Thu, 29 Dec 2022 04:23:18 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp7z-0002iE-Eg; Thu, 29 Dec 2022 04:23:10 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp73t1672305537tje3xs78
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:56 +0800 (CST)
X-QQ-SSF: 00200000000000C0C000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 09/12] hw/riscv/boot.c: make riscv_find_firmware() static
Date: Thu, 29 Dec 2022 17:18:25 +0800
Message-Id: <20221229091828.1945072-10-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

The only caller is riscv_find_and_load_firmware(), which is in the same
file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221221182300.307900-5-dbarboza@ventanamicro.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

(no changes since v1)

 include/hw/riscv/boot.h |  1 -
 hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 93e5f8760d..c03e4e74c5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,7 +37,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
-char *riscv_find_firmware(const char *firmware_filename);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ebd351c840..7361d5c0d8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,28 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
     }
 }
 
+static char *riscv_find_firmware(const char *firmware_filename)
+{
+    char *filename;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    if (filename == NULL) {
+        if (!qtest_enabled()) {
+            /*
+             * We only ship OpenSBI binary bios images in the QEMU source.
+             * For machines that use images other than the default bios,
+             * running QEMU test will complain hence let's suppress the error
+             * report for QEMU testing.
+             */
+            error_report("Unable to load the RISC-V firmware \"%s\"",
+                         firmware_filename);
+            exit(1);
+        }
+    }
+
+    return filename;
+}
+
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
@@ -104,28 +126,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
     return firmware_end_addr;
 }
 
-char *riscv_find_firmware(const char *firmware_filename)
-{
-    char *filename;
-
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
-    if (filename == NULL) {
-        if (!qtest_enabled()) {
-            /*
-             * We only ship OpenSBI binary bios images in the QEMU source.
-             * For machines that use images other than the default bios,
-             * running QEMU test will complain hence let's suppress the error
-             * report for QEMU testing.
-             */
-            error_report("Unable to load the RISC-V firmware \"%s\"",
-                         firmware_filename);
-            exit(1);
-        }
-    }
-
-    return filename;
-}
-
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb)
-- 
2.34.1


