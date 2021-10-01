Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77941F310
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:26:40 +0200 (CEST)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMIx-0002Oq-IQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM52-0004vl-3s
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:16 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4w-00057j-S4
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:15 -0400
Received: by mail-qk1-x72a.google.com with SMTP id b65so9793570qkc.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=ox9tk89ixmAYJEEJzNWoTUksyuhcuCJXzjxJwtioEpDbReFXDyyRKCEixMq/SSqlhN
 JWWrClTrPMjO7wbDVKM37vapqsBQ04qKUK+XsQkGFf6btJlLda5YwrFv8Hzzlhfwnkqb
 l40rQ/AbP1qAmk1BcqVl1JflaA4UbTQK60Y4F4fdoA7yujhXjfKrrHjJkrAmoYDkrBtR
 QieK/ThoW+zBG2OS4M5OB/pAc0oalqaD4Zip8L6AecZ9B4wdHMrnJadTYc8GSaIIUB8O
 6QGoUOXvRiXslJ/htg4hNnlgTpi40ZP1hI2c7Q+sEK5QD6izSfhiH0okGPvbsProKfNk
 oLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=POU1b2LESo2VpiDHxJxzn3bqILBXmEnkIWvlS8WDI4T8vY99JTq231lZdWBFHM8NAh
 ApnLtqUn6evZwz/KYFGigx0G2g+4vY63Rp6+T5X9BdGehVAboJzNXHZRF0vSPK4kq6wP
 7u/pZa8dg7/Nfol9LHhlnnLnL5YssH8MgNxiWIdMBskDZ7tqAGUJ8h90DjPVFVctexlL
 nxlyvJusWJnsg7U7CWTl/T31fntseTpYFuYUBUdkUbS9Rr3BaI/ix8iTOcrYERp0BN4W
 lDGa6TGhqxNslKZQVDTiIirXqyfW5+Ldn6cGMt350naw3v7bK7tAfXHe9uqPETwqTTKx
 G3LQ==
X-Gm-Message-State: AOAM533UWzSBnG/4SwL+4pACDv6hy1pWyhy5bA+tda5zTeT9n48Hik7l
 QNXQFAzKP/8xXPiTFzIv32HgxVFK4qe8bA==
X-Google-Smtp-Source: ABdhPJzajbUnqlGr0/vlrs4ODqYrS5kppdl6C4+VNA76C0ULhqSQzOaf9WxuQfzWIyKv4+7f9ew0WA==
X-Received: by 2002:a37:8e44:: with SMTP id q65mr10304663qkd.372.1633108329891; 
 Fri, 01 Oct 2021 10:12:09 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/41] hw/core: Add TCGCPUOps.record_sigsegv
Date: Fri,  1 Oct 2021 13:11:29 -0400
Message-Id: <20211001171151.1739472-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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


