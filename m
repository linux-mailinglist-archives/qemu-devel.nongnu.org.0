Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEF655BF9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:15:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP3-0002r6-SP; Sat, 24 Dec 2022 18:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOq-0002RC-Ic
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:58 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOn-0006MK-Sr
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:56 -0500
Received: by mail-pl1-x62f.google.com with SMTP id n4so8059897plp.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=jclAvtQpEMht6X8kAgklHePWZ4Cy017+ccVOunlfQdQl+gA/l0pM7mzIUwl/jXCcIn
 d8Wv0gKw2DmMrTCsyq9jDFdpfPqZKAPwePd/dQqLwPWLTxzZUM+oXSrwJyFCsrwHxzqX
 gHy+z4mzAMNjBYfBPWQuWaPjGOd7MDEAV71PDMHI88rc2ftKdD86nRf5chuHRC5CVxih
 jyXITetFJo5SWXy1zqq8uWwe9t040PYzT7wn49RTk0vvWgnKD/6Utsn7z7HoGIE7H15K
 MwuW9DfjfUL7DpS3F+lUm2J4rvu73BvS8vIKCITFz4Rmgac3jNYGewTmTTZ63PUVabk4
 FZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcsaITVUaZwX2W3VYFeAudOGzYmg0UWJ+TXMDg4IToo=;
 b=eCR+OjTVG4m2zQpXrD+lhOMHovuOsu7Jn7VU4NLv8wtZ65fYi7p0sGXewxZlfcM3Cw
 Q5Xjuv3nnNuqTZajMMW2IYj3OaBQp/fvqhtuZKjS6dapDM5/hkniwJG//E6TDanAgdrx
 7L05Xo44LYuVAGMHwCE4NIAF4I2K7iQZ8f5WxsW4wJXgn0QrUgw5ACC/8M0t87zEMcc4
 n0N9wr+6BA/1+CCseVmb0DfBku738aOB66uKq0u9aWhO+hExvJhkxUPGqg2Rdh8Pq5eg
 uQz5LV1E1VNx8H4EXSjiklI078Dhpw1Fk8DDBbMf6duI9s7l/MfAEQGISNLQpV1c7Oom
 d7cw==
X-Gm-Message-State: AFqh2kqtQDYslh7dqIaPlMPXbHctaKd0qLwcSthYDa1TJo3wli5tGvcY
 n4ZeSH8qwVc8EieDQm9A57h9QxJevjp5RDKe
X-Google-Smtp-Source: AMrXdXvXr4WpkW/gTIdxtn17u0A6MebnEM3UijGDaLIslZeGg0ZlFeuh3oHamzFvoa+ZY22xSpErHg==
X-Received: by 2002:a17:903:2341:b0:192:5e53:15f3 with SMTP id
 c1-20020a170903234100b001925e5315f3mr11633256plh.48.1671926271633; 
 Sat, 24 Dec 2022 15:57:51 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 31/43] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Sat, 24 Dec 2022 15:57:08 -0800
Message-Id: <20221224235720.842093-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


