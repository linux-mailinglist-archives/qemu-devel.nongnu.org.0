Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C511FA06F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:40:32 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkuy7-00072X-Bx
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkunE-0003hv-Rq
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:29:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkunC-0004kw-GL
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:29:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id l17so703970wmj.0
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HatCI/C20IbML7fPZvbn3fQQoPkpMBRHHooiTbsnPes=;
 b=HyYoQlAmAFq01K8ZAxx9N1B/th+8F8eAne2IlK8qC5Osni457nfLX/u5qaMjHcL4YF
 7gbtct7ntmEpAR02WLEI1HJ9aJH8TNemFzW/UWufYml9UhTvkbkhaTa0pl0YQvkDYfFU
 LVCf3eAywiEojJsmXHqIx5dIU/ci2auae7P14u6lnskNI7xwvMY+lPe3Rb1Zpit/mTHe
 v35wr1wnFZasN7gCG9o10WvPiq7er7nz4kkQEzCL8Nno8V0DIE8xJl/qBX6uCZje+zQo
 oMdhsVwpjpOzPUqyZe8MBw9Go8jDHrTyv+knU3o2A986xQlCmvHPkObKu7+i+/43ZQ3N
 e09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HatCI/C20IbML7fPZvbn3fQQoPkpMBRHHooiTbsnPes=;
 b=uevYG+4zQQzIUwYH2gkGY2Bvv321a2g4t9c8qxOoky3/31qS91xMJNWZ5arkDl00tJ
 Brr8JE7tZ4NawkaMKBjRe+jneQv3NmKOORyfW/JGBNwej48ie1Dnldq9rBURV+E0N25A
 5uwTuwLGQmZRnb6h98+luPAQLCyYcmVPAh0NzcsBnmZJpXssX/v8jpv8yfts/6TIzM1g
 9BC5i2SxMQdf+1h+y+RGX4Y0KpXHqHnqzap5hExDHNJXxwg6tFbIlZ3xPJ6LUc9btTKu
 mXrUM0nrwIGemJL8OqCsvQxacB2lqbhugLbjwgpxk1s0mr0axswlEoikMd+nxV5993ll
 oHTQ==
X-Gm-Message-State: AOAM530l0/Du3nzW1koAT9p8oMuYM3sAYZefDoTBObDlpMQJdXgemfe/
 yCwQ7vyMqw+nJStjucVQ/eNOL7cq
X-Google-Smtp-Source: ABdhPJxlk/k5bTXbo1x94O6UtgWb1PM9qPK99+TwIUpnb8TOb8WC/p3uqKcsOvMAsIZ6jHdhyKZcFw==
X-Received: by 2002:a1c:2b86:: with SMTP id r128mr898322wmr.13.1592249352825; 
 Mon, 15 Jun 2020 12:29:12 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 138sm713098wma.23.2020.06.15.12.29.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:29:12 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/18] target/mips: msa: Split helpers for SUBSUS_U.<B|H|W|D>
Date: Mon, 15 Jun 2020 21:28:55 +0200
Message-Id: <1592249340-8365-14-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592249340-8365-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1592249340-8365-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Achieves clearer code and slightly better performance.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200613152133.8964-12-aleksandar.qemu.devel@gmail.com>
---
 target/mips/helper.h     |   6 ++-
 target/mips/msa_helper.c | 102 ++++++++++++++++++++++++++++++++++++++---------
 target/mips/translate.c  |  15 ++++++-
 3 files changed, 103 insertions(+), 20 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 61dc1ed..227ff76 100644
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
index bce32ab..f7e5c01 100644
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
index 7671a49..b273f4d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29346,7 +29346,20 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
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
2.7.4


