Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1459C099
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:31:39 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7Wk-0000Zw-SX
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PW-00065D-O1
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PU-0001fL-Vi
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id b5so8926148wrr.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gAJToUGMZxgV0d4Q4X3oKY4UbjuKkCvUr3anhNbi7Gw=;
 b=mp+4Cvc2B2WVUm2VMs2TIKnUWypi5GuYqJehgRpGcGyztzYwY2ExisP+c7HQZnloeL
 9DXonw24UVUI/opfwc3UrMKXistkpbxPpA3p2mvDmJyVM/Tzrx5bt4WpD+GJCp5IPyRg
 00h7GN7aDZfzJSPsSFxtANOEExTX2D5wRz2Jhmhlgh/ncIARqVQOaTt2g+7aJGx4qsei
 oRVW9Pwu6EqFZEot/omyUqfo4+y8GqAMIS8a397RMt/NxnogXWs7hBdzSUnw0wbJsGpb
 8qTBr351CJU44LRsLYaanf+VcErpWsxaTEAmj/jS+cxFDN7QSX/6IrH9hYdsAAYH/Vl+
 ERYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gAJToUGMZxgV0d4Q4X3oKY4UbjuKkCvUr3anhNbi7Gw=;
 b=KnGx6FvWb142ofxNeByhcLXleniY/j2uKVKbf9spcdldGQzStdJSNxI5O1yFgXA8Tz
 3qDrdlnqeX2FelNtV2tKOMN4C/IlZulJA/g5oAlOeeXL/SoHpwAk0mNt4o00htGYIsAo
 DVXq0QxRPvivQW2LDmIjrwYtqSYVPfmhJAO046Vox8MTkMSdkd+ox7jlJhRxNbD2QET6
 5TeS4SgzM+vAo/KEE7qjaO4FkPaTbVDo5++VHB2dABayNv84tZ/BNwmW9LG37gXJ89Lb
 VjaPddjVlKHNcCRFe3DIWt8GRrPeO4goglyd/r0JA9iY8m3TodmgeXoHcfef58Pgc5Jn
 xbog==
X-Gm-Message-State: ACgBeo3KZI8AwkfddhzfO7/wCGdHWYs/BJ5NS3p66t/8T28156GChBWA
 DH5k1bO4UouDmNNSUJyzbLgZj4SUmaskbA==
X-Google-Smtp-Source: AA6agR7K2geqNcCLKUGVOIP4MmWZYqM5CmvVNNgE1A7yfOFEJduAaWgLG11RcPLaxyL/pDLH+QIkvQ==
X-Received: by 2002:adf:de08:0:b0:225:426d:480 with SMTP id
 b8-20020adfde08000000b00225426d0480mr6492941wrm.636.1661174646739; 
 Mon, 22 Aug 2022 06:24:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/10] target/arm: Detect overflow when calculating next
 PMU interrupt
Date: Mon, 22 Aug 2022 14:23:54 +0100
Message-Id: <20220822132358.3524971-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
---
v1->v2: fixed bogus indentation
---
 target/arm/helper.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d4127a1573..94307a6c417 100644
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
2.25.1


