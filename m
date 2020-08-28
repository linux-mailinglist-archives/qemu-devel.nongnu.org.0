Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E7255CB1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 16:38:38 +0200 (CEST)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBfWX-00034w-LS
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 10:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfF0-0001IK-4n
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:30 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEx-0005FT-Ms
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:29 -0400
Received: by mail-pj1-x1043.google.com with SMTP id s2so565405pjr.4
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQC2NsHcUulzW6D5RhH+hzBIgYR+xbZNPdmPEiO9k08=;
 b=zg0juVRQKbAqwIFtI3G83o+nuPOMDKq6hl5qrzV0gCIOSK5KXRue36QcRz9aLOiwtD
 aZq/hhprqlcky0GGAoOHd40WCZE1AL9SOuXMlidt/aElwSHW3TaoOvARsY+kweBnnHH/
 +AJXRZzbRjlPfdAe8K22PuXZ/U15eThQiN+u8K28xiuspGRAR20iufSG1alQqZL1LAB1
 ATDy6zxtvzrsWueFkiGDKG4K3c68yOMuEJDDKWhjcCZo9pdbeyh8Sl23ToNlBvYj2D3Q
 yfsV8cwoxGsnTVBBVU/gSau62LQg8Zd8JnjTz4q/euIa1aLxt+51N94MhgVuxMaLSq4X
 8QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQC2NsHcUulzW6D5RhH+hzBIgYR+xbZNPdmPEiO9k08=;
 b=YYrqnuwAhRj0rcYZMxGojmHxvcOqYQDfIJsm9PKQd8Xk+1bYSidFm8xQwPGXBZ8+pR
 336IFGYqUt/moVkf4HmNzH1E6nsUmvK+6a+x3XletejV1Wv50jwNo+O+asWxT9pi8Djj
 WCv+kNQSU3XvLc8+4qSxNzWCGonIblU1nycPEDyCmv1EULNBTSlPqLyOggmSKPcorMMg
 DQkdyj2nUHx7H4OGDzzyg0rrwt1/pdNgWF/8FKrqR04LtisHKHx7In7/SwrZYewmORQ0
 3tBFMDIFCo+giMDq/fihOk5KAwIk6//cPoly6FMeAXjdB2NRXqlslNy5a2jYCSbQB4hp
 02BA==
X-Gm-Message-State: AOAM5313r0qfC37t2WErBAHCv2nkiQl0nf9isxBeHUJb2tB7wsQak9Bh
 u/m45Viz2s1wD4bp8r7aRgNhdXJlV7CJUg==
X-Google-Smtp-Source: ABdhPJxMWr4PYB36C1+mioOCRrssHqQjMDtnxVF4NJ3K2eIRX7TFhtrBylFKY0y54E0ojTRD+SrHSg==
X-Received: by 2002:a17:902:690a:: with SMTP id
 j10mr1541600plk.155.1598624426000; 
 Fri, 28 Aug 2020 07:20:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j3sm1403080pjw.23.2020.08.28.07.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/76] target/microblaze: Unwind properly when raising
 divide-by-zero
Date: Fri, 28 Aug 2020 07:18:56 -0700
Message-Id: <20200828141929.77854-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828141929.77854-1-richard.henderson@linaro.org>
References: <20200828141929.77854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restore the correct pc when raising divide-by-zero.  Also, the
MSR[DZO] bit is sticky -- it is not cleared with a successful divide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/helper.h    |  4 ++--
 target/microblaze/op_helper.c | 23 ++++++++++++-----------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/microblaze/helper.h b/target/microblaze/helper.h
index 6f7f96421f..79e1e8ecc7 100644
--- a/target/microblaze/helper.h
+++ b/target/microblaze/helper.h
@@ -1,7 +1,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
-DEF_HELPER_3(divs, i32, env, i32, i32)
-DEF_HELPER_3(divu, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(divs, TCG_CALL_NO_WG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(divu, TCG_CALL_NO_WG, i32, env, i32, i32)
 
 DEF_HELPER_3(fadd, i32, env, i32, i32)
 DEF_HELPER_3(frsub, i32, env, i32, i32)
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index f976d112eb..d99d98051a 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -69,26 +69,27 @@ void helper_raise_exception(CPUMBState *env, uint32_t index)
     cpu_loop_exit(cs);
 }
 
-static inline int div_prepare(CPUMBState *env, uint32_t a, uint32_t b)
+static bool check_divz(CPUMBState *env, uint32_t a, uint32_t b, uintptr_t ra)
 {
-    MicroBlazeCPU *cpu = env_archcpu(env);
-
-    if (b == 0) {
+    if (unlikely(b == 0)) {
         env->msr |= MSR_DZ;
 
-        if ((env->msr & MSR_EE) && cpu->cfg.div_zero_exception) {
+        if ((env->msr & MSR_EE) &&
+            env_archcpu(env)->cfg.div_zero_exception) {
+            CPUState *cs = env_cpu(env);
+
             env->esr = ESR_EC_DIVZERO;
-            helper_raise_exception(env, EXCP_HW_EXCP);
+            cs->exception_index = EXCP_HW_EXCP;
+            cpu_loop_exit_restore(cs, ra);
         }
-        return 0;
+        return false;
     }
-    env->msr &= ~MSR_DZ;
-    return 1;
+    return true;
 }
 
 uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
 {
-    if (!div_prepare(env, a, b)) {
+    if (!check_divz(env, a, b, GETPC())) {
         return 0;
     }
     return (int32_t)a / (int32_t)b;
@@ -96,7 +97,7 @@ uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
 
 uint32_t helper_divu(CPUMBState *env, uint32_t a, uint32_t b)
 {
-    if (!div_prepare(env, a, b)) {
+    if (!check_divz(env, a, b, GETPC())) {
         return 0;
     }
     return a / b;
-- 
2.25.1


