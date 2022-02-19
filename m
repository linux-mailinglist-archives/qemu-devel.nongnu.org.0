Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C504BC640
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:08:44 +0100 (CET)
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLJrH-00074A-Kz
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJTC-0006k6-3v
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:50 -0500
Received: from [2607:f8b0:4864:20::52a] (port=33774
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJS3-0007Zv-1g
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:49 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 12so6135533pgd.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPpz9c043ribsgKaSugS8Enb+xI2S8O31WIDIpSwOJY=;
 b=fwjrACVOjCppXGq8o1FbWeNA2MuQqd5Mdj7vFo1lR1nIkvfgmDzN9Wm8sCL3ej/4IK
 phshZhligw3MrsxgKcOcRz6Y0q5e/SgrGSMqdEa43ZFps922lqRe5p1c5WJJbsG1Szab
 yHx/IXJozpI4q7rDD/e6UG0ovpa2+i9tz82L1gF/mulU6EbYFwvan9TmdHd3/BeYkKeD
 KbgB/9oxjJlI/4dMA8EpLqjbi9t9/wZ40wzc8aKyHNPQBqZQ/myDvfV3wh9M0yHDmpA6
 9mhew0T78/TsbFjyaLzZWsnlZmoC83OkEMGhZSqL4tdcBTxLmekLAkHuassLre3gNk1Y
 gP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPpz9c043ribsgKaSugS8Enb+xI2S8O31WIDIpSwOJY=;
 b=7MQQT/R2/cOpg4rJJP9rTbP7JKWFVv52zwd8Jf4+F6POfHX8QbfFLf30tZ/ZGa6IO1
 +aZwCED2+SSJ3DofbGQUfmt+PmZF+q5b5O8zmwyttqlT2tp6bVXmTlC/+5wWHRA9eElS
 NexpMgaWq7kR5+NFXGMs9cLU5omMk/fnHTiNcyYh9ZKV1BnRFgUbI2UDma3NiI9DdOQN
 Eqpf1ZhUSv3GRmULy4nSmcDA5KagLFvDzPAUqP4JFZNdodDabbcUwvehFNFiBsqhXyC8
 1/RHZT+wA00uCVILoOsYeGo4xxImRRXFY6nKXjBSTZuxpoGtND1x9wTxNzsgZ4Uzm9AX
 msWA==
X-Gm-Message-State: AOAM533qdOTxrUnSnyCeNpTRVQeSAVfMyLq0+oVYpndBq5ip40H3yMo0
 Mnlis4s4r5xHtDNC+s4Y7IgNyDMCoR6CMA==
X-Google-Smtp-Source: ABdhPJxSKIAELnsx1l+INtzRnheGDmkRUJoNYDMeT8vmXe8DsIQIZ1+7bjcH7gqE6i0ptbhouZ2e0A==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr10999869pfk.47.1645252951120; 
 Fri, 18 Feb 2022 22:42:31 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id o17sm1649669pfu.26.2022.02.18.22.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:30 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting UART
Date: Sat, 19 Feb 2022 15:42:07 +0900
Message-Id: <20220219064210.3145381-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220219064210.3145381-1-shorne@gmail.com>
References: <20220219064210.3145381-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52a.google.com
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
 Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the OpenRISC SMP configuration only supports 2 cores due to
the UART IRQ routing being limited to 2 cores.  As was done in commit
1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.

This patch moves serial initialization out to it's own function and
uses a splitter to connect multiple CPU irq lines to the UART.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d12b3e0c5e..5bfbac00f8 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -137,6 +137,28 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
     sysbus_mmio_map(s, 0, base);
 }
 
+static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
+                                     OpenRISCCPU *cpus[], int irq_pin)
+{
+    qemu_irq serial_irq;
+    int i;
+
+    if (num_cpus > 1) {
+        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
+        qdev_realize_and_unref(splitter, NULL, &error_fatal);
+        for (i = 0; i < num_cpus; i++) {
+            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
+        }
+        serial_irq = qdev_get_gpio_in(splitter, 0);
+    } else {
+        serial_irq = get_cpu_irq(cpus, 0, irq_pin);
+    }
+    serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+}
+
+
 static void openrisc_load_kernel(ram_addr_t ram_size,
                                  const char *kernel_filename)
 {
@@ -177,7 +199,6 @@ static void openrisc_sim_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     OpenRISCCPU *cpus[2] = {};
     MemoryRegion *ram;
-    qemu_irq serial_irq;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -208,15 +229,10 @@ static void openrisc_sim_init(MachineState *machine)
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(or1ksim_memmap[OR1KSIM_OMPIC].base, smp_cpus,
                                 cpus, OR1KSIM_OMPIC_IRQ);
-
-        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ),
-                                    get_cpu_irq(cpus, 1, OR1KSIM_UART_IRQ));
-    } else {
-        serial_irq = get_cpu_irq(cpus, 0, OR1KSIM_UART_IRQ);
     }
 
-    serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
-                   serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    openrisc_sim_serial_init(or1ksim_memmap[OR1KSIM_UART].base, smp_cpus, cpus,
+                             OR1KSIM_UART_IRQ);
 
     openrisc_load_kernel(ram_size, kernel_filename);
 }
-- 
2.31.1


