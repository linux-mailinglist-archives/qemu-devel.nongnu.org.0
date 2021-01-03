Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D092E8E54
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:12:52 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAgF-0003Qs-MW
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMk-0004cv-M3
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMj-0006NW-3R
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id r4so16638870wmh.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+Fl/Dw4XP4aoCncdK2UwY3/wzGCugYvGzMarlg1iC8=;
 b=pTqcQybfUzRheClpfoNh+tYTwYPB3I+xXKFwGBwHPKRVu6adzG5N3ioPEErbs8AoYa
 qILRZpG9MtfA38LX62bAvgOf4Vs8VIrKvzSArxjhuX6hkxOodRApI4inIOYq32nmyQoO
 rI1FxZGxnbCldwtAi5f08MIyUpW2msyGPAhJm+bAEpx2h0+tEaI3mtovMsZtDT1earOk
 Utq9rQc4jaDlplw0O50VS0/cQEWwprnT95ipq9Ixy0J0gGI+rBj0wBrurVPmTOMEk+K7
 1bTi3JhqwmCv4lGt96gUweKBIxx5mZgZdnIE8E2hYEa7x1OR77e3CaVSBpmb/6HaAFia
 XjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D+Fl/Dw4XP4aoCncdK2UwY3/wzGCugYvGzMarlg1iC8=;
 b=N5aaiMkQpocwfWzXI2S4tEmoIC2/SDwcP5PRjaA8alRBal8i6K3s9+vdznfhUaV7zq
 8kLZawW+IwoHCS6GV8+0jdLdnXasYKM807/eCHFCHKmYfOVMkiGPoF1mgQ7r5KZ1Tu8v
 O7m6cTYuhU+6dmQrnwHSmwGiW/7O0bAEizNBh5+gsrma9TH2A+kUft3ouuoVpIfCnrrR
 clttWCebCdfDFRwjiObHBPQ5rdIymM+Hfpp48Os6WH7OB/J9CKojcb1GYOY9V21aUuDU
 u+hhQVPmRlI0Pqlfmqv/DViuALEstD59zsZbL1vHyCQ8eYCBlUur/xV8+n+KKMe2uJpz
 8xTQ==
X-Gm-Message-State: AOAM532eq9L/qOhIvO/+F6SB3loVCyj4kyzz0rYo4KxUuc1n7DBdKj9+
 7zDRme1yHlVqNp8E9Ma0z784X4KfcJY=
X-Google-Smtp-Source: ABdhPJxBLMd1TrbIQvIMvz4IAbq0BX06B9javWRCgrTuxXejbrdUC03xLUmBOl0DJsqeeR+e6trC1Q==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr23981942wma.60.1609707159005; 
 Sun, 03 Jan 2021 12:52:39 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id g5sm85019499wro.60.2021.01.03.12.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] hw/mips: Make bootloader addresses unsigned
Date: Sun,  3 Jan 2021 21:50:14 +0100
Message-Id: <20210103205021.2837760-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Address should be unsigned anyway, otherwise it may carry
calculations wrongly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215064200.28751-2-jiaxun.yang@flygoat.com>
[PMD: Fixed typo and convert hw/mips/mipssim.c too]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 12 ++++++------
 hw/mips/malta.c     | 22 +++++++++++-----------
 hw/mips/mipssim.c   |  8 ++++----
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index e5d08669069..804bef94cda 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -107,9 +107,9 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static int64_t load_kernel(CPUMIPSState *env)
+static uint64_t load_kernel(CPUMIPSState *env)
 {
-    int64_t kernel_entry, kernel_high, initrd_size;
+    uint64_t kernel_entry, kernel_high, initrd_size;
     int index = 0;
     long kernel_size;
     ram_addr_t initrd_offset;
@@ -118,8 +118,8 @@ static int64_t load_kernel(CPUMIPSState *env)
 
     kernel_size = load_elf(loaderparams.kernel_filename, NULL,
                            cpu_mips_kseg0_to_phys, NULL,
-                           (uint64_t *)&kernel_entry, NULL,
-                           (uint64_t *)&kernel_high, NULL,
+                           &kernel_entry, NULL,
+                           &kernel_high, NULL,
                            0, EM_MIPS, 1, 0);
     if (kernel_size < 0) {
         error_report("could not load kernel '%s': %s",
@@ -180,7 +180,7 @@ static int64_t load_kernel(CPUMIPSState *env)
 }
 
 static void write_bootloader(CPUMIPSState *env, uint8_t *base,
-                             int64_t kernel_addr)
+                             uint64_t kernel_addr)
 {
     uint32_t *p;
 
@@ -299,7 +299,7 @@ static void mips_fuloong2e_init(MachineState *machine)
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
-    int64_t kernel_entry;
+    uint64_t kernel_entry;
     PCIDevice *pci_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 366f4fdfcde..7db009a3e96 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -616,8 +616,8 @@ static void network_init(PCIBus *pci_bus)
     }
 }
 
-static void write_bootloader_nanomips(uint8_t *base, int64_t run_addr,
-                                      int64_t kernel_entry)
+static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
+                                      uint64_t kernel_entry)
 {
     uint16_t *p;
 
@@ -840,8 +840,8 @@ static void write_bootloader_nanomips(uint8_t *base, int64_t run_addr,
  *   a2 - 32-bit address of the environment variables table
  *   a3 - RAM size in bytes
  */
-static void write_bootloader(uint8_t *base, int64_t run_addr,
-                             int64_t kernel_entry)
+static void write_bootloader(uint8_t *base, uint64_t run_addr,
+                             uint64_t kernel_entry)
 {
     uint32_t *p;
 
@@ -1003,7 +1003,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
                                         const char *string, ...)
 {
     va_list ap;
-    int32_t table_addr;
+    uint32_t table_addr;
 
     if (index >= ENVP_NB_ENTRIES) {
         return;
@@ -1014,7 +1014,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
         return;
     }
 
-    table_addr = sizeof(int32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
+    table_addr = sizeof(uint32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
     prom_buf[index] = tswap32(ENVP_ADDR + table_addr);
 
     va_start(ap, string);
@@ -1023,9 +1023,9 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
 }
 
 /* Kernel */
-static int64_t load_kernel(void)
+static uint64_t load_kernel(void)
 {
-    int64_t kernel_entry, kernel_high, initrd_size;
+    uint64_t kernel_entry, kernel_high, initrd_size;
     long kernel_size;
     ram_addr_t initrd_offset;
     int big_endian;
@@ -1042,8 +1042,8 @@ static int64_t load_kernel(void)
 
     kernel_size = load_elf(loaderparams.kernel_filename, NULL,
                            cpu_mips_kseg0_to_phys, NULL,
-                           (uint64_t *)&kernel_entry, NULL,
-                           (uint64_t *)&kernel_high, NULL, big_endian, EM_MIPS,
+                           &kernel_entry, NULL,
+                           &kernel_high, NULL, big_endian, EM_MIPS,
                            1, 0);
     if (kernel_size < 0) {
         error_report("could not load kernel '%s': %s",
@@ -1234,7 +1234,7 @@ void mips_malta_init(MachineState *machine)
     MemoryRegion *bios, *bios_copy = g_new(MemoryRegion, 1);
     const size_t smbus_eeprom_size = 8 * 256;
     uint8_t *smbus_eeprom_buf = g_malloc0(smbus_eeprom_size);
-    int64_t kernel_entry, bootloader_run_addr;
+    uint64_t kernel_entry, bootloader_run_addr;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     qemu_irq cbus_irq, i8259_irq;
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index f2e62735255..f5d0da05aa1 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -60,9 +60,9 @@ typedef struct ResetData {
     uint64_t vector;
 } ResetData;
 
-static int64_t load_kernel(void)
+static uint64_t load_kernel(void)
 {
-    int64_t entry, kernel_high, initrd_size;
+    uint64_t entry, kernel_high, initrd_size;
     long kernel_size;
     ram_addr_t initrd_offset;
     int big_endian;
@@ -75,8 +75,8 @@ static int64_t load_kernel(void)
 
     kernel_size = load_elf(loaderparams.kernel_filename, NULL,
                            cpu_mips_kseg0_to_phys, NULL,
-                           (uint64_t *)&entry, NULL,
-                           (uint64_t *)&kernel_high, NULL, big_endian,
+                           &entry, NULL,
+                           &kernel_high, NULL, big_endian,
                            EM_MIPS, 1, 0);
     if (kernel_size < 0) {
         error_report("could not load kernel '%s': %s",
-- 
2.26.2


