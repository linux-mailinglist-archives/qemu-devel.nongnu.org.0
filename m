Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81C4E1D1E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:27:20 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzKp-0003S4-FL
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:27:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5r-0008Pt-Jk
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:51 -0400
Received: from [2607:f8b0:4864:20::102d] (port=37611
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5n-0003RQ-D4
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so12183216pjb.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBLJhIXzKI/cdzhRUD5EzFRORqxgtBTHvf3b9Zw2Xz8=;
 b=gA0XEASGAR2s3DczN5S+O7hBXAp9WJpQj0ednhOmArxnoJvwMV67yUodOt5nYetRcS
 2Mh8JeiCA+O+Rxllt4zS+5ita3/24T2YmvYjFerm79eCGHSmmAOaq6ZZUL4Zyhkhz+xe
 WeX+Af3MShNKvtVm4sOKqU6m7YLwH7S3JYPfX6Bs+kNkVxZu7J/Np+wNQHjwhyC+/fRA
 Bs4dUlfJmHeI3QcAWfO3u20vmr4dqzfzGipwi0LsXpZR/CenrmvhGo42yO58JxFlnq/r
 gnIXn+dOTODiSxkj845EXC46Bv8kr/p7OqrG0ttbMuFTgAwcETv01rYS78ORxdRlByl2
 EIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBLJhIXzKI/cdzhRUD5EzFRORqxgtBTHvf3b9Zw2Xz8=;
 b=3ktrFpci/jxFL5FceV238AH7LNqxbgZHUw8N3NLPS6Bo4+FK1PYXdCm4yW3iRf1Sot
 yc8Xkzv5CIzJxuE8zlNrwF1KIRqlk6bB8FN1UlHh5KToaWUoAfGTQdvGuI4NrnoAbOD8
 vGMKexC2TcDchTOkuz9cMKdiiZH40UqtUWiLll3RCoLygspXU5bYud1cXcG1wpepG79L
 eLup+jfeklN3K7NkESuiVJ/L72uiDrQZl1701v16EU7XGI180nZGWyUdOXI34u9tDFba
 gytWMU52HCCvpMSVW4eGP+q4hN1mnXJ78x+RtdHeu2PsuXUppjv2Bzb8VpONCXA/hvX1
 yH5w==
X-Gm-Message-State: AOAM532weg/ciuIUajwWrEfNdWCA+5c0AP8I2ZVGiwPvxKIkzB7b7AeA
 C/5w6pZcmnotPXqD87Dr5W+ia5IE0vBQPA==
X-Google-Smtp-Source: ABdhPJwvKJ/vGrm4aeP0blmxAqLr7nMHwuQqolGf1lR1raKAKSjPIBfzCazmDUBnhVI5iwSSUZUMQQ==
X-Received: by 2002:a17:902:f544:b0:153:bb8a:9374 with SMTP id
 h4-20020a170902f54400b00153bb8a9374mr9316144plf.154.1647796306043; 
 Sun, 20 Mar 2022 10:11:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 10/36] tcg: Pass the locked filepointer to tcg_dump_ops
Date: Sun, 20 Mar 2022 10:11:09 -0700
Message-Id: <20220320171135.2704502-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 109 ++++++++++++++++++++++++++----------------------------
 1 file changed, 52 insertions(+), 57 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 42c1620ec6..1e27367af6 100644
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
+                    ne_fprintf(f, "%#x", (uint32_t)set);
                 } else {
-                    qemu_log("%#" PRIx64, (uint64_t)set);
+                    ne_fprintf(f, "%#" PRIx64, (uint64_t)set);
                 }
             }
         }
 
-        qemu_log("\n");
+        putc('\n', f);
     }
 }
 
@@ -4207,7 +4202,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         FILE *logfile = qemu_log_lock();
         if (logfile) {
             fprintf(logfile, "OP:\n");
-            tcg_dump_ops(s, false);
+            tcg_dump_ops(s, logfile, false);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
@@ -4254,7 +4249,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
             FILE *logfile = qemu_log_lock();
             if (logfile) {
                 fprintf(logfile, "OP before indirect lowering:\n");
-                tcg_dump_ops(s, false);
+                tcg_dump_ops(s, logfile, false);
                 fprintf(logfile, "\n");
                 qemu_log_unlock(logfile);
             }
@@ -4277,7 +4272,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         FILE *logfile = qemu_log_lock();
         if (logfile) {
             fprintf(logfile, "OP after optimization and liveness analysis:\n");
-            tcg_dump_ops(s, true);
+            tcg_dump_ops(s, logfile, true);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
-- 
2.25.1


