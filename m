Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97594DD3E8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 05:23:03 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV48k-0008MG-Ig
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 00:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV464-0004fj-W7; Fri, 18 Mar 2022 00:20:17 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:56934 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV45t-0001mN-3q; Fri, 18 Mar 2022 00:20:11 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABHKfJmCDRijsoBBA--.29102S6;
 Fri, 18 Mar 2022 12:19:55 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v9 04/14] target/riscv: rvk: add support for zbkx extension
Date: Fri, 18 Mar 2022 12:19:34 +0800
Message-Id: <20220318041944.19859-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABHKfJmCDRijsoBBA--.29102S6
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy8Jr1DXFy3Zr1fGw1xKrg_yoWrGry5pF
 4fKrW3GFWUJrWfXa1SyF45G3W3Jrs3Wr17Zws3tw1kta15JFZ5tr1qkw43KF45JFn09r4j
 9a1DA34ay3y8Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 lazyparser@gmail.com, luruibo2000@163.com, lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 - add xperm4 and xperm8 instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index e003e8b25b..b99c4a39a1 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -102,3 +102,30 @@ target_ulong HELPER(zip)(target_ulong rs1)
     x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
     return x;
 }
+
+static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
+                                    uint32_t sz_log2)
+{
+    target_ulong r = 0;
+    target_ulong sz = 1LL << sz_log2;
+    target_ulong mask = (1LL << sz) - 1;
+    target_ulong pos;
+
+    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
+        pos = ((rs2 >> i) & mask) << sz_log2;
+        if (pos < sizeof(target_ulong) * 8) {
+            r |= ((rs1 >> pos) & mask) << i;
+        }
+    }
+    return r;
+}
+
+target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 2);
+}
+
+target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 3);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7331d32dbf..a1d28b257f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3a49acab37..75ffac9c81 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -776,6 +776,10 @@ clmulh     0000101 .......... 011 ..... 0110011 @r
 # *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
 
+# *** RV32 Zbkx Standard Extension ***
+xperm4     0010100 .......... 010 ..... 0110011 @r
+xperm8     0010100 .......... 100 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 5a5751557d..e2b8329f1e 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -48,6 +48,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBKX(ctx) do {                   \
+    if (!ctx->cfg_ptr->ext_zbkx) {               \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -574,3 +580,15 @@ static bool trans_zip(DisasContext *ctx, arg_zip *a)
     REQUIRE_ZBKB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
 }
+
+static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4, NULL);
+}
+
+static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8, NULL);
+}
-- 
2.17.1


