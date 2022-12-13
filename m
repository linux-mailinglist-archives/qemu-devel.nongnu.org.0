Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0A64BE78
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:33:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmw-0000gg-VJ; Tue, 13 Dec 2022 16:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmu-0000g3-2V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:08 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmm-0003EK-PK
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:03 -0500
Received: by mail-oi1-x229.google.com with SMTP id s186so1044038oia.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=kx0pnFcthsKGbAbpVx4cshbd9Bl0sGXGRBqTqBJa6AH0L4i4fYPd5n87jgMjbuGUi7
 3q7OkH1WDbw20toRhp0/Rm2zIZRwVj8X0Uv48Zao/g/LlupdP/v64l+svNiC06aMa0xJ
 D2bC4onp1tCrM9eEfLLwXPzK5nNanKW+rIRc2iLUqtyJjk+d6pW2EoOK3Pqd8U2kLud6
 aZXk1vN+FeLahxKbv4g+MwRetR6R928jIYiJW2lAZQvpy9i2nfEqhB5jqEO2pJjP3wUs
 W6ul3bh1De/hJM8Hq2Ojc470ZGLzgpceYOwy43jUnwJOKU4VYH2jF5vugSUxZoUF8pHe
 Ellw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=y/LfQY7ODOBXuBpfjTuRuQ9wF8mY6tfoj3pU2ucOu4jRgwBbHMyW0yjJ23vlBUeGwM
 CUqbICAbEsFLushbQHKsCKD5PJpMAGGM4bLPw7nNjb6ZZCdQRMswMRJypTkNHYSrsv5f
 yiRwHQtSmxUQOvQ6Hrf9E96Vi5vYaY8qtMdRNkaqAjrfWxGA4vpN6FO54bIvaBXJJhEN
 ghjQEX77KYgh/rbAL2FSFfLdxPZTOPuz3T+HR21xOKYR9XcD+7XbR0TpoSxMYU3F1vIf
 tDD2YOOBqMkcvgAKPGJQJfdGZVEKoGPAVl1u8uFid97A93s+4SynX06UK2oRiee+89/K
 t49A==
X-Gm-Message-State: ANoB5plNoFP0H7jjdC3BmnNXD0QNAL5fAfqFLudVkrSwfRaGWTpCntHC
 fyk40tProkHo+I+sUCtQ0FRmsokmImRKblZjS0Q=
X-Google-Smtp-Source: AA0mqf796GG+wzckXRkswO2qpjpY8efJlcTUXZTXILjr+JMxEtefGIcHfC82JYUq9g/l4HglFyNRig==
X-Received: by 2002:a05:6808:404c:b0:35e:bc7b:20ea with SMTP id
 cz12-20020a056808404c00b0035ebc7b20eamr213228oib.57.1670966760075; 
 Tue, 13 Dec 2022 13:26:00 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 16/27] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Tue, 13 Dec 2022 15:25:30 -0600
Message-Id: <20221213212541.1820840-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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


