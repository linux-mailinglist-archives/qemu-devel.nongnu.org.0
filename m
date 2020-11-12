Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D252F2B125D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:03:25 +0100 (CET)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLci-0003W7-UH
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbB-0002Au-JQ; Thu, 12 Nov 2020 18:01:50 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLb5-0004x3-LR; Thu, 12 Nov 2020 18:01:49 -0500
Received: by mail-wr1-x441.google.com with SMTP id s8so7699093wrw.10;
 Thu, 12 Nov 2020 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEth3cIPetq13hYqLrB1ttiBiG7w3CF1MDMT0dl6/ug=;
 b=fnjypW7OB+EamSoWR7oda+uDMgEdQ/f7vd96Xt490TsU3nCQ/jCVPz2OxwU/mMuay+
 0y5ZKSXQg0gbxNJ2LNp7VhMW7lqC/wV7kirUNTCXibBpYiqDSMEAizqs5QrcPV1pAIWw
 TojKm6IVDNjGNQ3TJTihBA8+uA4d6SZC1prjdbe8CIeCtJDuAkoJb2upBqeNtK0o3WbR
 DsypXyQ1y4p/gZC5BmU6Iuws1rwY5E1+W6yON4P536anMy43vw52rD//O8wNIG76lAdB
 36c9ZK84DBf64P4FN3H3//XO7l3e7R3u5rP3qOGBFOyxBSx+1ViCjys5bUsHaqUeWUiy
 pbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEth3cIPetq13hYqLrB1ttiBiG7w3CF1MDMT0dl6/ug=;
 b=eYKQVOfZOALwHO3emh8XS1NLqS90LRAdObESm2983sMU2GJ38cgEvJOqjlAeX9Oj6k
 gR30IGQqUa1frwzYKOrGjAbviVDBn2uQabwuTBxmGCJd/7U3wTmuha9mjQEwiC70aXe8
 WugO4GdkDgs/BFx4MVrUr7odWP2IaGVWg7rHXvKAObtVbqnCm1d0tBpRPdFr3YUaNGV0
 AXXkmBPc+Rs3iWbQQiuvsl2aAKezNZd6JW9lz0qsQvqmpfFIAq0mUqyH/9dYhQSMoKhm
 NQ82KL8H0KkFsjK5Z/imWv0lbjKaSM6nvr9a0zrEWekpVcxjHX/1hZkzFAqaV+v55wEX
 +eXg==
X-Gm-Message-State: AOAM531lJETVGZsWa44FJ0/Y6aJWjX24IPsibHKdKLEy9fNqHgYO3Vxm
 xEwMzIUX9xWI53YOlYKEbf1SPmowq9AP4w==
X-Google-Smtp-Source: ABdhPJxpiGYz3ExzQKDYm52+HpvrLaZC78RHKfofiETQwB29NOoeY+47aVr+vZGTWg31RJfMrSfYMw==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr2069261wrr.303.1605222101683; 
 Thu, 12 Nov 2020 15:01:41 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id v16sm8326184wml.33.2020.11.12.15.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:41 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] ppc/translate: Raise exceptions after setting the cc
Date: Fri, 13 Nov 2020 00:01:30 +0100
Message-Id: <20201112230130.65262-5-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112230130.65262-1-thatlemon@gmail.com>
References: <20201112230130.65262-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerISA reference states that the comparison operators update the
FPCC, CR and FPSCR and, if VE=1, jump to the exception handler.

Moving the exception-triggering code after the CC update sequence solves
the problem.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 08fcaed723..033964f3d7 100644
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
2.27.0


