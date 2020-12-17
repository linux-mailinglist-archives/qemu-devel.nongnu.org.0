Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0C2DD387
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:02:21 +0100 (CET)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpunM-0003kR-I5
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudp-0003Ls-SD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:30 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudm-0004uN-8c
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:29 -0500
Received: by mail-ot1-x334.google.com with SMTP id j12so27484861ota.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBAAD2EsIW/155GIjaU48r4O2esHCcXs+AbT7vfXmho=;
 b=O/+k+KSr9hvaCLLhNFSRZoTnmppJsZP+iKhkMRFeOFLZJqY26DarRxtegaaKIqR4Gg
 oUDWgneg0fssO7iZiPNDR7XghhU6asWG6eEhc5LhbARpH2yhIw5HhEb6eHgtV3zLXhjR
 ZYw6vWPt+/Gy2f6xOxfgz0q29sjPwb0aFWoZ0Ro84C+CSwFXQ0LAEXxUwrTAQMRQn5m3
 W3JmIcXrjThbe+55Gf9FqJafueB9wzagg6Q+yuJ04GhWbZu/fHLDlwSfOxe8ryg1MWjE
 RgPNEwSUB4ghqiAU5nbj5QhDOMZARPPiIQCLKuomyc73nezOFywBjUte5cKa5a2O+pQg
 2UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBAAD2EsIW/155GIjaU48r4O2esHCcXs+AbT7vfXmho=;
 b=aC8FXCVFhlib+JW/ANN+mtDFPyEw74VZoROVGWWJJagvj2lz9qySiOyVDuHDwJNSsI
 qlZH5YNyjkOL+R02yXazDZtWh/hmOec6z/sYtRVXFrQNOCpLva5SSTdoR9u7/GGbQC+/
 FmUYhVySMKIb0C04d9Ic407W6uEklCfvGZVinUjHoXXjozvaeWT6LLMUVZxVYe3adAJW
 fh+gJ38CTiYH5UKGJHi1rbjUAUwUOd5f8FlwgVxCNXkQ/XwCx3NcpXhFfs+pIe5Na+3D
 S3VjYHLcZwJZQjFfgPs7xwXz0cShXYdvLQrqfcMcMpJrL4qmxXVf8tCeQVgCotbQTzMR
 pTUw==
X-Gm-Message-State: AOAM5334gYGC51LNlydlDWzis8d048bmrezvUN2hXJzfvj88PMdHbn9k
 HvVDgh+v0ADiMefLBhooYcICg1ElJtFXUaTC
X-Google-Smtp-Source: ABdhPJxGni9k6cd01JtRDVAVzjieOeYlYDMWLw34gCAoHeQCwhq5ayBUbpTwn4zSvupBYrFYZINlUw==
X-Received: by 2002:a9d:a4e:: with SMTP id 72mr30361815otg.267.1608216744212; 
 Thu, 17 Dec 2020 06:52:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/23] tcg: Rename struct tcg_temp_info to TempOptInfo
Date: Thu, 17 Dec 2020 08:51:58 -0600
Message-Id: <20201217145215.534637-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix this name vs our coding style.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3cffd941bd..81faf7cf10 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -35,20 +35,20 @@
         glue(glue(case INDEX_op_, x), _i64):    \
         glue(glue(case INDEX_op_, x), _vec)
 
-struct tcg_temp_info {
+typedef struct TempOptInfo {
     bool is_const;
     TCGTemp *prev_copy;
     TCGTemp *next_copy;
     tcg_target_ulong val;
     tcg_target_ulong mask;
-};
+} TempOptInfo;
 
-static inline struct tcg_temp_info *ts_info(TCGTemp *ts)
+static inline TempOptInfo *ts_info(TCGTemp *ts)
 {
     return ts->state_ptr;
 }
 
-static inline struct tcg_temp_info *arg_info(TCGArg arg)
+static inline TempOptInfo *arg_info(TCGArg arg)
 {
     return ts_info(arg_temp(arg));
 }
@@ -71,9 +71,9 @@ static inline bool ts_is_copy(TCGTemp *ts)
 /* Reset TEMP's state, possibly removing the temp for the list of copies.  */
 static void reset_ts(TCGTemp *ts)
 {
-    struct tcg_temp_info *ti = ts_info(ts);
-    struct tcg_temp_info *pi = ts_info(ti->prev_copy);
-    struct tcg_temp_info *ni = ts_info(ti->next_copy);
+    TempOptInfo *ti = ts_info(ts);
+    TempOptInfo *pi = ts_info(ti->prev_copy);
+    TempOptInfo *ni = ts_info(ti->next_copy);
 
     ni->prev_copy = ti->prev_copy;
     pi->next_copy = ti->next_copy;
@@ -89,12 +89,12 @@ static void reset_temp(TCGArg arg)
 }
 
 /* Initialize and activate a temporary.  */
-static void init_ts_info(struct tcg_temp_info *infos,
+static void init_ts_info(TempOptInfo *infos,
                          TCGTempSet *temps_used, TCGTemp *ts)
 {
     size_t idx = temp_idx(ts);
     if (!test_bit(idx, temps_used->l)) {
-        struct tcg_temp_info *ti = &infos[idx];
+        TempOptInfo *ti = &infos[idx];
 
         ts->state_ptr = ti;
         ti->next_copy = ts;
@@ -105,7 +105,7 @@ static void init_ts_info(struct tcg_temp_info *infos,
     }
 }
 
-static void init_arg_info(struct tcg_temp_info *infos,
+static void init_arg_info(TempOptInfo *infos,
                           TCGTempSet *temps_used, TCGArg arg)
 {
     init_ts_info(infos, temps_used, arg_temp(arg));
@@ -171,7 +171,7 @@ static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg val)
     const TCGOpDef *def;
     TCGOpcode new_op;
     tcg_target_ulong mask;
-    struct tcg_temp_info *di = arg_info(dst);
+    TempOptInfo *di = arg_info(dst);
 
     def = &tcg_op_defs[op->opc];
     if (def->flags & TCG_OPF_VECTOR) {
@@ -202,8 +202,8 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     TCGTemp *dst_ts = arg_temp(dst);
     TCGTemp *src_ts = arg_temp(src);
     const TCGOpDef *def;
-    struct tcg_temp_info *di;
-    struct tcg_temp_info *si;
+    TempOptInfo *di;
+    TempOptInfo *si;
     tcg_target_ulong mask;
     TCGOpcode new_op;
 
@@ -236,7 +236,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     di->mask = mask;
 
     if (src_ts->type == dst_ts->type) {
-        struct tcg_temp_info *ni = ts_info(si->next_copy);
+        TempOptInfo *ni = ts_info(si->next_copy);
 
         di->next_copy = si->next_copy;
         di->prev_copy = src_ts;
@@ -599,7 +599,7 @@ void tcg_optimize(TCGContext *s)
 {
     int nb_temps, nb_globals;
     TCGOp *op, *op_next, *prev_mb = NULL;
-    struct tcg_temp_info *infos;
+    TempOptInfo *infos;
     TCGTempSet temps_used;
 
     /* Array VALS has an element for each temp.
@@ -610,7 +610,7 @@ void tcg_optimize(TCGContext *s)
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
     bitmap_zero(temps_used.l, nb_temps);
-    infos = tcg_malloc(sizeof(struct tcg_temp_info) * nb_temps);
+    infos = tcg_malloc(sizeof(TempOptInfo) * nb_temps);
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         tcg_target_ulong mask, partmask, affected;
-- 
2.25.1


