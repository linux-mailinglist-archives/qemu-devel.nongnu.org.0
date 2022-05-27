Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD9536652
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:05:38 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudP7-0000bj-Pe
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8S-0001jl-RO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:24 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8F-0005Nn-NL
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:24 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 202so4823457pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=szRP+MhWzymXnTC155Br3Y/VKDlUnUGfKKg5AvTeWtg8qXq9++gPhAM4mEA3IhVZMZ
 wDnVj39vXVRltmJ2mbsWTm4QhDAo2VejmmmlnoHLZ7P96N5MgV8Cskc7g5t0eSQq5RrK
 2zw8DKs43l1ua2NS2Kz9KlGfsgH/H1wXuR0GUrtTRuUjORs3CJadCY7JR/7mHo6SEDdZ
 EwY9B3pBeBZ5wNds0HMcBFYPMJ82VdbWkWIBiOdcecSo5TkXWdqynUfbLSm36vCl+Ta2
 TRS+HpPCw1XfCW2C3IeGYfysegaAzGScRfrkMUzi55PdzwXN4Sf7Ada0ZE7Rzp4ac/2b
 P4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=XkaQ8ON4y9LLNy33hiLtSe9zqdW4vY9/I5p3Od5zz0hGNS0JmVI6eP5i6oov4wKocW
 NIZCGyY8Ala4VqOYtu8cvQp3L0eLm/G1UVW0UPOeQBTmxytZlCWG83gI6rggsWsQCUCU
 xWoBWp8r+kl5+ELQyUeFi88TW20lYNJN4Z2v5QLzQUO33mCH15b/UVd2drechq01Raa/
 +D3IvoY8sxL5BJxPyq1Dq9axcE/WrKYHyWOJs5huDl5Zc+tCojfi14V8aQeoO++9khIQ
 JpD93wqc0WIqLLisDzDDjM2+n5VUgR+m7Y9g6QsgGCPl0IIhSfdpwf+jmPfDW9XLfexC
 Ox9Q==
X-Gm-Message-State: AOAM532ilrHnEsfFBwtghGkmafMj0/3zL0oaLAnoEGv+sQ8apKCONFQz
 3mNydDJHk24djaCvoyNrE36Xq4Wx2FBXpg==
X-Google-Smtp-Source: ABdhPJyyIYi2VSQyDg2HAw7GiP/YHU9ErVEWEoW5BUbUH9R4fGEaupTlY1y4t/Pl6nspUnqbZjsyPQ==
X-Received: by 2002:a63:a1e:0:b0:3db:6616:9f45 with SMTP id
 30-20020a630a1e000000b003db66169f45mr37918068pgk.69.1653670090395; 
 Fri, 27 May 2022 09:48:10 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 02/17] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Fri, 27 May 2022 09:47:52 -0700
Message-Id: <20220527164807.135038-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace an if ladder with a switch for clarity.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 49 +++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d30f988ae0..2b94a6ec84 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -333,7 +333,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp &= ~1;
     }
 
-    if (cs->exception_index == EXCP_ACCESS) {
+    switch (cs->exception_index) {
+    case EXCP_ACCESS:
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
         }
@@ -391,29 +392,39 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
                      "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
                      env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
         }
-    } else if (cs->exception_index == EXCP_ADDRESS) {
+        break;
+
+    case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
-    } else if (cs->exception_index == EXCP_ILLEGAL ||
-               cs->exception_index == EXCP_DIV0 ||
-               cs->exception_index == EXCP_CHK ||
-               cs->exception_index == EXCP_TRAPCC ||
-               cs->exception_index == EXCP_TRACE) {
+        break;
+
+    case EXCP_ILLEGAL:
+    case EXCP_DIV0:
+    case EXCP_CHK:
+    case EXCP_TRAPCC:
+    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
-    } else if (is_hw && oldsr & SR_M &&
-               cs->exception_index >= EXCP_SPURIOUS &&
-               cs->exception_index <= EXCP_INT_LEVEL_7) {
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-        oldsr = sr;
-        env->aregs[7] = sp;
-        cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7];
-        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
-            sp &= ~1;
+        break;
+
+    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
+        if (is_hw && oldsr & SR_M) {
+            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            oldsr = sr;
+            env->aregs[7] = sp;
+            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            sp = env->aregs[7];
+            if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+                sp &= ~1;
+            }
+            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            break;
         }
-        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
-    } else {
+        /* fall through */
+
+    default:
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        break;
     }
 
     env->aregs[7] = sp;
-- 
2.34.1


