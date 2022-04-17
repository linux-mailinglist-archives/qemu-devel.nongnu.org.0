Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5F50491C
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:58:26 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA6L-0004Wa-S1
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0000Qz-GS
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fL-0001kd-Iu
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ll10so11365428pjb.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vd1XgGqQcOcYKISsTjgIB8sQLrJFePfOpt3KWWJyrc=;
 b=UP67EbGzxZ99g0mMfoPy66PjiwX12VkTnL+DJoQ506nIB+1yqskq0AM9XuUW7IHEBW
 CmLR/fNbGN2f2bvyqHmjq/Q2RoaPSZsVX03p7VeiVZH3sHgAx+gfYUevyoI6YyAbryuN
 svT35EfLV+uA0TO3uJ/s5yETNYAzQkkCeaiQnXL5Mx2Lnvouw9RsDJhxPdOSf34yxrte
 uzpqKGbAMltEFsRfa1lvB6u2VGMTsqNw3OOSw6fif/JAJOizvgRvPkOxMUWV4/jhPpid
 816SVEIjsaRwtTbu/hMWmNZrC38mtIFDEYVHElhPn0uldwlzJBleDKfNzudyVyXwt8Ev
 J3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vd1XgGqQcOcYKISsTjgIB8sQLrJFePfOpt3KWWJyrc=;
 b=C1XJlXZFC9rHIVVSuio4sr6W7bTKf3siz9KiRsEm+8I1cCgjjz1nfjz3KJ+VwbYFrB
 HCQZCySZeWE4VNkLRVZnJJm7qXG0HubwQmMmUqB+b5gTBMxlJgVJwXJe1nnviT3uY6sg
 5tunjSM8JFifAGemu7pP+SKWy1coCQG+Yb7JIZBgEcLS4QbdGpyUQVEKKLOh+vJ8eEA6
 vqtNoCpgzeyQ24zqmo/qDh3wPdd9BH7gnM5cw7JByQ+x/zEHY+BPC3qiHiounGksGpJc
 AszRuptsDUoSrDKlDULIMqC+qnCtnGKbsaC1xZCJOg+9/4T0ijfqVhB10tWq1lBl9Zuw
 lDiQ==
X-Gm-Message-State: AOAM533NRs76mXQpGf2yzRjamz9fMDmXHdPuzDFyrQCXyPEgkwt9wvnY
 VK0wARVsL9mYPE4PU50rwWRDr57QsiySJQ==
X-Google-Smtp-Source: ABdhPJwz9QTE6wCclSmRR0dp1dPEsczrwU3hw1Y4Gox/sdUjM0Tqkc880AByM3/EyyyKHNqvInczEw==
X-Received: by 2002:a17:90b:4f8f:b0:1cb:55da:6bdc with SMTP id
 qe15-20020a17090b4f8f00b001cb55da6bdcmr14514399pjb.114.1650220229755; 
 Sun, 17 Apr 2022 11:30:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/39] tcg: Pass the locked filepointer to tcg_dump_ops
Date: Sun, 17 Apr 2022 11:29:51 -0700
Message-Id: <20220417183019.755276-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have already looked up and locked the filepointer.
Use fprintf instead of qemu_log directly for output
in and around tcg_dump_ops.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 109 ++++++++++++++++++++++++++----------------------------
 1 file changed, 52 insertions(+), 57 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 892f640fce..70f3b52482 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1808,7 +1808,11 @@ static inline TCGReg tcg_regset_first(TCGRegSet d)
     }
 }
 
-static void tcg_dump_ops(TCGContext *s, bool have_prefs)
+/* Return only the number of characters output -- no error return. */
+#define ne_fprintf(...) \
+    ({ int ret_ = fprintf(__VA_ARGS__); ret_ >= 0 ? ret_ : 0; })
+
+static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
 {
     char buf[128];
     TCGOp *op;
@@ -1824,7 +1828,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
 
         if (c == INDEX_op_insn_start) {
             nb_oargs = 0;
-            col += qemu_log("\n ----");
+            col += ne_fprintf(f, "\n ----");
 
             for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
                 target_ulong a;
@@ -1833,7 +1837,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
 #else
                 a = op->args[i];
 #endif
-                col += qemu_log(" " TARGET_FMT_lx, a);
+                col += ne_fprintf(f, " " TARGET_FMT_lx, a);
             }
         } else if (c == INDEX_op_call) {
             const TCGHelperInfo *info = tcg_call_info(op);
@@ -1844,7 +1848,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             nb_iargs = TCGOP_CALLI(op);
             nb_cargs = def->nb_cargs;
 
-            col += qemu_log(" %s ", def->name);
+            col += ne_fprintf(f, " %s ", def->name);
 
             /*
              * Print the function name from TCGHelperInfo, if available.
@@ -1852,15 +1856,15 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
              * but the actual function pointer comes from the plugin.
              */
             if (func == info->func) {
-                col += qemu_log("%s", info->name);
+                col += ne_fprintf(f, "%s", info->name);
             } else {
-                col += qemu_log("plugin(%p)", func);
+                col += ne_fprintf(f, "plugin(%p)", func);
             }
 
-            col += qemu_log(",$0x%x,$%d", info->flags, nb_oargs);
+            col += ne_fprintf(f, ",$0x%x,$%d", info->flags, nb_oargs);
             for (i = 0; i < nb_oargs; i++) {
-                col += qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(buf),
-                                                       op->args[i]));
+                col += ne_fprintf(f, ",%s", tcg_get_arg_str(s, buf, sizeof(buf),
+                                                            op->args[i]));
             }
             for (i = 0; i < nb_iargs; i++) {
                 TCGArg arg = op->args[nb_oargs + i];
@@ -1868,34 +1872,32 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 if (arg != TCG_CALL_DUMMY_ARG) {
                     t = tcg_get_arg_str(s, buf, sizeof(buf), arg);
                 }
-                col += qemu_log(",%s", t);
+                col += ne_fprintf(f, ",%s", t);
             }
         } else {
-            col += qemu_log(" %s ", def->name);
+            col += ne_fprintf(f, " %s ", def->name);
 
             nb_oargs = def->nb_oargs;
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
             if (def->flags & TCG_OPF_VECTOR) {
-                col += qemu_log("v%d,e%d,", 64 << TCGOP_VECL(op),
-                                8 << TCGOP_VECE(op));
+                col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
+                                  8 << TCGOP_VECE(op));
             }
 
             k = 0;
             for (i = 0; i < nb_oargs; i++) {
-                if (k != 0) {
-                    col += qemu_log(",");
-                }
-                col += qemu_log("%s", tcg_get_arg_str(s, buf, sizeof(buf),
-                                                      op->args[k++]));
+                const char *sep =  k ? "," : "";
+                col += ne_fprintf(f, "%s%s", sep,
+                                  tcg_get_arg_str(s, buf, sizeof(buf),
+                                                  op->args[k++]));
             }
             for (i = 0; i < nb_iargs; i++) {
-                if (k != 0) {
-                    col += qemu_log(",");
-                }
-                col += qemu_log("%s", tcg_get_arg_str(s, buf, sizeof(buf),
-                                                      op->args[k++]));
+                const char *sep =  k ? "," : "";
+                col += ne_fprintf(f, "%s%s", sep,
+                                  tcg_get_arg_str(s, buf, sizeof(buf),
+                                                  op->args[k++]));
             }
             switch (c) {
             case INDEX_op_brcond_i32:
@@ -1910,9 +1912,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             case INDEX_op_cmpsel_vec:
                 if (op->args[k] < ARRAY_SIZE(cond_name)
                     && cond_name[op->args[k]]) {
-                    col += qemu_log(",%s", cond_name[op->args[k++]]);
+                    col += ne_fprintf(f, ",%s", cond_name[op->args[k++]]);
                 } else {
-                    col += qemu_log(",$0x%" TCG_PRIlx, op->args[k++]);
+                    col += ne_fprintf(f, ",$0x%" TCG_PRIlx, op->args[k++]);
                 }
                 i = 1;
                 break;
@@ -1927,12 +1929,12 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                     unsigned ix = get_mmuidx(oi);
 
                     if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
-                        col += qemu_log(",$0x%x,%u", op, ix);
+                        col += ne_fprintf(f, ",$0x%x,%u", op, ix);
                     } else {
                         const char *s_al, *s_op;
                         s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];
                         s_op = ldst_name[op & (MO_BSWAP | MO_SSIZE)];
-                        col += qemu_log(",%s%s,%u", s_al, s_op, ix);
+                        col += ne_fprintf(f, ",%s%s,%u", s_al, s_op, ix);
                     }
                     i = 1;
                 }
@@ -1950,9 +1952,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                         name = bswap_flag_name[flags];
                     }
                     if (name) {
-                        col += qemu_log(",%s", name);
+                        col += ne_fprintf(f, ",%s", name);
                     } else {
-                        col += qemu_log(",$0x%" TCG_PRIlx, flags);
+                        col += ne_fprintf(f, ",$0x%" TCG_PRIlx, flags);
                     }
                     i = k = 1;
                 }
@@ -1967,49 +1969,42 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             case INDEX_op_brcond_i32:
             case INDEX_op_brcond_i64:
             case INDEX_op_brcond2_i32:
-                col += qemu_log("%s$L%d", k ? "," : "",
-                                arg_label(op->args[k])->id);
+                col += ne_fprintf(f, "%s$L%d", k ? "," : "",
+                                  arg_label(op->args[k])->id);
                 i++, k++;
                 break;
             default:
                 break;
             }
             for (; i < nb_cargs; i++, k++) {
-                col += qemu_log("%s$0x%" TCG_PRIlx, k ? "," : "", op->args[k]);
+                col += ne_fprintf(f, "%s$0x%" TCG_PRIlx, k ? "," : "",
+                                  op->args[k]);
             }
         }
 
         if (have_prefs || op->life) {
-
-            QemuLogFile *logfile;
-
-            rcu_read_lock();
-            logfile = qatomic_rcu_read(&qemu_logfile);
-            if (logfile) {
-                for (; col < 40; ++col) {
-                    putc(' ', logfile->fd);
-                }
+            for (; col < 40; ++col) {
+                putc(' ', f);
             }
-            rcu_read_unlock();
         }
 
         if (op->life) {
             unsigned life = op->life;
 
             if (life & (SYNC_ARG * 3)) {
-                qemu_log("  sync:");
+                ne_fprintf(f, "  sync:");
                 for (i = 0; i < 2; ++i) {
                     if (life & (SYNC_ARG << i)) {
-                        qemu_log(" %d", i);
+                        ne_fprintf(f, " %d", i);
                     }
                 }
             }
             life /= DEAD_ARG;
             if (life) {
-                qemu_log("  dead:");
+                ne_fprintf(f, "  dead:");
                 for (i = 0; life; ++i, life >>= 1) {
                     if (life & 1) {
-                        qemu_log(" %d", i);
+                        ne_fprintf(f, " %d", i);
                     }
                 }
             }
@@ -2020,28 +2015,28 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 TCGRegSet set = op->output_pref[i];
 
                 if (i == 0) {
-                    qemu_log("  pref=");
+                    ne_fprintf(f, "  pref=");
                 } else {
-                    qemu_log(",");
+                    ne_fprintf(f, ",");
                 }
                 if (set == 0) {
-                    qemu_log("none");
+                    ne_fprintf(f, "none");
                 } else if (set == MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS)) {
-                    qemu_log("all");
+                    ne_fprintf(f, "all");
 #ifdef CONFIG_DEBUG_TCG
                 } else if (tcg_regset_single(set)) {
                     TCGReg reg = tcg_regset_first(set);
-                    qemu_log("%s", tcg_target_reg_names[reg]);
+                    ne_fprintf(f, "%s", tcg_target_reg_names[reg]);
 #endif
                 } else if (TCG_TARGET_NB_REGS <= 32) {
-                    qemu_log("%#x", (uint32_t)set);
+                    ne_fprintf(f, "0x%x", (uint32_t)set);
                 } else {
-                    qemu_log("%#" PRIx64, (uint64_t)set);
+                    ne_fprintf(f, "0x%" PRIx64, (uint64_t)set);
                 }
             }
         }
 
-        qemu_log("\n");
+        putc('\n', f);
     }
 }
 
@@ -4207,7 +4202,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP:\n");
-            tcg_dump_ops(s, false);
+            tcg_dump_ops(s, logfile, false);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
@@ -4254,7 +4249,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
                 fprintf(logfile, "OP before indirect lowering:\n");
-                tcg_dump_ops(s, false);
+                tcg_dump_ops(s, logfile, false);
                 fprintf(logfile, "\n");
                 qemu_log_unlock(logfile);
             }
@@ -4277,7 +4272,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP after optimization and liveness analysis:\n");
-            tcg_dump_ops(s, true);
+            tcg_dump_ops(s, logfile, true);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
-- 
2.25.1


