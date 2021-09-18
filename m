Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DB41082D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:51:59 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfRO-0005GQ-AI
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0005Bb-9q
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLN-0006qv-Sf
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:53 -0400
Received: by mail-pg1-x529.google.com with SMTP id h3so13086393pgb.7
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrD8E65gnfBNS6+ihjsgMJcAs7qIa3jYuvmEwiwusrE=;
 b=xzQZf8q0aioXJDqYBn2Hva+H5t5SIO5qSkagItq/E7Yd5xot92n0AcOwyqJapGf1NU
 IH9gKiFNJEiS2aZvBEKPALKxiOdofYKkQHeMNkPOt5oHdNIxLObA3lldX47h94+zdH4q
 FozT686IM7OUdnRbb1pptcMqlh/xBw24DMD8abpbaEAwKliTN7LJogEtJv5xSL6lwC4+
 3qO3U11h7mGx93ODo2VAAWdpYAcgOoYHY2z5qBuca1yiw5LroE8gRW2QgzALQqd3643w
 /od4Wz7wmME3ImSL9PvNrmrvnU5rV/3XvlPT7nuEWbZ8r45+lPtGE3B9zEdwdKLBpM7E
 3+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrD8E65gnfBNS6+ihjsgMJcAs7qIa3jYuvmEwiwusrE=;
 b=BRO/gz535i2rUhfL0xxk0vjvIZTJSk5NvRp8l5GhhJ3y1lj09Ol/5ZgKcpgS66nhhZ
 PsFXQmcNvxWlTNX7vbW/yTJTzflnoRELefFD/C9teXAjP15utp7OqMr+wIFYj8fgwtTb
 QgE11sM/NdsOMtvbhTILbOcGE3fhtGPByUCTvdY917QCmY7c+5yGWZrr7BPLPQSbA3b0
 wiUkPLHEOFE+xfZdZFWPz9V5p+zvQ+RG6lS/EFU+Nq7As9a6RtA24VMgduKpg5Dle6nD
 W2xluMw58Lk7lY8dctbRNTWWDIJipUuM1UO0uM920VOL+8Tob0h6YKRYtikB2JBfFFgl
 f+oA==
X-Gm-Message-State: AOAM530XxHvWODhaPFurMJZ4YVs47aGZYseBvzdFx3r4Bo5dOwiku5EC
 WestgpapKwaGY9j1iX89ht5HFFNJ40wvZA==
X-Google-Smtp-Source: ABdhPJyuU0hpn6UCFzTWIXeRrH3DEHok5ojAbFLjPu5k3ZXIj1i7xES5GSFH3V9xhYHy1o+e2E7ShQ==
X-Received: by 2002:a62:194a:0:b0:43d:f06e:4f4a with SMTP id
 71-20020a62194a000000b0043df06e4f4amr17025444pfz.20.1631990744594; 
 Sat, 18 Sep 2021 11:45:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/41] hw/core: Add TCGCPUOps.record_sigsegv
Date: Sat, 18 Sep 2021 11:45:05 -0700
Message-Id: <20210918184527.408540-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will replace tlb_fill for user-only
and should result in less boilerplate for each guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 4a4c4053e3..e229a40772 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -114,6 +114,32 @@ struct TCGCPUOps {
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


