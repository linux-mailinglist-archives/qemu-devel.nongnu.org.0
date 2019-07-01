Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186512AB39
	for <lists+qemu-devel@lfdr.de>; Sun, 26 May 2019 18:33:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUw53-0000vx-Td
	for lists+qemu-devel@lfdr.de; Sun, 26 May 2019 12:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hUvwy-0002p2-0A
	for qemu-devel@nongnu.org; Sun, 26 May 2019 12:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hUvsk-0007P6-BZ
	for qemu-devel@nongnu.org; Sun, 26 May 2019 12:20:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36571 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hUvsk-0007O5-0t
	for qemu-devel@nongnu.org; Sun, 26 May 2019 12:20:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 873E11A4B7F;
	Sun, 26 May 2019 18:19:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 604DC1A4BA1;
	Sun, 26 May 2019 18:19:16 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 May 2019 18:19:04 +0200
Message-Id: <1558887551-32137-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558887551-32137-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558887551-32137-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 05/12] target/mips: Refactor and fix
 COPY_S.<B|H|W|D> instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>

The old version of the helper for the COPY_S.<B|H|W|D> MSA instructions
has been replaced with four helpers that don't use switch, and change
the endianness of the given index, when executed on a big endian host.

Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1554212605-16457-4-git-send-email-mateja.marjanovic@rt-rk.com>
---
 target/mips/helper.h     |  7 +++++-
 target/mips/msa_helper.c | 62 +++++++++++++++++++++++++++++++++---------------
 target/mips/translate.c  | 19 ++++++++++++++-
 3 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index a6d687e..de3a9e0 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -876,7 +876,7 @@ DEF_HELPER_5(msa_hsub_u_df, void, env, i32, i32, i32, i32)
 
 DEF_HELPER_5(msa_sldi_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_copy_s_df, void, env, i32, i32, i32, i32)
+
 DEF_HELPER_5(msa_copy_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_insert_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_insve_df, void, env, i32, i32, i32, i32)
@@ -938,6 +938,11 @@ DEF_HELPER_4(msa_pcnt_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_nloc_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_nlzc_df, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_fclass_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ftrunc_s_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ftrunc_u_df, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 274c6ca..89b3be9 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1249,29 +1249,53 @@ void helper_msa_splati_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_splat_df(df, pwd, pws, n);
 }
 
-void helper_msa_copy_s_df(CPUMIPSState *env, uint32_t df, uint32_t rd,
-                          uint32_t ws, uint32_t n)
+void helper_msa_copy_s_b(CPUMIPSState *env, uint32_t rd,
+                         uint32_t ws, uint32_t n)
 {
-    n %= DF_ELEMENTS(df);
+    n %= 16;
+#if defined(HOST_WORDS_BIGENDIAN)
+    if (n < 8) {
+        n = 8 - n - 1;
+    } else {
+        n = 24 - n - 1;
+    }
+#endif
+    env->active_tc.gpr[rd] = (int8_t)env->active_fpu.fpr[ws].wr.b[n];
+}
 
-    switch (df) {
-    case DF_BYTE:
-        env->active_tc.gpr[rd] = (int8_t)env->active_fpu.fpr[ws].wr.b[n];
-        break;
-    case DF_HALF:
-        env->active_tc.gpr[rd] = (int16_t)env->active_fpu.fpr[ws].wr.h[n];
-        break;
-    case DF_WORD:
-        env->active_tc.gpr[rd] = (int32_t)env->active_fpu.fpr[ws].wr.w[n];
-        break;
-#ifdef TARGET_MIPS64
-    case DF_DOUBLE:
-        env->active_tc.gpr[rd] = (int64_t)env->active_fpu.fpr[ws].wr.d[n];
-        break;
+void helper_msa_copy_s_h(CPUMIPSState *env, uint32_t rd,
+                         uint32_t ws, uint32_t n)
+{
+    n %= 8;
+#if defined(HOST_WORDS_BIGENDIAN)
+    if (n < 4) {
+        n = 4 - n - 1;
+    } else {
+        n = 12 - n - 1;
+    }
 #endif
-    default:
-        assert(0);
+    env->active_tc.gpr[rd] = (int16_t)env->active_fpu.fpr[ws].wr.h[n];
+}
+
+void helper_msa_copy_s_w(CPUMIPSState *env, uint32_t rd,
+                         uint32_t ws, uint32_t n)
+{
+    n %= 4;
+#if defined(HOST_WORDS_BIGENDIAN)
+    if (n < 2) {
+        n = 2 - n - 1;
+    } else {
+        n = 6 - n - 1;
     }
+#endif
+    env->active_tc.gpr[rd] = (int32_t)env->active_fpu.fpr[ws].wr.w[n];
+}
+
+void helper_msa_copy_s_d(CPUMIPSState *env, uint32_t rd,
+                         uint32_t ws, uint32_t n)
+{
+    n %= 2;
+    env->active_tc.gpr[rd] = (int64_t)env->active_fpu.fpr[ws].wr.d[n];
 }
 
 void helper_msa_copy_u_df(CPUMIPSState *env, uint32_t df, uint32_t rd,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f96c0d0..c65d19e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28301,7 +28301,24 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
         switch (MASK_MSA_ELM(ctx->opcode)) {
         case OPC_COPY_S_df:
             if (likely(wd != 0)) {
-                gen_helper_msa_copy_s_df(cpu_env, tdf, twd, tws, tn);
+                switch (df) {
+                case DF_BYTE:
+                    gen_helper_msa_copy_s_b(cpu_env, twd, tws, tn);
+                    break;
+                case DF_HALF:
+                    gen_helper_msa_copy_s_h(cpu_env, twd, tws, tn);
+                    break;
+                case DF_WORD:
+                    gen_helper_msa_copy_s_w(cpu_env, twd, tws, tn);
+                    break;
+#if defined(TARGET_MIPS64)
+                case DF_DOUBLE:
+                    gen_helper_msa_copy_s_d(cpu_env, twd, tws, tn);
+                    break;
+#endif
+                default:
+                    assert(0);
+                }
             }
             break;
         case OPC_COPY_U_df:
-- 
2.7.4


