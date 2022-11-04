Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49761940A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtVd-0002ma-6e; Fri, 04 Nov 2022 06:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqtVJ-0002Tg-R4
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:51 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqtVE-0000vJ-BK
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:48 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx37fG4mRjwHsEAA--.10403S3;
 Fri, 04 Nov 2022 18:00:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPuDC4mRjYmUNAA--.37849S9; 
 Fri, 04 Nov 2022 18:00:37 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL v2 7/9] target/loongarch: Fix raise_mmu_exception() set wrong
 exception_index
Date: Fri,  4 Nov 2022 18:00:31 +0800
Message-Id: <20221104100033.3473980-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221104100033.3473980-1-gaosong@loongson.cn>
References: <20221104100033.3473980-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPuDC4mRjYmUNAA--.37849S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr13JF4fWr1UGFWkJw45Awb_yoW8Cw13pF
 9ruryUKr48JFWDAaykXa9YqFn8Xr47CF42ganaq3yFkw4aqr1jvF4kt3srKF1UJa1rX34I
 vF45Ar1jvF4rWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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


