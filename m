Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C9A1FA030
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:27:41 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkulg-0007sN-Un
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkuh4-0006cF-Mf
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkuh2-0003qO-F5
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x13so18303593wrv.4
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K8GKn5zVC/NwBQqMjXgoAeAlAwMlkVssHVJZBhNrmtk=;
 b=IZQXGXtalZAHBgUAnku9aWZ6xaxpfqacdfVBTL283cyKUVKSCTAVgs3npnEV/obTDd
 AsQ9Ojw5Bv7UEwtjTZAF/VUNXVeENp5NpvD5/CvwOHjb73RFWGJFgMrRcMhDKCHD21yv
 2cElD1roWe53Lus3b1yi4rRDZfwhrxJT9hLlsTT1/QaNnJK+cO/0LdnOJPbwUHAIzvrd
 af5UFG8S5Xy+tTFTsznpleS/o5ctlejr+f59pQ9R8nbXSx4bN+EkbjviKOIG+2sHhiKM
 LThhjHd3UGXVvKDQ4a8sSHgVqtD1SgoFIVClWaLQ1iDTxPrzh0gC9sqqXi4GBOrTzieK
 WObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K8GKn5zVC/NwBQqMjXgoAeAlAwMlkVssHVJZBhNrmtk=;
 b=YXqXk7X8VVT9E8fOJvvj0sWCAWmqtk6I4OyqwxcOCA5eCcBNnJRKbUA82EkIwMIUX5
 LmBtOqGNoLlmdXCdMJ+hcLe1hUSccxldEVrXnwVCOm3WYVZRyTzbjtnvT/D+VPzijwr9
 fqaKAx+L84D37p7mu0SSWUY/Gq1x8/E9nUjG7foH2Hcm5An5dKROCXpBrLZe578ZKY15
 uLa5a8uaMGw3k/J0wsl1QwJo78WIYkZeUr6gjZJtA8QjF2Ov6OwnVqQdoKZNBuzDW3r+
 GGVIeg99ZBH2S2vJtPuH5Cb7TemKQyoFgWZqZoFGKu/QyOUpWp/HKKrtqy3k54kmGuik
 Phmw==
X-Gm-Message-State: AOAM530pI16B5T2mfqITAWbTtQMNKrU3BOOjAlXPvc8zhRZS4CcZBMRr
 a3p+nsDNYEv0tqK8P4vuC46vHqrK
X-Google-Smtp-Source: ABdhPJxcMeqK04MRB9pbJOerM2B8qmmaCwChCFn8OuTbJ92l3Qww9aF2aF7Qn6lcQ/GAgu1W/2maVw==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr32619494wrp.57.1592248970797; 
 Mon, 15 Jun 2020 12:22:50 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 50sm27823909wra.1.2020.06.15.12.22.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:22:50 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/18] target/mips: msa: Split helpers for SUBSUU_S.<B|H|W|D>
Date: Mon, 15 Jun 2020 21:22:29 +0200
Message-Id: <1592248953-8162-15-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x42d.google.com
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
Message-Id: <20200613152133.8964-13-aleksandar.qemu.devel@gmail.com>
---
 target/mips/helper.h     |   6 ++-
 target/mips/msa_helper.c | 102 ++++++++++++++++++++++++++++++++++++++---------
 target/mips/translate.c  |  15 ++++++-
 3 files changed, 103 insertions(+), 20 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 227ff76..4795c97 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -993,6 +993,11 @@ DEF_HELPER_4(msa_subsus_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_subsus_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_subsus_u_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_subsuu_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_ilvev_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_w, void, env, i32, i32, i32)
@@ -1089,7 +1094,6 @@ DEF_HELPER_5(msa_srlri_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsl_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsr_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_subsuu_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mulv_df, void, env, i32, i32, i32, i32)
 
 DEF_HELPER_4(msa_dotp_s_h, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index f7e5c01..27a9c36 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -3886,6 +3886,90 @@ void helper_msa_subsus_u_d(CPUMIPSState *env,
 }
 
 
+static inline int64_t msa_subsuu_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t u_arg2 = UNSIGNED(arg2, df);
+    int64_t max_int = DF_MAX_INT(df);
+    int64_t min_int = DF_MIN_INT(df);
+    if (u_arg1 > u_arg2) {
+        return u_arg1 - u_arg2 < (uint64_t)max_int ?
+            (int64_t)(u_arg1 - u_arg2) :
+            max_int;
+    } else {
+        return u_arg2 - u_arg1 < (uint64_t)(-min_int) ?
+            (int64_t)(u_arg1 - u_arg2) :
+            min_int;
+    }
+}
+
+void helper_msa_subsuu_s_b(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_subsuu_s_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_subsuu_s_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_subsuu_s_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_subsuu_s_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_subsuu_s_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_subsuu_s_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_subsuu_s_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_subsuu_s_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_subsuu_s_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_subsuu_s_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_subsuu_s_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_subsuu_s_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_subsuu_s_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_subsuu_s_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_subsuu_s_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_subsuu_s_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_subsuu_s_h(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_subsuu_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_subsuu_s_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_subsuu_s_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_subsuu_s_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_subsuu_s_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_subsuu_s_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_subsuu_s_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_subsuu_s_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_subsuu_s_w(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_subsuu_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_subsuu_s_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_subsuu_s_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_subsuu_s_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_subsuu_s_d(CPUMIPSState *env,
+                           uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_subsuu_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_subsuu_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
 /*
  * Interleave
  * ----------
@@ -5296,23 +5380,6 @@ MSA_TEROP_IMMU_DF(binsli, binsl)
 MSA_TEROP_IMMU_DF(binsri, binsr)
 #undef MSA_TEROP_IMMU_DF
 
-static inline int64_t msa_subsuu_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t u_arg2 = UNSIGNED(arg2, df);
-    int64_t max_int = DF_MAX_INT(df);
-    int64_t min_int = DF_MIN_INT(df);
-    if (u_arg1 > u_arg2) {
-        return u_arg1 - u_arg2 < (uint64_t)max_int ?
-            (int64_t)(u_arg1 - u_arg2) :
-            max_int;
-    } else {
-        return u_arg2 - u_arg1 < (uint64_t)(-min_int) ?
-            (int64_t)(u_arg1 - u_arg2) :
-            min_int;
-    }
-}
-
 static inline int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 * arg2;
@@ -5436,7 +5503,6 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
 }
 
 MSA_BINOP_DF(subv)
-MSA_BINOP_DF(subsuu_s)
 MSA_BINOP_DF(mulv)
 
 MSA_BINOP_DF(mul_q)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index b273f4d..6d9ae1d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29362,7 +29362,20 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case OPC_SUBSUU_S_df:
-        gen_helper_msa_subsuu_s_df(cpu_env, tdf, twd, tws, twt);
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_subsuu_s_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_subsuu_s_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_subsuu_s_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_subsuu_s_d(cpu_env, twd, tws, twt);
+            break;
+        }
         break;
 
     case OPC_DOTP_S_df:
-- 
2.7.4


