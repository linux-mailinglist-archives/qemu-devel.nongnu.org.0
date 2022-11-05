Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C961A759
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 04:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or9vW-0007il-N5; Fri, 04 Nov 2022 23:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1or9rl-0004HB-CG
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:05 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1or9ri-0006TF-DZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:04 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx7Nh72GVjnpoEAA--.15601S3;
 Sat, 05 Nov 2022 11:28:59 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtuN52GVjeKENAA--.38334S4; 
 Sat, 05 Nov 2022 11:28:59 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v3 2/7] hw/intc: Fix LoongArch extioi coreisr accessing
Date: Sat,  5 Nov 2022 11:28:52 +0800
Message-Id: <20221105032857.3789472-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221105032857.3789472-1-gaosong@loongson.cn>
References: <20221105032857.3789472-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuN52GVjeKENAA--.38334S4
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry8Jw1kKF4fuF43GrWkCrg_yoWrAw1Dpr
 W7CwsIyr4UJw4fAwnrW3WxGF1DWasrW3W7uFWIkryFkwn8Jrn3urnFvw1v9F1UAa9aq3yU
 tr93Aw45AF4YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

1. When cpu read or write extioi COREISR reg, it should access
the reg belonged to itself, so the cpu index of 's->coreisr'
is current cpu number. Using MemTxAttrs' requester_id to get
the cpu index.
2. it need not to mask 0x1f when calculate the coreisr array index.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221021015307.2570844-3-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/loongarch_extioi.c      | 10 ++++++----
 target/loongarch/iocsr_helper.c | 19 +++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 72f4b0cde5..4b8ec3f28a 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -93,8 +93,9 @@ static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
         *data = s->bounce[index];
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        /* using attrs to get current cpu index */
+        cpu = attrs.requester_id;
         *data = s->coreisr[cpu][index];
         break;
     case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
@@ -185,8 +186,9 @@ static MemTxResult extioi_writew(void *opaque, hwaddr addr,
         s->bounce[index] = val;
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        /* using attrs to get current cpu index */
+        cpu = attrs.requester_id;
         old_data = s->coreisr[cpu][index];
         s->coreisr[cpu][index] = old_data & ~val;
         /* write 1 to clear interrrupt */
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 0e9c537dc7..505853e17b 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -14,54 +14,57 @@
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-ldst.h"
 
+#define GET_MEMTXATTRS(cas) \
+        ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
+
 uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldub(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              GET_MEMTXATTRS(env), NULL);
 }
 
 uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_lduw(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              GET_MEMTXATTRS(env), NULL);
 }
 
 uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldl(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             GET_MEMTXATTRS(env), NULL);
 }
 
 uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldq(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             GET_MEMTXATTRS(env), NULL);
 }
 
 void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stb(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env), NULL);
 }
 
 void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stw(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env), NULL);
 }
 
 void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stl(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env), NULL);
 }
 
 void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stq(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env), NULL);
 }
-- 
2.31.1


