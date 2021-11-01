Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D4441F96
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:50:58 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbST-0002NC-HK
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb64-0003lV-PP
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:48 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5z-0000ch-3W
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:48 -0400
Received: by mail-qv1-xf29.google.com with SMTP id d6so11688561qvb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=bu+b8DIA8sIT7NiYQeVxdE59RqzuDEt/K4dgmFjATnXouweHEE45Hb7LQs/B8gRDaw
 MmiktxLVRtqM3A0YplQwmL0VqjT9jy3iRfUMhk4jby8RqVcp7nO2ocqXWuwZrvOanHUX
 R9i9QkIX4PC3RWTjfjWu8GmkTWeUJLpRE88ZWwlLC7atC4eiq3FjxkOSF17OTCleouTk
 ZDpW+qTqbr7ya87hC8DfGqnyEZu02ikyER/fHcjP2snURdKlnl2O9uPR9CGYr1nZZFvh
 M6nPEOsM/xcnu5ZkJgxQ3PcIApdOV5YXFmF4eG3Vel6Je+ST3SSoX1qOYREgEjgN5Mpz
 Zqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=TN7DlR94noh6RyW4Cj/vRZ5xa2UFaXJsO4ieaRs2qRWkF7+gQ10yxzW6kFGIFGM4lG
 hIqdMapg+LAuvYWc5mFkvqjuInNC8EYcIpI/2uEVQrYnK6/diM6SS0aolw8vejgpwgsy
 znq3iUt7v+yVmZjuvzeicq0AQsL4BbLLGUwlqhmouuHwZm2Lh8C9PZQdsWmvEiiCu0b2
 VUKMbGh8b6gsLFnI6t6sDNx01xBaH7fM8JLjaXZM53xo61ycZAwOBfOT3u7lNrn4oFp7
 y7yTgznUaHrWUbtIADfauWpCyKKb1/VV6Vc+TTyW/Xo6vKcczEsqZI0iqyCpi1lE5R6b
 9p4Q==
X-Gm-Message-State: AOAM5326908z62qaiGXxyouXDG+6Lo4tuNLu4A6k1whmEBkjpftxWbLw
 BkwhDioJF+N3vyuH0+ekYRhchZLyL6dzMA==
X-Google-Smtp-Source: ABdhPJxOXyPYBMB+N/7ZcA4Ll2kk/TUUTot3sF5UMwB6KskTE60Z8KElcvYoegYKMqYLTNDskqb8Yw==
X-Received: by 2002:ad4:41c3:: with SMTP id a3mr17272271qvq.51.1635787661973; 
 Mon, 01 Nov 2021 10:27:41 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/60] hw/core: Add TCGCPUOps.record_sigsegv
Date: Mon,  1 Nov 2021 13:26:48 -0400
Message-Id: <20211101172729.23149-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will replace tlb_fill for user-only
and should result in less boilerplate for each guest.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6..41718b695b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -111,6 +111,32 @@ struct TCGCPUOps {
      */
     bool (*io_recompile_replay_branch)(CPUState *cpu,
                                        const TranslationBlock *tb);
+#else
+    /**
+     * record_sigsegv:
+     * @cpu: cpu context
+     * @addr: faulting guest address
+     * @access_type: access was read/write/execute
+     * @maperr: true for invalid page, false for permission fault
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGSEGV with si_code set for @maperr,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide anything to the signal
+     * handler with anything besides the user context registers, and
+     * the siginfo_t, then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
+     * so that a "normal" cpu exception can be raised.  In this case,
+     * the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
+                           MMUAccessType access_type,
+                           bool maperr, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


