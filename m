Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184A48FA69
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 04:04:09 +0100 (CET)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8vpv-0007a9-SY
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 22:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8vnd-0003RK-1p; Sat, 15 Jan 2022 22:01:45 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:56476 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8vnL-0002lJ-AB; Sat, 15 Jan 2022 22:01:31 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXXVluiuNhImeeBQ--.54727S4;
 Sun, 16 Jan 2022 11:01:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] target/riscv: add support for svnapot extension
Date: Sun, 16 Jan 2022 10:59:23 +0800
Message-Id: <20220116025925.29973-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABXXVluiuNhImeeBQ--.54727S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4DAw4fXF43XF1xWFyrXrb_yoW5Zw4fpr
 Z8G39FkrZ7JFW3Aa1fKF1UJw1rGw4Y93yF9w4xZrs7Gw4rJrW5W3Wqkws09F45XFW8ZryY
 9an8CF1Yyr4UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUUUUU==
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

- add PTE_N bit
- add PTE_N bit check for inner PTE
- update address translation to support 64KiB continuous region (napot_bits = 4)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 22 +++++++++++++++++-----
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..ff6c86c85b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -668,6 +668,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..d3d17cde82 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -327,6 +327,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_svnapot;
         bool ext_zfh;
         bool ext_zfhmin;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..bc23e3b523 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -486,6 +486,7 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_N               0x8000000000000000 /* NAPOT translation */
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d84cde424d..832a2dd79c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -619,14 +619,17 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
 
-        if (!(pte & PTE_V)) {
+        RISCVCPU *cpu = env_archcpu(env);
+        if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+            return TRANSLATE_FAIL;
+        } else if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U)) {
+            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
                 return TRANSLATE_FAIL;
             }
             base = ppn << PGSHIFT;
@@ -702,8 +705,17 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+
+            int napot_bits = ((pte & PTE_N) ? (ctzl(ppn) + 1) : 0);
+            if (((pte & PTE_N) && ((ppn == 0) || (i != (levels - 1)))) ||
+                (napot_bits != 0 && napot_bits != 4)) {
+                return TRANSLATE_FAIL;
+            }
+
+            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << ptshift) - 1))
+                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-- 
2.17.1


