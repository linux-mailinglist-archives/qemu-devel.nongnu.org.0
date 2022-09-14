Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BA5B88E6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:14:34 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSDp-0006WE-JF
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwc-0000Xi-SV
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-00006d-AP
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso2092463wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cWtVxLGk2Gz3c0rqKUOonGO/yrqOCOPVcHSSu/486Rw=;
 b=ja/yRueSVKZ7ylhmIRANZaQgPgwiigr1YqdumzoV0IUKLOUD8vSrqjM21hwdwaP9Mt
 SpROa/N7SjCJQ9C9jI/exZtUv9/1c/rk979uZepwP0OkGGpdYeGbp1BEIA9R1gJZG8N2
 cwRg6GFDQmUNXKTtmulr40XfMIZI4xxOa2W2AUiWbS8nVKuQD5LzphEnyRDMDzwiLVwd
 0OHzLP6x8dxYyh1rRVTCHTNPwVd4rHa8sGLMFjF9MQ/LZhmV3624p3cNtT7NhHEotCCw
 Q2fRjaQlUGlclcZDzzGgzUSTfSXrttYgpZms2hoYbllKS7VxzWqYZSPvJWKAaLrwnHyx
 Pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cWtVxLGk2Gz3c0rqKUOonGO/yrqOCOPVcHSSu/486Rw=;
 b=2rPm46R5uBjqN+B0Fq5b8XFWJkNBuFoJUG3U2Oun8s6dIt4QPLH0KlVfuRUAKxF+G9
 MZtvj3M52rlmwmLS6gEB0tBvHWSu9GbP/zLf5SEUZGx6rxqLGmEjWNBglmg3Gjh24HxV
 r0UKIRnk8RWlRHvcQaoISFMojgQHxwygm5u4EhNtkw3iKjujJTljN1tejjxLs6WaVXyx
 1S2q4f19QQhJLD+0sXBE9X6pGoRVY6AHhl2NTn3wbHUvKcCQl5QvzD9vS6Lq6MFdaG3d
 VnSJ6qpV0+1Och9u1AMnxE5aseiya10avC8aR5rSu3yl0oBlWGycKlkmwvHwa6oJ0bos
 JljQ==
X-Gm-Message-State: ACgBeo0TuRURG2gC5UO9guMcbFvi4loQQy9r2M64d03uVfKCM0gcOEoQ
 KP/PXQ6bBKMVpqRZXaGGc4t7Cr5wwhoR5HSu
X-Google-Smtp-Source: AA6agR7j6DHka52ov4Ak/nZ7CrbWcskTi7GQ8exR58ewmN6+EY4cpKrrI6feAjKM1Y1JiSsWphdfTw==
X-Received: by 2002:a05:600c:414b:b0:3b4:a655:720f with SMTP id
 h11-20020a05600c414b00b003b4a655720fmr955500wmm.92.1663156352920; 
 Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/20] target/arm: Detect overflow when calculating next PMU
 interrupt
Date: Wed, 14 Sep 2022 12:52:11 +0100
Message-Id: <20220914115217.117532-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In pmccntr_op_finish() and pmevcntr_op_finish() we calculate the next
point at which we will get an overflow and need to fire the PMU
interrupt or set the overflow flag.  We do this by calculating the
number of nanoseconds to the overflow event and then adding it to
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).  However, we don't check
whether that signed addition overflows, which can happen if the next
PMU interrupt would happen massively far in the future (250 years or
more).

Since QEMU assumes that "when the QEMU_CLOCK_VIRTUAL rolls over" is
"never", the sensible behaviour in this situation is simply to not
try to set the timer if it would be beyond that point.  Detect the
overflow, and skip setting the timer in that case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b792694df0..11a7a57710 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1227,10 +1227,13 @@ static void pmccntr_op_finish(CPUARMState *env)
         int64_t overflow_in = cycles_ns_per(remaining_cycles);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                 overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
@@ -1275,10 +1278,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
         int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                 overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
-- 
2.34.1


