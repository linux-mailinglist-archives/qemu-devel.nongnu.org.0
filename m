Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E295F5FFC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:17:55 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIKY-000351-Pw
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoa-0004Mw-DP
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoW-0003rT-QC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so3174610pjs.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5D15v8p3bWjvQ/ElUGF1Bxd02HbXzPE0732wE/uoaww=;
 b=CzW9ySwNURTEkb02XShiYTV8oK/ZygnVyMoDYaTPJMK6hMb197IFHglFW8FdFB6eFl
 2dv0xmVavr2oMZStQFLvI2ojCo0QAr7LZGa+KUQ5F2a+6w9smqMLmUsvOHHU58P/0wU2
 wj+6lZSorEWwqDzYXfZslhaec2HkmqsIwqgHpg10mboPcVtrDBH+vUk+ioeqrK0NGDUQ
 pJrYW3yk/5vnva3HPsRZCGcBNsFxvTW+cgX3lhfDYHBdNZPkycUsnuAYneR2wJlbhqgf
 F5TTQiBNqbW1QbnoXCaSGdEcCaErzwO78JOy/IAJzL8KWqJr+DxaL18sBtEIT+8or99n
 FHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5D15v8p3bWjvQ/ElUGF1Bxd02HbXzPE0732wE/uoaww=;
 b=67vIjb+OfvEFMKxyQUVUSxiuHLsLqdTy7ZAqy7L/4YVqhOzWgzqkfn3ZyuWuUTN5tE
 B7YkCoqS0pqIV9msvu4xwcYR7zCWgVdLvd6zkkDokvmrYp50sF7BP5IqmNxsH7bk5VEh
 95X2hkMeKQST5HjDiWx9xJ5IFhoIiLQifT/SvDid1YDTME72/47ZJyYb/W/zt06NfJD+
 v6nF6RuTCauZhkwn8WLhu52aEyBMkuFvghkoBKJfISEQNczZfwz+XmpW+CdtX2RKCXQr
 LRqAz308ceYlzQic08mYwF8CUvU6N9yjbyfImeO3H0LjEDDRPw+CfsZ+9RSJnGh6HgvU
 kmJw==
X-Gm-Message-State: ACrzQf0TQbp02VrE1oI+Q6iEUeWI4XUuMyu2B5lBQZMFiEk/xW3GQ844
 lrxPyuwJGY1iNLN9Ukso3CsAzaM+wyaS5A==
X-Google-Smtp-Source: AMsMyM48EgAekmLs0GALjEwf3ZME0n/n5AddAfd62StOPZjht3LYzPGP0pZcXc6ZoCNSaz1BB6zTcA==
X-Received: by 2002:a17:903:186:b0:178:2ca7:fae5 with SMTP id
 z6-20020a170903018600b001782ca7fae5mr2538684plg.173.1665027885818; 
 Wed, 05 Oct 2022 20:44:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 24/26] tcg: Introduce tcg_temp_ebb_new_*
Date: Wed,  5 Oct 2022 20:44:19 -0700
Message-Id: <20221006034421.1179141-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow targets to allocate extended-basic-block temps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 ++
 include/tcg/tcg.h    | 20 +++++++++++++++++++-
 tcg/tcg.c            | 16 ++++------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 209e168305..0ebbee6e24 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -848,6 +848,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
 #define tcg_temp_local_new() tcg_temp_local_new_i32()
+#define tcg_temp_ebb_new() tcg_temp_ebb_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
@@ -855,6 +856,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
 #define tcg_temp_local_new() tcg_temp_local_new_i64()
+#define tcg_temp_ebb_new() tcg_temp_ebb_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e01a47ec20..3835711d52 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -609,7 +609,7 @@ struct TCGContext {
 #endif
 
     GHashTable *const_table[TCG_TYPE_COUNT];
-    TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
+    TCGTempSet free_temps[TCG_TYPE_COUNT * 3];
     TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
 
     QTAILQ_HEAD(, TCGOp) ops, free_ops;
@@ -890,6 +890,12 @@ static inline TCGv_i32 tcg_temp_local_new_i32(void)
     return temp_tcgv_i32(t);
 }
 
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -909,6 +915,12 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -928,6 +940,12 @@ static inline TCGv_ptr tcg_temp_local_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
diff --git a/tcg/tcg.c b/tcg/tcg.c
index acdbd5a9a2..7aa6cc3451 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -948,17 +948,8 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
     TCGTemp *ts;
     int idx, k;
 
-    switch (kind) {
-    case TEMP_NORMAL:
-        k = 0;
-        break;
-    case TEMP_LOCAL:
-        k = TCG_TYPE_COUNT;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    k += type;
+    assert(kind >= TEMP_NORMAL && kind <= TEMP_LOCAL);
+    k = TCG_TYPE_COUNT * kind + type;
 
     idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
     if (idx < TCG_MAX_TEMPS) {
@@ -1046,6 +1037,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          */
         return;
     case TEMP_NORMAL:
+    case TEMP_EBB:
     case TEMP_LOCAL:
         break;
     default:
@@ -1063,7 +1055,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
     ts->temp_allocated = 0;
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
+    k = ts->base_type + ts->kind * TCG_TYPE_COUNT;
     set_bit(idx, s->free_temps[k].l);
 }
 
-- 
2.34.1


