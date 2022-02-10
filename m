Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FB4B068A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:47:24 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI3Ef-0001Jm-FM
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:47:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yi-00048Z-M5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:52 -0500
Received: from [2607:f8b0:4864:20::1035] (port=51134
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI2yg-0005BP-AQ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:30:51 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m7so4338841pjk.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TbCj5emV1bwxvh/XZZRmYbRkwMGqKerZwxd3Gj6CI+M=;
 b=ekt/bA3B+YmW70TXMlk7w+seMW+1gMuEu/ay7uPq4OmrurbSP+GXKwhYTZwHv9pWD4
 vMqDVri/InNmP8aEr/R6dlNO/zurmfh7VTS6o3SMA+QUzV00+n3MbGnVg32dZ16mf9P6
 4B0U0XlzNWEVI1SZSof9DwyKfsTLcfxKRMtQJ61bEt48fjQRXTXu9gHiaiLTFLlaE6C9
 WQi+F9/rs457iwjYHTlZ3Oim8R524ZOaGZtLFOkpC4XPiQFiXLRLzNuHEbQGeELGYhDF
 lodnZY3UU1F0RWiuY//1VpKHjBePop7t5eeyhRaXiUjJ85LcrEhj6OHwAMmEaSqGcsiM
 r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TbCj5emV1bwxvh/XZZRmYbRkwMGqKerZwxd3Gj6CI+M=;
 b=5MsiLCjO2KRZptRw6aZeMhke4RoARu6n/78X5k4kpPwXIjRWvx6RsWK3fAXkVNf+/E
 z3NtL2wcQLGg0vD8NlCOW0eIMWSqNxnVIHSnGwqKE2m3xgaLhpYEJgAIbaRpR5OpAMQk
 BrjrF1t3r2VhJQp/42INHon6LeVjGmG9KahDgP6zJnt12x3ffjLw4h56QTOj8v4+6S1P
 FoG/YGxYpP14JcdiObYjxKPMrEW7qeYF293Bxt6FR3j6cpzV18xu88GPvB34yZ1NGq1j
 mg4MTSVBbDA5U7hVB/KbBSmEI4ZCG+vlj3f/mDQkRUCLwHA/G8zVjNUgSMaFOIXbssP+
 X+6w==
X-Gm-Message-State: AOAM5320M8MqlAYoHnMZ9A50Jn14lCr9wYhhYNwhnrt1eThXcHvDqM9I
 RhujNcfg/r62WHxrS+K9Ok2tleltoRotog==
X-Google-Smtp-Source: ABdhPJxWx1eV2iWe1PhqcEPKGrvz7Nht0ibyLjoj8LADTu4j1/tdXqLUZYxFkHDIoEpiH+95marFVw==
X-Received: by 2002:a17:902:e5c2:: with SMTP id
 u2mr6331984plf.144.1644474634558; 
 Wed, 09 Feb 2022 22:30:34 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id b2sm15593286pgg.59.2022.02.09.22.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:30:33 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH 2/4] hw/openrisc/openrisc_sim: Paramatarize initialization
Date: Thu, 10 Feb 2022 15:30:07 +0900
Message-Id: <20220210063009.1048751-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063009.1048751-1-shorne@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move magic numbers to variables and enums. These will be
reused for upcoming fdt initialization.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 42 ++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index b83cc1c191..5a0cc4d27e 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -49,6 +49,29 @@ typedef struct Or1ksimState {
 
 } Or1ksimState;
 
+enum {
+    OR1KSIM_DRAM,
+    OR1KSIM_UART,
+    OR1KSIM_ETHOC,
+    OR1KSIM_OMPIC,
+};
+
+enum {
+    OR1KSIM_OMPIC_IRQ = 1,
+    OR1KSIM_UART_IRQ = 2,
+    OR1KSIM_ETHOC_IRQ = 4,
+};
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} or1ksim_memmap[] = {
+    [OR1KSIM_DRAM] =      { 0x00000000,          0 },
+    [OR1KSIM_UART] =      { 0x90000000,      0x100 },
+    [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
+    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
+};
+
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
 } boot_info;
@@ -177,21 +200,24 @@ static void openrisc_sim_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0, ram);
 
     if (nd_table[0].used) {
-        openrisc_sim_net_init(0x92000000, 0x92000400, smp_cpus,
-                              cpus, 4, nd_table);
+        openrisc_sim_net_init(or1ksim_memmap[OR1KSIM_ETHOC].base,
+                              or1ksim_memmap[OR1KSIM_ETHOC].base + 0x400,
+                              smp_cpus, cpus,
+                              OR1KSIM_ETHOC_IRQ, nd_table);
     }
 
     if (smp_cpus > 1) {
-        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpus, 1);
+        openrisc_sim_ompic_init(or1ksim_memmap[OR1KSIM_OMPIC].base, smp_cpus,
+                                cpus, OR1KSIM_OMPIC_IRQ);
 
-        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, 2),
-                                    get_cpu_irq(cpus, 1, 2));
+        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ),
+                                    get_cpu_irq(cpus, 1, OR1KSIM_UART_IRQ));
     } else {
-        serial_irq = get_cpu_irq(cpus, 0, 2);
+        serial_irq = get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ);
     }
 
-    serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
-                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
+                   serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
 
     openrisc_load_kernel(ram_size, kernel_filename);
 }
-- 
2.31.1


