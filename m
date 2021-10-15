Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7742E7A3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:21:21 +0200 (CEST)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEie-0001Z0-BI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYt-0007EW-6m
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:15 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYq-0000Im-VW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:14 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e7so7463745pgk.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=dejJWWV6X/iZBhyVdKrm+gz+tC6AeGz+0aY28bMFsYencTyEotWAo553EGcPwSELU3
 zwIsefSOFzV5g1WsO+kfnYdqZ0olHhZnrcvDOHeskI4p9pFGhxGOfA4q9Ir0G31yJ8nd
 c4IW/9Al4nb8XRt9daLBNElDkY0/A66q2kTXTIojYUnpt1Z5afWDW95WgDYbqykQtmkZ
 Xy1NW3CWN/jA0Wu+yd4t+NRzvlkf5HX38wyVsZ/kTyTmKL1nc/ySQi6LaneH2PMSgVdg
 mmRmOMzPd5o1o/grnD1xa29f4RPLd3yra86ZYkj4nywKtsmMjro+PspkUBMRK6Y3dJyt
 Q0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=OWAFRpANthmuTazM/95vo+0LAdQIzKukoedwJkNVJFafrDllfhzjWR7bnFuNm9MRyh
 W4rwsZaQAqVsNxHI8zd9qgR+h/Q7Z5J48s6u9XRcm8BUoi9DKshXOoJmIgKa7i168hwl
 6qtIS1ZfODFOdMQPKX3nRNlq3rvitesxCOaGLlScafioIIY1fw07Pd+ez/06MV/DWpzc
 w9FvQH7H5GFOo1nydpXSOSFoQlsmd5pZ7ecW1FMy9jFZXSJQXGpOOjusLnXPGNOEXlPr
 huH3rLoKgtRZ/oNlEmHoIn/5XLMlf/Vuqk6EuVVWENkZO06bvX4JbKQZCkPJUZodv7Vd
 ZalA==
X-Gm-Message-State: AOAM5338Lu9UyCIfaX3MWQ2cBpkqhuK0VyYR3IaevJuQdiL6eiadAuZF
 xLM+5rxEwR5aPtQaPEYEfUMGnWgqHgvcaA==
X-Google-Smtp-Source: ABdhPJxAhfTFzVFzBChvDlzfe1+u8+Gg1oBPTGLfq1S/q0eOrOzeOPMVDndW2D3FgeW5qtl2lqmKfA==
X-Received: by 2002:a63:6943:: with SMTP id e64mr7281160pgc.480.1634271071338; 
 Thu, 14 Oct 2021 21:11:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/67] hw/core: Add TCGCPUOps.record_sigsegv
Date: Thu, 14 Oct 2021 21:10:05 -0700
Message-Id: <20211015041053.2769193-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


