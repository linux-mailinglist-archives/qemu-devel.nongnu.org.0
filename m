Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B168805E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaqv-0005PU-MU; Thu, 02 Feb 2023 09:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvW-00079F-HJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:54 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvU-0000fg-B1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:54 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvH-004Q6t-0K; Thu, 02 Feb 2023 12:42:39 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 15/39] target/riscv: Add vaesdf.vs decoding,
 translation and execution support
Date: Thu,  2 Feb 2023 12:42:06 +0000
Message-Id: <20230202124230.295997-16-lawrence.hunter@codethink.co.uk>
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
 target/riscv/helper.h                       | 1 +
 target/riscv/insn32.decode                  | 1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 1 +
 target/riscv/vcrypto_helper.c               | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b7696cb6c4..020b9861cf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1184,3 +1184,4 @@ DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesdf_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ca907dac85..33e5883937 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -913,3 +913,4 @@ vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
 vaesef_vv       101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesef_vs       101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesdf_vv       101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
+vaesdf_vs       101001 1 ..... 00001 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 2e09deeb84..2d6a92c153 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -55,3 +55,4 @@ static bool vaes_check_vs(DisasContext *s, arg_rmr *a)
 GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesef_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesdf_vv, vaes_check_vv)
+GEN_V_UNMASKED_TRANS(vaesdf_vs, vaes_check_vs)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 24b5336fa7..d3ba5e9cb8 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -298,3 +298,6 @@ GEN_ZVKNS_HELPER_VS(vaesef_vs, aes_sub_bytes(round_state);
 GEN_ZVKNS_HELPER_VV(vaesdf_vv, aes_inv_shift_bytes(round_state);
                     aes_inv_sub_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);)
+GEN_ZVKNS_HELPER_VS(vaesdf_vs, aes_inv_shift_bytes(round_state);
+                    aes_inv_sub_bytes(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);)
-- 
2.39.1


