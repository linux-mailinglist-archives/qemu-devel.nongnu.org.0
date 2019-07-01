Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76784226AF
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 12:59:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSJXC-0007CA-Fs
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 06:59:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJS1-0003MC-R2
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJRs-0001t8-Ac
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:52 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45752 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hSJRo-0001og-5U
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id EDF241A1DF4;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id C24161A1FEA;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 12:52:20 +0200
Message-Id: <1558263144-8776-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558263144-8776-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558263144-8776-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 06/10] target/mips: Refactor and fix
 COPY_U.<B|H|W> instructions
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

The old version of the helper for the COPY_U.<B|H|W> MSA instructions
has been replaced with four helpers that don't use switch, and change
the endianness of the given index, when executed on a big endian host.

Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1554212605-16457-5-git-send-email-mateja.marjanovic@rt-rk.com>
---
 target/mips/helper.h     |  4 +++-
 target/mips/msa_helper.c | 55 +++++++++++++++++++++++++++++++-----------------
 target/mips/translate.c  | 21 +++++++++++++++++-
 3 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index de3a9e0..c4a77e2 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -877,7 +877,6 @@ DEF_HELPER_5(msa_hsub_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_sldi_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
 
-DEF_HELPER_5(msa_copy_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_insert_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_insve_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_3(msa_ctcmsa, void, env, tl, i32)
@@ -942,6 +941,9 @@ DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_copy_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_copy_s_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_copy_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_w, void, env, i32, i32, i32)
 
 DEF_HELPER_4(msa_fclass_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ftrunc_s_df, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 89b3be9..52680fe 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1298,29 +1298,46 @@ void helper_msa_copy_s_d(CPUMIPSState *env, uint32_t rd,
     env->active_tc.gpr[rd] = (int64_t)env->active_fpu.fpr[ws].wr.d[n];
 }
 
-void helper_msa_copy_u_df(CPUMIPSState *env, uint32_t df, uint32_t rd,
-                          uint32_t ws, uint32_t n)
+void helper_msa_copy_u_b(CPUMIPSState *env, uint32_t rd,
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
+    env->active_tc.gpr[rd] = (uint8_t)env->active_fpu.fpr[ws].wr.b[n];
+}
 
-    switch (df) {
-    case DF_BYTE:
-        env->active_tc.gpr[rd] = (uint8_t)env->active_fpu.fpr[ws].wr.b[n];
-        break;
-    case DF_HALF:
-        env->active_tc.gpr[rd] = (uint16_t)env->active_fpu.fpr[ws].wr.h[n];
-        break;
-    case DF_WORD:
-        env->active_tc.gpr[rd] = (uint32_t)env->active_fpu.fpr[ws].wr.w[n];
-        break;
-#ifdef TARGET_MIPS64
-    case DF_DOUBLE:
-        env->active_tc.gpr[rd] = (uint64_t)env->active_fpu.fpr[ws].wr.d[n];
-        break;
+void helper_msa_copy_u_h(CPUMIPSState *env, uint32_t rd,
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
+    env->active_tc.gpr[rd] = (uint16_t)env->active_fpu.fpr[ws].wr.h[n];
+}
+
+void helper_msa_copy_u_w(CPUMIPSState *env, uint32_t rd,
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
+    env->active_tc.gpr[rd] = (uint32_t)env->active_fpu.fpr[ws].wr.w[n];
 }
 
 void helper_msa_insert_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c65d19e..68ea6ee 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28297,6 +28297,11 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
             generate_exception_end(ctx, EXCP_RI);
             break;
         }
+        if ((MASK_MSA_ELM(ctx->opcode) == OPC_COPY_U_df) &&
+              (df == DF_WORD)) {
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
 #endif
         switch (MASK_MSA_ELM(ctx->opcode)) {
         case OPC_COPY_S_df:
@@ -28323,7 +28328,21 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
             break;
         case OPC_COPY_U_df:
             if (likely(wd != 0)) {
-                gen_helper_msa_copy_u_df(cpu_env, tdf, twd, tws, tn);
+                switch (df) {
+                case DF_BYTE:
+                    gen_helper_msa_copy_u_b(cpu_env, twd, tws, tn);
+                    break;
+                case DF_HALF:
+                    gen_helper_msa_copy_u_h(cpu_env, twd, tws, tn);
+                    break;
+#if defined(TARGET_MIPS64)
+                case DF_WORD:
+                    gen_helper_msa_copy_u_w(cpu_env, twd, tws, tn);
+                    break;
+#endif
+                default:
+                    assert(0);
+                }
             }
             break;
         case OPC_INSERT_df:
-- 
2.7.4


