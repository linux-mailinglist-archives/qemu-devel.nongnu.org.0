Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D06B39C5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYnl-0007g7-EL; Fri, 10 Mar 2023 04:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYnf-0007fE-OI
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:32 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYne-0002YZ-5Q
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:31 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1paYnZ-00GpVx-L4; Fri, 10 Mar 2023 09:12:25 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 07/45] target/riscv: Add vclmulh.vx decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 09:11:37 +0000
Message-Id: <20230310091215.931644-8-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
References: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
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
 target/riscv/helper.h                      | 1 +
 target/riscv/insn32.decode                 | 1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 1 +
 target/riscv/vcrypto_helper.c              | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1c69c34a78..37f2e162f6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1147,3 +1147,4 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ad8e2055b..488e01ca59 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -913,3 +913,4 @@ czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
 vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
 vclmulh_vv      001101 . ..... ..... 010 ..... 1010111 @r_vm
+vclmulh_vx      001101 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 63a8778acc..810e469e13 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -87,3 +87,4 @@ static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
 }
 
 GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
+GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 1891c29767..8b7c63d499 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -55,3 +55,5 @@ RVVCALL(OPIVX2, vclmul_vx, OP_UUU_D, H8, H8, clmul64)
 GEN_VEXT_VX(vclmul_vx, 8)
 RVVCALL(OPIVV2, vclmulh_vv, OP_UUU_D, H8, H8, H8, clmulh64)
 GEN_VEXT_VV(vclmulh_vv, 8)
+RVVCALL(OPIVX2, vclmulh_vx, OP_UUU_D, H8, H8, clmulh64)
+GEN_VEXT_VX(vclmulh_vx, 8)
-- 
2.39.2


