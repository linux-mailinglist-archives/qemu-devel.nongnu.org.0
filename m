Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8C4C7012
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:52:27 +0100 (CET)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhNy-0004Uu-Ia
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhL5-0001JE-Tw; Mon, 28 Feb 2022 09:49:27 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:58320 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhL0-0002Vk-Qo; Mon, 28 Feb 2022 09:49:27 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADHzfHl4BxirdTdAQ--.5182S10;
 Mon, 28 Feb 2022 22:49:18 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v7 08/14] target/riscv: rvk: add support for sha256 related
 instructions in zknh extension
Date: Mon, 28 Feb 2022 22:48:04 +0800
Message-Id: <20220228144810.7284-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADHzfHl4BxirdTdAQ--.5182S10
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7XFyftw45uryrCFWDtwb_yoW5Xr13pF
 1rKryfCrWkArWrAa4ftF15ZF13CFs7u3yUt3sxtwn3Kay5XF45Za1qgw43KrsrXFyq9F4j
 kFWkCryY934rJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: wangjunqiang@iscas.ac.cn, Weiwei Li <liweiwei@iscas.ac.cn>,
 lazyparser@gmail.com, luruibo2000@163.com, lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn32.decode              |  5 ++++
 target/riscv/insn_trans/trans_rvk.c.inc | 37 +++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0b800b4093..db28ecdd2b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -857,3 +857,8 @@ aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
 # *** RV64 Zkne/zknd Standard Extension ***
 aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
 aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
+# *** RV32 Zknh Standard Extension ***
+sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
+sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
+sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
+sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index e315462e5a..02a3261675 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -29,6 +29,12 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKNH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zknh) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
                           void (*func)(TCGv, TCGv, TCGv, TCGv))
 {
@@ -112,3 +118,34 @@ static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
     REQUIRE_ZKND(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
 }
+
+#define GEN_SHA256(NAME, OP, NUM1, NUM2, NUM3) \
+static void gen_##NAME(TCGv dest, TCGv src1) \
+{ \
+    TCGv_i32 t0 = tcg_temp_new_i32(); \
+    TCGv_i32 t1 = tcg_temp_new_i32(); \
+    TCGv_i32 t2 = tcg_temp_new_i32(); \
+    \
+    tcg_gen_trunc_tl_i32(t0, src1); \
+    tcg_gen_rotri_i32(t1, t0, NUM1); \
+    tcg_gen_rotri_i32(t2, t0, NUM2); \
+    tcg_gen_xor_i32(t1, t1, t2); \
+    tcg_gen_##OP##_i32(t2, t0, NUM3); \
+    tcg_gen_xor_i32(t1, t1, t2); \
+    tcg_gen_ext_i32_tl(dest, t1); \
+    \
+    tcg_temp_free_i32(t0); \
+    tcg_temp_free_i32(t1); \
+    tcg_temp_free_i32(t2); \
+} \
+\
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+{ \
+    REQUIRE_ZKNH(ctx); \
+    return gen_unary(ctx, a, EXT_NONE, gen_##NAME); \
+}
+
+GEN_SHA256(sha256sig0, shri, 7, 18, 3)
+GEN_SHA256(sha256sig1, shri, 17, 19, 10)
+GEN_SHA256(sha256sum0, rotri, 2, 13, 22)
+GEN_SHA256(sha256sum1, rotri, 6, 11, 25)
-- 
2.17.1


