Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A67B440B44
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:33:05 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtA8-0005l4-KJ
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1l-0001RE-9A
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1h-00029G-0K
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 127so12335592pfu.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=TEcgx0ZuLk0mVfx3LHzcdtCguBL8HUedrt7ayH8FU7IeY5TySv/aQ4/hVlFBJKV7ef
 aeTD3/pTFrHfsNzBL2mohx73VAoFCpaY95HP8qJRvWeRFvvuuAZ3gfh1qne2BZr0lAf+
 KGykZnUhFcP4+AjJsDi7xfN3sgS9beQyIblV2sQQQehsYfj7Hu+FWmEqPJcbBmzvq+iA
 9xFrGwoagJ2TIkbmQIzPgEP9kzyT4gepOLki+p1xQjKtFFQxlAyNcB/28lgzvnKhKOIs
 JsKjISFm8oByM388BzjdH//WT/iAMvJGZu/9Foj+2FZsbWZCyFcq1oBeM8awjs/axilB
 /Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGec2V7sqBlJXZFFOVGa4jSeCFBEP3Km3jAuCBMCplk=;
 b=Szu12UtD3sSrWUhofXZ9Tq8/e5IVujF+WmRacJTGQqzqwmfUixTkAKuuZS8bejoacp
 cl1UCLCxbxuqeedWMo2OEQtwBZJGafp4G8KbTAkY/E/7nvRepb05XDp4WLx8uyL3raSv
 souwViyvIiC8aGhOcnW3S695QQNVHt1Q5i//VTo6fygj2JnNvSrieXYsPQxCmJ07oFcs
 6rFYTKTEhp84mPcjOZC0qrcttt11duedc/3QaMxZK+xeBwj701P1yaM60SQk2pzAYpPd
 FPRmN3HtKaPlWLuo5XouAqIvzuYstxuK8fHSqT0Se5gGuKMALdYOIr9wpLZ7CNVfeUTZ
 VHow==
X-Gm-Message-State: AOAM533xaQ8imB/5ojFSOFEL7e+BzJQlOE8a04IaN7ugeHvhlT+8/oKe
 m3fLzsRrOSGqcGrnw0cEJIy7AnXbj5CvMw==
X-Google-Smtp-Source: ABdhPJxXridwUano5oqeE2ZLa+MAEU0u8vqhv+FaMExc0g4NotOmMN/jfNu+weqDd4B2l9maXbeF5g==
X-Received: by 2002:a05:6a00:1ac9:b0:47c:236d:65f1 with SMTP id
 f9-20020a056a001ac900b0047c236d65f1mr18567124pfv.3.1635614415708; 
 Sat, 30 Oct 2021 10:20:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 42/66] hw/core: Add TCGCPUOps.record_sigbus
Date: Sat, 30 Oct 2021 10:16:11 -0700
Message-Id: <20211030171635.1689530-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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


