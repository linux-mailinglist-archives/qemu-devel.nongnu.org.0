Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC01DD43C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:25:18 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbowX-0006zR-6p
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJS-000569-V8
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:54 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:39771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJR-0006zw-Ra
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:54 -0400
Received: by mail-qt1-x841.google.com with SMTP id l1so5989489qtp.6
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxlpAA+PZ/IrNPvmGjLlDG9tH8eZcMlAHM/CkfDCuY4=;
 b=veO3K/vjcVpuQ+C+yQY2XAkmnfKBO7Fk/QZ6Uq7Ad74lHb6rjDuwWx3jbsLltck3Ef
 IuVf0lyi1gbyPazl0nzvdZFR0CAFpcRet/R1ApaXwdbTLb2bpwAStPS5/A7pAx+H6YeW
 8KvyhX3H7cg5fO6ntD2B1rV3hf2ge+s6hXr+dhcEAojlBHDwsNtGlsrqvNM5foLRsLhL
 dmjV0jN701NWNAdQA8B9Ys1P0vio0BgTBYyFr5p0XSNi6b0RbScbN1ct+Gq1HSfjSAfU
 MYxcLwRMpegzOBs0kBOFbE9dLQ/dYAXjM12bfNK0fFAFxM4xngkSobQHZGyxRP+vniFy
 gaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxlpAA+PZ/IrNPvmGjLlDG9tH8eZcMlAHM/CkfDCuY4=;
 b=SNdGzfjV3CyPgu+cu6T5kOzHhj7k103pF7XsWdrmgd3fZWKu1mb9Qththmt4SEGLXj
 4rCjwqE7t5BRdlHy4BQN2RBzTzat2Q9JXORD1I6VSuRAk+z0l+seem7jEMx2eNVqMNFd
 epOSLMhxMNVZNN+tmqkWc/Jn0rCzoEYJpYEN2hSpKC0vvPNran2ls96v9wvz0B6OwG+M
 kR/5jB7bWAqN6ssTkK4EsAs9Q8rwHW/9OiAKq9dUlY4JmJQRXybDPFIAmVyZIuuwuV8g
 Fet8c1tCgu9+hcBy0mfUkSlhrIPSuT2iie3ypay/pQ6tOhWpc+e8ounZa4LLasyY8pHR
 wiIw==
X-Gm-Message-State: AOAM532QymB8PiqrWuz6KJNizrnUI4oUolaYxI0TxM8dtmpuTUGOqsIw
 vmuuxtbAaKokrs0sEGbQoABCLz0vEarIug==
X-Google-Smtp-Source: ABdhPJypdGKUc8YKxGycEvbQX/1ExOqOFr03PfU8cnNsFj1yxnihx20FzBrsV/KPceK0sFFuIisTIg==
X-Received: by 2002:aed:35a1:: with SMTP id c30mr11738669qte.228.1590079492546; 
 Thu, 21 May 2020 09:44:52 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:51 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 73/74] cpu: add async_run_on_cpu_no_bql
Date: Thu, 21 May 2020 12:40:10 -0400
Message-Id: <20200521164011.638-74-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x841.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Some async jobs do not need the BQL.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 cpus-common.c         | 39 ++++++++++++++++++++++++++++++++++-----
 include/hw/core/cpu.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 7ccc7df876..651f9b31cc 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -99,6 +99,7 @@ struct qemu_work_item {
     run_on_cpu_func func;
     run_on_cpu_data data;
     bool free, exclusive, done;
+    bool bql;
 };
 
 /* Called with the CPU's lock held */
@@ -145,6 +146,7 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
     wi.done = false;
     wi.free = false;
     wi.exclusive = false;
+    wi.bql = true;
 
     cpu_mutex_lock(cpu);
     queue_work_on_cpu_locked(cpu, &wi);
@@ -169,6 +171,21 @@ void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
     wi->func = func;
     wi->data = data;
     wi->free = true;
+    wi->bql = true;
+
+    queue_work_on_cpu(cpu, wi);
+}
+
+void async_run_on_cpu_no_bql(CPUState *cpu, run_on_cpu_func func,
+                             run_on_cpu_data data)
+{
+    struct qemu_work_item *wi;
+
+    wi = g_malloc0(sizeof(struct qemu_work_item));
+    wi->func = func;
+    wi->data = data;
+    wi->free = true;
+    /* wi->bql initialized to false */
 
     queue_work_on_cpu(cpu, wi);
 }
@@ -315,6 +332,7 @@ void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func,
     wi->data = data;
     wi->free = true;
     wi->exclusive = true;
+    /* wi->bql initialized to false */
 
     queue_work_on_cpu(cpu, wi);
 }
@@ -339,6 +357,7 @@ static void process_queued_cpu_work_locked(CPUState *cpu)
              * BQL, so it goes to sleep; start_exclusive() is sleeping too, so
              * neither CPU can proceed.
              */
+            g_assert(!wi->bql);
             if (has_bql) {
                 qemu_mutex_unlock_iothread();
             }
@@ -349,12 +368,22 @@ static void process_queued_cpu_work_locked(CPUState *cpu)
                 qemu_mutex_lock_iothread();
             }
         } else {
-            if (has_bql) {
-                wi->func(cpu, wi->data);
+            if (wi->bql) {
+                if (has_bql) {
+                    wi->func(cpu, wi->data);
+                } else {
+                    qemu_mutex_lock_iothread();
+                    wi->func(cpu, wi->data);
+                    qemu_mutex_unlock_iothread();
+                }
             } else {
-                qemu_mutex_lock_iothread();
-                wi->func(cpu, wi->data);
-                qemu_mutex_unlock_iothread();
+                if (has_bql) {
+                    qemu_mutex_unlock_iothread();
+                    wi->func(cpu, wi->data);
+                    qemu_mutex_lock_iothread();
+                } else {
+                    wi->func(cpu, wi->data);
+                }
             }
         }
         cpu_mutex_lock(cpu);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8478628fdb..b061618666 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -889,9 +889,23 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
  * @data: Data to pass to the function.
  *
  * Schedules the function @func for execution on the vCPU @cpu asynchronously.
+ * See also: async_run_on_cpu_no_bql()
  */
 void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
+/**
+ * async_run_on_cpu_no_bql:
+ * @cpu: The vCPU to run on.
+ * @func: The function to be executed.
+ * @data: Data to pass to the function.
+ *
+ * Schedules the function @func for execution on the vCPU @cpu asynchronously.
+ * This function is run outside the BQL.
+ * See also: async_run_on_cpu()
+ */
+void async_run_on_cpu_no_bql(CPUState *cpu, run_on_cpu_func func,
+                             run_on_cpu_data data);
+
 /**
  * async_safe_run_on_cpu:
  * @cpu: The vCPU to run on.
-- 
2.17.1


