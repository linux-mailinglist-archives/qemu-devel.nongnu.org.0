Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9CC60713E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:37:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmb5-0001HH-AF
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:37:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHi-0003JW-Jx
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHR-0003F1-Sk
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:23 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHP-0005oI-QF
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id c24so1584919plo.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YL8W2fQ+28CPJzwzlqNSd9vlVmUOZrRLduSb6SVZ5pE=;
 b=CIgAbSny0mKIJfru330j4NH2hSkZFTeWyyqhgtsEM04xi8oGpFkhrYL20xPb4ohbCs
 JrBXRy9reoui42skjWfJSSANoHyzjRez0bTCsI3/QFDoF8a8vLAfS8C1ROtjO7a/+J/v
 4+7Pz8X9v9vaWfkwaVHgSufnNlaugQTB+zn50PjQ1ndrO3kS+6pqt95RShBjJcUL/WGo
 qEbeSqsGTnnWfUUgmxFrGfwx7jdLpUcbNIeqBkGJwXzw4T5ghnNu0By31LvN71tFMTLD
 6Gr2mt2yo3TdklZ6q4PHgOO09q/uoLCPQv9rkZBt094MJQaZ274ZWX1v7bqJlqVZRTFu
 UklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YL8W2fQ+28CPJzwzlqNSd9vlVmUOZrRLduSb6SVZ5pE=;
 b=0epr44rspn7v26+2r5L+KFfSHv9+dRHw6chas71dm6mts07xtfis7hZqzTKyGWu9Nr
 ctW2nNlITF/KuCx3jmUCKbV0x6WKHBzul3lXSWgokDnTDUTnFkvznULupgklHMuyr70F
 6JYKcNV0Jehx0kLxC4byyiuPSdsJC2JKcEPxd+NtykzJf9b9KCz4UY0alHpHr5ZKUXH9
 hhFJxoyy4zhJkKzHPtDmi34pd8uVM+qMfiz+y33T/EqqwF4OEWIeGB/19u4agIyGd7KG
 Nejx6aXtm3+S3Ic3KeyVa2yDSqUbWBWre4O1WzqlmcV4jBs0cO2WNWoHhxf9SQsZYEXz
 mA3g==
X-Gm-Message-State: ACrzQf1zmZe2mrOsxMBCrgz9qlmdXOo3PaWToORYonoQPTx8RaeG1WKD
 Wu76aQa1spz184Y+L4RjwJHwpX05hH8kC+ln
X-Google-Smtp-Source: AMsMyM5d1uuaOLM+v5TE0LHmDE6kIzhnTLWs/8tPM5BvJ/D/+LNkcQlqYFVKDbsXzMPrabmHrtHzeA==
X-Received: by 2002:a17:903:48e:b0:17e:ea4a:394e with SMTP id
 jj14-20020a170903048e00b0017eea4a394emr17417365plb.48.1666336637236; 
 Fri, 21 Oct 2022 00:17:17 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/36] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Fri, 21 Oct 2022 17:15:32 +1000
Message-Id: <20221021071549.2398137-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change 32-bit tci TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EVEN, to
force 32-bit values to be aligned to 64-bit.  With a small reorg
to the argument processing loop, this neatly replaces an ifdef for
CONFIG_TCG_INTERPRETER.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h |  3 ++-
 tcg/tcg.c            | 62 ++++++++++++++++++++++++++------------------
 2 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index d6e0450ed8..94ec541b4e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -158,10 +158,11 @@ typedef enum {
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
-#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
+# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
 #else
+# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d4960c62b5..e0f5c6ea7b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1532,36 +1532,48 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     real_args = 0;
     for (i = 0; i < nargs; i++) {
         int argtype = extract32(typemask, (i + 1) * 3, 3);
-        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
-        bool want_align = false;
+        TCGCallArgumentKind kind;
+        TCGType type;
 
-#if defined(CONFIG_TCG_INTERPRETER)
-        /*
-         * Align all arguments, so that they land in predictable places
-         * for passing off to ffi_call.
-         */
-        want_align = true;
-#else
-        /* Some targets want aligned 64 bit args */
-        if (is_64bit) {
-            want_align = TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN;
-        }
-#endif
-
-        if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
-            op->args[pi++] = TCG_CALL_DUMMY_ARG;
-            real_args++;
+        switch (argtype) {
+        case dh_typecode_i32:
+        case dh_typecode_s32:
+            type = TCG_TYPE_I32;
+            kind = TCG_TARGET_CALL_ARG_I32;
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            type = TCG_TYPE_I64;
+            kind = TCG_TARGET_CALL_ARG_I64;
+            break;
+        case dh_typecode_ptr:
+            type = TCG_TYPE_PTR;
+            kind = TCG_CALL_ARG_NORMAL;
+            break;
+        default:
+            g_assert_not_reached();
         }
 
-        if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
+        switch (kind) {
+        case TCG_CALL_ARG_EVEN:
+            if (real_args & 1) {
+                op->args[pi++] = TCG_CALL_DUMMY_ARG;
+                real_args++;
+            }
+            /* fall through */
+        case TCG_CALL_ARG_NORMAL:
+            if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
+                op->args[pi++] = temp_arg(args[i]);
+                op->args[pi++] = temp_arg(args[i] + 1);
+                real_args += 2;
+                break;
+            }
             op->args[pi++] = temp_arg(args[i]);
-            op->args[pi++] = temp_arg(args[i] + 1);
-            real_args += 2;
-            continue;
+            real_args++;
+            break;
+        default:
+            g_assert_not_reached();
         }
-
-        op->args[pi++] = temp_arg(args[i]);
-        real_args++;
     }
     op->args[pi++] = (uintptr_t)func;
     op->args[pi++] = (uintptr_t)info;
-- 
2.34.1


