Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E218948E243
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 02:50:48 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Bjp-0004zw-Qk
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 20:50:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Ban-0006lA-EX; Thu, 13 Jan 2022 20:41:25 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:36966 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Bak-00076y-LQ; Thu, 13 Jan 2022 20:41:25 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX3y+41OBheoyDBQ--.37348S5;
 Fri, 14 Jan 2022 09:41:15 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] target/riscv: add support for svpbmt extension
Date: Fri, 14 Jan 2022 09:40:58 +0800
Message-Id: <20220114014059.23300-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowADX3y+41OBheoyDBQ--.37348S5
X-Coremail-Antispam: 1UD129KBjvJXoWxAFWrGry8Ar17GFWfKr47twb_yoW5AF4Upr
 4kG3y2k395tFW3Aa18tr1UJw15CwsI9F4Skws7Zrs7Jr4rJrW3XF1DKw42gF45XF48ZFy3
 u3Z8Cr1Yvr4UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
Cc: wangjunqiang@iscas.ac.cn, Weiwei Li <liweiwei@iscas.ac.cn>,
 lazyparser@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_bits.h   | 3 +++
 target/riscv/cpu_helper.c | 9 ++++++++-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 45ac98e06b..4f82bd00a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c3d1845ca1..53f314c752 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_svinval;
         bool ext_svnapot;
+        bool ext_svpbmt;
         bool ext_zfh;
         bool ext_zfhmin;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bc23e3b523..ee294c1d0b 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -486,7 +486,10 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
+#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
 #define PTE_N               0x8000000000000000 /* NAPOT translation */
+#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 58ab85bca3..f90766e026 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -619,16 +619,23 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
+        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
 
         RISCVCPU *cpu = env_archcpu(env);
         if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
             return TRANSLATE_FAIL;
+        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
+            return TRANSLATE_FAIL;
+        } else if (pte & PTE_RSVD) {
+            return TRANSLATE_FAIL;
         } else if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
+            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
+                return TRANSLATE_FAIL;
+            }
             base = ppn << PGSHIFT;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
-- 
2.17.1


