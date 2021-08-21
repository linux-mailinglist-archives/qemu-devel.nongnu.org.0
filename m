Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617F3F3C63
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:07:32 +0200 (CEST)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXH9-0004vF-JC
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA2-0002HD-2G
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-0004X7-6l
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: by mail-pf1-x434.google.com with SMTP id y190so11739311pfg.7
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=CWy0u4ItQ1fMEI83X7OMtn0drKtEV8/2zb7hqU3BgWpKtZovNZU80UGL0Sne0i54uf
 BxT1K8kfL4Zlo9fcSACd1py78BetXDy/ZKjh5G+JK9hSQ3sR3/g8Pe2+WQtGANFOSWxf
 XsXlchc15t9nMOjw2HlFFpPPs7ZWUUVsYhJfoAQiIjFjVqVsO/vParXY6gbg/opafsch
 a5rQOnWUmIMUXE5kE2OC8N1pyWNsTnKUjiGbUC+pU1UcUGQfjqWD30D0h2whwtq8KALc
 ffMiaoXPvAhPbosmv292M1cfjxFBMuL4BNMLxRjnzfTeHFcucXS9+Z9mA6fobJ4iED2R
 R09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=i3uIK1XomERr1hCInq68PAhbZxQ4v+TBt0m+JaK3yWdvocRb5tsszY/mmT9psnkCNZ
 zXHF6Shn+kNY4a1Kr9cW5enAlLCZtXc8Aez6hGN0XOtkjaHNIqZXpDJ77jgU/vld7/mX
 oDpnd25Z7+49d/G7sYQy+Jou/zR8lf5JjRwEuxlfWp56BW4dVDd0te2Hc76OzSXLWQjw
 03YiY/qDeFa9oVhBRBJ+rRAsx4ZBa3bwT4K73of0Yjvt7IbBnMxho9gq7gyawzsWSRik
 Facxy9Z9vSPnP0GCODYnVOWLafVOtif80sBG0B9etrpkxb9mw1n4FjGpi48XHVdPFJWE
 Zx7A==
X-Gm-Message-State: AOAM532aCa5EHsGQcJfyKCi/zP6kXJNY/12hs34tUepSQYSnSxcIuR4z
 yzof78mw9ogU/G/JEZiGmILh/uECi94hnA==
X-Google-Smtp-Source: ABdhPJwNoiDM22FC2O7canmDHqjtKRGxzjGEgjEyaNfVPu58SclOv9vLjFS3nVZxhFf8MlgVebN10Q==
X-Received: by 2002:a65:670f:: with SMTP id u15mr24513059pgf.205.1629576004541; 
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] target/arm: Suppress bp for exceptions with more
 priority
Date: Sat, 21 Aug 2021 12:59:57 -0700
Message-Id: <20210821195958.41312-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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


