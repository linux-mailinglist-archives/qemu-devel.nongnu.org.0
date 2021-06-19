Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEE3ADB46
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:23:24 +0200 (CEST)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufcp-0000EM-9h
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUj-0000gk-33
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUd-0002Cz-UD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:00 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u18so4989552pfk.11
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdhOR4bbdTkQJ8JwWauxjmsHhxrFc7wx39xQEmIIlNk=;
 b=aTw6s8p5DLyQl0qMrZeY4HFjOKnbBdgC6t6qLQ2eQP79GW+SbbdfL67rTjHHYfj8Fa
 wSVWKt0H/5Fo9iuuqsuOMRzKS0j5YaPw7QNmy4n4C/G4W0fT66SBz2mqPuedpyjbrnna
 geF0V8GDwCQn6lcn9ThU4BtgXUF2ohH4MBQylVQo5EXUIbNCL06L86v0K3A+cR79evXa
 N2UcevSMDru128REHTGF1o0aT797rLoRfhqH3PSL7l5HoTwN4gqbBrW/eIqRjWIlgVBu
 IEz73LxFJtR5YOBAVkj3TnryAQOuNFfn23/coHQeB5QBg1r9QhlgUYQgTneIhuTVjC2V
 LoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdhOR4bbdTkQJ8JwWauxjmsHhxrFc7wx39xQEmIIlNk=;
 b=kO6+DGIyL+/tBq4loQiVBOnG6I68jlozK0bqbJDRtrgyKDrDS3I6RA9em5y1dtZsnY
 jmVQgTcUXIO4xkfDU+8K+SCWsR9LSJgM73uGv3EgYRgKLDd3Fe9VtCrQsOE+V/S/ndbH
 dwPOs3mO/KeNSSiwe3w4YbsBeNRgv71mEZ5DEbySONvrDnTMz30fbPdSP9MuqVjE+lpt
 8WOxSsuG43Qu7qShnQ6gj05+vHRC+ojToArwUNoThOjOD4aP0UkBWin9ouSyEUrE97l0
 DjxEk+MciKrLfpWqiWp4M+lK0Y8jz6Q8T7J6tFZn/DhK9TvFtztK5EmaHsIGGJuytLVu
 BYvw==
X-Gm-Message-State: AOAM532hMb3JsNDirgEoJ7ZqNVprll7t9ffxFAanqpiZJXIF95Q1JC34
 m7y+FkjyL9nclndoU67u9Os1CiXWx0wuzQ==
X-Google-Smtp-Source: ABdhPJzAKy2PGIizXi3G1LXP4kn3HgChgE1vJf7ycWLu0Hvd+4V45m0QJ49FmfzA2HBCLRZdihu9lA==
X-Received: by 2002:a63:bf0d:: with SMTP id v13mr15762243pgf.303.1624126494561; 
 Sat, 19 Jun 2021 11:14:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] tcg: Add tcg_call_flags
Date: Sat, 19 Jun 2021 11:14:21 -0700
Message-Id: <20210619181452.877683-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to change how to look up the call flags from a TCGop,
so extract it as a helper.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  5 +++++
 tcg/optimize.c     |  3 ++-
 tcg/tcg.c          | 14 ++++++--------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 181f86507a..0796407c13 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -37,4 +37,9 @@ bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
 
+static inline unsigned tcg_call_flags(TCGOp *op)
+{
+    return op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
+}
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37c902283e..211a4209a0 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
+#include "tcg-internal.h"
 
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
index 3d6e6b260c..51c1f61828 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1766,9 +1766,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
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
@@ -2155,7 +2155,6 @@ static void reachable_code_pass(TCGContext *s)
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         bool remove = dead;
         TCGLabel *label;
-        int call_flags;
 
         switch (op->opc) {
         case INDEX_op_set_label:
@@ -2200,8 +2199,7 @@ static void reachable_code_pass(TCGContext *s)
 
         case INDEX_op_call:
             /* Notice noreturn helper calls, raising exceptions.  */
-            call_flags = op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
-            if (call_flags & TCG_CALL_NO_RETURN) {
+            if (tcg_call_flags(op) & TCG_CALL_NO_RETURN) {
                 dead = true;
             }
             break;
@@ -2402,7 +2400,7 @@ static void liveness_pass_1(TCGContext *s)
 
                 nb_oargs = TCGOP_CALLO(op);
                 nb_iargs = TCGOP_CALLI(op);
-                call_flags = op->args[nb_oargs + nb_iargs + 1];
+                call_flags = tcg_call_flags(op);
 
                 /* pure functions can be removed if their result is unused */
                 if (call_flags & TCG_CALL_NO_SIDE_EFFECTS) {
@@ -2717,7 +2715,7 @@ static bool liveness_pass_2(TCGContext *s)
         if (opc == INDEX_op_call) {
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
-            call_flags = op->args[nb_oargs + nb_iargs + 1];
+            call_flags = tcg_call_flags(op);
         } else {
             nb_iargs = def->nb_iargs;
             nb_oargs = def->nb_oargs;
@@ -3799,7 +3797,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs;
 
     func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
-    flags = op->args[nb_oargs + nb_iargs + 1];
+    flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
     if (nb_regs > nb_iargs) {
-- 
2.25.1


