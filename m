Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9746B4C20
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafEE-0002xD-15; Fri, 10 Mar 2023 11:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafE2-0002ps-1k
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:10 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDz-0006cl-Bd
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:09 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDm-00H4ad-9n; Fri, 10 Mar 2023 16:03:54 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 19/45] target/riscv: Add vaesdf.vv decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 16:03:20 +0000
Message-Id: <20230310160346.1193597-20-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
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
 target/riscv/helper.h                        |  1 +
 target/riscv/insn32.decode                   |  1 +
 target/riscv/insn_trans/trans_rvzvkned.c.inc |  1 +
 target/riscv/vcrypto_helper.c                | 31 ++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index fb30b4d13e..c626ddcee1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1190,3 +1190,4 @@ DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5d1bb6ccc6..e9ccc56915 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -930,3 +930,4 @@ vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
 # *** RV64 Zvkned vector crypto extension ***
 vaesef_vv       101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesef_vs       101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
+vaesdf_vv       101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkned.c.inc b/target/riscv/insn_trans/trans_rvzvkned.c.inc
index 69bf7f9fee..134fd59df8 100644
--- a/target/riscv/insn_trans/trans_rvzvkned.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkned.c.inc
@@ -90,3 +90,4 @@ static bool vaes_check_vs(DisasContext *s, arg_rmr *a)
 
 GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesef_vs, vaes_check_vs)
+GEN_V_UNMASKED_TRANS(vaesdf_vv, vaes_check_vv)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index b079b543c7..8f448de86e 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -181,6 +181,34 @@ static inline void xor_round_key(uint8_t round_state[4][4], uint8_t *round_key)
     }
 }
 
+static inline void aes_inv_sub_bytes(uint8_t round_state[4][4])
+{
+    for (int j = 0; j < 16; j++) {
+        round_state[j / 4][j % 4] = AES_isbox[round_state[j / 4][j % 4]];
+    }
+}
+
+static inline void aes_inv_shift_bytes(uint8_t round_state[4][4])
+{
+    uint8_t temp;
+    temp = round_state[3][1];
+    round_state[3][1] = round_state[2][1];
+    round_state[2][1] = round_state[1][1];
+    round_state[1][1] = round_state[0][1];
+    round_state[0][1] = temp;
+    temp = round_state[0][2];
+    round_state[0][2] = round_state[2][2];
+    round_state[2][2] = temp;
+    temp = round_state[1][2];
+    round_state[1][2] = round_state[3][2];
+    round_state[3][2] = temp;
+    temp = round_state[0][3];
+    round_state[0][3] = round_state[1][3];
+    round_state[1][3] = round_state[2][3];
+    round_state[2][3] = round_state[3][3];
+    round_state[3][3] = temp;
+}
+
 #define GEN_ZVKNED_HELPER_VV(NAME, ...)                                   \
 void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,      \
                   uint32_t desc)                                          \
@@ -253,3 +281,6 @@ GEN_ZVKNED_HELPER_VV(vaesef_vv, aes_sub_bytes(round_state);
 GEN_ZVKNED_HELPER_VS(vaesef_vs, aes_sub_bytes(round_state);
                     aes_shift_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);)
+GEN_ZVKNED_HELPER_VV(vaesdf_vv, aes_inv_shift_bytes(round_state);
+                    aes_inv_sub_bytes(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);)
-- 
2.39.2


