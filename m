Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D269FF6E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWJ-0000Pt-0T; Wed, 22 Feb 2023 18:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWH-0000Og-1R
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:29 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWF-0005JA-AA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id x34so7424736pjj.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+N5bQjUnjMOfQ9Q0ZNUmrWXqHC77HMHd7kbnKb9ea14=;
 b=p1gacrw8242h1JWdDCzX9jtB6QyDRoxRRYiKWEgVCFfbON58yAXOBfFQtxXpikQK7h
 ThU7xQ24U0x004dOHoysoBhmJkeC25ZvVhD6w3bKo+Z03cB/wDwr4Kz5P1yZ+IDKXwLr
 V1HvpAxiOr0CxT/XGHl88XVGRhsP3ygwZjrdxiKycc8+X/Uic3f7pkxL3ycfmM+NbJCC
 QPS2Q+A48jiaJQSTx/FF0XEviM3u/XrioRoAZobvuRHCfOzxa6UR7ThAKbdAggXjnKCr
 ca3AJM+r6b53JuOLqt3mKJu/L43HQX9/TBpP4jtrQk4pStpRhSWiZv56BCQKJBdexjQ4
 Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+N5bQjUnjMOfQ9Q0ZNUmrWXqHC77HMHd7kbnKb9ea14=;
 b=FvvbBxnjqV3H1okS0nUm7OlAdEHvR2EHK3IIJMWcNq0mtvsKTFzEvrc8bKRy61MhOp
 Dr/lWJeM9StQ9uiee7TefMOkKOlikPoVDAksgdWdsfS4Px4lOvsMByersqD8YgXiVGzH
 /ymre4SY5PdjSAlzGO2JoiaP5o4DL/FfoJ1fZtDYe8py3/FFwlYkNJKcQhAROSBL5PTd
 Kg5bFb8E4md3eS77J4vjKuCYRm4yKJ4EreIfd3uz+ivju+6EcFz+QnH43xxZy6+S3ydU
 YMLvHoPg5izIqADd4/n+ixPW4gaBv6Kz7P15RrZn4UocXKH5Xl7qO37wrCuJMGts59l3
 qkOw==
X-Gm-Message-State: AO0yUKXbyISOK71y0sIsEna14aHgRa0NptYZP/tlCTkYIrpJgV83AKax
 UG5bp1dYbJIP+DHkA0f4A8U4sIhGmcY4bK+YL2Q=
X-Google-Smtp-Source: AK7set+AzEnTxk9dFDIxo5S2f3ppBdDBRm4ofKLeVvBZ6+oMiVeoEUdJ68tmHbbAXGcrfl7zjf4cnw==
X-Received: by 2002:a17:90b:3b4b:b0:233:d5a8:16 with SMTP id
 ot11-20020a17090b3b4b00b00233d5a80016mr12073229pjb.0.1677108445906; 
 Wed, 22 Feb 2023 15:27:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] tcg: Add liveness_pass_0
Date: Wed, 22 Feb 2023 13:26:53 -1000
Message-Id: <20230222232715.15034-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 tcg/tcg.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bf2af8b0fe..8d4ce7bd1e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2857,6 +2857,74 @@ static void la_cross_call(TCGContext *s, int nt)
     }
 }
 
+/*
+ * Liveness analysis: Verify the lifetime of TEMP_TB, and reduce
+ * to TEMP_EBB, if possible.
+ */
+static void liveness_pass_0(TCGContext *s)
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
@@ -4870,6 +4938,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     reachable_code_pass(s);
+    liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-- 
2.34.1


