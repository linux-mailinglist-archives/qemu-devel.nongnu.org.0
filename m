Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122D53169B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:51:33 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntF1Y-0004AC-BG
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExy-0008De-20
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExu-0004zB-O5
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so365542pjq.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJAaanvQuK73f6LtwZ6AmktcHVIa9UGFP+msm39TbKw=;
 b=KqldvE/25cf1yARueOkRl5RWX6gwhTLo4/xbLytS/mKo40SnWXK/Iq65VuNH6UBrVu
 xVRDWoM0xBGHiwJ94i7YIN3CYzu0XxTVqlCdGTC95FSdtb+tPUc837xrQOKdiScajD4L
 Bo9+pReewtraBa9iVexbkcP6GHUTTuEkpRQ5S9907R68La3ozoZz7L8q2RAQUcr61/6D
 XGTH8zirNSFHzdiOGSpMQ/3K4nj1gpfeyPFIKY9veIu5+a0sgVVg02DFMufMzf3O8pv/
 qOFXaOnkJ4ziqi+yQM9GmcGtfYNwDLAn+AhSVaqIXSYziARIDFJqbnFCcs8kzN9fsQVR
 t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJAaanvQuK73f6LtwZ6AmktcHVIa9UGFP+msm39TbKw=;
 b=HQ5YHSM0d+ojBzX7RKJYTr6i/HuImADTnYR1PoNFqdP+cXaJlnJ2GrfkQHXVe9lwQH
 2F0WSKH3hVNtV47HwIxJ+EW/LhWmbNKpnukwpWAVV8y919iI/i/i3v+Lp+94SiQ2ZEwA
 CcY4F2jIj6ccKZjCxUnUbxuuIAnfRmXPzFVk9WdMrxfbRuHrjv5fgWdyteO1QS6cwgMG
 VM+iUiKY2iR9d9PVFBlXLqm6WJSmdZMm28ReFoRqZWXB7oqhHip45621aU2CT63U7sJ8
 yHanq+TR+TXLmWH0IkTwlVdZDt33nAPblLWoNKRMr/1GQmDURtM+CKX3XF589JokSHdW
 W6TA==
X-Gm-Message-State: AOAM532UhB54xkStzotb3q00psjK+w5yvfPozlOu/AaMmZ4GwU2ofPXd
 a/1wqY3H3zDUfPDC7Z8jViTH57cqSMTqhw==
X-Google-Smtp-Source: ABdhPJx1Wc72olL/VTNPsZ5rry6DUnsW1O2SmzdtyiUqlMIQ4R2RBgqKOR5oiwJNNdCT3SKhhKkKpQ==
X-Received: by 2002:a17:90a:e7c8:b0:1df:fe28:ceb8 with SMTP id
 kb8-20020a17090ae7c800b001dffe28ceb8mr827372pjb.193.1653338865037; 
 Mon, 23 May 2022 13:47:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
Date: Mon, 23 May 2022 13:47:25 -0700
Message-Id: <20220523204742.740932-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The work of finding the correct target EL for an exception is
currently split between raise_exception and target_exception_el.
Begin merging these by allowing the input to raise_exception
to be zero and use exception_target_el for that case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 ++++++-----
 target/arm/op_helper.c | 13 +++++++++----
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..03363b0f32 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -111,18 +111,19 @@ FIELD(DBGWCR, SSCE, 29, 1)
 /**
  * raise_exception: Raise the specified exception.
  * Raise a guest exception with the specified value, syndrome register
- * and target exception level. This should be called from helper functions,
- * and never returns because we will longjump back up to the CPU main loop.
+ * and the current or target exception level. This should be called from
+ * helper functions, and never returns because we will longjump back up
+ * to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint32_t syndrome, uint32_t cur_or_target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint32_t syndrome,
+                                   uint32_t cur_or_target_el, uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..6b9141b79a 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,10 +28,15 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+                     uint32_t cur_or_target_el)
 {
     CPUState *cs = env_cpu(env);
+    int target_el = cur_or_target_el;
+
+    if (cur_or_target_el == 0) {
+        target_el = exception_target_el(env);
+    }
 
     if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
         /*
@@ -54,7 +59,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 }
 
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+                        uint32_t cur_or_target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
@@ -64,7 +69,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
     cpu_restore_state(cs, ra, true);
-    raise_exception(env, excp, syndrome, target_el);
+    raise_exception(env, excp, syndrome, cur_or_target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.34.1


