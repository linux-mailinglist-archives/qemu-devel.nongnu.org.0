Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D19614512
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 08:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opllM-0002NF-CY; Tue, 01 Nov 2022 03:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1opllB-0002Me-47
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:32:34 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1opll8-0001oZ-CY
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:32:32 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxbbZ7y2Bjh70DAA--.1682S3;
 Tue, 01 Nov 2022 15:32:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxHuJ6y2BjP2EJAA--.28642S3; 
 Tue, 01 Nov 2022 15:32:11 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@loongson.cn, xen0n@gentoo.org
Subject: [PATCH 2/2] target/loongarch: Fix raise_mmu_exception() set wrong
 exception_index
Date: Tue,  1 Nov 2022 15:32:10 +0800
Message-Id: <20221101073210.3934280-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221101073210.3934280-1-gaosong@loongson.cn>
References: <20221101073210.3934280-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuJ6y2BjP2EJAA--.28642S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr13JF4fWr1UGFWkJw45Awb_yoW8AFW8pF
 9ruryUKr4xJFWDAaykXa90qFn8Xr47CFW2ganaq3yFkw4aqr10vF4kt3sFgF1UJa1rX34I
 9F45Ar1jvF4rWaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


