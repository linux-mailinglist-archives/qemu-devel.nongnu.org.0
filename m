Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39936B0F87
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx89-0004RR-SO; Wed, 08 Mar 2023 11:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx83-0004HD-2r; Wed, 08 Mar 2023 11:59:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-00041u-OK; Wed, 08 Mar 2023 11:59:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EFF56400F3;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id B0EC892;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: (nullmailer pid 2098294 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 21/47] target/i386: Fix BEXTR instruction
Date: Wed,  8 Mar 2023 19:57:24 +0300
Message-Id: <20230308165815.2098148-21-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

There were two problems here: not limiting the input to operand bits,
and not correctly handling large extraction length.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1372
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114230542.3116013-3-richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit b14c0098975264ed03144f145bca0179a6763a07)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/tcg/emit.c.inc      | 22 +++++++++++-----------
 tests/tcg/i386/test-i386-bmi2.c | 12 ++++++++++++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 7037ff91c6..99f6ba6e19 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1078,30 +1078,30 @@ static void gen_ANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BEXTR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound, zero;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
     /*
      * Extract START, and shift the operand.
      * Shifts larger than operand size get zeros.
      */
     tcg_gen_ext8u_tl(s->A0, s->T1);
+    if (TARGET_LONG_BITS == 64 && ot == MO_32) {
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+    }
     tcg_gen_shr_tl(s->T0, s->T0, s->A0);
 
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
-    zero = tcg_constant_tl(0);
     tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound, s->T0, zero);
 
     /*
-     * Extract the LEN into a mask.  Lengths larger than
-     * operand size get all ones.
+     * Extract the LEN into an inverse mask.  Lengths larger than
+     * operand size get all zeros, length 0 gets all ones.
      */
     tcg_gen_extract_tl(s->A0, s->T1, 8, 8);
-    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound, s->A0, bound);
-
-    tcg_gen_movi_tl(s->T1, 1);
-    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-    tcg_gen_subi_tl(s->T1, s->T1, 1);
-    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+    tcg_gen_shl_tl(s->T1, mone, s->A0);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->T1, s->A0, bound, s->T1, zero);
+    tcg_gen_andc_tl(s->T0, s->T0, s->T1);
 
     gen_op_update1_cc(s);
     set_cc_op(s, CC_OP_LOGICB + ot);
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 3c3ef85513..982d4abda4 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -99,6 +99,9 @@ int main(int argc, char *argv[]) {
     result = bextrq(mask, 0x10f8);
     assert(result == 0);
 
+    result = bextrq(0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0xfedcba9876543210ull);
+
     result = blsiq(0x30);
     assert(result == 0x10);
 
@@ -164,6 +167,15 @@ int main(int argc, char *argv[]) {
     result = bextrl(mask, 0x1038);
     assert(result == 0);
 
+    result = bextrl((reg_t)0x8f635a775ad3b9b4ull, 0x3018);
+    assert(result == 0x5a);
+
+    result = bextrl((reg_t)0xfedcba9876543210ull, 0x7f00);
+    assert(result == 0x76543210u);
+
+    result = bextrl(-1, 0);
+    assert(result == 0);
+
     result = blsil(0xffff);
     assert(result == 1);
 
-- 
2.30.2


