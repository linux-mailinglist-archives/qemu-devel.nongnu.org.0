Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD5681C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFu-000817-I1; Mon, 30 Jan 2023 15:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFp-0007c5-S7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:54 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFo-0005FO-AZ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:53 -0500
Received: by mail-pg1-x530.google.com with SMTP id 78so8578219pgb.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEaUywT9yyO/FtIlPM94mPtt+7ciBwT5ZJGBWHxwoOY=;
 b=UL7c8tIN6e73mk6BhS2v/KLHUpSr1XPTGmL31BVZ1SSIyTYiWpaeKvxBbzsa3xznMJ
 FFMufjsK3mU2Ol6tNzsOkAJHh8oP4PAoVEmn7+ERU2edrzvzPhjvvbsRlrd+ejT5dY/W
 deVlZLXHif50JDD6J5HqxXIP1kVsZP8PmkgzsxRITKYduRb4x/4+pyNSojCmVc0HeEPH
 4w3me1oT6eaUcOxnRzD2jlnfe+iaDPMMqFTKqcGdXrep36HYigFdhpMh7unOsJzRKh8n
 LIkGBWf+2bDRPBKZ3XyYoO1RDoVveqHY6NrHbdP8SIdmsNSSbRgS+ihVo8BjCE6wMh09
 bK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEaUywT9yyO/FtIlPM94mPtt+7ciBwT5ZJGBWHxwoOY=;
 b=0QQe0NnMWYcW8gftL1jY9S+9oyOd7HHchARM9JnW5Nae2mfq4CTnG2pgi6NBLg6Hq2
 Eio8ljHV70b942l7qP94StJsvpRQ5lCtMvBkFU4lND4Ew48f7oN4I6pXD6uEMGYKqBCX
 mIvep/svGdJowfCT1UeTzfO+Cjgd/tlW6g7axX8PSA+J7iEcxexrnNOvUg61KhM922yv
 9fsHAPLMTUHZBfPSvT31niTIiTFhz3kzbBDK0+ViJjo7nRpqSRofaHUxlLbf36tIMm5p
 fbY/8+O+eGfXXxyl4y8fUgcYDfEOsdvEtvl9XdLopFQatGtYeEtMKuDNB6gxwiKXbeCT
 cwIg==
X-Gm-Message-State: AO0yUKXd3FaPL7XP02oF7s+5B1rvssBcKyTfYlk1MoHBoS+yTdeojv6Q
 C5XBUBGkx3rsOmQjIwY2cGxXNS0cA9kY30c0
X-Google-Smtp-Source: AK7set9XAiiYPX2gXKJKMHH69bc3W08+JGkBggfAImmvAKkoElW9TqOqGN6hc4ztEpy4eT+DAuXd4A==
X-Received: by 2002:a62:14c6:0:b0:593:2289:f01c with SMTP id
 189-20020a6214c6000000b005932289f01cmr11895320pfu.25.1675112390893; 
 Mon, 30 Jan 2023 12:59:50 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 06/27] tcg: Add liveness_pass_0
Date: Mon, 30 Jan 2023 10:59:14 -1000
Message-Id: <20230130205935.1157347-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 3e12053229..fb9ab967ea 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2855,6 +2855,74 @@ static void la_cross_call(TCGContext *s, int nt)
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
@@ -4867,6 +4935,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     reachable_code_pass(s);
+    liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-- 
2.34.1


