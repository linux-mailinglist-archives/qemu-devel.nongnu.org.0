Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0476668AB5A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTz-00055M-Op; Sat, 04 Feb 2023 11:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTw-00053w-NB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:40 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTu-0002Xi-TP
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so11559993pjq.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbuhRhUYqcTRZmlMcn2tZNQNeEvdTwmKn5ApcN4PW1Q=;
 b=LnhPSTkYIONGib5n/3465HWEgTxVFf+kta6LBv/T/s2J02J5ZBWuJO4TxyMYQaRT8p
 j9oOqwS8NtLi91Tbunan5QDhyM2uMr5lFBOJmfhvdtG0l6N2t4ZAhjaSQdonl6sCpk64
 Xfwt+W3wQgtd/MhFuRQZ1gDatcSERjPSwXAUa1i5EsMOv1Eq++vDVDFUE4CCsA6ybwzZ
 ifl28wxCk9SM+zvjr4Zk6oG4i2yYrj63EgFIANpLBEIO0cAzp2X/Tyy4fl3qwmkTD7q+
 wgWbPb1WOj7DGSMwia1XeLi8piYYtyrVe9wJu+razZudjAz446j1GSNz+ziGDrAHtF66
 f3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbuhRhUYqcTRZmlMcn2tZNQNeEvdTwmKn5ApcN4PW1Q=;
 b=ahZOt/01UcLngBgZSTe55wmTnLXV+XQQbWwwNJe/WeMFHbkK+oByjxRLt7CShXiXdH
 tdDRSQ64xMSNGQzGrHm6SwhgQiEpOXjER8YrpuFpOisBBfNE0n1d5vVIJcmWHOJhiprc
 Q6qwFwneMTFfyrtDSXkSSQK56lE+z32A2EzeNWFOXjmta+HL80U1I+w+BfYvq2eNq0t/
 Ale3xKgbp50sgQwwYt0lEhd97Id7BfVvxYnrye76HvmsWOvVXuO1NT3c+DgqgHu61WvO
 WxOmEh829YMTiANekJ29DPY66b0ZiXWt5rZXIIJ00BcdxGyERgXcjjjUDoNtaDUAHNJF
 ydfg==
X-Gm-Message-State: AO0yUKVmJnLOY8F4tgubw2LcEYfy99ZqNlYJfnhJRqVcq9bx3kDOgdEy
 FHUuor0c1VkdaXDEtlc7QKdnhbQOEkdS2mf8
X-Google-Smtp-Source: AK7set/AYJcUnkH0Uv3nYQk+9YL9z2c4t5X+UmCAbFOotuHkFtHQwTELQA0KWMImXOr0fCIrKbaqSQ==
X-Received: by 2002:a05:6a20:4919:b0:b6:7c79:a158 with SMTP id
 ft25-20020a056a20491900b000b67c79a158mr6195978pzb.4.1675528417584; 
 Sat, 04 Feb 2023 08:33:37 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/40] tcg: Add temp allocation for TCGv_i128
Date: Sat,  4 Feb 2023 06:32:45 -1000
Message-Id: <20230204163310.815536-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This enables allocation of i128.  The type is not yet
usable, as we have not yet added data movement ops.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 32 +++++++++++++++++++++++++
 tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 4d7e4107a9..59854f95b1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -687,6 +687,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
     return tcgv_i32_temp((TCGv_i32)v);
 }
 
+static inline TCGTemp *tcgv_i128_temp(TCGv_i128 v)
+{
+    return tcgv_i32_temp((TCGv_i32)v);
+}
+
 static inline TCGTemp *tcgv_ptr_temp(TCGv_ptr v)
 {
     return tcgv_i32_temp((TCGv_i32)v);
@@ -707,6 +712,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
     return temp_arg(tcgv_i64_temp(v));
 }
 
+static inline TCGArg tcgv_i128_arg(TCGv_i128 v)
+{
+    return temp_arg(tcgv_i128_temp(v));
+}
+
 static inline TCGArg tcgv_ptr_arg(TCGv_ptr v)
 {
     return temp_arg(tcgv_ptr_temp(v));
@@ -728,6 +738,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
     return (TCGv_i64)temp_tcgv_i32(t);
 }
 
+static inline TCGv_i128 temp_tcgv_i128(TCGTemp *t)
+{
+    return (TCGv_i128)temp_tcgv_i32(t);
+}
+
 static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
 {
     return (TCGv_ptr)temp_tcgv_i32(t);
@@ -853,6 +868,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
     tcg_temp_free_internal(tcgv_i64_temp(arg));
 }
 
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
 static inline void tcg_temp_free_ptr(TCGv_ptr arg)
 {
     tcg_temp_free_internal(tcgv_ptr_temp(arg));
@@ -901,6 +921,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i128 tcg_temp_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_i128 tcg_temp_local_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 163913c95f..a4a3da6804 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1273,26 +1273,45 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
     } else {
+        int i, n;
+
+        switch (type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            n = 1;
+            break;
+        case TCG_TYPE_I64:
+            n = 64 / TCG_TARGET_REG_BITS;
+            break;
+        case TCG_TYPE_I128:
+            n = 128 / TCG_TARGET_REG_BITS;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         ts = tcg_temp_alloc(s);
-        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
-            TCGTemp *ts2 = tcg_temp_alloc(s);
+        ts->base_type = type;
+        ts->temp_allocated = 1;
+        ts->kind = kind;
 
-            ts->base_type = type;
-            ts->type = TCG_TYPE_I32;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
-
-            tcg_debug_assert(ts2 == ts + 1);
-            ts2->base_type = TCG_TYPE_I64;
-            ts2->type = TCG_TYPE_I32;
-            ts2->temp_allocated = 1;
-            ts2->temp_subindex = 1;
-            ts2->kind = kind;
-        } else {
-            ts->base_type = type;
+        if (n == 1) {
             ts->type = type;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
+        } else {
+            ts->type = TCG_TYPE_REG;
+
+            for (i = 1; i < n; ++i) {
+                TCGTemp *ts2 = tcg_temp_alloc(s);
+
+                tcg_debug_assert(ts2 == ts + i);
+                ts2->base_type = type;
+                ts2->type = TCG_TYPE_REG;
+                ts2->temp_allocated = 1;
+                ts2->temp_subindex = i;
+                ts2->kind = kind;
+            }
         }
     }
 
@@ -3384,9 +3403,14 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     case TCG_TYPE_V64:
         align = 8;
         break;
+    case TCG_TYPE_I128:
     case TCG_TYPE_V128:
     case TCG_TYPE_V256:
-        /* Note that we do not require aligned storage for V256. */
+        /*
+         * Note that we do not require aligned storage for V256,
+         * and that we provide alignment for I128 to match V128,
+         * even if that's above what the host ABI requires.
+         */
         align = 16;
         break;
     default:
-- 
2.34.1


