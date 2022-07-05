Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A9566905
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:20:13 +0200 (CEST)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gbE-0001dm-7x
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI5-0006wF-Us
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHz-0000iF-SI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so8160466pjo.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AohpMsSvo2wFsE5mlCbRYktMX9SmmQeeRLqLmCJ9PEc=;
 b=QbM+VBO/4m9rXFV9gTIQvNTzkO0Kcfq0sbNYO2SQVX3LGgd4orATukT7fW0kFO5wNa
 GvQCqf9bu37Z0fotiIo1lpJdlr2b43K/HRkLir9/XCQD9SNHQQ9HQr3NlcpwTyLGNhq1
 QdPuO0/d9KR7QZkf0dnAEkkuY+vG0Q5durlQOnbGERfQLmukNgWvlYJuVuava+W3gCJ4
 g7NmqG0j4L5gvcv2DroJrsnCrVaPLZy0+eUJVQpfuaFerZMypU20apLu4LqJJ39E2eg5
 WeOtrKf99cqPvggxadZsbCb1rdgJahttPHIuN07UvCxM1nyU9oDGyC3vZUjlR7DhF7n1
 QlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AohpMsSvo2wFsE5mlCbRYktMX9SmmQeeRLqLmCJ9PEc=;
 b=dwFP+wW4sOKxt2U++HE1diG9WEhTq39FleKvbUFt2vH//KSOBAmdZCfmH7W8+fwOHs
 vVZM/OPLvB8nE6p5alnZZaSP8eKtkZqp4HD0nMoGtS8iaZgu3bVxArFd8bKDBZfp9w3g
 ecRNlA1iba4Qd4eeTkUIkOY9i6/yrMPx4KRjbO8Wk2sqHLMLRQISN9CugQk8JmFZbrMg
 e6+nLKNIVGz5huBMAiDoA2Ih1xhu3phyv0Jr2l4/Mhf+GLkht4S+o9MwvpCtLGsvgIqC
 SP2kMK18/0O6DjR4yifey7YUNQz+kJ6/f+yzn8RNiWEBc9qfEGtTU55pp0bwTyD+kWPV
 oJFw==
X-Gm-Message-State: AJIora97h5UOh4nHybRLnaZ8XUKAIPWB7EYJnRxymZSA3q53n7TCwcrc
 C+rayg9FjDoj8v9UtSA7nQ0SyOQu9wBpBE9l
X-Google-Smtp-Source: AGRyM1tAolWC62S5SOh4pOmn4V2QGGkQ2gTYUJKEVg/tBfLsZrulvwILGwKW033CSXRhzxkdAjMBwA==
X-Received: by 2002:a17:902:7893:b0:16a:6d44:2556 with SMTP id
 q19-20020a170902789300b0016a6d442556mr39564318pll.166.1657018816798; 
 Tue, 05 Jul 2022 04:00:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 5/6] hw/intc/loongarch_ipi: Fix ipi device access of 64bits
Date: Tue,  5 Jul 2022 16:29:56 +0530
Message-Id: <20220705105957.1144514-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

In general loongarch ipi device, 32bit registers is emulated, however for
anysend/mailsend device only 64bit register access is supported. So separate
the ipi memory region into two regions, including 32 bits and 64 bits.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220705064901.2353349-2-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/loongarch_ipi.h |  7 +++---
 hw/intc/loongarch_ipi.c         | 38 +++++++++++++++++++++++++++------
 hw/loongarch/loongson3.c        |  5 ++++-
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
index 996ed7ea93..0ee48fca55 100644
--- a/include/hw/intc/loongarch_ipi.h
+++ b/include/hw/intc/loongarch_ipi.h
@@ -24,8 +24,9 @@
 #define IOCSR_MAIL_SEND       0x48
 #define IOCSR_ANY_SEND        0x158
 
-/* IPI system memory address */
-#define IPI_SYSTEM_MEM        0x1fe01000
+#define MAIL_SEND_ADDR        (SMP_IPI_MAILBOX + IOCSR_MAIL_SEND)
+#define MAIL_SEND_OFFSET      0
+#define ANY_SEND_OFFSET       (IOCSR_ANY_SEND - IOCSR_MAIL_SEND)
 
 #define MAX_IPI_CORE_NUM      4
 #define MAX_IPI_MBX_NUM       4
@@ -46,7 +47,7 @@ typedef struct IPICore {
 struct LoongArchIPI {
     SysBusDevice parent_obj;
     MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
-    MemoryRegion ipi_system_mem[MAX_IPI_CORE_NUM];
+    MemoryRegion ipi64_iocsr_mem[MAX_IPI_CORE_NUM];
 };
 
 #endif
diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 66bee93675..b8b1b9cd53 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -150,12 +150,6 @@ static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
     case IOCSR_IPI_SEND:
         ipi_send(val);
         break;
-    case IOCSR_MAIL_SEND:
-        mail_send(val);
-        break;
-    case IOCSR_ANY_SEND:
-        any_send(val);
-        break;
     default:
         qemu_log_mask(LOG_UNIMP, "invalid write: %x", (uint32_t)addr);
         break;
@@ -172,6 +166,32 @@ static const MemoryRegionOps loongarch_ipi_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+/* mail send and any send only support writeq */
+static void loongarch_ipi_writeq(void *opaque, hwaddr addr, uint64_t val,
+                                 unsigned size)
+{
+    addr &= 0xfff;
+    switch (addr) {
+    case MAIL_SEND_OFFSET:
+        mail_send(val);
+        break;
+    case ANY_SEND_OFFSET:
+        any_send(val);
+        break;
+    default:
+       break;
+    }
+}
+
+static const MemoryRegionOps loongarch_ipi64_ops = {
+    .write = loongarch_ipi_writeq,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+    .valid.min_access_size = 8,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 static void loongarch_ipi_init(Object *obj)
 {
     int cpu;
@@ -187,8 +207,12 @@ static void loongarch_ipi_init(Object *obj)
     lams = LOONGARCH_MACHINE(machine);
     for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
         memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
-                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x100);
+                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
         sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
+
+        memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
+                              &lams->ipi_core[cpu], "loongarch_ipi64_iocsr", 0x118);
+        sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem[cpu]);
         qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
     }
 }
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 403dd91e11..15fddfc4f5 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -230,7 +230,10 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         /* IPI iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
                                     sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
-                                    cpu));
+                                    cpu * 2));
+        memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
+                                    sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
+                                    cpu * 2 + 1));
         /* extioi iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
-- 
2.34.1


