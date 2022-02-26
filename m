Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFE4C5339
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:05:44 +0100 (CET)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmSt-0008W0-DD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:05:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmN4-0002HU-FF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:47 -0500
Received: from [2607:f8b0:4864:20::52f] (port=40870
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMz-00074L-Sp
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:42 -0500
Received: by mail-pg1-x52f.google.com with SMTP id w37so6178371pga.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRWwYIpH79WnXrvA95iIW6INZqQLTad2HjWVVpgkLC0=;
 b=icbE9ETAU1Xb40ld5G5SOH0OoLsC3KRyzUphZh9QSxPwH3qzAaEVajXW7asyl+uACM
 h8S25bqjHtwswBn7MKBqepQGDWgrUX04u7FcnZBuqnIsAd8t9P5f+hyipGoeER/yzDbc
 FskAfZjMYMLU3bnHYw1EKaR5VyPNZsGom58vb3ny6Znx7ddCX+bY6l9+gfaRmjDri91k
 4E3wDVw8LCl5u9/96YPy1zQDrN7nT4XkjLOTzKYDRRczLk7LNKPKYwta6ktUxu5HWXxH
 WnD/SEFlRQfdMFF2ZCKUVdKfr1rBE41sYUerqoGuy2Lrdjpd0QR1jMhJCV970OBlXW7z
 nHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRWwYIpH79WnXrvA95iIW6INZqQLTad2HjWVVpgkLC0=;
 b=zXaRHpSdXSMAlM+kAwkOa0GwGz4pMroZjhNBnoLyu/SwNMJUp58slCK6lsUDbigBW2
 tSeohycb0Qo61ION+YpQiysqaYUKro5jOhMwbdvV5ZQMsN6RAvXDN+QZPCFouruXxIYr
 OjE6z19Vf/LtVxUaTZCjPeN1c3ZEG6CitpmllItC36Ma4qI4ba75MfVY6xSTw1p4tmKR
 QpPFxmWRG6gJYs+RC4rIwtkrnUuSzGz7+VumrY5uQEIXGRrH3aO3GkkAEStdDqYKSW17
 JmeeDGNWknE3PnPinu+ENnnBiIq+cOF7tFVqE1OfrlWurfCJVx6Tq3F21iEoieJEmTSc
 mdXA==
X-Gm-Message-State: AOAM532uHhu3dXR/sFKXe6wybPebuBbTukSNAKMy52bRzZYX4HjjWINk
 8Z3+8bQXSp/1eaGPzh70ITB6O3T0JI9+vw==
X-Google-Smtp-Source: ABdhPJySS7v/O9HqdLqrXrh/GUzIzbJDhv/lz97yfnGZBEMLcbtm9jinZcZEtSu09XHgiLLgGQwHbQ==
X-Received: by 2002:a63:27c7:0:b0:372:c656:20b2 with SMTP id
 n190-20020a6327c7000000b00372c65620b2mr8501883pgn.545.1645840776133; 
 Fri, 25 Feb 2022 17:59:36 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f2a4316a0asm4477807pfv.60.2022.02.25.17.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:35 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting UART
Date: Sat, 26 Feb 2022 10:59:21 +0900
Message-Id: <20220226015924.1293022-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
References: <20220226015924.1293022-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52f.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the OpenRISC SMP configuration only supports 2 cores due to
the UART IRQ routing being limited to 2 cores.  As was done in commit
1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.

This patch moves serial initialization out to it's own function and
uses a splitter to connect multiple CPU irq lines to the UART.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


