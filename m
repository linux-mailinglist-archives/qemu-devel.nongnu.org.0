Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7E3FB14C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:39:45 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKaxH-0004ou-MZ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj6-0003bW-Lq
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj5-0007QU-79
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:00 -0400
Received: by mail-pg1-x530.google.com with SMTP id s11so12390804pgr.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EGSJJ61X3FkAvzFRiCSr9bHCfCMYIoiBfLCMNZS+yck=;
 b=hC9xeXaTlJG4g3rn+/GDLXnI6j0SKXtwIxCGO60FHMmuzP62cLb7ldck+wcgRJ/oOq
 fmDkOxro6DdDAxQtY1dVs02vdBNNHqzb9OV+kEXHKJ8HDRBP0/a3ghzD5AhnBdvOP4S6
 pIzz5mHSuB3W60nudPUnUFhn5ErtELAx8W2BZX3sFt0VxDG1BMER2mtWSV0SIX9SwtPE
 Z2POqOxROnnryjQQ/0aENqCbdntPq7rZeU+8pWWbTX9ncT09L+OvPvMHjDdk+nmCXng5
 hYinjexMLMVhsdwzgXhkLpG7t5nmu9tjG1Sc3GV4J0F0ZKX/9tBjCsMDZivjxtJfH8uS
 wCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGSJJ61X3FkAvzFRiCSr9bHCfCMYIoiBfLCMNZS+yck=;
 b=Ya0jBv7bopvi9qKRfM0VCTcZS8U3wejgJUTOT2LAOGmbRKXnV9KTiJzKWbEEnKdfJA
 U9sadJA+03gdGisKX0Fq/fkQvTMDRXUef5NhIBaMLv6i+syccwQElN/6fzBlYIfwqCEZ
 dWeVRp9v4uAhJPxegjzBdY/uF8eMVJBuH2pxYXXH1eIDsf/jyr53HMDmxilewYSy9xXP
 qZf2Z8gvGF0HQmAbz1uo/jGtwuy2tjuC9Qr8Xl4fwLtID7EpP6W1Def9S4Iw5WCJOnWm
 sKTZAW6El63xenmZKT8CArvaKrAfD/smY84MkCMLaGzTdLCBEbSFpWYmzviRGa0u4Krj
 OWJQ==
X-Gm-Message-State: AOAM531jKUWl9j9Cp4zSTp/qi8v1V+nS5pjhDMDm8B8XbVqkQwJAnI0D
 moNMCPU30dIyFOfzvK2akOVNU4jA4a547g==
X-Google-Smtp-Source: ABdhPJzpHOX9QZjsZ2B7VhVCCUleCKMh13KP07MXylC2hfTa1AYlw6HSpWxrkQg9xlAoKFvMFnvzkw==
X-Received: by 2002:a63:ce0f:: with SMTP id y15mr16282354pgf.249.1630304697876; 
 Sun, 29 Aug 2021 23:24:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/48] tcg/optimize: Split out copy_propagate
Date: Sun, 29 Aug 2021 23:24:10 -0700
Message-Id: <20210830062451.639572-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
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

Continue splitting tcg_optimize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index b1b5096a9d..a668c5f0df 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -611,6 +611,19 @@ static void init_arguments(OptContext *ctx, TCGOp *op, int nb_args)
     }
 }
 
+static void copy_propagate(OptContext *ctx, TCGOp *op,
+                           int nb_oargs, int nb_iargs)
+{
+    TCGContext *s = ctx->tcg;
+
+    for (int i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
+        TCGTemp *ts = arg_temp(op->args[i]);
+        if (ts && ts_is_copy(ts)) {
+            op->args[i] = temp_arg(find_better_copy(s, ts));
+        }
+    }
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -646,14 +659,7 @@ void tcg_optimize(TCGContext *s)
             nb_iargs = def->nb_iargs;
         }
         init_arguments(&ctx, op, nb_oargs + nb_iargs);
-
-        /* Do copy propagation */
-        for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
-            TCGTemp *ts = arg_temp(op->args[i]);
-            if (ts && ts_is_copy(ts)) {
-                op->args[i] = temp_arg(find_better_copy(s, ts));
-            }
-        }
+        copy_propagate(&ctx, op, nb_oargs, nb_iargs);
 
         /* For commutative operations make constant second argument */
         switch (opc) {
-- 
2.25.1


