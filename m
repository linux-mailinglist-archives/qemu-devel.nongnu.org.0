Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A06D9380
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:02:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMQW-00020r-CL; Thu, 06 Apr 2023 06:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pkMQS-0001zO-3J
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:01:04 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pkMQP-00055p-TO
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:01:03 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxJAxWmC5kSjwXAA--.35737S3;
 Thu, 06 Apr 2023 18:00:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxT+RVmC5kPQ8XAA--.58108S3; 
 Thu, 06 Apr 2023 18:00:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH 2/3] hw/intc: Add NULL pointer check on LoongArch ipi device
Date: Thu,  6 Apr 2023 18:00:51 +0800
Message-Id: <20230406100052.3355632-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230406100052.3355632-1-gaosong@loongson.cn>
References: <20230406100052.3355632-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxT+RVmC5kPQ8XAA--.58108S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr4rJrWfXFy8Xr1rurWfZrb_yoW8CF4xpr
 9I9w4akr48tFW7Xanrt34UuF1UGrn293yYyFsxK3yF9a1kuryvga4DK3s7XF1v9340vFyY
 vr1kA3y7XF1UWa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When ipi mailbox is used, cpu index is decoded from iocsr register.
cpu maybe does not exist. This patch adss NULL pointer check on
ipi device.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/loongarch_ipi.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 0563d83a35..39e899df46 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -86,11 +86,12 @@ static void ipi_send(uint64_t val)
     /* IPI status vector */
     data = 1 << (val & 0x1f);
     cs = qemu_get_cpu(cpuid);
-    cpu = LOONGARCH_CPU(cs);
-    env = &cpu->env;
-    address_space_stl(&env->address_space_iocsr, 0x1008,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
-
+    if (cs) {
+        cpu = LOONGARCH_CPU(cs);
+        env = &cpu->env;
+        address_space_stl(&env->address_space_iocsr, 0x1008,
+                          data, MEMTXATTRS_UNSPECIFIED, NULL);
+    }
 }
 
 static void mail_send(uint64_t val)
@@ -104,9 +105,11 @@ static void mail_send(uint64_t val)
     cpuid = (val >> 16) & 0x3ff;
     addr = 0x1020 + (val & 0x1c);
     cs = qemu_get_cpu(cpuid);
-    cpu = LOONGARCH_CPU(cs);
-    env = &cpu->env;
-    send_ipi_data(env, val, addr);
+    if (cs) {
+        cpu = LOONGARCH_CPU(cs);
+        env = &cpu->env;
+        send_ipi_data(env, val, addr);
+    }
 }
 
 static void any_send(uint64_t val)
@@ -114,13 +117,17 @@ static void any_send(uint64_t val)
     int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     addr = val & 0xffff;
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
-    env = &cpu->env;
-    send_ipi_data(env, val, addr);
+    cs = qemu_get_cpu(cpuid);
+    if (cs) {
+        cpu = LOONGARCH_CPU(cs);
+        env = &cpu->env;
+        send_ipi_data(env, val, addr);
+    }
 }
 
 static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
-- 
2.31.1


