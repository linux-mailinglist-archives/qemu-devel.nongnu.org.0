Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE91F83EE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 17:30:51 +0200 (CEST)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jk87O-0005lm-KZ
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 11:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jk7z0-0001L4-I0
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 11:22:10 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37325)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jk7yy-0002nA-Kk
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 11:22:10 -0400
Received: by mail-wm1-x343.google.com with SMTP id y20so10626559wmi.2
 for <qemu-devel@nongnu.org>; Sat, 13 Jun 2020 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9i3sTCzkg8YaUiycgdb5Fq8bcmtFPZaDPeHuPy7pP0=;
 b=YGKwWZB6dX17sgQErtaqD/vKJzmqV8xrMCvD2Rv5EXYf8Qyn1L0hkr4QYsnzgzMfH2
 mVxRIHaxhANaAxnGf7mPQPsqW+jNu4ZvbyryBm4E8VXM6c7QrK4dGmcOstoBtUBrcjIf
 KBZ1MdLwTYuq1YUc0FP5URAmqAKk5+jzxOqqdi1xEo75s9fWlskARvJKogGaJ+uMDH/X
 wTYm+rJIbznCqxhb5L5u0Cxx9jR4Hmi3TFlVCtLTlBk0mB9sqo1cmHteGG9sgm1cm7vb
 XQR0/dqkasuOapy9kv7S38EPnJdNWRQ70eC5pcJ8IRo5wNyar4PVX2S2Fzsu5FLDDJ0L
 +BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9i3sTCzkg8YaUiycgdb5Fq8bcmtFPZaDPeHuPy7pP0=;
 b=tr65Chfrli8Uz+tzAjwXnVBkcgb9zPscdp/g0Ed3DCcpg7Ck2pfM1q9GhuqU4gTQ4/
 sJdiQOi1bay27gkvta9hZXxlyIGGfiCY3rjuKOBKT4eXV6dA3XkuARJWO+hhS+i670sB
 LD6EQXn4piyElXUl/K4LaDR8DCACBX6m0BE68BfL1ARJtP9p+oRdQ5GbSAGwRuKVOXwf
 e3q+ndAPFtii2LrFCK8axFdEmOakdyq4xhJZW8QJDOi8WIDJ0LrE57TImHEkQq3yuvi7
 PMMn5ptLJ5J6llGyCG7JP4/g5H2WyzYdk8OeH5DbD9UDVXOSUPCiSY08Zz96tffqCGEI
 yNYg==
X-Gm-Message-State: AOAM533LUnhi/2ysQiShkKwU+lD3d7dhk1E3OELiB6c6XE1AhkMBETnx
 oDGv8At96ZXKHa7IJ/nf983cDL5FFLU=
X-Google-Smtp-Source: ABdhPJyKI0Dqg3s3l8JJk3Lrjh9rlLtUc60CwLzL+wnA3tP3qNIIEK2t4xHwjSIqNk8UhPPZMKZwfQ==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4448468wmi.38.1592061721895; 
 Sat, 13 Jun 2020 08:22:01 -0700 (PDT)
Received: from localhost.localdomain (net212-32-245-109.mbb.telenor.rs.
 [109.245.32.212])
 by smtp.gmail.com with ESMTPSA id 67sm16045399wrk.49.2020.06.13.08.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 08:22:01 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/14] target/mips: msa: Split helpers for
 SUBSUS_U.<B|H|W|D>
Date: Sat, 13 Jun 2020 17:21:30 +0200
Message-Id: <20200613152133.8964-12-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613152133.8964-1-aleksandar.qemu.devel@gmail.com>
References: <20200613152133.8964-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Achieves clearer code and slightly better performance.

Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/helper.h     |   6 ++-
 target/mips/msa_helper.c | 102 ++++++++++++++++++++++++++++++++-------
 target/mips/translate.c  |  15 +++++-
 3 files changed, 103 insertions(+), 20 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 61dc1ed626..227ff76ec1 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -988,6 +988,11 @@ DEF_HELPER_4(msa_subs_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_subs_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_subs_u_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_subsus_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_ilvev_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_w, void, env, i32, i32, i32)
@@ -1084,7 +1089,6 @@ DEF_HELPER_5(msa_srlri_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsl_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsr_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_subsus_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subsuu_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mulv_df, void, env, i32, i32, i32, i32)
 
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index bce32abf77..f7e5c018ac 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -3802,6 +3802,90 @@ void helper_msa_subs_u_d(CPUMIPSState *env,
 }
 
 
+static inline int64_t msa_subsus_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t max_uint = DF_MAX_UINT(df);
+    if (arg2 >= 0) {
+        uint64_t u_arg2 = (uint64_t)arg2;
+        return (u_arg1 > u_arg2) ?
+            (int64_t)(u_arg1 - u_arg2) :
+            0;
+    } else {
+        uint64_t u_arg2 = (uint64_t)(-arg2);
+        return (u_arg1 < max_uint - u_arg2) ?
+            (int64_t)(u_arg1 + u_arg2) :
+            (int64_t)max_uint;
+    }
+}
+
+void helper_msa_subsus_u_b(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_subsus_u_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_subsus_u_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_subsus_u_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_subsus_u_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_subsus_u_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_subsus_u_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_subsus_u_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_subsus_u_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_subsus_u_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_subsus_u_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_subsus_u_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_subsus_u_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_subsus_u_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_subsus_u_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_subsus_u_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_subsus_u_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_subsus_u_h(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_subsus_u_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_subsus_u_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_subsus_u_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_subsus_u_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_subsus_u_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_subsus_u_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_subsus_u_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_subsus_u_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_subsus_u_w(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_subsus_u_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_subsus_u_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_subsus_u_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_subsus_u_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_subsus_u_d(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_subsus_u_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_subsus_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
 /*
  * Interleave
  * ----------
@@ -5212,23 +5296,6 @@ MSA_TEROP_IMMU_DF(binsli, binsl)
 MSA_TEROP_IMMU_DF(binsri, binsr)
 #undef MSA_TEROP_IMMU_DF
 
-static inline int64_t msa_subsus_u_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t max_uint = DF_MAX_UINT(df);
-    if (arg2 >= 0) {
-        uint64_t u_arg2 = (uint64_t)arg2;
-        return (u_arg1 > u_arg2) ?
-            (int64_t)(u_arg1 - u_arg2) :
-            0;
-    } else {
-        uint64_t u_arg2 = (uint64_t)(-arg2);
-        return (u_arg1 < max_uint - u_arg2) ?
-            (int64_t)(u_arg1 + u_arg2) :
-            (int64_t)max_uint;
-    }
-}
-
 static inline int64_t msa_subsuu_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
@@ -5369,7 +5436,6 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
 }
 
 MSA_BINOP_DF(subv)
-MSA_BINOP_DF(subsus_u)
 MSA_BINOP_DF(subsuu_s)
 MSA_BINOP_DF(mulv)
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index cdf5e939de..1a95fe08fc 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29345,7 +29345,20 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         gen_helper_msa_splat_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_SUBSUS_U_df:
-        gen_helper_msa_subsus_u_df(cpu_env, tdf, twd, tws, twt);
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_subsus_u_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_subsus_u_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_subsus_u_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_subsus_u_d(cpu_env, twd, tws, twt);
+            break;
+        }
         break;
     case OPC_SUBSUU_S_df:
         gen_helper_msa_subsuu_s_df(cpu_env, tdf, twd, tws, twt);
-- 
2.20.1


