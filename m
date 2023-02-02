Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B768807F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:51:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNar8-0005TN-4u; Thu, 02 Feb 2023 09:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvO-000748-Ur
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:47 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvM-0000eq-15
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:46 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvE-004Q6t-A8; Thu, 02 Feb 2023 12:42:37 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 04/39] target/riscv: Add vclmulh.vv decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:41:55 +0000
Message-Id: <20230202124230.295997-5-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Feb 2023 09:46:13 -0500
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

Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                      |  1 +
 target/riscv/insn32.decode                 |  1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc |  1 +
 target/riscv/vcrypto_helper.c              | 12 ++++++++++++
 4 files changed, 15 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6c786ef6f3..a155272701 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1140,3 +1140,4 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 /* Vector crypto functions */
 DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4a7421354d..e26ea1df08 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -894,3 +894,4 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
 # *** RV64 Zvkb vector crypto extension ***
 vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
+vclmulh_vv      001101 . ..... ..... 010 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 6e8b81136c..19ce4c7431 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -39,6 +39,7 @@ static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
 }
 
 GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
+GEN_VV_MASKED_TRANS(vclmulh_vv, vclmul_vv_check)
 
 #define GEN_VX_MASKED_TRANS(NAME, CHECK)                                \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index c453d348ad..022b941131 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -31,5 +31,17 @@ static void do_vclmul_vx(void *vd, target_long rs1, void *vs2, int i)
     ((uint64_t *)vd)[i] = result;
 }
 
+static void do_vclmulh_vv(void *vd, void *vs1, void *vs2, int i)
+{
+    __uint128_t result = 0;
+    for (int j = 63; j >= 0; j--) {
+        if ((((uint64_t *)vs1)[i] >> j) & 1) {
+            result ^= (((__uint128_t)(((uint64_t *)vs2)[i])) << j);
+        }
+    }
+    ((uint64_t *)vd)[i] = (result >> 64);
+}
+
 GEN_VEXT_VV(vclmul_vv, 8)
 GEN_VEXT_VX(vclmul_vx, 8)
+GEN_VEXT_VV(vclmulh_vv, 8)
-- 
2.39.1


