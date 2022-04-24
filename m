Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFC50D598
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:08:31 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikP8-0004Ob-Ea
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJC-00056O-Jp
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikJA-0001L6-LN
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:02:22 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ5-0001ea-7p; Sun, 24 Apr 2022 23:02:15 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 03/42] Add AVX_EN hflag
Date: Sun, 24 Apr 2022 23:01:25 +0100
Message-Id: <20220424220204.2493824-4-paul@nowt.org>
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

Add a new hflag bit to determine whether AVX instructions are allowed

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/cpu.h            |  3 +++
 target/i386/helper.c         | 12 ++++++++++++
 target/i386/tcg/fpu_helper.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9661f9fbd1..65200a1917 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -169,6 +169,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_SHIFT     25 /* MPX Enabled (CR4+XCR0+BNDCFGx) */
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
 #define HF_UMIP_SHIFT       27 /* CR4.UMIP */
+#define HF_AVX_EN_SHIFT     28 /* AVX Enabled (CR4+XCR0) */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
@@ -195,6 +196,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_MASK       (1 << HF_MPX_EN_SHIFT)
 #define HF_MPX_IU_MASK       (1 << HF_MPX_IU_SHIFT)
 #define HF_UMIP_MASK         (1 << HF_UMIP_SHIFT)
+#define HF_AVX_EN_MASK       (1 << HF_AVX_EN_SHIFT)
 
 /* hflags2 */
 
@@ -2035,6 +2037,7 @@ void host_cpuid(uint32_t function, uint32_t count,
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
+void cpu_sync_avx_hflag(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
 static inline int x86_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
diff --git a/target/i386/helper.c b/target/i386/helper.c
index fa409e9c44..30083c9cff 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -29,6 +29,17 @@
 #endif
 #include "qemu/log.h"
 
+void cpu_sync_avx_hflag(CPUX86State *env)
+{
+    if ((env->cr[4] & CR4_OSXSAVE_MASK)
+        && (env->xcr0 & (XSTATE_SSE_MASK | XSTATE_YMM_MASK))
+            == (XSTATE_SSE_MASK | XSTATE_YMM_MASK)) {
+        env->hflags |= HF_AVX_EN_MASK;
+    } else{
+        env->hflags &= ~HF_AVX_EN_MASK;
+    }
+}
+
 void cpu_sync_bndcs_hflags(CPUX86State *env)
 {
     uint32_t hflags = env->hflags;
@@ -209,6 +220,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     env->hflags = hflags;
 
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index ebf5e73df9..b391b69635 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2943,6 +2943,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 
     env->xcr0 = mask;
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
     return;
 
  do_gpf:
-- 
2.36.0


