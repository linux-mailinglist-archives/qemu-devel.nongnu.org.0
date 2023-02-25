Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29656A281B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:04:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPV-0000Po-ST; Sat, 25 Feb 2023 04:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPT-0000Ov-JI
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:03 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPR-0004py-Es
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:03 -0500
Received: by mail-pj1-x1036.google.com with SMTP id kb15so1419689pjb.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2yx2ICVs1zB6ngtjHL2Am0/1UDD6BkdCpu6nOfJ5a4=;
 b=v9lm36CYsz0pY/5+dHGw+39kLu3Ovsl1a3EMjRflFYU8VOA3RKWqv7P/JdWh9iYV54
 E6RuGa8URdsV9cXDFZc34xBhXAkSyzmcjmW4EojnLJADMRzIHuYh2uGGGLWi6M4tAMhq
 NdC6tvks5hK0ijVakH8Z8UUzPgWbia9bd83y2lPTn3aTyMwLrj50n7PA5SMqHGqbjgaL
 qwcTiSBAdkDBQMeEEn9TMXi6/YhVn4iNptgUlx+im6xt6wbusN1Nm903k8G1rf34+Zlw
 lgpFdL4nSkuuliQ2mi2fUH6QSGlZEhucqH458vQxI3OEWBwKSw5wpkkpeLyAKgFdds0W
 DTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2yx2ICVs1zB6ngtjHL2Am0/1UDD6BkdCpu6nOfJ5a4=;
 b=z4VjHOAtWSOriqHp0TER255RdmWukCf/wwF4F81On+k3OH7V203kEAGy76lnu9Qk0P
 7NOG6X9AyBh2jjIUFBp7jDHIZ8xPx6UC+NgJOdC3OKbQk/5dJj4V624Il1G3rTLSjZ01
 0pKIhE0HHy1vDXFuCGtBDqUrn849p2uQFgOC3gQfegF1UfdtaqHlqbUUSy/Zif11O4IG
 Q+DEZYZiPDRKKxI8a2D+4RfZJ87SowmcG+6icVW+xb9jQ+ylIfjIIbb0/fUeM3+4aSVY
 jTtDhDIJtH78xQzGTSR/aKBfrcg2h33koDCMaLMj1lmj1DuSvV6KPw+hvHMD9DjP0spE
 G5xw==
X-Gm-Message-State: AO0yUKXtVFcs3YbWZ/ooiDb3WcDhNJwpToQoIbJB/kXJe0UGFYr3fKG1
 4VT+6+AUQPo109mJ2ZpGV7+4suJRtS1+IiAxgqE=
X-Google-Smtp-Source: AK7set/3brNr3aJMtLNUBjpVl9oHF/xFoJNhh1Bo8f+LhL0BftLp6cxB1fwBzApvsJsIbwg48htmxg==
X-Received: by 2002:a17:90b:3ec9:b0:237:ae7c:15b9 with SMTP id
 rm9-20020a17090b3ec900b00237ae7c15b9mr3292416pjb.36.1677315599868; 
 Sat, 25 Feb 2023 00:59:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 07/30] tcg: Add liveness_pass_0
Date: Fri, 24 Feb 2023 22:59:22 -1000
Message-Id: <20230225085945.1798188-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Attempt to reduce the lifetime of TEMP_TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7ee935701a..6646770268 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2858,6 +2858,75 @@ static void la_cross_call(TCGContext *s, int nt)
     }
 }
 
+/*
+ * Liveness analysis: Verify the lifetime of TEMP_TB, and reduce
+ * to TEMP_EBB, if possible.
+ */
+static void __attribute__((noinline))
+liveness_pass_0(TCGContext *s)
+{
+    void * const multiple_ebb = (void *)(uintptr_t)-1;
+    int nb_temps = s->nb_temps;
+    TCGOp *op, *ebb;
+
+    for (int i = s->nb_globals; i < nb_temps; ++i) {
+        s->temps[i].state_ptr = NULL;
+    }
+
+    /*
+     * Represent each EBB by the op at which it begins.  In the case of
+     * the first EBB, this is the first op, otherwise it is a label.
+     * Collect the uses of each TEMP_TB: NULL for unused, EBB for use
+     * within a single EBB, else MULTIPLE_EBB.
+     */
+    ebb = QTAILQ_FIRST(&s->ops);
+    QTAILQ_FOREACH(op, &s->ops, link) {
+        const TCGOpDef *def;
+        int nb_oargs, nb_iargs;
+
+        switch (op->opc) {
+        case INDEX_op_set_label:
+            ebb = op;
+            continue;
+        case INDEX_op_discard:
+            continue;
+        case INDEX_op_call:
+            nb_oargs = TCGOP_CALLO(op);
+            nb_iargs = TCGOP_CALLI(op);
+            break;
+        default:
+            def = &tcg_op_defs[op->opc];
+            nb_oargs = def->nb_oargs;
+            nb_iargs = def->nb_iargs;
+            break;
+        }
+
+        for (int i = 0; i < nb_oargs + nb_iargs; ++i) {
+            TCGTemp *ts = arg_temp(op->args[i]);
+
+            if (ts->kind != TEMP_TB) {
+                continue;
+            }
+            if (ts->state_ptr == NULL) {
+                ts->state_ptr = ebb;
+            } else if (ts->state_ptr != ebb) {
+                ts->state_ptr = multiple_ebb;
+            }
+        }
+    }
+
+    /*
+     * For TEMP_TB that turned out not to be used beyond one EBB,
+     * reduce the liveness to TEMP_EBB.
+     */
+    for (int i = s->nb_globals; i < nb_temps; ++i) {
+        TCGTemp *ts = &s->temps[i];
+        if (ts->kind == TEMP_TB && ts->state_ptr != multiple_ebb) {
+            ts->kind = TEMP_EBB;
+        }
+    }
+}
+
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
@@ -4873,6 +4942,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     reachable_code_pass(s);
+    liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-- 
2.34.1


