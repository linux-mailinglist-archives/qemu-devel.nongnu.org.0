Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A96254DD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:05:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOjW-0001Pb-HF; Fri, 11 Nov 2022 02:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjT-0001N0-RZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:47 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjS-000182-36
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so4089262pji.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8Y1g/wUg06QV14OKflOwRGsY0ezG4rnZiU5/c0ET0lg=;
 b=lY7a8gE2C9IWsGik3j4R92fFRpym2KWYCKJn/lpenv1VRt/JfEd+0xbV3odxYqI8js
 aX2OcgwqE+YtjuPPfXM+oBfMTLmr3P7YxRludhe2ntBYidiNh9V77dy35TS1gyzp6Ojm
 aFIKxfXAiyhtbdAc7l2JD3W4WfKeH1slF9/CD2YImHjZCjqunuVMmemuKtRGyvl/X8kH
 vN6WVQu+4ke/HyqCV7Z6bseTs1irFGOPKoBNhzfCMQX63JkWoZ+y7obw+kWzwrHufh9h
 AeFHl+fmYMACwBWF3jihb9khVPJwfYqAivgDHA0y/SBHYgznyp7hQoeKafzIM0WL3653
 6O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Y1g/wUg06QV14OKflOwRGsY0ezG4rnZiU5/c0ET0lg=;
 b=OgrVvwKiAEzhOrOb1HrBU3CFF7rhZUa3QDPEpi7AydJrOo0VP7rasMUaWhJHUQ2W7M
 ipQ/dYCtSQVkt8OZSnJdKEB/a8yv0Aq0UawwD+L4hsvVRITARkyY7nGQ2dFN3aS1cDDD
 Xk/sNBf9aySdQnFgGwc2OiVaLhbWT9Ac/SSsP8gVxhUvBz/5h95ww4N7R2EUk6zuIeki
 DJ67PxjmwzkezmDHyu5mQRBFShrlGLfrvYjczm51Th7ZAIKhIDaxwYmyuRtCZ+xJ1LGi
 UjAjYzRf/dFomoSbDT2GyjqG/6Hrb6VZh/Bt3cwiRGRdB+3QLwi9aWKBCJfw7fnSZuei
 IoNw==
X-Gm-Message-State: ANoB5pmSdgC58lwP8pXMXqCSIPOvBCoo6y04YkUytF1q8A2s4yo99RFo
 RbyB3bSKs2zIpa0/hE+9LFdqVOKbh91z+n3t
X-Google-Smtp-Source: AA0mqf5Vl5CI786F3KJEiMnwLPcjSydlfbzkPu/fNCIV10LYcYDWJaxQyJknnH02ZHeEZzGumWnanQ==
X-Received: by 2002:a17:903:284:b0:186:b91b:17ec with SMTP id
 j4-20020a170903028400b00186b91b17ecmr1479921plr.10.1668152744588; 
 Thu, 10 Nov 2022 23:45:44 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b001869f2120a6sm983802plg.108.2022.11.10.23.45.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:45:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 41/45] tcg: Add temp allocation for TCGv_i128
Date: Fri, 11 Nov 2022 17:40:57 +1000
Message-Id: <20221111074101.2069454-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 32 +++++++++++++++++++++++++
 tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7d346192ca..a996da60b5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -697,6 +697,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
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
@@ -717,6 +722,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
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
@@ -738,6 +748,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
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
@@ -860,6 +875,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
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
@@ -908,6 +928,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
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
index 5465297495..50db393594 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1232,26 +1232,45 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
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
 
@@ -3413,9 +3432,14 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
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


