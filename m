Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400436A65F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCfD-000372-8W; Tue, 28 Feb 2023 21:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCfB-0002zy-UP
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:53 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCfA-0003L1-38
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:53 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so11616636pjp.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHNQ406h/hUxehvnJIpfjbI2MbuZU/f56i9/YECKVw0=;
 b=zvz3vA47xKehc+VGKZsOyfbMJePjfQ1mdvvEtAiteXlhkNZmE1pfI5ZeaVs/JOSyka
 nshEZRlFVgxbGZO/E5dXwz1fvQ76y5pyJn//yDBZZEAe7ZzUdZ/tnqqPxay8DBIuBhk2
 FMnYIFP5XYj5boj5sUKySIgKWXmY4OhKObWeDeMt8FhXrgTlRwTfVuTA5nAKy5u6477A
 +HBlt0sqaVt3xyvHFlj9dSBqXodL1FPOBhha/wMEmZlNRM4HuCkvYkIlzyv+Dj0bstj5
 ktj0Cil7NGGbfXVLzJIWcK8kXfPXArBCisZ3nQ+gGdRMcRyKdwghtIxP+mcCqrz6sH//
 47hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHNQ406h/hUxehvnJIpfjbI2MbuZU/f56i9/YECKVw0=;
 b=o0LtvbWYKtP3cP9LQpoU8Z1lMxVlgbQcfiEB/TL5ns8SlUSESD6JqiGceOaaj7g0DD
 PGfYFyO9b/oOE4brYmKjArQ/TQVdIHRzfS0Oa3h9sy/xIZJsWjRhVcDwQT+J7546YTjz
 rp5UtzNRghduN8WmcNT2yc5H/mOsoqojWj9+AaFuPW6eLdLwdPd0FJKVx0xZGFQaNtfV
 r7T38112f2mqgjlbOKObKqO8roD/d/3V5HX85HcrPb160b2jNIDGtRg0ZMc0+PmX8121
 DGangcxNn1dgISTsBwm2D5WhAkV8X1SgZ7s72ytleD5HJaFL1cIPbpHstFw2pSwRckat
 2mSg==
X-Gm-Message-State: AO0yUKWSekELRrTyxUWaxk2h0UoInJSY0lV+yD167VS/c7eaY4Ggx+gT
 wTMPp2j5uszbxPNkAMtt13zV4zw5oDoNs1tpQ54=
X-Google-Smtp-Source: AK7set9Hg31bNpK+zZiv+ew3610q6EgaqjDdrjvkwh2b9AZwU4wm4SdYjuSmH2O5aRef6gQjCDYGiw==
X-Received: by 2002:a17:902:cec1:b0:19a:a305:e367 with SMTP id
 d1-20020a170902cec100b0019aa305e367mr5594986plg.30.1677639470558; 
 Tue, 28 Feb 2023 18:57:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 38/62] tcg: Add liveness_pass_0
Date: Tue, 28 Feb 2023 16:56:19 -1000
Message-Id: <20230301025643.1227244-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 71b6843eb1..1dbb24294e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2857,6 +2857,75 @@ static void la_cross_call(TCGContext *s, int nt)
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
@@ -4872,6 +4941,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     reachable_code_pass(s);
+    liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-- 
2.34.1


