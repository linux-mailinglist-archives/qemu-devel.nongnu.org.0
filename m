Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE95688078
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNarS-0005tK-HR; Thu, 02 Feb 2023 09:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvY-0007GQ-9b
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:57 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvV-0000fw-6K
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:55 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvH-004Q6t-PN; Thu, 02 Feb 2023 12:42:40 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 18/39] target/riscv: Add vaesz.vs decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:09 +0000
Message-Id: <20230202124230.295997-19-lawrence.hunter@codethink.co.uk>
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
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 13 ++++++++-----
 target/riscv/vcrypto_helper.c               |  2 ++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9895bf5712..def126a59b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1187,3 +1187,4 @@ DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 753039e954..b4ddc2586c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -916,3 +916,4 @@ vaesdf_vv       101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
 vaesdf_vs       101001 1 ..... 00001 010 ..... 1110111 @r2_vm_1
 vaesdm_vv       101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesdm_vs       101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
+vaesz_vs        101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 1459cb6d26..022fdeec00 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -41,15 +41,17 @@ static bool vaes_check_vv(DisasContext *s, arg_rmr *a)
 static bool vaes_check_overlap(DisasContext *s, int vd, int vs2)
 {
     int8_t op_size = s->lmul <= 0 ? 1 : 1 << s->lmul;
-    return !is_overlapped(vd, op_size, vs2, op_size);
+    return !is_overlapped(vd, op_size, vs2, 1);
 }
 
 static bool vaes_check_vs(DisasContext *s, arg_rmr *a)
 {
-    return vaes_check_overlap(s, a->rd, a->rs2) &&
-           s->cfg_ptr->ext_zvkns == true && vext_check_isa_ill(s) &&
-           require_align(a->rd, s->lmul) && s->vstart % 4 == 0 &&
-           s->sew == MO_32;
+    return require_rvv(s) &&
+           vaes_check_overlap(s, a->rd, a->rs2) &&
+           s->cfg_ptr->ext_zvkns == true &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           s->vstart % 4 == 0 && s->sew == MO_32;
 }
 
 GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
@@ -58,3 +60,4 @@ GEN_V_UNMASKED_TRANS(vaesdf_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesdf_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesdm_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesdm_vs, vaes_check_vs)
+GEN_V_UNMASKED_TRANS(vaesz_vs, vaes_check_vs)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 699bf25bbd..39e2498b7d 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -341,3 +341,5 @@ GEN_ZVKNS_HELPER_VS(vaesdm_vs, aes_inv_shift_bytes(round_state);
                     aes_inv_sub_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);
                     aes_inv_mix_cols(round_state);)
+GEN_ZVKNS_HELPER_VS(vaesz_vs,
+                    xor_round_key(round_state, (uint8_t *)round_key);)
-- 
2.39.1


