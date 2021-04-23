Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95433697D5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:42 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzAY-0005Bv-1K
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4b-0008NO-78
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4S-0008BU-7p
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e2so21189111plh.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o32ekfL5QFhqhaXYyN+uFzVuIh/l+z5aZIxS+8hP4yY=;
 b=gOuGbMbmFNaIRjnyhhfjad3JYE57M2fB0AgjuztoDAuvuLllwEaKZhMNWCY1o9AfPs
 pt8oPlQEh05aJJ/x4XC2HqmblZIA740/wOpPm2ohvrsJUc4uqrQGiSHqWvzw8pr1zyRS
 h4gVgvk/LGHfpVy//9xMZi5tn5ZPGB5WtTyybvqxreDpOK1CzlyBrXrHzm31NAmOJG9F
 9Ap7pP5UGjGVl+8Yg6LF6JwGFKYkP2W9OLuzkUlmPJ5btVq6B6FFkqmoF84N44+rFB52
 ERct4m3uOYzMujLUcoNkj788SQlixBAmX3jvB3EP/K5xMm6rK3y9U+1brke51QyVH9r1
 i2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o32ekfL5QFhqhaXYyN+uFzVuIh/l+z5aZIxS+8hP4yY=;
 b=JT+KgVP5O/Tw7/RDYYj3F/86kMDTJm9iTZD8GZLS2xHcXkipkchk4KKeIAecWiTEb9
 /oGWtwFE8KwhCSF0LDAgwW3SW90DA32La5aNd7n3e/kvquEdCPXlPCb1XSlo4NZ35BOO
 6jJgfzPe7dpKyu/Bai6pvef6zqnTKrlbsQOo8Of8VGrbbDxgCxF945p+4Pdozm74xjgB
 mC1bjowpJf7igrG4DayD5JLEGClP0waH12D4q/6HNc/jxuQQfaIMzAqvgdV1+EKn2KvN
 vzqiKPfvZ2uBDqRmXB/Zea4UyDhRaflMRWR6wV1zpeXjprygFNMfnLzpM5noVjrBqM/J
 E1Cg==
X-Gm-Message-State: AOAM531dsR53uQWevVxac6/edFIzHgBDw1el2vvBMjas+rbE90NiR/FC
 3eaE8z/5Xf3PeD+3q8Y4OJKRFV+lXi2IDQ==
X-Google-Smtp-Source: ABdhPJx2uz5d03OWF50PdOBsY9ninEDTPpQpkErAHdO3nWs10kKtKuT2QA+Eft46m0N0tSY1SXGKZA==
X-Received: by 2002:a17:902:361:b029:e9:8392:7abd with SMTP id
 88-20020a1709020361b02900e983927abdmr4670089pld.8.1619196857454; 
 Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] linux-user/arm: Simplify accumulating and raising fpa11
 exceptions
Date: Fri, 23 Apr 2021 09:54:13 -0700
Message-Id: <20210423165413.338259-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Use bit masking instead of an if tree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 50 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 5f61d25717..69632d15be 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -228,6 +228,7 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 {
     TaskState *ts = env_cpu(env)->opaque;
     int rc = EmulateAll(opcode, &ts->fpa, env);
+    int raise, enabled;
 
     if (rc == 0) {
         /* Illegal instruction */
@@ -240,28 +241,31 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     }
 
     /* FP exception */
-    int arm_fpe = 0;
+    rc = -rc;
+    raise = 0;
 
     /* Translate softfloat flags to FPSR flags */
-    if (-rc & float_flag_invalid) {
-        arm_fpe |= BIT_IOC;
+    if (rc & float_flag_invalid) {
+        raise |= BIT_IOC;
     }
-    if (-rc & float_flag_divbyzero) {
-        arm_fpe |= BIT_DZC;
+    if (rc & float_flag_divbyzero) {
+        raise |= BIT_DZC;
     }
-    if (-rc & float_flag_overflow) {
-        arm_fpe |= BIT_OFC;
+    if (rc & float_flag_overflow) {
+        raise |= BIT_OFC;
     }
-    if (-rc & float_flag_underflow) {
-        arm_fpe |= BIT_UFC;
+    if (rc & float_flag_underflow) {
+        raise |= BIT_UFC;
     }
-    if (-rc & float_flag_inexact) {
-        arm_fpe |= BIT_IXC;
+    if (rc & float_flag_inexact) {
+        raise |= BIT_IXC;
     }
 
-    /* Exception enabled? */
-    FPSR fpsr = ts->fpa.fpsr;
-    if (fpsr & (arm_fpe << 16)) {
+    /* Accumulate unenabled exceptions */
+    enabled = ts->fpa.fpsr >> 16;
+    ts->fpa.fpsr |= raise & ~enabled;
+
+    if (raise & enabled) {
         target_siginfo_t info = { };
 
         /*
@@ -275,24 +279,6 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     } else {
         env->regs[15] += 4;
     }
-
-    /* Accumulate unenabled exceptions */
-    if ((!(fpsr & BIT_IXE)) && (arm_fpe & BIT_IXC)) {
-        fpsr |= BIT_IXC;
-    }
-    if ((!(fpsr & BIT_UFE)) && (arm_fpe & BIT_UFC)) {
-        fpsr |= BIT_UFC;
-    }
-    if ((!(fpsr & BIT_OFE)) && (arm_fpe & BIT_OFC)) {
-        fpsr |= BIT_OFC;
-    }
-    if ((!(fpsr & BIT_DZE)) && (arm_fpe & BIT_DZC)) {
-        fpsr |= BIT_DZC;
-    }
-    if ((!(fpsr & BIT_IOE)) && (arm_fpe & BIT_IOC)) {
-        fpsr |= BIT_IOC;
-    }
-    ts->fpa.fpsr = fpsr;
     return true;
 }
 
-- 
2.25.1


