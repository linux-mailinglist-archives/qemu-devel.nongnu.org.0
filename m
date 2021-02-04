Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB130EA43
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:36:51 +0100 (CET)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UVm-0004hC-MK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjs-0006ED-3I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:20 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tji-0004B2-E2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:18 -0500
Received: by mail-pj1-x1032.google.com with SMTP id m12so771436pjs.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=mnRk04CMbYnHsFBpHWCrgFQELbSVEYEkc1At4b3HVFT/dd/Y310CTMBKd3t4a/XGWj
 3LdTZdBnt/kmTA8IkwpsL3INoIbWskkKdnkdZTNXFkm+B8YxtCb+ZgKPglF81x9wwdym
 kgsGyr5g9gAew1qmHlQg2c8aO/h4p6OdnLZTeFfsvA1H+tZFxN8s18CLdwKGOWPoJ8S7
 GFyqDC6Bnp20xabjdnRHB7GjGnAzNYc2iHePvdSwCecw6Bqs75xYJCH6jtrr7LiUf4Ph
 mrNGQ+qi0pDWtaa0U+YCpFO5gRT773LbXmvLEdU4GB+PhjUmMmYDQfyjtArxk+Pks0Db
 wJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=DWGp1wl3RedwyfdjHJ9J9adXgNxPeEI0XDVg5EEScQO9R9FWNoLHQiAPZJN4Oy6YGF
 0EWsurARpnVPMpBaQnNwMMp9ZD1CAGTA6Dufst7KcI0vg0Y0xn0+1LGp6qU7QWOz0leS
 5C1s0MnxfaGkhNxeErqgm94wPFpY9fFolWemdmGP7NBwgmhb1OUu6zDSNxEtut+8gdCD
 ocJAKYvdT2eeZqx6YC7oWf4NvTUPERvqDKU2WBwT4yqSrq85Gn5/NHpkLOznzHe/EamE
 PpZB6PO6fz4PWBmUYdlMKfkQpO3MSbkAUAi9FESI+f6RNV3tBUMY5KB1kZ5zkxK434jc
 3lrw==
X-Gm-Message-State: AOAM530Bhe59hVoyMHn/00ysN4GSQybNEq2U0HD0OLHq7Os2cGcmyqIF
 jv5yLWMocGpGRrF+KAUIjDkdwSZ25jqmHQMd
X-Google-Smtp-Source: ABdhPJynXUi5kcE/PRKeAmiKRnkQxBUa6YqnpkAek1B5WmDvmrAYMZfpRRD9BgdjDzD36cG+dIbv5Q==
X-Received: by 2002:a17:902:b7c7:b029:e1:6cbe:db19 with SMTP id
 v7-20020a170902b7c7b02900e16cbedb19mr5788454plz.20.1612403228759; 
 Wed, 03 Feb 2021 17:47:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 67/93] tcg/tci: Split out tcg_out_op_rrs
Date: Wed,  3 Feb 2021 15:44:43 -1000
Message-Id: <20210204014509.882821-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 84 +++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 050d514853..707f801099 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,32 +283,38 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
-static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
-                       intptr_t arg2)
+static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, intptr_t i2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
 
-    stack_bounds_check(arg1, arg2);
-    if (type == TCG_TYPE_I32) {
-        tcg_out_op_t(s, INDEX_op_ld_i32);
-        tcg_out_r(s, ret);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
-#if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_ld_i64);
-        tcg_out_r(s, ret);
-        tcg_out_r(s, arg1);
-        tcg_debug_assert(arg2 == (int32_t)arg2);
-        tcg_out32(s, arg2);
-#else
-        TODO();
-#endif
-    }
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_debug_assert(i2 == (int32_t)i2);
+    tcg_out32(s, i2);
+
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
+                       intptr_t offset)
+{
+    stack_bounds_check(base, offset);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rrs(s, INDEX_op_ld_i32, val, base, offset);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rrs(s, INDEX_op_ld_i64, val, base, offset);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -444,12 +450,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_64(st32)
     CASE_64(st)
         stack_bounds_check(args[1], args[2]);
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_debug_assert(args[2] == (int32_t)args[2]);
-        tcg_out32(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrs(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(add)
@@ -597,29 +598,22 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     }
 }
 
-static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
-                       intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
+                       intptr_t offset)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    stack_bounds_check(arg1, arg2);
-    if (type == TCG_TYPE_I32) {
-        tcg_out_op_t(s, INDEX_op_st_i32);
-        tcg_out_r(s, arg);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
+    stack_bounds_check(base, offset);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rrs(s, INDEX_op_st_i32, val, base, offset);
+        break;
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_st_i64);
-        tcg_out_r(s, arg);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-#else
-        TODO();
+    case TCG_TYPE_I64:
+        tcg_out_op_rrs(s, INDEX_op_st_i64, val, base, offset);
+        break;
 #endif
+    default:
+        g_assert_not_reached();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-- 
2.25.1


