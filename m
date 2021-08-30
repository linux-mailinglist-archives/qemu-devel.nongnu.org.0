Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B43FB134
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:31:11 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKap4-0006Wx-LQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj5-0003Yv-Jt
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj3-0007PM-Uw
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:24:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id u1so4138422plq.5
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bl5RK4GarrGI3jKzjeoPfPKsN8c22YUTkuysQ6ecu08=;
 b=b5QlFuyXbPdAjXOI2E9XFE87xlVMLGI0DfYW0OnXPg6e3xigkTTNVPdUSaLVrxIo2V
 0VQRzCE4sRaBvVszGoQppmcGKI2Vu2QFOMs0kpqJG66SR8MfwcUxss2iT9vnTwuFoQ5o
 7IKe+hNkRH1/9U2EY73xfo0JRMPNGRFbbZ4O8Ao5gxoixCd9xgA8yoUX2+URpY2l4cb7
 uiKf+JP3htKuTTB+ynXWqCJ4BL2/OcWJ7icFunCfgyz+L+yfj+PFavx9a7/2JYh8JVCf
 sGXvnL3DAQ0pp5b4hCmJBJCtfez3vUdAb1mY22DhLbYtSsqPXdS0rlF2altNerV3wwvg
 r0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bl5RK4GarrGI3jKzjeoPfPKsN8c22YUTkuysQ6ecu08=;
 b=EfqrZjd5Uekp43oTE9XcAFoiyiTkw7drgVRrmkuPlgAonzVuH7Qq1/odCC/5fJb96B
 E/J6TcmIefN+v7FoprP3J1g59Mouzz5xlXC8K3RaO22CdlpC6cKGCkwZCAc3rzobQH7p
 U9Pp1Z1vPwCMqGdfWL1iImgylzdFFlEzNCUrWfYS4iCIGqBwZ4ZCWNhjJZONvM/y+43Z
 LxyQuGvCx4lhmJak+ISsRcI6O0SrGMp5ixlT7xatYyRkwiDXHXrLAAANarqtTw56oH31
 MebvCmsMirQ/MiKpzsf0cI9hs09BzPtFjQO1QmIFHCFvTuRnf18/vxki/QTIziYVV0lE
 9isA==
X-Gm-Message-State: AOAM533tJc/uIQiD9NX4grIWifS0I45F9HzZ/Larn9bnFCpFqNC59FfX
 kl+5ncR13RCXvNvRGctPeAwT2Ar8IrCqaA==
X-Google-Smtp-Source: ABdhPJyLQVNrKcjbSOTrg+p6/rO5FSHybyI/dTS0KE6bzG9EBk7qRhAtmviaoCoOXA2W0ePUf7WrMQ==
X-Received: by 2002:a17:90b:a48:: with SMTP id
 gw8mr38011542pjb.145.1630304696629; 
 Sun, 29 Aug 2021 23:24:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/48] tcg/optimize: Move prev_mb into OptContext
Date: Sun, 29 Aug 2021 23:24:08 -0700
Message-Id: <20210830062451.639572-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This will expose the variable to subroutines that
will be broken out of tcg_optimize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c73ec384f3..87f33521ad 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -46,6 +46,7 @@ typedef struct TempOptInfo {
 
 typedef struct OptContext {
     TCGContext *tcg;
+    TCGOp *prev_mb;
     TCGTempSet temps_used;
 } OptContext;
 
@@ -609,7 +610,7 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
 void tcg_optimize(TCGContext *s)
 {
     int nb_temps, nb_globals, i;
-    TCGOp *op, *op_next, *prev_mb = NULL;
+    TCGOp *op, *op_next;
     OptContext ctx = { .tcg = s };
 
     /* Array VALS has an element for each temp.
@@ -1566,7 +1567,7 @@ void tcg_optimize(TCGContext *s)
         }
 
         /* Eliminate duplicate and redundant fence instructions.  */
-        if (prev_mb) {
+        if (ctx.prev_mb) {
             switch (opc) {
             case INDEX_op_mb:
                 /* Merge two barriers of the same type into one,
@@ -1580,7 +1581,7 @@ void tcg_optimize(TCGContext *s)
                  * barrier.  This is stricter than specified but for
                  * the purposes of TCG is better than not optimizing.
                  */
-                prev_mb->args[0] |= op->args[0];
+                ctx.prev_mb->args[0] |= op->args[0];
                 tcg_op_remove(s, op);
                 break;
 
@@ -1597,11 +1598,11 @@ void tcg_optimize(TCGContext *s)
             case INDEX_op_qemu_st_i64:
             case INDEX_op_call:
                 /* Opcodes that touch guest memory stop the optimization.  */
-                prev_mb = NULL;
+                ctx.prev_mb = NULL;
                 break;
             }
         } else if (opc == INDEX_op_mb) {
-            prev_mb = op;
+            ctx.prev_mb = op;
         }
     }
 }
-- 
2.25.1


