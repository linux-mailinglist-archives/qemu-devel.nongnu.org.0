Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75C4C5C41
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 15:32:51 +0100 (CET)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOKbS-0003n7-Rq
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 09:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKWj-0003WP-DG; Sun, 27 Feb 2022 09:27:57 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:35454 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKWS-0003jm-3H; Sun, 27 Feb 2022 09:27:57 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACX3sZLihti7HLGAQ--.65305S10;
 Sun, 27 Feb 2022 22:27:33 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 08/14] target/riscv: rvk: add support for sha256 related
 instructions in zknh extension
Date: Sun, 27 Feb 2022 22:25:47 +0800
Message-Id: <20220227142553.25815-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACX3sZLihti7HLGAQ--.65305S10
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7Ar4fCw18WFy7uFW8tFb_yoWrCw4kpr
 4rKrWfGrWUGFWSya1fKa15Gr13Ar4xuryUtws3tw1Iya1fXrZ5Xr1qqw4aka1UJF98ur1Y
 kayDCFyakrsYqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
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
 target/riscv/crypto_helper.c            | 31 +++++++++++++
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 9e56668627..f5ffc262f2 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -272,4 +272,35 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
 
     return result;
 }
+
+#define ROR32(a, amt) ((a << (-amt & 31)) | (a >> (amt & 31)))
+
+target_ulong HELPER(sha256sig0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 7) ^ ROR32(a, 18) ^ (a >> 3));
+}
+
+target_ulong HELPER(sha256sig1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 17) ^ ROR32(a, 19) ^ (a >> 10));
+}
+
+target_ulong HELPER(sha256sum0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 2) ^ ROR32(a, 13) ^ ROR32(a, 22));
+}
+
+target_ulong HELPER(sha256sum1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
+}
+#undef ROR32
 #undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 040b771eb6..898d093ae9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1129,3 +1129,8 @@ DEF_HELPER_2(aes64dsm, tl, tl, tl)
 DEF_HELPER_2(aes64ks2, tl, tl, tl)
 DEF_HELPER_2(aes64ks1i, tl, tl, tl)
 DEF_HELPER_1(aes64im, tl, tl)
+
+DEF_HELPER_1(sha256sig0, tl, tl)
+DEF_HELPER_1(sha256sig1, tl, tl)
+DEF_HELPER_1(sha256sum0, tl, tl)
+DEF_HELPER_1(sha256sum1, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bf6a8797a2..f86745edcb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -854,3 +854,8 @@ aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
 # *** RV64 Zkne/zknd Standard Extension ***
 aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
 aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd
+# *** RV32 Zknh Standard Extension ***
+sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
+sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
+sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
+sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index 3dc855fd3c..ce29eaa2f4 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -29,6 +29,12 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKNH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zknh) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
 {
     REQUIRE_ZKNE(ctx);
@@ -194,3 +200,55 @@ static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
 
     return true;
 }
+
+static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sig1(DisasContext *ctx, arg_sha256sig1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum0(DisasContext *ctx, arg_sha256sum0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
-- 
2.17.1


