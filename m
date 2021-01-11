Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9B2F1C46
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:26:04 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0x9-0007iw-Bz
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rV-0003BU-1Z
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:21 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rQ-00008z-CZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:12 -0500
Received: by mail-pf1-x432.google.com with SMTP id c13so298934pfi.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRVnylJXcFc8ozdMeUWi6zX6AVte8Tt6BWKvI+IXZu0=;
 b=dagHZ9bEQCvyrIZL1mIzun0pPvJxm1IxbSpbz7pc2ncwrqOT4KddEMGpUhqE1vxVeN
 RhbTsK4u6snxSXfw/MA6gyMlDYC75kLtQODanL6ctrfM6p2QwiaALhzrJhvcMqdneELv
 Umi4tpCC6ZX7XCBpYzBMwNcAMRlEZxjF9J7FTvPS5azaIYIOtu87pKVPLHLZewhAtST0
 eYVetmDcm+kEkP0I8VQlQt82Yq11gQ4MZdfq+RfITPwz6RRwMyFbnde5+k5RS9Fd2YcO
 S4T8M9Q/cXowmre3gyBLt49+M1EnlBVRndu8Fkg3Gma6G5N8HCRiyBWK6sqL9/IfPylp
 1o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRVnylJXcFc8ozdMeUWi6zX6AVte8Tt6BWKvI+IXZu0=;
 b=QVHuJ7OFLb0/2pIZzm2sfzEUwFWLJGmxtvgKmg+ZvzqzPDCLP+G4xlMvW5eiZWihuV
 A6PJuBrkXFWVxMOiDmE68FUSb5fEHhUxIrwz+3WVcVMZPzHgmnS3Rr3+p6ndRu1US6Ie
 YXYmJqtj1whgBHZbWLQcfsjKt8TEXQHn84+uQKC0XLk5mcg6C68am0Za5DA6j7EDmhku
 rjgyBDcxToAnuOScEwgl4vvBitSU1xJYc2QnFUV5hprdcQ1lAq26eEoW0pmZ94pRK3IB
 WtOo8n7Yw+cpEtaRPWUgnrsUsqysxQ3fLd/UlOsMF76XTbiHnA5odCt33MrRulavxVsn
 Ba8w==
X-Gm-Message-State: AOAM530eOI5zbGhavuH0IB87Pbn4nkYVQBaMxw08RLsIge2XgwpfqogZ
 Ka7lUUk2NsoEUcWQPeer4l+UdG0yhTuVwg==
X-Google-Smtp-Source: ABdhPJx2RTZq12DWL+q/Rv6C+ufV12j17Kz7S3tcY34BGrPybfbLzCQZ+6GepRGEDWp/fhK/ghLXBA==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr482002pgs.429.1610385606726; 
 Mon, 11 Jan 2021 09:20:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/23] tcg/optimize: Adjust TempOptInfo allocation
Date: Mon, 11 Jan 2021 07:19:33 -1000
Message-Id: <20210111171946.219469-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index e42f9c89a8..49bf1386c7 100644
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


