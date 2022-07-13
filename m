Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E4572CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:06:41 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBUa8-0007nr-7I
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSq-0001B5-5v
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:59:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSk-0006rw-2d
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:59:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso1791419pjc.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0h1mijfb/JBmMIsG1ho4eH5ZlC4TyS0gLWzNfX6jB0=;
 b=Um2W1PLjch0aH+/d4eDtNA/Xw2OpL6Z6fnYnDEPLyYkGENxcYExIubl6SknSvYwo+Q
 jZpDWmDw2iZe5/gIbCO2J3eQBXG5hPWqeWC8UZjWIAJ/U5rX7i6xPxrJJA+uWogdwzkH
 S2fo8Zu1trTE5UVzSGM46Ax8EWi5BsyLtJ9Vkwk/pYslkP6VuMEo8kxniNvYreOIBrsg
 JINfuxoMahU+jTeKMFUOnSOMfk4A9EmwAoADRS4rm0cCfzpGTr1QRyoGnSDbT0v9hqYq
 nReQ6TEaE9CnogdI9/fuir68MtEylw7/tMdhvZ5vaygrtkpQv/1tgyjlvV9l7B73R66w
 F4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0h1mijfb/JBmMIsG1ho4eH5ZlC4TyS0gLWzNfX6jB0=;
 b=n4fCpDXitdryae4ncawfyKvEpIvX7hl+pn3sCg0YNPoYOhxq8sxyJ81Fm85UmUyNbB
 99a1uV+N7EKisOgm/RQ7BnMdD5ZJjsos3VTIYiKReeI8KFOxcDHmCTpZQYx2hVk3Yuo2
 xZV4BRcK6Z9akwyTtH425TaQa7s3LkuSWbnXCuEUnC1/VKYM7DuA0Jc1Lt5siuqt5Mc7
 BGgluzl+TlRRvQPGV6Gb5PVdgAGesF6rpjItKZE10JtLncYsjx8FFWydMkj51CGGJ+Mk
 SOqZgvLiy3gop7UmZ5E01wmuW8wIM4wlJ0gn+SlkwsBR78C31XzofXyi7/nZuUEcWev7
 57jg==
X-Gm-Message-State: AJIora8XYduMDxbXYAdKGE55MceMrhgj/0UDu0xsrixZ8F/stttXyehm
 LUEugFbIh0qbvAMtZci21i2L++NaPdlO5vt+
X-Google-Smtp-Source: AGRyM1t6ZrNmAn/sNVKwxDbG7Eu4hquj24h1tlChErKXa5ufJjvwl6MhkRIKZ7xCe5oEWC3h8ctLCA==
X-Received: by 2002:a17:903:26c1:b0:16b:df40:e566 with SMTP id
 jg1-20020a17090326c100b0016bdf40e566mr1435578plb.121.1657688340781; 
 Tue, 12 Jul 2022 21:59:00 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:59:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix aarch64_sve_change_el for SME
Date: Wed, 13 Jul 2022 10:28:48 +0530
Message-Id: <20220713045848.217364-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
References: <20220713045848.217364-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

We were only checking for SVE disabled and not taking into
account PSTATE.SM to check SME disabled, which resulted in
vectors being incorrectly truncated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6fff7fc64f..24c45a9bf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11228,6 +11228,21 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
     }
 }
 
+static uint32_t sve_vqm1_for_el_sm_ena(CPUARMState *env, int el, bool sm)
+{
+    int exc_el;
+
+    if (sm) {
+        exc_el = sme_exception_el(env, el);
+    } else {
+        exc_el = sve_exception_el(env, el);
+    }
+    if (exc_el) {
+        return 0; /* disabled */
+    }
+    return sve_vqm1_for_el_sm(env, el, sm);
+}
+
 /*
  * Notice a change in SVE vector size when changing EL.
  */
@@ -11236,7 +11251,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 {
     ARMCPU *cpu = env_archcpu(env);
     int old_len, new_len;
-    bool old_a64, new_a64;
+    bool old_a64, new_a64, sm;
 
     /* Nothing to do if no SVE.  */
     if (!cpu_isar_feature(aa64_sve, cpu)) {
@@ -11256,7 +11271,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * invoke ResetSVEState when taking an exception from, or
      * returning to, AArch32 state when PSTATE.SM is enabled.
      */
-    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+    sm = FIELD_EX64(env->svcr, SVCR, SM);
+    if (old_a64 != new_a64 && sm) {
         arm_reset_sve_state(env);
         return;
     }
@@ -11273,10 +11289,13 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_vqm1_for_el(env, old_el) : 0);
-    new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_vqm1_for_el(env, new_el) : 0);
+    old_len = new_len = 0;
+    if (old_a64) {
+        old_len = sve_vqm1_for_el_sm_ena(env, old_el, sm);
+    }
+    if (new_a64) {
+        new_len = sve_vqm1_for_el_sm_ena(env, new_el, sm);
+    }
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1


