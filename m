Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E162550F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfs-0006cY-SY; Fri, 11 Nov 2022 02:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfm-0006Pw-N2
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfj-0008MR-IJ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id gw22so3777665pjb.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IvH3a4hJ5hvV/BTIYuq60e5ApjpQFWGSwmOpPcPvBI=;
 b=mYwePqDrxJW27cYki/BTL9fKArrn7YgP/vvcBtQOztuZd4qUG75LmplrKEdY3AnEd3
 bL6EtqhEzP9OSopPA3dY9mS5sAncSKkOYhkXQi7LK3qcHGTK4TamcoWgRdE+qbn/fbrq
 2OI5fUYEcxCZtL3YGx9YVKLDSCL7OOzunN8f4wO3WlBMo94ZLaGpmEmifuYXkieUxKBp
 BCeF0Rx5NOrSogpQjf53LgbkaacH1fUB2CeC06vhtXiEYQrMoMMLt2eQcojficrscIZJ
 Njp2C0d1d23zmh+CofLtdw82d519MVfyR7DRtKnJ2/jrPlB1wdF0ceQqO48M1IwP82Ve
 YGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IvH3a4hJ5hvV/BTIYuq60e5ApjpQFWGSwmOpPcPvBI=;
 b=AHPkLgESqE2QGxNXRN8nbbP0iAXKT+DtaDhnwu41GJnq5VYJNyHsrkFfQxDG3WxqLY
 War5qZ5PVCDSldTOczuAH4Yf+GYGWxeRhYDCHO1X0+1ITA0bwiTYMtVuAPEAoxShFTNV
 Tdce2+qKssu4q2s+WmDits/8vQKrx0puCukfuk1InH34+OLvDfLMGYALBKjrfLaLryzw
 M/mxzL2Sn8BsF/ovTJ7ESYTpD6yZU3VcztsCGCz3agVwSAILIZHWxPC+xaeJnxD11On6
 iPPl48crcSd7vHXWPkdyJ3p5RUXtfhv0CjM2mLAtqq3Odak5oRHl5SdLE0kL0l0aVCAo
 jX+w==
X-Gm-Message-State: ANoB5pmcoOoGMiDGNsSIQIa5JKVPij6S0QV4BKLsVSyRBnQ133WK0dKj
 ip0w+MV0ZsTWJv+Em10VauX4jyt9dReqI6Yo
X-Google-Smtp-Source: AA0mqf4W7e/Sr7Bl1B5LotNZXgppl3hNVZ9hZBZLgNk89jByPUjg8/M200rPkKdKWHfrZdRvkxvPpA==
X-Received: by 2002:a17:90a:14a4:b0:212:d62a:aeb8 with SMTP id
 k33-20020a17090a14a400b00212d62aaeb8mr558889pja.221.1668152510557; 
 Thu, 10 Nov 2022 23:41:50 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 18/45] tcg: Use TCG_CALL_ARG_EVEN for TCI special
 case
Date: Fri, 11 Nov 2022 17:40:34 +1000
Message-Id: <20221111074101.2069454-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Change 32-bit tci TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EVEN, to
force 32-bit values to be aligned to 64-bit.  With a small reorg
to the argument processing loop, this neatly replaces an ifdef for
CONFIG_TCG_INTERPRETER.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index b43a5200ad..b4d0ad8a17 100644
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


