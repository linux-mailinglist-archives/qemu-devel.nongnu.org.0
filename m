Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9B6B0FB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx87-0004NZ-IH; Wed, 08 Mar 2023 11:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx83-0004HE-36; Wed, 08 Mar 2023 11:59:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-000426-Ox; Wed, 08 Mar 2023 11:59:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4622B40102;
 Wed,  8 Mar 2023 19:58:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 0987613A;
 Wed,  8 Mar 2023 19:58:32 +0300 (MSK)
Received: (nullmailer pid 2098324 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:31 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 24/47] target/i386: Fix BZHI instruction
Date: Wed,  8 Mar 2023 19:57:27 +0300
Message-Id: <20230308165815.2098148-24-mjt@msgid.tls.msk.ru>
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

We did not correctly handle N >= operand size.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1374
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114233206.3118472-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 9ad2ba6e8e7fc195d0dd0b76ab38bd2fceb1bdd4)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/tcg/emit.c.inc      | 14 +++++++-------
 tests/tcg/i386/test-i386-bmi2.c |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0d7c6e80ae..7296f3952c 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1145,20 +1145,20 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
-    TCGv bound;
+    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv mone = tcg_constant_tl(-1);
 
-    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
+    tcg_gen_ext8u_tl(s->T1, s->T1);
 
     /*
      * Note that since we're using BMILG (in order to get O
      * cleared) we need to store the inverse into C.
      */
-    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
-    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
+    tcg_gen_setcond_tl(TCG_COND_LEU, cpu_cc_src, s->T1, bound);
 
-    tcg_gen_movi_tl(s->A0, -1);
-    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
+    tcg_gen_shl_tl(s->A0, mone, s->T1);
+    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->T1, bound, s->A0, zero);
     tcg_gen_andc_tl(s->T0, s->T0, s->A0);
 
     gen_op_update1_cc(s);
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 982d4abda4..0244df7987 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -123,6 +123,9 @@ int main(int argc, char *argv[]) {
     result = bzhiq(mask, 0x1f);
     assert(result == (mask & ~(-1 << 30)));
 
+    result = bzhiq(mask, 0x40);
+    assert(result == mask);
+
     result = rorxq(0x2132435465768798, 8);
     assert(result == 0x9821324354657687);
 
-- 
2.30.2


