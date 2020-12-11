Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D982D6F3E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:29:15 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kna3O-00038e-Mv
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqB-0005gE-Rl; Thu, 10 Dec 2020 23:15:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35219 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqA-0000ni-5N; Thu, 10 Dec 2020 23:15:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrc0V7Cz9sWt; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660112;
 bh=PY63Yfb95gZfHPkDRqTgk6oSSfAef8g/nYcMHoJai1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GbhimUGJZcIHHKtJatoe/CLXtmDA3cIaNcQaIK9kHuXMACNWYyg1IpEEHLZqFaFSH
 8gb8qwWxUTkDTeWVs2AS1V8PHhk4lkiiwwDiWMPkqWh5f4Z1VMusQqQ9i7ObrgeJqi
 FCkF3PtjInDJnYDUxuf/r11l2POPjKhSJQihhB20=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 13/30] ppc/translate: Raise exceptions after setting the cc
Date: Fri, 11 Dec 2020 15:14:50 +1100
Message-Id: <20201211041507.425378-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: LemonBoy <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

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


