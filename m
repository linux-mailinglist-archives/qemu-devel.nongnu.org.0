Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6406B4C2F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:09:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafEG-00032Y-LP; Fri, 10 Mar 2023 11:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafE0-0002oR-MP
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:08 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDy-0006by-0n
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:08 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDk-00H4ad-K9; Fri, 10 Mar 2023 16:03:52 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 13/45] target/riscv: Add vrev8.v decoding,
 translation and execution support
Date: Fri, 10 Mar 2023 16:03:14 +0000
Message-Id: <20230310160346.1193597-14-lawrence.hunter@codethink.co.uk>
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 target/riscv/helper.h                      |  4 ++++
 target/riscv/insn32.decode                 |  1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc |  1 +
 target/riscv/vcrypto_helper.c              | 11 +++++++++++
 4 files changed, 17 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 625f9872d0..b4baa22692 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1169,6 +1169,10 @@ DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_5(vrev8_v_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vrev8_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vrev8_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vrev8_v_d, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 87473a77c0..bdefcd3fa2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -922,3 +922,4 @@ vror_vv         010100 . ..... ..... 000 ..... 1010111 @r_vm
 vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
 vror_vi         01010. . ..... ..... 011 ..... 1010111 @r2_zimm6
 vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
+vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 7cd114ae71..77ba8bc713 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -183,3 +183,4 @@ static bool vxrev8_check(DisasContext *s, arg_rmr *a)
 }
 
 GEN_OPIV_TRANS(vbrev8_v, vxrev8_check)
+GEN_OPIV_TRANS(vrev8_v, vxrev8_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 5d2a995de6..ecf21c50f8 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/bitops.h"
+#include "qemu/bswap.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -114,3 +115,13 @@ GEN_VEXT_V(vbrev8_v_b, 1)
 GEN_VEXT_V(vbrev8_v_h, 2)
 GEN_VEXT_V(vbrev8_v_w, 4)
 GEN_VEXT_V(vbrev8_v_d, 8)
+
+#define DO_IDENTITY(a) (a)
+RVVCALL(OPIVV1, vrev8_v_b, OP_UU_B, H1, H1, DO_IDENTITY)
+RVVCALL(OPIVV1, vrev8_v_h, OP_UU_H, H2, H2, bswap16)
+RVVCALL(OPIVV1, vrev8_v_w, OP_UU_W, H4, H4, bswap32)
+RVVCALL(OPIVV1, vrev8_v_d, OP_UU_D, H8, H8, bswap64)
+GEN_VEXT_V(vrev8_v_b, 1)
+GEN_VEXT_V(vrev8_v_h, 2)
+GEN_VEXT_V(vrev8_v_w, 4)
+GEN_VEXT_V(vrev8_v_d, 8)
-- 
2.39.2


