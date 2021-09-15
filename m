Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436040CEE5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:33:24 +0200 (CEST)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcWx-0006JH-JZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV0-0003Rs-3u
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:22 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcUy-0003Ey-FN
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t4so2517797plo.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lhsY62Axz8P4uEG2iGxE1nxCZRsB4mKyTgfXOvjyYjw=;
 b=RnVhU2bOgKcxanTAI/ECu9oJqtuU43f3EmGR217Qs4/QS9gI4jMjLCoVyEvmwuFBJD
 w9ZCey+QNsk5FYk354k0aITMGOSQqrypGD9fxHXvhSK8BiL9SGOWLePcYJpRENWoEEOc
 yNco/gvg4IrnbnstAnm8olPWP2TJCeN5yOprdYYFKityuzIV1Q05+40bJ074i5Qn8X0t
 Gfy8kJdWnnWSoyy1/77qIb9OL/ibngoxTTSmUCoUsI3ccCr0ylzeOaZm0YyaplZNs6yu
 sGm0Xo9gvltVvBu6hvUzWEp9q+hwyfIv4q1z6KOaDY8TmAnSmDWsO8dEZNAE4TRd+tG3
 jLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhsY62Axz8P4uEG2iGxE1nxCZRsB4mKyTgfXOvjyYjw=;
 b=Su7Yg8nEQ1mmFUliIS2lQtDRfDxr/c3kws6i+xC1zhljSq08Ao4Cai1dwzLOypYor2
 SMUQV29aPk0y+iv44Kt9zhzVyhIpv1HpcTEww/04ci8KF/Vx39+C5fyjXsN0IAUD0qse
 5IgKNIWEfVmXRuNNkC2JbTAGP40wnNjyE7b5LPUb/b1twUiso/13G+y55lWMd1WvnToX
 u8gkQ7zIeUC4Ft0ZJzdM4ApNNI/sH81v7mSJlwI49nuJLOLGSuZaVrQVFGkclVzn3VbZ
 XMjXm3Lx3hdQ5AzgXjNBufD/o+pWSo4XUqr6ozgc64PIMeUNXXhyYQ40zRRKVkZwSqMy
 c6hQ==
X-Gm-Message-State: AOAM530cDXSroGLpyOyCnlI3AQasQG9SApAyr8YOENMh6dPsEO03K6Fg
 tbNJFt498dLppUPwTc58ZQFtkBvc0UWWpw==
X-Google-Smtp-Source: ABdhPJxlhnDHEIz23lNt2y6dhYKSQGWsYDv1yI9MrBjzxYy9rFY08/1RFOaE3voMV514KYGEm2+ksw==
X-Received: by 2002:a17:90b:4d90:: with SMTP id
 oj16mr1378237pjb.170.1631741479026; 
 Wed, 15 Sep 2021 14:31:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/16] tcg: Expand usadd/ussub with umin/umax
Date: Wed, 15 Sep 2021 14:30:59 -0700
Message-Id: <20210915213114.1923776-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For usadd, we only have to consider overflow.  Since ~B + B == -1,
the maximum value for A that saturates is ~B.

For ussub, we only have to consider underflow.  The minimum value
that saturates to 0 from A - B is B.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-vec.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 15e026ae49..7705a49c0b 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -119,6 +119,18 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
                 continue;
             }
             break;
+        case INDEX_op_usadd_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
+        case INDEX_op_ussub_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
         case INDEX_op_cmpsel_vec:
         case INDEX_op_smin_vec:
         case INDEX_op_smax_vec:
@@ -603,7 +615,18 @@ void tcg_gen_ssadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_usadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_usadd_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_usadd_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* usadd(a, b) = min(a, ~b) + b */
+        tcg_gen_not_vec(vece, t, b);
+        tcg_gen_umin_vec(vece, t, t, a);
+        tcg_gen_add_vec(vece, r, r, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
@@ -613,7 +636,17 @@ void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_ussub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_ussub_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_ussub_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* ussub(a, b) = max(a, b) - b */
+        tcg_gen_umax_vec(vece, t, a, b);
+        tcg_gen_sub_vec(vece, r, t, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 static void do_minmax(unsigned vece, TCGv_vec r, TCGv_vec a,
-- 
2.25.1


