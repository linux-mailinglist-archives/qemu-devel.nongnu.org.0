Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D4440AD7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:00:36 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgseh-0006ue-6M
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryV-0002Dg-Ak
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:00 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryS-00009u-Af
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id t7so12991214pgl.9
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=tFHQGAzBSohwn8NtlCyzQcv+8qj2sS17Vbg+fqXl5pidyxn5rtIzOB9bWfIgoSJ7bY
 NXMzasflqC4s4W1ECEuuKzDLaQROZI70iECFPf/vT+U7s/FoDpSaUWZs97SVtqmxcWuS
 q2zyNMUYCWOxC+OxS31uUaZthr8LrPcxNV1x2dLvUSuSpEX23EuC5qYkzO8ux2b3E0Cu
 AorVuFG+mFoxdrEbCI85s0aywvA3FOCBAiWBQtGV9++pmQF/7L+fQ9aBN88MY2qXFJcb
 1hb6lZ/02w8M+sKLh7kktiYwVTXAMaK/toY1LutaT2UObd/voMcKeIcbpSplJwGU6IUU
 iAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=XIm1SSLJ2eHPXnMRFinwn0xw5LNgAPjADPud9eeONB1a56wiWHy4LbJc7XmwO29CXI
 1CxV1iTvi+LaMjwZYGdJGhi8A4zXypdjToqd/y6+5pVVVWZ+70YLjwGCU/iM5bsMSQ6O
 MMVM6WM9/bjKE+85ZLxp9iCJaA4aARAnmqpQMvfHqY0Q1BPN1SNWf5prY2rFgC9wsu9c
 kjwofluhOKVlktsmkkkNn5ZVQW3PugHkaQYq+5coYes4/O0HoF1bvPjilHNskOB4v3tJ
 opr02zPFJ+bCPjcwKR+bgWgdPRkUVJDcEpO4rePDUbWPkuA2P433dQa9zXFE6Qnd7eOt
 YQqQ==
X-Gm-Message-State: AOAM530v3k4B+qcjuvuybpMOJwPcINgbcmlHRAT5r4IDsVjQn7RihlfX
 BGK9h4UXeLxXe3ELcxrLWh09/wHpNMUh4A==
X-Google-Smtp-Source: ABdhPJwSGCMK51l8bSst9hVE4c3Iy8ahY+SJoBhRG9IVaLcPKOrGAtAGvB6YghOvl0Yx9Or2UXAnJg==
X-Received: by 2002:a63:b145:: with SMTP id g5mr13514504pgp.355.1635614215080; 
 Sat, 30 Oct 2021 10:16:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/66] hw/core: Add TCGCPUOps.record_sigsegv
Date: Sat, 30 Oct 2021 10:15:48 -0700
Message-Id: <20211030171635.1689530-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


