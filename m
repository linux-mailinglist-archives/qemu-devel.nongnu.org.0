Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FC688057
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNarT-0005ut-WE; Thu, 02 Feb 2023 09:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvW-00079Z-RE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:55 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvU-0000fo-Ua
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:54 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvH-004Q6t-8L; Thu, 02 Feb 2023 12:42:40 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 16/39] target/riscv: Add vaesdm.vv decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:07 +0000
Message-Id: <20230202124230.295997-17-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Feb 2023 09:46:14 -0500
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
 target/riscv/helper.h                       |  1 +
 target/riscv/insn32.decode                  |  1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc |  1 +
 target/riscv/vcrypto_helper.c               | 36 +++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 020b9861cf..328a026039 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1185,3 +1185,4 @@ DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 33e5883937..e5f3af999d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -914,3 +914,4 @@ vaesef_vv       101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesef_vs       101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesdf_vv       101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
 vaesdf_vs       101001 1 ..... 00001 010 ..... 1110111 @r2_vm_1
+vaesdm_vv       101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 2d6a92c153..6cb25d0d88 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -56,3 +56,4 @@ GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesef_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesdf_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesdf_vs, vaes_check_vs)
+GEN_V_UNMASKED_TRANS(vaesdm_vv, vaes_check_vv)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index d3ba5e9cb8..bac21b5623 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -219,6 +219,38 @@ static inline void aes_inv_shift_bytes(uint8_t round_state[4][4])
     round_state[3][3] = temp;
 }
 
+static inline uint8_t xtime(uint8_t x)
+{
+    return (x << 1) ^ (((x >> 7) & 1) * 0x1b);
+}
+
+static inline uint8_t multiply(uint8_t x, uint8_t y)
+{
+    return (((y & 1) * x) ^ ((y >> 1 & 1) * xtime(x)) ^
+            ((y >> 2 & 1) * xtime(xtime(x))) ^
+            ((y >> 3 & 1) * xtime(xtime(xtime(x)))) ^
+            ((y >> 4 & 1) * xtime(xtime(xtime(xtime(x))))));
+}
+
+static inline void aes_inv_mix_cols(uint8_t round_state[4][4])
+{
+    uint8_t a, b, c, d;
+    for (int j = 0; j < 4; ++j) {
+        a = round_state[j][0];
+        b = round_state[j][1];
+        c = round_state[j][2];
+        d = round_state[j][3];
+        round_state[j][0] = multiply(a, 0x0e) ^ multiply(b, 0x0b) ^
+                            multiply(c, 0x0d) ^ multiply(d, 0x09);
+        round_state[j][1] = multiply(a, 0x09) ^ multiply(b, 0x0e) ^
+                            multiply(c, 0x0b) ^ multiply(d, 0x0d);
+        round_state[j][2] = multiply(a, 0x0d) ^ multiply(b, 0x09) ^
+                            multiply(c, 0x0e) ^ multiply(d, 0x0b);
+        round_state[j][3] = multiply(a, 0x0b) ^ multiply(b, 0x0d) ^
+                            multiply(c, 0x09) ^ multiply(d, 0x0e);
+    }
+}
+
 #define GEN_ZVKNS_HELPER_VV(NAME, ...)                                    \
 void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,      \
                   uint32_t desc)                                          \
@@ -301,3 +333,7 @@ GEN_ZVKNS_HELPER_VV(vaesdf_vv, aes_inv_shift_bytes(round_state);
 GEN_ZVKNS_HELPER_VS(vaesdf_vs, aes_inv_shift_bytes(round_state);
                     aes_inv_sub_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);)
+GEN_ZVKNS_HELPER_VV(vaesdm_vv, aes_inv_shift_bytes(round_state);
+                    aes_inv_sub_bytes(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);
+                    aes_inv_mix_cols(round_state);)
-- 
2.39.1


