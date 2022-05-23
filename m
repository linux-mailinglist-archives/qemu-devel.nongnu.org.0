Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1890531D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:02:26 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFC5-0000UU-Qi
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyI-0000TC-Ja
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-00054H-70
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id f21so2348782pfa.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jD6P95boxWaFHWGjo6mmW0PDhuVHQHt7cpvcaNfyIzM=;
 b=AGLnsTiuOea8q9OM9vQ8LQN5rvwKktk8ok0EGJyznLa4ht4voMoryoVz3zVTDd7fyE
 +ryzjM9jlZqzWBEzIWRMe1Viba4OTHCMnUnSVUgftIoGsWtg8OsMHAumxEfHu0nfu5Aw
 +zgtToE8a9eF8sfu0qeeZG2Y7Ai9Wtg08BZScM/fm5C8KfilkFdtYkEZbCOmpBsJkS7z
 Ifp1f+u/3UutB3Z7VHMV5pDSPRxMMOrcvJi9H2XYxtzcCMq3i6iZ8+dlarjsVt+31PTg
 W/V2QRdjNKzxifOnoX39Nw0cTKCp8k9WNw7CTk15c4Es+bGt0WArpDDuT9Z818D3ONRs
 iKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jD6P95boxWaFHWGjo6mmW0PDhuVHQHt7cpvcaNfyIzM=;
 b=yhRA1SeoecbrhCYprjx7kJe8+jAt60s+Zeexc6BFEc5ITtOXIjzXqVNF4P1pIwju9B
 WiY1EmBtWYt+yxuqof6T/xPCHOeIl4yNLPrLTSRZ9tFh0H5MNHOpSw8CvRFeo2asZMjt
 4wvBusW5QFoMQ3ucUK5miA5jg4D0voPIPwPMgqU1ssbGGws4F68m9kqA1sS23groJMXT
 21cldbQ8k0DUIHmcCsSSaYYfw8AKvi4aYQvzsU7esyFfMDFIemye0b1VDwOUtO5Z+mhG
 JKxjXGtbbQKJuXbwoE9xNwzWpqyguBtbQovWLPh6TDovCBHQ3Xz9IddEwa4ZJ9bJ71F4
 5R/Q==
X-Gm-Message-State: AOAM532MRR6HKrj3h9QXNKfynQJs4VQ7hmun3h7QV7V2xxhOVwtc7+hN
 jd6or75ypYO1Pdr9XUMDlorHJ8eRBGr9hw==
X-Google-Smtp-Source: ABdhPJyiIvOt+NUZu4ymMxbKY7xNr7Q77kkk7uvN8zTR1ATMp5UsOvcnA7DeGtVSjdJouT5T/VNABA==
X-Received: by 2002:a63:d211:0:b0:3fa:8733:73a with SMTP id
 a17-20020a63d211000000b003fa8733073amr2963634pgg.606.1653338879602; 
 Mon, 23 May 2022 13:47:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/18] target/arm: Create helper_exception_swstep
Date: Mon, 23 May 2022 13:47:39 -0700
Message-Id: <20220523204742.740932-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Move the computation from gen_swstep_exception into a helper.
The assert removed here is present in raise_exception_debug.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h       |  1 +
 target/arm/translate.h    | 12 +++---------
 target/arm/debug_helper.c |  5 +++++
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73d..f3fd53f3f9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
+DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6f0ebdc88e..c03dbfb618 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -340,15 +340,9 @@ static inline void gen_exception(int excp, uint32_t syndrome,
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
-    bool same_el = (s->debug_target_el == s->current_el);
-
-    /*
-     * If singlestep is targeting a lower EL than the current one,
-     * then s->ss_active must be false and we can never get here.
-     */
-    assert(s->debug_target_el >= s->current_el);
-
-    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
+    /* Fill in the same_el field of the syndrome in the helper. */
+    uint32_t syn = syn_swstep(false, isv, ex);
+    gen_helper_exception_swstep(cpu_env, tcg_constant_i32(syn));
 }
 
 /*
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 181ba7b042..8d87b65a8d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -467,6 +467,11 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
     raise_exception_debug(env, EXCP_BKPT, syndrome);
 }
 
+void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
+{
+    raise_exception_debug(env, EXCP_UDEF, syndrome);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-- 
2.34.1


