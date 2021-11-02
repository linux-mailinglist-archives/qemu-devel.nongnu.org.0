Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DB442D2B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:50:49 +0100 (CET)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsJV-0006zO-2G
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh8-0001CR-1c
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:10 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh5-0001uM-Tx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:09 -0400
Received: by mail-qt1-x82a.google.com with SMTP id n2so18489552qta.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=TJp+AxRIUnzrTleZR8gDvrA3xWHh1Cr3g0w/pgdUMlWn9ItNOYbeKSYqt33TWauMm3
 6Lg0HrQa57Yc5/KsQnqAy3amzcPjs3EoCnXgFsC1BU0epHbynrNvBp5/nmzAl9dVbypO
 uXhlUuW21fcQn2NQQpPzT5ZM8BmqY4oaG9HCsUl16/pmMRNQGHOyzChTLgmSXujLd2N8
 FNLAVO21YGYAjgLbUy8qJzb1W9iTmcA8UxEOrSnp4gveA/+LV4ACh1sjVzEEpn7yIguj
 zu4sPa1RpjebpXpUDUhneyMeIicg48cOYd4mzvZnBV+zM3K9GJL0ByCCD2RnJwbcD7a2
 u+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=E0hb7owMa5MTTeevedkVTdCroT6q8HZFPAOM64mA4EZKTOwW03DKExq4uJQGjxGa19
 TFInLOWobc97H0uutCKfCenW/Hjl5mreBIYKugAFUcFiDJjt3Gl2MbHRpFuOZ7hanJQA
 qYCR7FenSArQjEWweEWJYY2B/khu+q7g3sliBv0y6m9sEuOiUidfBbvWB45GF9wat7tc
 Q6JFSCQIgEWE3ryFjI7+BEQnVKjU2J6vKM768xiHYn+pOtiwYmAc14ZIYOqBWyvWm6/D
 oKUCcPrQQQ8022sznWVzCHvlPOHOwIE8W8bP7WdlXhl1O390zwz5TP1X1xtxOh9KfG8j
 NGqQ==
X-Gm-Message-State: AOAM530mCAN5PzXnUYyurOuJLwJpsFqty/RFu//9PiTiz5rGJlGYyZgk
 VAyVMAQpJ6yK6V4AEfCpY0P5AIYF/Z86Eg==
X-Google-Smtp-Source: ABdhPJy9Qnoaz1PJaDsya2PUtex0RfryAq4wi2ZixjbAKRYnXujDnY8I4PTevJ8c/cWpen6tbCpQOg==
X-Received: by 2002:a05:622a:311:: with SMTP id
 q17mr11219195qtw.106.1635851466816; 
 Tue, 02 Nov 2021 04:11:06 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/60] hw/core: Add TCGCPUOps.record_sigbus
Date: Tue,  2 Nov 2021 07:07:22 -0400
Message-Id: <20211102110740.215699-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will take the place of do_unaligned_access
for user-only and should result in less boilerplate for each guest.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 8eadd404c8..e13898553a 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -135,6 +135,29 @@ struct TCGCPUOps {
     void (*record_sigsegv)(CPUState *cpu, vaddr addr,
                            MMUAccessType access_type,
                            bool maperr, uintptr_t ra);
+    /**
+     * record_sigbus:
+     * @cpu: cpu context
+     * @addr: misaligned guest address
+     * @access_type: access was read/write/execute
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGBUS with si_code BUS_ADRALN,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide the signal handler with
+     * anything besides the user context registers, and the siginfo_t,
+     * then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu do_unaligned_access code,
+     * @ra is provided so that a "normal" cpu exception can be raised.
+     * In this case, the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigbus)(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


