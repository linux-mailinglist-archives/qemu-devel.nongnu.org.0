Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA681DD439
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:23:46 +0200 (CEST)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbov3-0002aF-7Q
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJS-00053q-4f
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:54 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJQ-0006zm-99
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:53 -0400
Received: by mail-qt1-x843.google.com with SMTP id v4so6015721qte.3
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PofzzyIN8ZoMX3VcbhKeSDmt2Z4USbgC222e6DzhLWQ=;
 b=D7TRfDNXXyAbBnWHO/BW6jNN13ajx8i1EgERkdVyXr7GHH7kmYc0qcFfaEv5z90mzQ
 wuvWFcuTFMYe71jc8dK6Y2eoiVzeROO9SJ9UUrEn+f3GWXJtoDS2vX35PSfUxnt5pjqj
 mN+dngBfIAC/cBXTS6iZr4GQwqmbZtdKo4nCDSs0SFAXFIwu2016qImQ/07+1jtxPI8Z
 d3ADahoV8cHN5EuQ/AODEBRx1+bgj3hHTM7JXBwTn428UCS2ubzjGjZg1vUHrNnoCpkT
 iTwapSBkDSCLFB9eswwIDfEMcKt6soQndSmfdQSUjpSLNSZwFz1S4760QCUkkhgHpv2J
 fosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PofzzyIN8ZoMX3VcbhKeSDmt2Z4USbgC222e6DzhLWQ=;
 b=LzEeLx75ILLDLVcF/5JjIzNMJnmKM3udi1zMIwTcOi6vzaeyJrz2p9jOk0BTm5HZwA
 2eKISy2cGBVAWlkgQiqoOm6W1UQCTryS7re9wiYuSIGfzIlOctNwrhhyNZ9nEHy7rlhI
 pSzsMPlmDLTXmutfEsBnu6f+WgPZMUkbBF/kG6A0lhbAi3GOgGP7wG0u75EOMjkLQI54
 dArk9YyoKnwC8BGZY7/99eFra1QlPDsUVLRYeO57HK6qLRRFyjB0vsTbiPmcYtc2P9eH
 9PV5OKpuBJnz3iVY4HswY5IOKCmn6uSDcVCaYJfB7cs/UG8HbuXaEKyRjhOkQroWqZz6
 HRyQ==
X-Gm-Message-State: AOAM531+4Prox6WkOvjhxFcgSYZmPn87ykTZDK9R5KWI7SK4yUtYa052
 0WjMWYJA0fvXQz7xZIPw6NnVZMR2yj+mZQ==
X-Google-Smtp-Source: ABdhPJx3PBSSY/7rEerhpOl51AZ6/Gz54wzFVddOmzO2JQv5TK1tTCuB4g454I66N4X7v6gG/JbQHw==
X-Received: by 2002:ac8:6c54:: with SMTP id z20mr11450617qtu.76.1590079491175; 
 Thu, 21 May 2020 09:44:51 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:50 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 72/74] cpus-common: release BQL earlier in run_on_cpu
Date: Thu, 21 May 2020 12:40:09 -0400
Message-Id: <20200521164011.638-73-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x843.google.com
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

After completing the conversion to per-CPU locks, there is no need
to release the BQL after having called cpu_kick.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 cpus-common.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index d418eb5aef..7ccc7df876 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -135,6 +135,11 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
         return;
     }
 
+    /* We are going to sleep on the CPU lock, so release the BQL */
+    if (has_bql) {
+        qemu_mutex_unlock_iothread();
+    }
+
     wi.func = func;
     wi.data = data;
     wi.done = false;
@@ -143,21 +148,6 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 
     cpu_mutex_lock(cpu);
     queue_work_on_cpu_locked(cpu, &wi);
-
-    /*
-     * We are going to sleep on the CPU lock, so release the BQL.
-     *
-     * During the transition to per-CPU locks, we release the BQL _after_
-     * having kicked the destination CPU (from queue_work_on_cpu_locked above).
-     * This makes sure that the enqueued work will be seen by the CPU
-     * after being woken up from the kick, since the CPU sleeps on the BQL.
-     * Once we complete the transition to per-CPU locks, we will release
-     * the BQL earlier in this function.
-     */
-    if (has_bql) {
-        qemu_mutex_unlock_iothread();
-    }
-
     while (!atomic_mb_read(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
-- 
2.17.1


