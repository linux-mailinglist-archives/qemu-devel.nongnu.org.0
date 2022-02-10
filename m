Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B24B0DFA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:58:33 +0100 (CET)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI91r-0006rC-9T
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eQ-0002Jp-Ar
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:18 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39901
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eO-0004vU-CY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:18 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso8334026pjt.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=jxllV9Osn3fKWDYa1InXAfJ6p04hxUFrmYBK6y7Ey8BThkp2o0JPODQTDniTUKqO1F
 Idq74J8gJphtu6cgqxk1tcrV08jBe1sIJ+7PaLCwhrmTjYcIndbEIfVLirhu+4v/JeJs
 bm2ZbhwcCM9nJLAYFRQXRLHoUjyvj5Z/m9XgaLSx3mcy4VmPFMnhg6Y1/tcJEBXKdXg2
 m/q4NLH1DIXrV0oQdOUxUmPMo963u72GcAgzTaG0M/8EhhOvSoVyTcDvr6RTiiJEwepj
 8SL8qdsn8xfCQch8viETrAOuvrTpctkkr5lmoRZFFDfv+RoWb69xzEv+Sx4LS1vHmrur
 Clzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+a1/AvqQIHRNVAxSn1EGU2MopJ+WOc+lm0G/tKcRReY=;
 b=a/O1JSBgv5pj/XwsHDnGPiWr2tEJWEkd6kKwobbmZmONgoaRLVayqveNEUxXnNr9SE
 nAGqD0nbwmPoUh8/CWKAtdWCWkQ3PciXkhF+M0RDcVUc0yabH3UovypAAoh+890Aw5XK
 IGfdvw58FuLQyYlbRQDnx1L5uQAY4vJ7CXYb6pFF9mDi7qzdilE/+fY/4lM0VWFuRFuE
 5O0k5+gLnoZw4HPBAWGhMW00kWei7I/HR/dMSbQpyXs9VKzPQgRYL5MEFF8LMwwc559t
 zLynfD5Dqc1QtanJpZYNJ8WknupdKajsKakKSqsuFUe0hM0WWEJbtOkfZB3QDgDqp9If
 TdVQ==
X-Gm-Message-State: AOAM530bpalKQRfF0kSBxFdi14wi23Ms94aFtVEs0w++g//uESjwnYA/
 vzG0aX+J9Di3N+n376hyHcr1yOiKksjwKvYh
X-Google-Smtp-Source: ABdhPJyUQBxczAWmfwbBzPq+F1rOFtezKPmOwdymI2ed3RXPsr27FAjwAsG+zHCXeXRhi01E9VF4yQ==
X-Received: by 2002:a17:902:74c6:: with SMTP id
 f6mr7476376plt.30.1644496453768; 
 Thu, 10 Feb 2022 04:34:13 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id l22sm24476042pfc.191.2022.02.10.04.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:13 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/4] hw/openrisc/openrisc_sim: Parameterize initialization
Date: Thu, 10 Feb 2022 21:34:01 +0900
Message-Id: <20220210123403.2059926-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210123403.2059926-1-shorne@gmail.com>
References: <20220210123403.2059926-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
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


