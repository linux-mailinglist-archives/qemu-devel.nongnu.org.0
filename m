Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F34BC645
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:20:00 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLK2B-0003bZ-AV
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJTB-0006k5-TL
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:50 -0500
Received: from [2607:f8b0:4864:20::635] (port=46750
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJS3-0007Ye-05
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:49 -0500
Received: by mail-pl1-x635.google.com with SMTP id u12so8779398plf.13
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=JqnNN2Weovj/LN+7gsyq2c41AyeXwohY4y2/TvAXG4o25ZM7TKjBvuAQYSkVSAGeyU
 HgyfJSK9Grw0+xCh1n6ggi4EnNIn5bARUU78KaHWJwPQjdgvwxkZXUM+0yH239P+MRr0
 AjieI9v7kY270kJjEB0AP795IZIFyxcuSbyTCY5lyf98KpRtqTgWuGpiJS9AuqZyZFfw
 pq7NVcm7vD837uhWe+O/QHv0Lhd9etyFpe/pcEp7oxSpiZR+eQxDWn1rA/EM22ks3aQr
 o6lLUrRymzV+dAv4OHyuysPxxeRmx8SM82hRTQdffMEPQzb2JaPDGcFmXcUBOXTWW50p
 jKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=pEhrQmCHBnJO+hydDA7E42WRbbQeauNDObERhjf1/KaD3WElavQPvf+hH8/yVX1Q9E
 WpbhD3X4PIbdWrBC870t/ElM88e4NoeVB4KPyy+Oowu9JDJQgfN92Ig5Y5a+9s2pKzIJ
 dDiysaGhS+6N64b+yP+r0mzyVG1KwHTr9h3mppXHXjOH/ArC/nxZWzXO/oCmfG6qZCp9
 OKXK7KODIN+IzKodNxMP00V6VdyrB1UDNkPXSCtGfIFjfLfx2awRwTSZar1aKtRD22kV
 /Va4jS87MQdrWiwXH2Tpq7PvxQu5n4N35JJ3goqAqzjET9Mrfav5r+hRvM7ttFjo1akr
 7/fw==
X-Gm-Message-State: AOAM532/Ayfmqulap7Rmr7wOaY3CxtHdy9xN6oXsTs8su0ZZQARZhdvQ
 OMn0lAhyjRl5v7B0nmjgvhDjBAN00+5mNw==
X-Google-Smtp-Source: ABdhPJx+grUDRMY0OMJKCeTXev+Oup8NWWzUOTPNTH2MTOlINElZN6sVHfCPdZ0GlX6wA1bQCTgBrA==
X-Received: by 2002:a17:90a:420f:b0:1b9:58b:966d with SMTP id
 o15-20020a17090a420f00b001b9058b966dmr11620939pjg.28.1645252948626; 
 Fri, 18 Feb 2022 22:42:28 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id b2sm12502391pgg.59.2022.02.18.22.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:28 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/6] hw/openrisc/openrisc_sim: Parameterize initialization
Date: Sat, 19 Feb 2022 15:42:06 +0900
Message-Id: <20220219064210.3145381-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220219064210.3145381-1-shorne@gmail.com>
References: <20220219064210.3145381-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move magic numbers to variables and enums. These will be reused for
upcoming fdt initialization.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 42 ++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 26d2370e60..d12b3e0c5e 100644
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
@@ -176,21 +199,24 @@ static void openrisc_sim_init(MachineState *machine)
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


