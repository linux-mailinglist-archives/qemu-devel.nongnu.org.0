Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073269C473
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmR-0001Ae-Ad; Sun, 19 Feb 2023 22:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmQ-0001AH-6c
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:54 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmO-0005qc-LZ
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 mg17-20020a17090b371100b00229ca6a4636so1934943pjb.0
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxPSc8yJkvzSaYSSEPoT7SrrtEyyDZGvKalhQ2ISznU=;
 b=xQGOdQE5fjPXJrAl15obpcT+Dgg1sPFXqIEvHnJO8MkhAbUaOyIuULsufGFGNzb0We
 3bB/wL0B824828RnIJ8jN8ITQ1lMJh/rZJ1MoyUA14UuGGZLCHDJEQ36lOmfLZAQWue5
 FhyZW/rK5irkVE8l2VXS67g++Ep+kgy3G3Jx9bVwBbUMDNncV0dVXo2XuoFqvA3Hd54/
 dBEyZVpB1xOgAo33AvgwcEmGrk4rTatX+56SQMASmtrGTrdolKlV9tYA6yZCNxmnYc/+
 m/nkPzQSQuoMzAxnR33yKPaOOchJyiju+mGO5HyGc47c/O5ZcHh1YjyTVAqQhQ26Xdl4
 MjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxPSc8yJkvzSaYSSEPoT7SrrtEyyDZGvKalhQ2ISznU=;
 b=HAHXqgKDyRcaJJe4WYetchKlH9YVxeFYIg9QG+CTmkSmw9890XE7ODI4WK1ybxIOsb
 uqqg31en/EJjLWcczk6lHKreWeq1O8I2hPJV+XpeYJ6pLezRfCvIM410ES6RVQkUJxcP
 26Sa7ol5wy+nh9LFl4OGJqgZkdFM+zVe/d73ICpueuciQBuCx/quSPgTze1kIw3wJ21P
 VsONRokk86v/sGCSllYw9UDMxkjqEGRVoAs1ABUsX+JQ8x6pSmYb1HbbpEdLd0Vdgr9G
 xg4e3SDRNiwchjVveKpLrrJHpd7SC5aLHX34gokhPumiYgYyUZ4KYX2oaFNARpMcK5Kz
 Sj+A==
X-Gm-Message-State: AO0yUKUhgtUvDKK0HfKQZ33iBeQyS+g4R91GwvZPRUMHDqOcxP+/qash
 YeomEf6EaOad/3AlMyOPCXkLjXHf8oxcF1JkjSM=
X-Google-Smtp-Source: AK7set9XL80Jv5Hg0PM/uWT10p1p/cRtqvxn+OYT1ymCOnG1YIU3E/xLAhtdDksJ9ub6HmMw5QRHPQ==
X-Received: by 2002:a17:902:fa86:b0:19a:66bb:698f with SMTP id
 lc6-20020a170902fa8600b0019a66bb698fmr1637631plb.58.1676863431253; 
 Sun, 19 Feb 2023 19:23:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 4/7] cpus: Make {start,end}_exclusive() recursive
Date: Sun, 19 Feb 2023 17:23:35 -1000
Message-Id: <20230220032338.5619-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently dying to one of the core_dump_signal()s deadlocks, because
dump_core_and_abort() calls start_exclusive() two times: first via
stop_all_tasks(), and then via preexit_cleanup() ->
qemu_plugin_user_exit().

There are a number of ways to solve this: resume after dumping core;
check cpu_in_exclusive_context() in qemu_plugin_user_exit(); or make
{start,end}_exclusive() recursive. Pick the last option, since it's
the most straightforward one.

Fixes: da91c1920242 ("linux-user: Clean up when exiting due to a signal")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230214140829.45392-3-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  4 ++--
 cpus-common.c         | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236..671f041bec 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -349,7 +349,7 @@ struct CPUState {
     bool unplug;
     bool crash_occurred;
     bool exit_request;
-    bool in_exclusive_context;
+    int exclusive_context_count;
     uint32_t cflags_next_tb;
     /* updates protected by BQL */
     uint32_t interrupt_request;
@@ -758,7 +758,7 @@ void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data
  */
 static inline bool cpu_in_exclusive_context(const CPUState *cpu)
 {
-    return cpu->in_exclusive_context;
+    return cpu->exclusive_context_count;
 }
 
 /**
diff --git a/cpus-common.c b/cpus-common.c
index 793364dc0e..39f355de98 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -192,6 +192,11 @@ void start_exclusive(void)
     CPUState *other_cpu;
     int running_cpus;
 
+    if (current_cpu->exclusive_context_count) {
+        current_cpu->exclusive_context_count++;
+        return;
+    }
+
     qemu_mutex_lock(&qemu_cpu_list_lock);
     exclusive_idle();
 
@@ -219,13 +224,16 @@ void start_exclusive(void)
      */
     qemu_mutex_unlock(&qemu_cpu_list_lock);
 
-    current_cpu->in_exclusive_context = true;
+    current_cpu->exclusive_context_count = 1;
 }
 
 /* Finish an exclusive operation.  */
 void end_exclusive(void)
 {
-    current_cpu->in_exclusive_context = false;
+    current_cpu->exclusive_context_count--;
+    if (current_cpu->exclusive_context_count) {
+        return;
+    }
 
     qemu_mutex_lock(&qemu_cpu_list_lock);
     qatomic_set(&pending_cpus, 0);
-- 
2.34.1


