Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C591563FFE0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymi-0002gt-CE; Fri, 02 Dec 2022 00:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0yme-0002ft-Qy
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:24 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymd-0003Nt-4R
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:24 -0500
Received: by mail-pg1-x52f.google.com with SMTP id w37so3548775pga.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=HRQgHXeaXaSkuEVlXHqbcguF9eYqOOEbK/BfX6f1Bxtx8k/FKyNyq0VGceo2Xs1YfG
 ZD3FKDqE6ruOwFibpuJNkZ2H31QSkoG4u6vVvPepwmBh9phKihYhhFdZAqmNACpvRqhk
 3dd/3lzxBJPT7wrjlJTGUtQpwsIpq6ShHqNgVT19bBG3JX3FBxhFaCPIkGJtZHZLTvEA
 q+EG4Fb7mj8ZRwTCXDu4NdaJGxeD6RtGrLR8KuN5h53nm6UqDbpAuIqxeKTjCZCOJ/fu
 f2nMGvyC3dk1P9shoT6yUobF4ODTWMeo44HCfT/hTSYU4lBt62Al/IajzdyNbw19yv6C
 9Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=IaJE0GrLWFDzAiaarVG2UKmtmoauYnyBIQOVQnP6RM1Yn2es7GIHR6CS6GQnnl5Ptt
 2W6BIZDgc/2kkJhIIlsP4NMx/3GwRuwxUWqqVASUHRpNaNH62d7xWhjiIEgYb7Jkc2K7
 6aiOTsiiRz+0kiR0xEard/wNeoviKr4pVOlzuvthgYjtEr0kpus/5jelLPqlHmR3nFca
 VrOMVCf2p4SN68MuqQKftf6JkKo3hyQc6qdh7ZiaFjzk/+ieSJ58aEHHygJAsiFKcwpc
 7a4BcUf2SlyvjbnXW/UiOsa6gBWzpyFsjMxEFJyScw+kLboF9dCCWNSp2SkcwunDELs3
 Bdvg==
X-Gm-Message-State: ANoB5pmzcoxsnaKnXvlvWoApDDscDmcvCZhvfcDwYQllY+musqMdtSlZ
 1spGYeob2DhmkpsiaZ3xFgIrzq9Ckdb+m+k+
X-Google-Smtp-Source: AA0mqf4cO2hIabc64k/XYdJL24aCF8vd/vGQCoHABKscGRc8Xuh1pf915iBkzxq0fD+RHwUnrvNQHw==
X-Received: by 2002:a65:53ca:0:b0:476:dd80:fb29 with SMTP id
 z10-20020a6553ca000000b00476dd80fb29mr63167917pgr.619.1669959621843; 
 Thu, 01 Dec 2022 21:40:21 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 22/34] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Thu,  1 Dec 2022 21:39:46 -0800
Message-Id: <20221202053958.223890-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 tcg/tci/tcg-target.h |  3 +-
 tcg/tcg.c            | 70 ++++++++++++++++++++++++++++----------------
 2 files changed, 47 insertions(+), 26 deletions(-)

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
index 4c397cb0fa..aae4046e1b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1533,36 +1533,56 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            type = TCG_TYPE_I64;
+            break;
+        case dh_typecode_ptr:
+            type = TCG_TYPE_PTR;
+            break;
+        default:
+            g_assert_not_reached();
         }
 
-        if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
+        switch (type) {
+        case TCG_TYPE_I32:
+            kind = TCG_TARGET_CALL_ARG_I32;
+            break;
+        case TCG_TYPE_I64:
+            kind = TCG_TARGET_CALL_ARG_I64;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
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


