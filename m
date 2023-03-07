Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B86AD8EB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:15:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSSk-00061h-RK; Tue, 07 Mar 2023 03:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSg-0005zp-Aq; Tue, 07 Mar 2023 03:14:18 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSc-0007Jk-Vd; Tue, 07 Mar 2023 03:14:18 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowACn0qJN8gZkNe6lDA--.36330S5;
 Tue, 07 Mar 2023 16:14:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 03/10] target/riscv: add support for Zcf extension
Date: Tue,  7 Mar 2023 16:13:56 +0800
Message-Id: <20230307081403.61950-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACn0qJN8gZkNe6lDA--.36330S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uF43Jry7Xw47JFyrJF4UXFb_yoW8trW3pr
 18Cay7GrWUAryfA3Z3tF45Xr1UJrs2gry8t3sIyw1kGa1UGFs8Zw1qqr13tr4UXFyvqr1Y
 kF18A39xC3yktrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ccfe59f294..f3ea650325 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -109,11 +109,11 @@ sw                110  ... ... .. ... 00 @cs_w
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
 {
   ld              011  ... ... .. ... 00 @cl_d
-  flw             011  ... ... .. ... 00 @cl_w
+  c_flw           011  ... ... .. ... 00 @cl_w
 }
 {
   sd              111  ... ... .. ... 00 @cs_d
-  fsw             111  ... ... .. ... 00 @cs_w
+  c_fsw           111  ... ... .. ... 00 @cs_w
 }
 
 # *** RV32/64C Standard Extension (Quadrant 1) ***
@@ -174,9 +174,9 @@ sw                110 .  .....  ..... 10 @c_swsp
 {
   c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
   ld              011 .  .....  ..... 10 @c_ldsp
-  flw             011 .  .....  ..... 10 @c_lwsp
+  c_flw           011 .  .....  ..... 10 @c_lwsp
 }
 {
   sd              111 .  .....  ..... 10 @c_sdsp
-  fsw             111 .  .....  ..... 10 @c_swsp
+  c_fsw           111 .  .....  ..... 10 @c_swsp
 }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 052408f45c..9e9fa2087a 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,6 +30,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZCF(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zcf) {              \
+        return false;                          \
+    }                                          \
+} while (0)
+
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     TCGv_i64 dest;
@@ -61,6 +67,18 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     return true;
 }
 
+static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_flw(ctx, a);
+}
+
+static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_fsw(ctx, a);
+}
+
 static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


