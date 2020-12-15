Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD72DA82B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:45:06 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp453-0004Fu-Hl
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42S-0002Xr-3X
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:27 -0500
Received: from relay1.mymailcheap.com ([144.217.248.102]:46356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42O-0003y9-1D
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:23 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id AE7E43F157;
 Tue, 15 Dec 2020 06:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 953752A370;
 Tue, 15 Dec 2020 01:42:16 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014536;
 bh=BywRbk7fBtvY251r/H3j4PpBjmNOhVX4sj3Z7oRtv3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DzxiSjhNXhOeFCGOJjnODMgdvDiP0+o0yG6Pog37pjfmhkztJn9k9qw3J9F88jzbh
 WUujy5HSxoAAxx5iomp0WYLKYF6bg/SaPyvyqya7JJa7XC+H9h9fDogD8Yb4Xq8Rje
 zy7W+c550cjZaVwp6ENot1mFZLUAIMlW6RNYm148=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdZatChOJq2j; Tue, 15 Dec 2020 01:42:15 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 01:42:15 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id AEC0542D0B;
 Tue, 15 Dec 2020 06:42:13 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="BD8+hgjh"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id BF57F40026;
 Tue, 15 Dec 2020 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014531;
 bh=BywRbk7fBtvY251r/H3j4PpBjmNOhVX4sj3Z7oRtv3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BD8+hgjhnmIWEMRZbec6uy5iL5Lo6FSFuLaryEI/to80Yv2QvIgIJW0jWs/rl0sVn
 zDLQ0a+W4unm39Dej39u69q+JSn8iT35vr1JNuGCz/fbnK8AMv+e9J7ceiOLt3oNWc
 0tI/HCGXgI4KstjYmbDnnbzcIPyunndwAGhl7smA=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/mips: Make bootloader addresses unsgined
Date: Tue, 15 Dec 2020 14:41:53 +0800
Message-Id: <20201215064200.28751-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[5];
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: AEC0542D0B
X-Spam: Yes
Received-SPF: pass client-ip=144.217.248.102;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address should be unsigned anyway, otherwise it may carry
calculations wrongly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 12 ++++++------
 hw/mips/malta.c     | 22 +++++++++++-----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe..fc4d7f21ed 100644
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
 
@@ -294,7 +294,7 @@ static void mips_fuloong2e_init(MachineState *machine)
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
-    int64_t kernel_entry;
+    uint64_t kernel_entry;
     PCIDevice *pci_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 366f4fdfcd..7db009a3e9 100644
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
-- 
2.29.2

