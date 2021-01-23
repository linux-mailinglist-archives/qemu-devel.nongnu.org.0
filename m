Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D903017CB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:54:16 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O35-0000g6-4p
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzT-0005Ag-BL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:31 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzP-0008E3-7F
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:31 -0500
Received: by mail-pl1-x633.google.com with SMTP id j21so547445pls.7
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdBJyG9pvdbY/tWrWdbknFMnMMlRkyr0IIdSlApvTpw=;
 b=ymwZOQfHld7DCBVukldRcdmdz9p7bX9JMNNYxbCglSEhb+BcI4dgf10ud6SrBA5StU
 8zfvAMcuY9UTz0ieOm0vBRxwlak282Om6Aa25XizmeEqmlRY7c/115qmJoPUv4DlJAOD
 CvzamhDgJOl/o1XK2/Qe5mnDa28zFiAi8U34d3CSXl+Ru1E+FNIWW2Ko8DC8FBdOb+Ye
 P/+7dRfpcpkI6EQPkDsFWgYeH3WS5QhpDoLBcTfwSfN5RSRCRor9qOv3t0RyGY8kMoY/
 T3oLzNW5C5nEOb9/OOwvXNuyWSHvTfe7CkgXPOR0Z73Own5DPfjzfbrO6c1vvRpFcS76
 XjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdBJyG9pvdbY/tWrWdbknFMnMMlRkyr0IIdSlApvTpw=;
 b=FfWe71XCZuKOrZCUFH4m43+SW+L8C+ldnJArAyTviibMsd+AwF12yd3F0+EfUpiapj
 3xFGbENesJbHtydUJ4vQfqxKdVFt4k5zj33U0U48PhjUZMQCDQB/mx50vbbYqa/79Jfs
 pLXHGaVUwB9EHQKicPdqt+5AWHlWx7XZaVKKMrfd+wB0//PeRcDDi7ygs7XLEgpK9LiZ
 AHeNk26mJibpQpaWKw6x1lFtcb+lPUVDy/q6NrJpVVc4v5OqC7xdAObgiGSps2CFAH7E
 K1e8ZmKm1YbekJvHjfnhfdaG9tXuuXMbv44evtLjVx43TFAVp3OqklSgxxmS0kt+b1D5
 wSlg==
X-Gm-Message-State: AOAM530wP5JgHeqZp9FiWhfTll5340oNrYJAgz4X2ZfXvwRNYqDAgv0e
 yJ6+x7WvBpFMn/JxMl2bX8DhpOkPFYwQDg==
X-Google-Smtp-Source: ABdhPJytriIY6fH/s2P2xo4QIZKiRkjtRS7CAse6VrJQ3uF5Lg5WnNIlE0IW4cS3nvwxwE2tJ/ME9A==
X-Received: by 2002:a17:90a:db50:: with SMTP id
 u16mr12958389pjx.39.1611427825225; 
 Sat, 23 Jan 2021 10:50:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] tcg: update the cpu running flag in cpu_exec_step_atomic
Date: Sat, 23 Jan 2021 08:50:11 -1000
Message-Id: <20210123185020.1766324-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: peter.maydell@linaro.org, Douglas Crosher <dtc-ubuntu@scieneer.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Douglas Crosher <dtc-ubuntu@scieneer.com>

The cpu_exec_step_atomic() function is called with the cpu->running
clear and proceeds to run target code without setting this flag. If
this target code generates an exception then handle_cpu_signal() will
unnecessarily abort.  For example if atomic code generates a memory
protection fault.

This patch at least sets and clears this running flag, and adds some
assertions to help detect other cases.

Signed-off-by: Douglas Crosher <dtc-ubuntu@scieneer.com>
Message-Id: <a272c656-f7c5-019d-1cc0-499b8f80f2fc@scieneer.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e0df9b6a1d..8053aa3f11 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -285,6 +285,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
         start_exclusive();
+        g_assert(cpu == current_cpu);
+        g_assert(!cpu->running);
+        cpu->running = true;
 
         tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
         if (tb == NULL) {
@@ -323,6 +326,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
      */
     g_assert(cpu_in_exclusive_context(cpu));
     parallel_cpus = true;
+    cpu->running = false;
     end_exclusive();
 }
 
-- 
2.25.1


