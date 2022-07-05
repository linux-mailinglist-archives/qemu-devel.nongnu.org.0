Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8F566911
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:24:42 +0200 (CEST)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gfZ-00008t-Kt
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI5-0006wH-Ut
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI0-0000jX-T9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id fz10so5705231pjb.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l2yErBWzj5ESCHU8EEDRL6D/1bAkAZGvE1eyYa7hP9s=;
 b=L4pE2MJ4f1tjX8pmM0ptFwGkw2raZ3UFH2QlkNjOhkv1wPRYa2iQgochHgiOgaJKlQ
 Gsc0iPkLL5vRO9vGOffuWpYOzAv6meBujVNhsP7Dxy6aUD4jM5bTVc4O6RcQxhIfo7rw
 mc6T7dkZ0TsGsXeDMgSZ6Krh1AurPHH6SbyL2Lkw938P+qMCSZZBMnu/HKp/xHzdErVM
 pyXTRLtJdn5PKa+kVZwAehYvaVpYalh39BXqgJNyQtBVBoTD5fvrI25Cl1os2ZTFlLRr
 mIGCtlLi6brqjp8zPmY8DzplupPN5XWCoaueBMzUZ/PiRsl+nOri6W574JBuRyTIUhoF
 Agaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2yErBWzj5ESCHU8EEDRL6D/1bAkAZGvE1eyYa7hP9s=;
 b=xUpkeWjpGjopkkgmWDmofbmlMlPB4z26M5LQTwNKlR8UvqxxitjC7RZlZUkGZneLes
 9ysTudOQOBBJe+uSTFrRlwauzdRTvgju2fWacEn7KQ2fhDdXOMZr8qRRRR+pk/J2n9uD
 oB6T65i01Uw3Pm9pH32tK5aCWPYl+pQ8jUEa8ERTbl1Ec1arNMlbm7z/z9Z3J5BSi7VQ
 E+DSFnVd3pyfQWS1HT0MFuWrNg1E/HbBW09Lxx/Y+HvRvv8kWLNRP22iQDTc1V7Y7JTJ
 ihuwPogZ89a46efR5OW7TgWnw0DpwNgPo+3tyNYe0i2HTbVMaIFF2LHQd3daxn7IJHKS
 4OXQ==
X-Gm-Message-State: AJIora9rxFSpv465VTDvYM4SP3HHRea7wADcXzeKVcmP7QcbXihVyxYm
 NVdtUeKDVhLvJWNSqalxApfi03PqfxtYCpul
X-Google-Smtp-Source: AGRyM1sgVONXjs3G1Mc+JzqXL9TYkfqHdKkrfXDqNgihbRtG/I348fs4JMR70EJxyxaJONH7X6hiGA==
X-Received: by 2002:a17:903:2614:b0:16b:d519:d1e2 with SMTP id
 jd20-20020a170903261400b0016bd519d1e2mr16800847plb.93.1657018819671; 
 Tue, 05 Jul 2022 04:00:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 6/6] hw/intc/loongarch_ipi: Fix mail send and any send function
Date: Tue,  5 Jul 2022 16:29:57 +0530
Message-Id: <20220705105957.1144514-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

By the document of ipi mailsend device, byte is written only when the mask bit
is 0. The original code discards mask bit and overwrite the data always, this
patch fixes the issue.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220705064901.2353349-3-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/loongarch_ipi.c | 54 +++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index b8b1b9cd53..4f3c58f872 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -50,35 +50,45 @@ static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-static int get_ipi_data(target_ulong val)
+static void send_ipi_data(CPULoongArchState *env, target_ulong val, target_ulong addr)
 {
-    int i, mask, data;
+    int i, mask = 0, data = 0;
 
-    data = val >> 32;
-    mask = (val >> 27) & 0xf;
-
-    for (i = 0; i < 4; i++) {
-        if ((mask >> i) & 1) {
-            data &= ~(0xff << (i * 8));
+    /*
+     * bit 27-30 is mask for byte writing,
+     * if the mask is 0, we need not to do anything.
+     */
+    if ((val >> 27) & 0xf) {
+        data = address_space_ldl(&env->address_space_iocsr, addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+        for (i = 0; i < 4; i++) {
+            /* get mask for byte writing */
+            if (val & (0x1 << (27 + i))) {
+                mask |= 0xff << (i * 8);
+            }
         }
     }
-    return data;
+
+    data &= mask;
+    data |= (val >> 32) & ~mask;
+    address_space_stl(&env->address_space_iocsr, addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static void ipi_send(uint64_t val)
 {
     int cpuid, data;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     /* IPI status vector */
     data = 1 << (val & 0x1f);
-    qemu_mutex_lock_iothread();
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
-    qemu_mutex_unlock_iothread();
     address_space_stl(&env->address_space_iocsr, 0x1008,
                       data, MEMTXATTRS_UNSPECIFIED, NULL);
 
@@ -86,23 +96,23 @@ static void ipi_send(uint64_t val)
 
 static void mail_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     addr = 0x1020 + (val & 0x1c);
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void any_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
 
@@ -111,9 +121,7 @@ static void any_send(uint64_t val)
     CPUState *cs = qemu_get_cpu(cpuid);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
-- 
2.34.1


