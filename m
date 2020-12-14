Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684D2D9273
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:09:44 +0100 (CET)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog7D-0002uR-3d
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwU-0005GS-HL; Sun, 13 Dec 2020 23:58:38 -0500
Received: from ozlabs.org ([203.11.71.1]:37987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwS-0004rd-Sq; Sun, 13 Dec 2020 23:58:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfr5CYxz9sVw; Mon, 14 Dec 2020 15:58:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921892;
 bh=/xktcrTWGYjvCl+ilHWh8ZNOKs3LzRkFmgo9zOBipEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hr5mmydotXoGkLEhEmri6WMLK0jAxutsabCZ/O1bOH+QqwAULUfv7JNAuI6y/wRiU
 cCYpFv9cQcqn5IJizoLZndu/9hQqEQu3rmStazPPaYqYFVQCX6BhxDeHZ0i3mCkzHh
 YxoyaLwZjLIze+yGHt1uTestoRO9UrlOVKg7DfoA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 13/30] ppc/translate: Raise exceptions after setting the cc
Date: Mon, 14 Dec 2020 15:57:50 +1100
Message-Id: <20201214045807.41003-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

The PowerISA reference states that the comparison operators update the
FPCC, CR and FPSCR and, if VE=1, jump to the exception handler.

Moving the exception-triggering code after the CC update sequence solves
the problem.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201112230130.65262-5-thatlemon@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f5a4be595a..44315fca0b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2501,13 +2501,6 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
             }
         }
 
-        if (vxsnan_flag) {
-            float_invalid_op_vxsnan(env, GETPC());
-        }
-        if (vxvc_flag) {
-            float_invalid_op_vxvc(env, 0, GETPC());
-        }
-
         break;
     default:
         g_assert_not_reached();
@@ -2517,6 +2510,13 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[crf_idx] = cc;
 
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
     do_float_check_status(env, GETPC());
 }
 
@@ -2566,13 +2566,6 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
             }
         }
 
-        if (vxsnan_flag) {
-            float_invalid_op_vxsnan(env, GETPC());
-        }
-        if (vxvc_flag) {
-            float_invalid_op_vxvc(env, 0, GETPC());
-        }
-
         break;
     default:
         g_assert_not_reached();
@@ -2582,6 +2575,13 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[crf_idx] = cc;
 
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
     do_float_check_status(env, GETPC());
 }
 
-- 
2.29.2


