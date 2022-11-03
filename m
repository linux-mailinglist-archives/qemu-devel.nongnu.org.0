Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7E617CD4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:40:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZVZ-0002Q6-1s; Thu, 03 Nov 2022 08:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqZV6-0002Jn-VL
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqZV0-0000ZM-QT
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:16 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxOdhptmNjUDsEAA--.12905S3;
 Thu, 03 Nov 2022 20:39:05 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldltmNjofgLAA--.16257S9; 
 Thu, 03 Nov 2022 20:39:05 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 7/7] target/loongarch: Fix raise_mmu_exception() set wrong
 exception_index
Date: Thu,  3 Nov 2022 20:39:01 +0800
Message-Id: <20221103123901.2811990-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221103123901.2811990-1-gaosong@loongson.cn>
References: <20221103123901.2811990-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldltmNjofgLAA--.16257S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr13JF4fWr1UGFWkJw45Awb_yoW8Cw13pF
 9ruryUKr48JFWDAaykXa9YqFn8Xr47CF42ganaq3yFkw4aqr1jvF4kt3srKF1UJa1rX34I
 vF45Ar1jvF4rWaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the address is invalid address, We should set exception_index
according to MMUAccessType, and EXCCODE_ADEF need't update badinstr.
Otherwise, The system enters an infinite loop. e.g:
run test.c on system mode
test.c:
    #include<stdio.h>

    void (*func)(int *);

    int main()
    {
        int i = 8;
        void *ptr = (void *)0x4000000000000000;
        func = ptr;
        func(&i);
        return 0;
    }

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20221101073210.3934280-2-gaosong@loongson.cn>
---
 target/loongarch/cpu.c        | 1 +
 target/loongarch/tlb_helper.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index b28aaed5ba..1512664214 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -177,6 +177,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         }
         QEMU_FALLTHROUGH;
     case EXCCODE_PIF:
+    case EXCCODE_ADEF:
         cause = cs->exception_index;
         update_badinstr = 0;
         break;
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index 610b6d123c..d2f8fb0c60 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -229,7 +229,8 @@ static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
     switch (tlb_error) {
     default:
     case TLBRET_BADADDR:
-        cs->exception_index = EXCCODE_ADEM;
+        cs->exception_index = access_type == MMU_INST_FETCH
+                              ? EXCCODE_ADEF : EXCCODE_ADEM;
         break;
     case TLBRET_NOMATCH:
         /* No TLB match for a mapped address */
@@ -643,7 +644,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPULoongArchState *env = &cpu->env;
     hwaddr physical;
     int prot;
-    int ret = TLBRET_BADADDR;
+    int ret;
 
     /* Data access */
     ret = get_physical_address(env, &physical, &prot, address,
-- 
2.31.1


