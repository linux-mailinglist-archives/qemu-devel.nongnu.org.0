Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B853B14D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:39:14 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZnt-0007IA-V7
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj1-0002Md-Q8
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiw-0005EC-V1
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:09 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso4312244pjb.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=ovgoZ/5Lrp0mnppAWS/xEp2q/zvJtCwmTkPtX4YwiLu6Ppv4zkVd4tV+ZMzGElwXEN
 1mX8b/mrmHT/wujWhq+pyfBgAlOXC48N55fuDvj9zSFrh5bYH5VHraEQ8Vh1Ocl6GW2o
 QJsinlGnmUKGnd6q31sNM9WoroV4/S6gG+2kSNsEHleaWS5IXs2NQ3NOYl4pg17JzUJo
 As/7KZk1hH0kHmZhxHW1KHq/ZXcD3Hm1hl1DssOcwopg9aeuLexGn6Nhoh5dSTyIV8cs
 tsTVgWlsU9n/fKgmOSEDWxv7W1t2ynDAdMj/+IBDRURbr3aLZwGItja3bOdZroZ98kMc
 uH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=wUzclgO7nNXyEcmcw/OG1da8t/l08fdlUQii5BDsW1T08/2ExGpAkvuKx1wKi1+hvM
 NFWg0P0mLDRFWunD1iDXjXG4hWx+dwA7i2Yp0jq9Gj9x9jkv42baH3jjAafIH6fT7afS
 HpcZQlsRc5VDvErXMFez/ZGtp949uQTwV6uZam0fGzY+Rv1IjDgNAkzkT9mhISfi66H+
 l3W5JjIn6hHm0Vq5H2DqQ/JUYL5Zh1NCcgbtKFS8+620DxiPfjdEyV6JpS+2W1SX/wNH
 D/1T+JgZPyJ9L4yaeuwx3ahz05ME/Sl96PirhHrhT8lGbL05NTw+N+VsgtrQcr0XoQYg
 qbWw==
X-Gm-Message-State: AOAM532E6aEVaCZKA1Co3rSUXv4y0DQ7SmCbLJmhE2mxvd8KsVR2jZaZ
 PI5Uat+7zNgP5ITZiVYlKXAYiSPeYt6/NA==
X-Google-Smtp-Source: ABdhPJzs8Sv+mjbgQ3EZCuRGoC+bdXCiNoudf6clMQU8aZOUXi4nmerz/SRu+Mc/yc5MviQTevkUBQ==
X-Received: by 2002:a17:902:ce8a:b0:161:af5e:a7b9 with SMTP id
 f10-20020a170902ce8a00b00161af5ea7b9mr2219577plg.167.1654133645361; 
 Wed, 01 Jun 2022 18:34:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 02/17] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Wed,  1 Jun 2022 18:33:46 -0700
Message-Id: <20220602013401.303699-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


