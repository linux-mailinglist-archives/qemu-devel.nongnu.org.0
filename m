Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049650D5B5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:24:14 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikeL-0003X5-KL
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSk-0001g9-3f
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:14 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSh-0002pR-LG
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:13 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJA-0001ea-Hv; Sun, 24 Apr 2022 23:02:20 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 28/42] i386: Implement VZEROALL and VZEROUPPER
Date: Sun, 24 Apr 2022 23:01:50 +0100
Message-Id: <20220424220204.2493824-29-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use the same opcode as EMMS, which I guess makes some sort of sense.
Fairly strightforward other than that.

If we were wanting to optimize out gen_clear_ymmh then this would be one of
the starting points.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 48 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  9 +++++++
 target/i386/tcg/translate.c  | 26 ++++++++++++++++---
 3 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index ad3312d353..a1f50f0c8b 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3071,6 +3071,54 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #endif
 #endif
 
+#if SHIFT == 2
+void helper_vzeroall(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper(CPUX86State *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+#ifdef TARGET_X86_64
+void helper_vzeroall_hi8(CPUX86State *env)
+{
+    int i;
+
+    for (i = 8; i < 16; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
+void helper_vzeroupper_hi8(CPUX86State *env)
+{
+    int i;
+
+    for (i = 8; i < 16; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+#endif
+#endif
+
 #undef SSE_HELPER_S
 
 #undef SHIFT
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index cfcfba154b..48f0945917 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -411,6 +411,15 @@ DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
+#if SHIFT == 2
+DEF_HELPER_1(vzeroall, void, env)
+DEF_HELPER_1(vzeroupper, void, env)
+#ifdef TARGET_X86_64
+DEF_HELPER_1(vzeroall_hi8, void, env)
+DEF_HELPER_1(vzeroupper_hi8, void, env)
+#endif
+#endif
+
 #undef SHIFT
 #undef Reg
 #undef SUFFIX
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index bcd6d47fd0..ba70aeb039 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3455,9 +3455,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         return;
     }
     if (b == 0x77) {
-        /* emms */
-        gen_helper_emms(cpu_env);
-        return;
+        if (s->prefix & PREFIX_VEX) {
+            CHECK_AVX(s);
+            if (s->vex_l) {
+                gen_helper_vzeroall(cpu_env);
+#ifdef TARGET_X86_64
+                if (CODE64(s)) {
+                    gen_helper_vzeroall_hi8(cpu_env);
+                }
+#endif
+            } else {
+                gen_helper_vzeroupper(cpu_env);
+#ifdef TARGET_X86_64
+                if (CODE64(s)) {
+                    gen_helper_vzeroupper_hi8(cpu_env);
+                }
+#endif
+            }
+            return;
+        } else {
+            /* emms */
+            gen_helper_emms(cpu_env);
+            return;
+        }
     }
     /* prepare MMX state (XXX: optimize by storing fptt and fptags in
        the static cpu state) */
-- 
2.36.0


