Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D972DD359
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:56:50 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpui0-0006kI-IH
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudy-0003QO-5s
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:38 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:44748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudr-0004v8-Ek
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:37 -0500
Received: by mail-oi1-x236.google.com with SMTP id d189so32431807oig.11
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1NhNPEIDsGzd2+XZQVnWFC0k3zKAB+Awk5/hTm4NEwE=;
 b=RBCr7+n/bBPQ15WBTjPdBzcKtFHeFj8t8I539Hk9zGHRkZDUyhoo3fGx96ltme7cVT
 b7wt7v1DCATNjOlKaqFp0H76k64C4pmBOQRgs1x8VMbjS0ASF3ugyUYoSsE8EsZAXlC/
 oJRK+jd6bb1wO/ua2GlhcQB8NGhtrdEBxzPvejs1OgNLmBYBwSnrNk0W5+c+a5vu2UTh
 +UobkXw6xt2cV0cu5d+1IPFd6S9QBJOjCu1PPI2A7k2/AWVMK8jlBA103ZmQMyhZ7lHt
 uXzBZdzQ8CC54dILgb/TJ9XD0ec2rZmsY4FFXh9jZHtl0+HOeVQlPdfoU6fSw3mc2WLm
 PN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1NhNPEIDsGzd2+XZQVnWFC0k3zKAB+Awk5/hTm4NEwE=;
 b=bkcUS8EvGsMW5+9rSnCnSOsKjFG95X4mtCmMf+lluuDp7lnC9x1pkbSK1IRmfhJjJy
 vxyXrTb4uwL0vObtFQiK/2U6nqKcfOHV5wTpx9CoFeBWv1nl/XvtIc3FzYsgFNcRpczH
 qs+28Pe9Ksucc7RwNnJ6Fqkw4POl9Izlg4u/W07SZAvBwMHjEMyVsHuHwDti/p6Jx6Z6
 AwwL2NBPcnOsMKJI+otG81WK8v79jo6lN5L4ie8jLZfEt3tFYzQX+eTti7iVF1HF4v+P
 x9bimnjBmO+arrrpll/GXzW2OHjq+pwkhhoNjAq3gufC7WZYkcapbWRqc2EJ0SJ8QlZI
 K3Yg==
X-Gm-Message-State: AOAM531GdWXhAC6aCj43ljEKDd2rQTxh7PX/rxHw2MKSAigjvz+bBuTv
 D389MUgP3VF8V/2ywVid2sZhp9q6brAsj+Me
X-Google-Smtp-Source: ABdhPJwBQPxsK1dcr/QGLzOwfrikY4JTJuHckftlwjf/+M6IKe0NtToEOS8/BqPBfIKxT8wZKqURcw==
X-Received: by 2002:aca:c30b:: with SMTP id t11mr5182693oif.61.1608216748795; 
 Thu, 17 Dec 2020 06:52:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/23] tcg/optimize: Adjust TempOptInfo allocation
Date: Thu, 17 Dec 2020 08:52:02 -0600
Message-Id: <20201217145215.534637-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not allocate a large block for indexing.  Instead, allocate
for each temporary as they are seen.

In general, this will use less memory, if we consider that most
TBs do not touch every target register.  This also allows us to
allocate TempOptInfo for new temps created during optimization.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 60 ++++++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bf2c2a3ce5..e269962932 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -89,35 +89,41 @@ static void reset_temp(TCGArg arg)
 }
 
 /* Initialize and activate a temporary.  */
-static void init_ts_info(TempOptInfo *infos,
-                         TCGTempSet *temps_used, TCGTemp *ts)
+static void init_ts_info(TCGTempSet *temps_used, TCGTemp *ts)
 {
     size_t idx = temp_idx(ts);
-    if (!test_bit(idx, temps_used->l)) {
-        TempOptInfo *ti = &infos[idx];
+    TempOptInfo *ti;
 
+    if (test_bit(idx, temps_used->l)) {
+        return;
+    }
+    set_bit(idx, temps_used->l);
+
+    ti = ts->state_ptr;
+    if (ti == NULL) {
+        ti = tcg_malloc(sizeof(TempOptInfo));
         ts->state_ptr = ti;
-        ti->next_copy = ts;
-        ti->prev_copy = ts;
-        if (ts->kind == TEMP_CONST) {
-            ti->is_const = true;
-            ti->val = ti->mask = ts->val;
-            if (TCG_TARGET_REG_BITS > 32 && ts->type == TCG_TYPE_I32) {
-                /* High bits of a 32-bit quantity are garbage.  */
-                ti->mask |= ~0xffffffffull;
-            }
-        } else {
-            ti->is_const = false;
-            ti->mask = -1;
+    }
+
+    ti->next_copy = ts;
+    ti->prev_copy = ts;
+    if (ts->kind == TEMP_CONST) {
+        ti->is_const = true;
+        ti->val = ts->val;
+        ti->mask = ts->val;
+        if (TCG_TARGET_REG_BITS > 32 && ts->type == TCG_TYPE_I32) {
+            /* High bits of a 32-bit quantity are garbage.  */
+            ti->mask |= ~0xffffffffull;
         }
-        set_bit(idx, temps_used->l);
+    } else {
+        ti->is_const = false;
+        ti->mask = -1;
     }
 }
 
-static void init_arg_info(TempOptInfo *infos,
-                          TCGTempSet *temps_used, TCGArg arg)
+static void init_arg_info(TCGTempSet *temps_used, TCGArg arg)
 {
-    init_ts_info(infos, temps_used, arg_temp(arg));
+    init_ts_info(temps_used, arg_temp(arg));
 }
 
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
@@ -604,9 +610,8 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
-    int nb_temps, nb_globals;
+    int nb_temps, nb_globals, i;
     TCGOp *op, *op_next, *prev_mb = NULL;
-    TempOptInfo *infos;
     TCGTempSet temps_used;
 
     /* Array VALS has an element for each temp.
@@ -616,12 +621,15 @@ void tcg_optimize(TCGContext *s)
 
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
+
     bitmap_zero(temps_used.l, nb_temps);
-    infos = tcg_malloc(sizeof(TempOptInfo) * nb_temps);
+    for (i = 0; i < nb_temps; ++i) {
+        s->temps[i].state_ptr = NULL;
+    }
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         uint64_t mask, partmask, affected, tmp;
-        int nb_oargs, nb_iargs, i;
+        int nb_oargs, nb_iargs;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def = &tcg_op_defs[opc];
 
@@ -633,14 +641,14 @@ void tcg_optimize(TCGContext *s)
             for (i = 0; i < nb_oargs + nb_iargs; i++) {
                 TCGTemp *ts = arg_temp(op->args[i]);
                 if (ts) {
-                    init_ts_info(infos, &temps_used, ts);
+                    init_ts_info(&temps_used, ts);
                 }
             }
         } else {
             nb_oargs = def->nb_oargs;
             nb_iargs = def->nb_iargs;
             for (i = 0; i < nb_oargs + nb_iargs; i++) {
-                init_arg_info(infos, &temps_used, op->args[i]);
+                init_arg_info(&temps_used, op->args[i]);
             }
         }
 
-- 
2.25.1


