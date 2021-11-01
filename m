Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10E441FBD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:00:07 +0100 (CET)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbbK-0002h8-9p
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb99-0007nN-Jv
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb97-0001BR-19
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bj20so5971010qkb.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=uL2BuegEf/bwrO4a4c6q9GujS24PmWjf4NXikyrI85wu09/AjYdmSoylaCxzUsDP17
 qOnnvPZ95fmMqwGSDVG7ThJRCum5uEbn8+d8HyXcIPw7hCfcr8IsAOp/noL45DubZSkV
 3MJwiGTbcqsaKK/yPPJRr2FWqsP85kqH1HLATCryYkThtgbB6RB8lt/1rQyu1NfxUnbN
 goIWXM9Luq31j8fXJWJvsJcjvCtt3m72hzqbIlX0RUL3t17csVlVpjeRYqEW0h7ocohU
 xh9iUfNj9k3F8dJYEKx/0wXge7ZbJzsb8A1BZV7cliHe7R0HfDaugi3jwCsR/Ta07mXs
 bkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=ZcUGxpDrWPDmUT9LA8t3/LUNw9/00pF4bHTg1KheMnDw1n8xd8ICaxHzo6YOoMdg0s
 rzPfOLYO98FrT2NstTMDF8IT4x35aAHLzt4blSg2q2g8662cbjaXt/8YEJjszmF5X/zn
 7/RiFmbt8VSTPSiWWfMShKoHsMkL9p8EyNFs8IJsdc8fAaqXwG3n5JXxwFB+erZTu7Mv
 2hJxCwFFy5T6Uqb+A9Qw34SyOD/FG9+dn+hD/SfvcZcAMvbJNAOs2HfJefP0F2q/LFAl
 lJfY1grqIt+18W9CeLtujvkGm8oCwyEONUJUuslR3A6VdNPNr1yFtDaKup9hzCUTRcji
 9mVw==
X-Gm-Message-State: AOAM531GF8/Jzk4olFfmqkNqvvlmi78exELAsd1hGsKKODUxyWsmvBu0
 GfM+NSJrx0y5kEELzk5JlEEJK4GX58zwnw==
X-Google-Smtp-Source: ABdhPJxGUs34H7AK+A9lEB0UvJdnBc403MTN6uQX9FH+13SNhxQ3t/m1w0DA9oaa7kAhU6d5YvC5wg==
X-Received: by 2002:a05:620a:4403:: with SMTP id
 v3mr11305076qkp.383.1635787855866; 
 Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 42/60] hw/core: Add TCGCPUOps.record_sigbus
Date: Mon,  1 Nov 2021 13:27:11 -0400
Message-Id: <20211101172729.23149-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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


