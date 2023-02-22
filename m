Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3869ECA1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:01:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQz-00036A-Tb; Tue, 21 Feb 2023 21:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQu-00032z-7i
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:36 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQs-00014S-L4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:35 -0500
Received: by mail-pl1-x630.google.com with SMTP id q11so7478272plx.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxPSc8yJkvzSaYSSEPoT7SrrtEyyDZGvKalhQ2ISznU=;
 b=vWAf7VNJ8cFB73zb5ZKFtVK3NU5Ie3Ya1NJtuBimgfYWPUPGfoqBPYInxDOOjxi0U7
 lgn9rMDNrH1dCh8tRJVPSQqZdFAgzu2z4YVEGM6iXjtU8iLpJ9YRmqwibGHu0hzHQo5h
 NcEQUjegHb+2YTyivB5UUEmREzswegrIfXA3nDUfvdQh8poKhLCxtQVFn8L3oJyAfRgM
 SeZxahAzoHQTxgOiMROQeberGnUqVN8lwFqMT/hvbsOhUg52C7NLOskDqIywb26aO5Cm
 egHksOAc6xWyArzKm2NAzvIi+w0sobxo9yuTPwmgOS17F5ypCE64pRAWcrFGhLXRzwyq
 rGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxPSc8yJkvzSaYSSEPoT7SrrtEyyDZGvKalhQ2ISznU=;
 b=rmTiwqBiNToQ8IrzM4KZ8WI2sM8j4jIy/Q9vDwcKZn+5lDnIx18KGHLay5PC48rWds
 FUpW0r4+gV66R1Czm9fmLr/V6W57L3ky4yjtH4C008DnrmSCit2KJfTLWdRsOOOiDLuL
 NXATin/ZBIGwUzQIxPoSoTAeopFTk28fdkAbD6kfLBkWPqhVLHN6G1bbvkZsfWjhylSJ
 9jUPzmn58xR2N4GkO4+rBAAnzgOkEZHKjDNp+rnq3zVcA0Cyw01/dKPHjzP/djbMQtgb
 DiPpga+8y5FZXKWztIafngTg4XqECg1Oy3fBnonFyGKogQsr8zTRDmEr3LYsyz6di+xk
 QY9A==
X-Gm-Message-State: AO0yUKWcPBzJT+KsJxaYhSDU838w0QASeQsgfUKsGweBFT8QaWpjURd9
 fWJZXW0CDdCkjfwl8hfIuRADie6A9OOh7T0c5Uw=
X-Google-Smtp-Source: AK7set/n4OoMe+N/fG92W1He8obIQN+trikO9GDki+o38mAyc0oYFNAx4VKUMtkP2sgzIiacjpI2Xg==
X-Received: by 2002:a17:902:e884:b0:198:dd3f:2847 with SMTP id
 w4-20020a170902e88400b00198dd3f2847mr10095406plg.21.1677031232896; 
 Tue, 21 Feb 2023 18:00:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 4/8] cpus: Make {start,end}_exclusive() recursive
Date: Tue, 21 Feb 2023 16:00:19 -1000
Message-Id: <20230222020023.904232-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


