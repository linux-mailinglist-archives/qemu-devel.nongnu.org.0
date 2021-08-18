Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7173EF724
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 03:06:47 +0200 (CEST)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGA2Y-0004h1-5u
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 21:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wu-000491-72
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wp-0001OD-Ib
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so1218537pjl.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3++UiM9Nvpex33sDYBqi5LO8w14qjh3qiR4geB26iKQ=;
 b=HvtvifipWcMTSCAtENYbf4UhBK5dI7dfEyiX/nAFe88Q+DvjPLBFxu8vhUMWCCrYRr
 g+vIjImlTxeKvD9E5NHuxHXhuIf+zKyABupvCBLGLnpw75+TkXkTw2RCMgzIqLGkWvb7
 cLu2s0AtS+1gSW+Rm2eJQEEfv0zHt8qHHgxexBJ1jlpUk2kmEkzMpq8E4dgwgFJhgUE0
 aGVJWdMxd7y1isERpqRRfLxQ5I8/djLnRA1TtVZaseQvWqfXQOgTDqd/obGEo69UVzXc
 +26OzUUBKc3ClFhwRTtE3gPa8ZGLy5dHTqhJ2wDJZ93Z5S2N4TtlUF4KHDcV7NKq+3Bp
 Y4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3++UiM9Nvpex33sDYBqi5LO8w14qjh3qiR4geB26iKQ=;
 b=Du+R9OmAAw/J3gxzPZ+juN9S7GlGN2o1podOR/kjvsiVCjkvEDDM0BEkdgNYkB3U60
 DmhD56XRZ1q8fQxw+QBtwnBfgVQgZUkslJ66yFEUwrlngDRVCJtSSkAXZuKaZ3Q8Uc3z
 p7eSfzJfgBtIlJN1EU0lNqW4eGxYpx/aa9G9IvO9tT+vIs9IWoViIqiFKI63D6VN7wNP
 KLJOV2AY9SKZ1LdbOrJSjoE2+chDTMjTSQGCF9Wf5SIZzkiGu19+63s9+SE7kBVLd/Q7
 jX4XmZNGHoMWVmGy71cOuY67EY5F28mrD6zp+BhJ29rNvduBmKyfT5dghN2SSOX5PENw
 /FIA==
X-Gm-Message-State: AOAM533PRxkPXjh7ZrqGqCAkDnUVeC+nNu0/IHyoZySaWV2VmCckWDeg
 X0SGKvTEQZfFQ5HsEzBGfdbYxJP45T61qg==
X-Google-Smtp-Source: ABdhPJxc0SfwYtON37beOPlI7sMeis1QDfxvI8bRP9ydXRPkYPvsDevz3FLuZcOMDQU92L0Jamrl+A==
X-Received: by 2002:a17:90b:507:: with SMTP id r7mr6408192pjz.47.1629248450220; 
 Tue, 17 Aug 2021 18:00:50 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Suppress bp for exceptions with more priority
Date: Tue, 17 Aug 2021 15:00:41 -1000
Message-Id: <20210818010041.337010-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010041.337010-1-richard.henderson@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2983e36dd3..32f3caec23 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -220,6 +220,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    target_ulong pc;
     int n;
 
     /*
@@ -231,6 +232,28 @@ bool arm_debug_check_breakpoint(CPUState *cs)
         return false;
     }
 
+    /*
+     * Single-step exceptions have priority over breakpoint exceptions.
+     * If single-step state is active-pending, suppress the bp.
+     */
+    if (arm_singlestep_active(env) && !(env->pstate & PSTATE_SS)) {
+        return false;
+    }
+
+    /*
+     * PC alignment faults have priority over breakpoint exceptions.
+     */
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
+        return false;
+    }
+
+    /*
+     * Instruction aborts have priority over breakpoint exceptions.
+     * TODO: We would need to look up the page for PC and verify that
+     * it is present and executable.
+     */
+
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
-- 
2.25.1


