Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0D443C20
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:11:19 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7cN-0004AR-48
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VM-0005Fk-Al
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:06 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VI-0000w7-NC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:04 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id d6so1502012qvb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=eoMwY3zXHU5BmWu0Wwlxb1SANRZPySGNMZi1IV6nZBvpTxPNEH2w/GVO9g6aRKSRVW
 wsDgWGEBtQodTE1GObNyI8FXRdxaEYSXixYDa1xnvf93R8B0juhB056bchODawDw8ts4
 v5v4Bs5PVaYr59zS0KOR9sa28PfzxQ/6fpo+BD8okn8tKJY4kiR/kDNQaAioRIVxX0N1
 5qzc80HQS5pujyEdZXHcZDYIQrvMqZDRIz6bHBbA3AUCv4B4/a8q93yuodv0I+Zc78Du
 WCBiulhmDBQhCgnZwF2q+9nwcOKwQ4ogrdU3H4Ec7FVZeqGAg6ZLBWAMPJBx+kJUZSuR
 Da2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=JJQ1onWmd1I54P4frPxNRsD4s+V9JlitteYO6VL2bVGC2aJUzFi/EudkVAGES4Mh7b
 K+y7+cVmETZGR+ew0xAOqpBqgzFFRqqiT1/2H7yg1FZRSF5jfWnxAkAhn9fQbnXK5NBO
 aiOowXw1EuKzMeu9bNNJRHr93MMkzo67aHXbja2XaYh14cGEdgu9BZoZOXT03Jf/F9yj
 8YpKTMeoSkHxIgH/6y11tbDtFCe9WNED9KP2VFCBKZ2oIQRljwVXFtW9VtyY2ICMFVg+
 krnU5VYTarUWBSdabD+fCW6mVgy6qLG5n/MWy0RAvsxMkhCrnU4JgbhAmfSPlhKdUGQw
 laLA==
X-Gm-Message-State: AOAM533Y+Ddxq/hzo9mzHwZokU9DJ3HO8cA1417zUXF5BEZ14x0TvBW/
 IkhQDt4S0v3mqhs5vMW4hworo7D9l4PLMQ==
X-Google-Smtp-Source: ABdhPJyIZDu+4Mao3PSCeRvH/+E6+bwxfcNClkCR1fbaKMKbRfPmHoiB8xrw4qD9bxcq2lFfB4LOnw==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr42533562qtx.194.1635912239748; 
 Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/10] target/arm: Suppress bp for exceptions with more
 priority
Date: Wed,  3 Nov 2021 00:03:51 -0400
Message-Id: <20211103040352.373688-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


