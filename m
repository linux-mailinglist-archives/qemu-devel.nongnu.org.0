Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F71FA02D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:27:10 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkulB-0006cC-VB
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkuh0-0006Sq-Vt
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:51 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkugz-0003pR-0c
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so18270122wrm.13
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=isro7fKjPLJB8xxG5dZpv8KrIizIt+ZNoNO3oJwZWJg=;
 b=VyTbgn0fkBGGgKie3nsMwLnB8gLdU0FzH2J8X0pltKiSoiphQNixwIcmB3qe5tRj/H
 Ut5+Uzeug4d3/Thdpze8gB9+sMcHdzrh+S5zRdkF4Dt9etR00zzbrUNA5el8szz5UIve
 LbNXrF1PybaeTPaOPCfAqJlWFKwPF4VoQE3MH2nfY9/CKCDZYVdGFmzCI0VJN/0bIIwU
 JaJbCPIBE/idwD3CZqA7lv7nTGENXyDT04Pdi2brkEOUtd6VsHpJCHQSekLyeFfbypUi
 I4/cog2bFnnvCWM/f07ltdc1NTCAswM8lrWvaCXt5DhLnyofFoc5ECgbVrvW8iGVnynB
 aLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=isro7fKjPLJB8xxG5dZpv8KrIizIt+ZNoNO3oJwZWJg=;
 b=SMkKGsmjzYv3DHzxzVnotdJoYZ2I69ByKU4dMZqtU6zkw2oHMENREPazIKFh0KtMsV
 6ywy7iJX+6BaIScdLRJa7R/2Hlsa/Hr9cZ92bbIaiRhCHkKDYZ4Y81vS88PJa0LxHIdN
 molw+I4LwKnI++4VtkMIDV73TEAnLsmSJDR91ufd4XD/zVS4JQ5Sus6P1RLgKWArBsab
 V6IeGdN7bajtPZimCRk2BuZtD+BXXVr43UqNAab+iRTFiXGucFqmSf8XlprtjsWOLvlL
 30/Gow/0DgaNNwFAwGQg6UJKzDeanePHvkvSKd9rZvxYBGnPxiGtkX/hxYCDAxX7tc6i
 5Gcg==
X-Gm-Message-State: AOAM533fPX39TrN0CryE5i++DElVKUlBINhsJrZT6wftGmTpcpVRh70i
 54RjoNibXn08mw26F4ozJBnPB4X1
X-Google-Smtp-Source: ABdhPJzNuax9O1DZaTMtxSEuqdr443zNEwIEp1cXYiuqSil7f5IeVTxs0Abo98WYGGXk3QvZPGiyZg==
X-Received: by 2002:adf:b697:: with SMTP id j23mr32615018wre.201.1592248967497; 
 Mon, 15 Jun 2020 12:22:47 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 50sm27823909wra.1.2020.06.15.12.22.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:22:47 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 09/18] target/mips: msa: Split helpers for DOTP_S.<H|W|D>
Date: Mon, 15 Jun 2020 21:22:24 +0200
Message-Id: <1592248953-8162-10-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x42c.google.com
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
Message-Id: <20200613152133.8964-8-aleksandar.qemu.devel@gmail.com>
---
 target/mips/helper.h     |  5 +++-
 target/mips/msa_helper.c | 66 +++++++++++++++++++++++++++++++++++++++---------
 target/mips/translate.c  | 12 ++++++++-
 3 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 575f4a5..06df3de 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -1079,7 +1079,10 @@ DEF_HELPER_5(msa_subs_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subsus_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subsuu_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mulv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_dotp_s_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_4(msa_dotp_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_s_d, void, env, i32, i32, i32)
 DEF_HELPER_5(msa_dotp_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_4(msa_dpadd_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_dpadd_s_w, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 33d5251..201283f 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -2236,6 +2236,60 @@ void helper_msa_div_u_d(CPUMIPSState *env,
         o = UNSIGNED_ODD(a, df);        \
     } while (0)
 
+
+static inline int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    int64_t even_arg1;
+    int64_t even_arg2;
+    int64_t odd_arg1;
+    int64_t odd_arg2;
+    SIGNED_EXTRACT(even_arg1, odd_arg1, arg1, df);
+    SIGNED_EXTRACT(even_arg2, odd_arg2, arg2, df);
+    return (even_arg1 * even_arg2) + (odd_arg1 * odd_arg2);
+}
+
+void helper_msa_dotp_s_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_dotp_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_dotp_s_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_dotp_s_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_dotp_s_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_dotp_s_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_dotp_s_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_dotp_s_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_dotp_s_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_dotp_s_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_dotp_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_dotp_s_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_dotp_s_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_dotp_s_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_dotp_s_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_dotp_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_dotp_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
 static inline int64_t msa_dpadd_s_df(uint32_t df, int64_t dest, int64_t arg1,
                                      int64_t arg2)
 {
@@ -5010,17 +5064,6 @@ static inline int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
     return arg1 * arg2;
 }
 
-static inline int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    int64_t even_arg1;
-    int64_t even_arg2;
-    int64_t odd_arg1;
-    int64_t odd_arg2;
-    SIGNED_EXTRACT(even_arg1, odd_arg1, arg1, df);
-    SIGNED_EXTRACT(even_arg2, odd_arg2, arg2, df);
-    return (even_arg1 * even_arg2) + (odd_arg1 * odd_arg2);
-}
-
 static inline int64_t msa_dotp_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t even_arg1;
@@ -5155,7 +5198,6 @@ MSA_BINOP_DF(subs_u)
 MSA_BINOP_DF(subsus_u)
 MSA_BINOP_DF(subsuu_s)
 MSA_BINOP_DF(mulv)
-MSA_BINOP_DF(dotp_s)
 MSA_BINOP_DF(dotp_u)
 
 MSA_BINOP_DF(mul_q)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index bd6febc..e150454 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29394,7 +29394,17 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case OPC_DOTP_S_df:
-            gen_helper_msa_dotp_s_df(cpu_env, tdf, twd, tws, twt);
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_dotp_s_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_dotp_s_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_dotp_s_d(cpu_env, twd, tws, twt);
+                break;
+            }
             break;
         case OPC_DOTP_U_df:
             gen_helper_msa_dotp_u_df(cpu_env, tdf, twd, tws, twt);
-- 
2.7.4


