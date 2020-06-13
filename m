Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F21F83E7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 17:25:28 +0200 (CEST)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jk82B-0005jT-0a
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jk7yt-00013J-TD
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 11:22:03 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35724)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jk7yr-0002kX-WF
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 11:22:03 -0400
Received: by mail-wm1-x344.google.com with SMTP id q25so10650655wmj.0
 for <qemu-devel@nongnu.org>; Sat, 13 Jun 2020 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGafr/lKS1dyaPv6Hozdw0DiY6Yu2WTH+okEAJX8aVA=;
 b=lnd7as+wbTTdFv9EVM2cQACJnlJmzHAi5GImsF1gytYPbg5lwTAClQzs6eNfhPUbZ4
 yVRg8+e8vefsxdWU9rs4DjpY1ji2ZtID+HhsJ66spb3nSLuVH1JI0M6AAmbp1+kLQDE+
 EgLv5lNfLImDOu3tNPP8xEsPCCM1Ob7Q9YM1qnysXWnrPOoSzEFEFtIQ4aG8Cn1PeVJc
 GWLLhwyUs81kz+sMTP+3uczEPYacEmrr0poU7MQ5oXDFT4gB/o+xwoLJMNkVys3oYGom
 3R63wqw3QoV2VZs9vxiTji32xtbHiKBFoT/cJbrj3aTDC+vfmDUlg7kPOqVpCNe79sjh
 umOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGafr/lKS1dyaPv6Hozdw0DiY6Yu2WTH+okEAJX8aVA=;
 b=DV5MxTW3w67Q2eqgCsTLQ+JOdd/B33Ww0zGv8lyzE2RqUXOoGL3aSiIG6IvOk8J/FZ
 YoaaBGxVqFu/ssL/1t9+TFZFZwllh7BsOPcIdKOa7kF8skjzk20o1xQ7MchAom3Wh9Pw
 QCNJkUauGkp5moPqDR4SuPmJHUVEFwekNpNVHIV2GF1yL1Ezzng3s7Sm8qO4Gnl/5wOv
 7CuyeMI8j4sQt4QLqVlOWXuuFS4Xv9iUf9pzrk4beH9BGgq6fVtn8zq/d6DeMMs3Hdf2
 Sccd4uw8MLdEsE67v6BRdAGzFVmCrg4dvG0AoA/Wqi5RWY6jVtmHh7tyJzOsW2fWCMw/
 fRRg==
X-Gm-Message-State: AOAM531H4kc+ozn+nPZY1Q7iW3fOsis7XtU3MsgZk501+Ri5u7C4kzaY
 +m/qnp8a6YJQTeEmw5UOzKTplb9t21M=
X-Google-Smtp-Source: ABdhPJwUsZ3fodP6QGoacU8o549bka5Oa1ECtUU4XksKkEQKiBwqKgNpedftFmrm/Tza4O7DDn1SEg==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr4511453wma.118.1592061714876; 
 Sat, 13 Jun 2020 08:21:54 -0700 (PDT)
Received: from localhost.localdomain (net212-32-245-109.mbb.telenor.rs.
 [109.245.32.212])
 by smtp.gmail.com with ESMTPSA id 67sm16045399wrk.49.2020.06.13.08.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 08:21:54 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/14] target/mips: msa: Split helpers for DPSUB_S.<H|W|D>
Date: Sat, 13 Jun 2020 17:21:24 +0200
Message-Id: <20200613152133.8964-6-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613152133.8964-1-aleksandar.qemu.devel@gmail.com>
References: <20200613152133.8964-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x344.google.com
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
 target/mips/helper.h     |  4 ++-
 target/mips/msa_helper.c | 67 ++++++++++++++++++++++++++++++++--------
 target/mips/translate.c  | 12 ++++++-
 3 files changed, 68 insertions(+), 15 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 155b6bbe3e..2de14542cd 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -1087,7 +1087,9 @@ DEF_HELPER_4(msa_dpadd_s_d, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_dpadd_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_dpadd_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_dpadd_u_d, void, env, i32, i32, i32)
-DEF_HELPER_5(msa_dpsub_s_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_d, void, env, i32, i32, i32)
 DEF_HELPER_5(msa_dpsub_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_sld_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_splat_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 9741c94d27..934f705c1e 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -2344,6 +2344,60 @@ void helper_msa_dpadd_u_d(CPUMIPSState *env,
 }
 
 
+static inline int64_t msa_dpsub_s_df(uint32_t df, int64_t dest, int64_t arg1,
+                                     int64_t arg2)
+{
+    int64_t even_arg1;
+    int64_t even_arg2;
+    int64_t odd_arg1;
+    int64_t odd_arg2;
+    SIGNED_EXTRACT(even_arg1, odd_arg1, arg1, df);
+    SIGNED_EXTRACT(even_arg2, odd_arg2, arg2, df);
+    return dest - ((even_arg1 * even_arg2) + (odd_arg1 * odd_arg2));
+}
+
+void helper_msa_dpsub_s_h(CPUMIPSState *env,
+                          uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_dpsub_s_df(DF_HALF, pwd->h[0],  pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_dpsub_s_df(DF_HALF, pwd->h[1],  pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_dpsub_s_df(DF_HALF, pwd->h[2],  pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_dpsub_s_df(DF_HALF, pwd->h[3],  pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_dpsub_s_df(DF_HALF, pwd->h[4],  pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_dpsub_s_df(DF_HALF, pwd->h[5],  pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_dpsub_s_df(DF_HALF, pwd->h[6],  pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_dpsub_s_df(DF_HALF, pwd->h[7],  pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_dpsub_s_w(CPUMIPSState *env,
+                          uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_dpsub_s_df(DF_WORD, pwd->w[0],  pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_dpsub_s_df(DF_WORD, pwd->w[1],  pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_dpsub_s_df(DF_WORD, pwd->w[2],  pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_dpsub_s_df(DF_WORD, pwd->w[3],  pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_dpsub_s_d(CPUMIPSState *env,
+                          uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_dpsub_s_df(DF_DOUBLE, pwd->d[0],  pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_dpsub_s_df(DF_DOUBLE, pwd->d[1],  pws->d[1],  pwt->d[1]);
+}
+
+
 /*
  * Int Max Min
  * -----------
@@ -5063,18 +5117,6 @@ void helper_msa_sld_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_sld_df(df, pwd, pws, env->active_tc.gpr[rt]);
 }
 
-static inline int64_t msa_dpsub_s_df(uint32_t df, int64_t dest, int64_t arg1,
-                                     int64_t arg2)
-{
-    int64_t even_arg1;
-    int64_t even_arg2;
-    int64_t odd_arg1;
-    int64_t odd_arg2;
-    SIGNED_EXTRACT(even_arg1, odd_arg1, arg1, df);
-    SIGNED_EXTRACT(even_arg2, odd_arg2, arg2, df);
-    return dest - ((even_arg1 * even_arg2) + (odd_arg1 * odd_arg2));
-}
-
 static inline int64_t msa_dpsub_u_df(uint32_t df, int64_t dest, int64_t arg1,
                                      int64_t arg2)
 {
@@ -5213,7 +5255,6 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df, uint32_t wd,  \
     }                                                                         \
 }
 
-MSA_TEROP_DF(dpsub_s)
 MSA_TEROP_DF(dpsub_u)
 MSA_TEROP_DF(binsl)
 MSA_TEROP_DF(binsr)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 009ac5c1fb..2576905e5b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29425,7 +29425,17 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case OPC_DPSUB_S_df:
-            gen_helper_msa_dpsub_s_df(cpu_env, tdf, twd, tws, twt);
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_dpsub_s_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_dpsub_s_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_dpsub_s_d(cpu_env, twd, tws, twt);
+                break;
+            }
             break;
         case OPC_DPSUB_U_df:
             gen_helper_msa_dpsub_u_df(cpu_env, tdf, twd, tws, twt);
-- 
2.20.1


