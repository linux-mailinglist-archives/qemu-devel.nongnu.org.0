Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E890397625
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:09:47 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo61a-0007ms-4E
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tL-0002Ak-W7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:16 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tJ-0002Ti-Lg
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:15 -0400
Received: by mail-il1-x12a.google.com with SMTP id b9so5544910ilr.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ht8N/KCBkjYSaUObM7d0Vb7s6Kg841z61eMFrL9GxjQ=;
 b=fX5t/xWWsLUezaqgJ/f2SeQUlXEC0zZuf1ivvvtwHA6b8o5cbu1LLpz4EhD30q5J5b
 JWlSfoOwT//+z5/0YBjSZHkbOUZ+rY48iSwISxgVI/q0/b/qmULTtcdH25429g49p8iT
 fbrHN57Mm00B9/KcWS0VKbQvGVrO2mj4lqG2w7E9aN7Q6ftDtR40ZTOlCIvqeFttelWz
 LEmYKHUpGd8RRKHaZRmJ/qxKYlwYTjfRvXsGZk31kTytJoQ6aBDkpNJmw3O91SBUUaAa
 hEXZxvOkDGCBH90Noz8ocRIBQgja2AJOt0gibEdeEIRng5Csk1oJ2KeGig7EMCSzbZgb
 Fudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ht8N/KCBkjYSaUObM7d0Vb7s6Kg841z61eMFrL9GxjQ=;
 b=nCz7FdHO7sXE7QNzJ4lJgBiXxeJ/+IJRE5jnX7C8viFPdoLHre5pc1CVTwQTWSkKuH
 BngNdJQ4YQB/oxkPXHwQb6LMO6y2bjzXfDEKRdk1/Dk5AVZvMWVc/SHUE9SbOr/7ye2J
 TmKAC6J7/3oqPQ0GzL88zduXZVdvvuYvH1gO5vFymPSbqtApP1rbRsPNFbh3Btb0rvhC
 lz0FqUKY44uz8Gxqttc0dC7b/j1cqWOfqaIezq/N5TDPSFdQpMZGjxXHqeBlE9iLuxaH
 w05l/V9S8OC3yOpyAkUW2wimNHjhb4AJm4Ud/fHechNC/NT7kRYCecjXreGnaULk3ioa
 SKAA==
X-Gm-Message-State: AOAM531PoeyVuQylfgYMgf4ZrBakxIswwNj/6GQlxhhwc1yv7297OjV0
 Kx8WxwKrHDYiQmpmiWQqv9QtJ321wdM4YbJT
X-Google-Smtp-Source: ABdhPJyqlycrzqS6o7einQzq58VPhWAds3U7vnT+5RN+F1O46FHToGKLxk4vfAoK3GABMhlybcvjuQ==
X-Received: by 2002:a92:b506:: with SMTP id f6mr9779747ile.148.1622559672505; 
 Tue, 01 Jun 2021 08:01:12 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/27] tcg: Add tcg_call_flags
Date: Tue,  1 Jun 2021 08:00:41 -0700
Message-Id: <20210601150106.12761-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to change how to look up the call flags from a TCGop,
so extract it as a helper.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h | 33 +++++++++++++++++++++++++++++++++
 tcg/optimize.c |  3 ++-
 tcg/tcg.c      | 15 +++++++--------
 3 files changed, 42 insertions(+), 9 deletions(-)
 create mode 100644 tcg/internal.h

diff --git a/tcg/internal.h b/tcg/internal.h
new file mode 100644
index 0000000000..35a8a0d9fa
--- /dev/null
+++ b/tcg/internal.h
@@ -0,0 +1,33 @@
+/*
+ * Internal declarations for Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef TCG_INTERNAL_H
+#define TCG_INTERNAL_H 1
+
+static inline unsigned tcg_call_flags(TCGOp *op)
+{
+    return op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
+}
+
+#endif /* TCG_INTERNAL_H */
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37c902283e..081b62798e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
+#include "internal.h"
 
 #define CASE_OP_32_64(x)                        \
         glue(glue(case INDEX_op_, x), _i32):    \
@@ -1481,7 +1482,7 @@ void tcg_optimize(TCGContext *s)
             break;
 
         case INDEX_op_call:
-            if (!(op->args[nb_oargs + nb_iargs + 1]
+            if (!(tcg_call_flags(op)
                   & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
                 for (i = 0; i < nb_globals; i++) {
                     if (test_bit(i, temps_used.l)) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5c9a89d22d..1fb4604e45 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -63,6 +63,7 @@
 
 #include "elf.h"
 #include "exec/log.h"
+#include "internal.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
@@ -2333,9 +2334,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             nb_cargs = def->nb_cargs;
 
             /* function name, flags, out args */
-            col += qemu_log(" %s %s,$0x%" TCG_PRIlx ",$%d", def->name,
+            col += qemu_log(" %s %s,$0x%x,$%d", def->name,
                             tcg_find_helper(s, op->args[nb_oargs + nb_iargs]),
-                            op->args[nb_oargs + nb_iargs + 1], nb_oargs);
+                            tcg_call_flags(op), nb_oargs);
             for (i = 0; i < nb_oargs; i++) {
                 col += qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(buf),
                                                        op->args[i]));
@@ -2709,7 +2710,6 @@ static void reachable_code_pass(TCGContext *s)
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         bool remove = dead;
         TCGLabel *label;
-        int call_flags;
 
         switch (op->opc) {
         case INDEX_op_set_label:
@@ -2754,8 +2754,7 @@ static void reachable_code_pass(TCGContext *s)
 
         case INDEX_op_call:
             /* Notice noreturn helper calls, raising exceptions.  */
-            call_flags = op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
-            if (call_flags & TCG_CALL_NO_RETURN) {
+            if (tcg_call_flags(op) & TCG_CALL_NO_RETURN) {
                 dead = true;
             }
             break;
@@ -2956,7 +2955,7 @@ static void liveness_pass_1(TCGContext *s)
 
                 nb_oargs = TCGOP_CALLO(op);
                 nb_iargs = TCGOP_CALLI(op);
-                call_flags = op->args[nb_oargs + nb_iargs + 1];
+                call_flags = tcg_call_flags(op);
 
                 /* pure functions can be removed if their result is unused */
                 if (call_flags & TCG_CALL_NO_SIDE_EFFECTS) {
@@ -3271,7 +3270,7 @@ static bool liveness_pass_2(TCGContext *s)
         if (opc == INDEX_op_call) {
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
-            call_flags = op->args[nb_oargs + nb_iargs + 1];
+            call_flags = tcg_call_flags(op);
         } else {
             nb_iargs = def->nb_iargs;
             nb_oargs = def->nb_oargs;
@@ -4353,7 +4352,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs;
 
     func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
-    flags = op->args[nb_oargs + nb_iargs + 1];
+    flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
     if (nb_regs > nb_iargs) {
-- 
2.25.1


