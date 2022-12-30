Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C946593CB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:22:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sM-0003ny-Hf; Thu, 29 Dec 2022 19:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rY-00039S-6t
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rS-0002fA-6m
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:03 -0500
Received: by mail-pj1-x102f.google.com with SMTP id p4so20797172pjk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIYBFdTpghAdpncoDoo3OM1Ll9TMAgl8x6x4b6Uo9Ew=;
 b=EKvqwtfKP9dJjTyvmMMx6OS06ZvGTWQd0JfpFiIquR5KQd9EjicepkYMwdY5iYqXwG
 UvdH6HkEFZflKNCh6+h42x7KFSrd428vQwR7YT+DD6hXsnoE7I2NI3WcAB80TmfS2Z1v
 Vq/NNlFz6ONqISW0BPly6GgFKCmYtQKPNqXOwngdZqgezWb2vV1SN7nvqn2m6XuuK/n0
 5HQYK9s0RwMh7772DQ+4k5G/hchD69l2EL3aLhMcWlOLH5YvD+d+GnKhHeqhRwHStd/H
 gRKmYBEw47fh0xidqoFPJfdqHjljYbJOyBgU0OIibXF/hAgPBW3LUnzmaDLeSeITbtUU
 vkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIYBFdTpghAdpncoDoo3OM1Ll9TMAgl8x6x4b6Uo9Ew=;
 b=J1+E3TKtXC6TJLpkrj7fCq8tIzPIE3fu9IyK6e566NglbNY12a7l7EQTHMJ9+Yd+QL
 kaD6Tu8rAtrPofylzxSi6wirllk7ObLkvxqgpAIu9oZ4SG1cjF25JV1rEE80TapbYN9x
 S//rdVvZ0W58TctdPsEqAbSpJOkqQ5pvYkVJmtOpg2QpEjB6tpO+zinty/R3UrAKrmvS
 sPa9YkzVOFw4UhMI1XiwO3omG2dFUji5v5+BKJ7/N7Hebk6G1nssBDxoquJPyqZ4BrCT
 NeJpZ8epxYz49Jhn2BRj040lgJr7MjW+Bx2d4tOaP5hEqGSS2aII1nK6qEyLXlg8puGN
 4GDg==
X-Gm-Message-State: AFqh2kpYRHLSYpqMlx5hTrXlsgPXWlK7mygWPpqpJIbt7rk0iFh31Mru
 RFizT8au8LREHROYdc3vOm+x+C+b/1t+bjee
X-Google-Smtp-Source: AMrXdXt+alCxqTmqtAXtezKOyJhrlpbsg1m9bZkCwNzcJ4+G0826DAmTLU45gOfmKa0YHJCMHqzGuA==
X-Received: by 2002:a17:902:82c4:b0:192:622a:ff9c with SMTP id
 u4-20020a17090282c400b00192622aff9cmr25528715plz.39.1672358571416; 
 Thu, 29 Dec 2022 16:02:51 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/47] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Thu, 29 Dec 2022 16:02:05 -0800
Message-Id: <20221230000221.2764875-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index a6adc43f9f..a5ecc92591 100644
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


