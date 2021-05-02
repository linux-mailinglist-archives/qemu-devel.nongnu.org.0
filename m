Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F220370FF2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:59:30 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLzl-0000mF-4T
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxt-0007Ta-R1
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxr-0000WO-Jo
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id v191so2965626pfc.8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Pv6wH67s4MyTK6qfKIrdCJIZdE3Amzzm/8J1bNCBCcA=;
 b=ldljY/ZWNlSgso7loEsC+oAMDJx3q1T47nkeej4aQvnYtGjJLI6dU5aWlFJk1IORew
 CrZK8eGfJ2TKnhvl6qofuATqdPGnohUW8DwDwCz7bxya9Eu3c8GNDA5YsxZhks91NDPl
 dCiYXZBE4KMBUn6WulaosvyhGGAV4lmlYZha+4Hduqe5n6jABWH8/yGnhjGrX6ZEDVpc
 2rrQutD15i/MUi6SnAsBbCtpb3lGt6NS0WXxEwP8vVqE92+NQOxFwyIQIaN884kTYo0N
 Ijvf0RLsneDFG/detc2eYFyD+IxCYM65I0RpjX0dLWQwjwbgFsB0Vvp9SCu2U3H9h14w
 wSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pv6wH67s4MyTK6qfKIrdCJIZdE3Amzzm/8J1bNCBCcA=;
 b=Jh6A9PJwp3u1yTAcKdXPiJq/LjSXWN+NMGAFEwotucEiXIfDRKFoLwJ043xn5R6S4g
 Y124HVVRxInBYedbhJRJuplmgKonBtNUkyEUpJHyhRLr7LUrHrfbtTH8IONQoNBktM7R
 4OukNprTuu2Stpnoo52lIPpgLEfHl4V2b/zU2fShAuQsISkvxFtgIms9CjfQ2oTAiFBV
 Yeg2Lq/Gh/6dQNaK0sCkOHW2sr6J+KztZrO0z7PGiqaWrOk+VZwWhNzNugRvpM8MwcT6
 8VGWIlOoHhF3Ci0IYZ2I2AyDtmgNnt1YvP/L7Yhud4hUUivizP3D9ZNV7Cz8Jvpp7q1p
 GrzQ==
X-Gm-Message-State: AOAM530FcnXvDKoniwFp3EGGMW2afuzGP6DHrhBQG7Nm4a7hNUqjweQV
 QYbXBnP07Crq7qqmgK5dhV43ChgVESpljg==
X-Google-Smtp-Source: ABdhPJzFq7mJTwp5l+EMFx5Qmwq6Rrdma6g73THJIR5V5W++k+P8Cxv5EB4+A8lLmtAaYbYPhMQ7HA==
X-Received: by 2002:a63:150c:: with SMTP id v12mr15793285pgl.344.1619999850262; 
 Sun, 02 May 2021 16:57:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/26] tcg: Add tcg_call_flags
Date: Sun,  2 May 2021 16:57:03 -0700
Message-Id: <20210502235727.1979457-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to change how to look up the call flags from a TCGop,
so extract it as a helper.

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
index 3c7c9a5517..b590f8d0de 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -65,6 +65,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
+#include "internal.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
@@ -2335,9 +2336,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
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
@@ -2711,7 +2712,6 @@ static void reachable_code_pass(TCGContext *s)
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         bool remove = dead;
         TCGLabel *label;
-        int call_flags;
 
         switch (op->opc) {
         case INDEX_op_set_label:
@@ -2756,8 +2756,7 @@ static void reachable_code_pass(TCGContext *s)
 
         case INDEX_op_call:
             /* Notice noreturn helper calls, raising exceptions.  */
-            call_flags = op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
-            if (call_flags & TCG_CALL_NO_RETURN) {
+            if (tcg_call_flags(op) & TCG_CALL_NO_RETURN) {
                 dead = true;
             }
             break;
@@ -2958,7 +2957,7 @@ static void liveness_pass_1(TCGContext *s)
 
                 nb_oargs = TCGOP_CALLO(op);
                 nb_iargs = TCGOP_CALLI(op);
-                call_flags = op->args[nb_oargs + nb_iargs + 1];
+                call_flags = tcg_call_flags(op);
 
                 /* pure functions can be removed if their result is unused */
                 if (call_flags & TCG_CALL_NO_SIDE_EFFECTS) {
@@ -3273,7 +3272,7 @@ static bool liveness_pass_2(TCGContext *s)
         if (opc == INDEX_op_call) {
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
-            call_flags = op->args[nb_oargs + nb_iargs + 1];
+            call_flags = tcg_call_flags(op);
         } else {
             nb_iargs = def->nb_iargs;
             nb_oargs = def->nb_oargs;
@@ -4355,7 +4354,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs;
 
     func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
-    flags = op->args[nb_oargs + nb_iargs + 1];
+    flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
     if (nb_regs > nb_iargs) {
-- 
2.25.1


