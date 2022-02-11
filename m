Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B34B1B68
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:42:10 +0100 (CET)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKwr-0004di-Um
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn3-00044E-Hm
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:05 -0500
Received: from [2607:f8b0:4864:20::42a] (port=34732
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmu-0007LE-0U
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:00 -0500
Received: by mail-pf1-x42a.google.com with SMTP id n23so13528822pfo.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCvTS/+Prs4N88DmcHEGIADFyIfzc+5Gdyad6hpKQy8=;
 b=pWMVzgsrOJKr74IepZfcfPEqYfdMlW2y4JeFd/7v2zYL5C5lo1C9RYr3s6mI4R1XFJ
 AgBDa3D/ALn5L5DyWJn9X6OQ+odl2zZM1MzCYwi8XB0JfPndLxQILXlROzhYZgaAi20W
 kyMIX48DZ+Dzue9Wz4m7sZmd1asw+5waAf++8znJNUOQFIAGSE0BU3eq5GOQnBwHbqGP
 gFXFnm3ce4yNMSCkd5WhhUgNmeZCfMkemoVc9oE+q/N43xIEC+5RRG1DVRPukQYTUGH2
 rKg4Y2M77opnJ444zBKaNHBqFLqJqrvIB9BvASototsJfNFYC2HbLNE7IoeLLppp2AoS
 stwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCvTS/+Prs4N88DmcHEGIADFyIfzc+5Gdyad6hpKQy8=;
 b=lm9j4P8Z1sNVMVlrNeeY+HecpL+WPHieUMQzoDXCkQc7n5pbUJMX8wRBM7gq7YPYWn
 mEgSKfYp9uOODMsRCuMKw0SzAPyeHwbztFJncUDBAJmBEODRCTher/Irn4K33R9+swTT
 FOZtVOvjf6Vwak/QxoEFQFdTaBYvbyGh0fL55WGgG2ec7WlL35wbjlGrcMUgy/slH3DU
 bwqcpx3UBKkhoJc83crYCiieSO8z2Zh5ki11D12BmoMciIAEsqN2wNQu6yKZM9th47fh
 uK+ZCzuPQzsuGX0S+CUrY3oo0F1arlFx8NCWAS5wy7HMWWOuxl3KK/uiXUaxbiHd0QiB
 xiMw==
X-Gm-Message-State: AOAM530GSJhZv/8+2szuqZ7k/fdVriqO0owYtERUAFZfpsHU6T0P0UB5
 wJam5viB3cCqBIMPWYhJhzigxkSkroxufXKC
X-Google-Smtp-Source: ABdhPJw7nHvSehaFvCrY2POrA/eTL3pko1NzhixrmImCNvVOyNZBMk9IF730k3JzLgIBVOC1ptGpIg==
X-Received: by 2002:a63:1b0d:: with SMTP id b13mr5268517pgb.50.1644543109887; 
 Thu, 10 Feb 2022 17:31:49 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/34] accel/tcg: Optimize jump cache flush during tlb range
 flush
Date: Fri, 11 Feb 2022 12:30:31 +1100
Message-Id: <20220211013059.17994-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Idan Horowitz <idan.horowitz@gmail.com>

When the length of the range is large enough, clearing the whole cache is
faster than iterating over the (possibly extremely large) set of pages
contained in the range.

This mimics the pre-existing similar optimization done on the flush of the
tlb itself.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Message-Id: <20220110164754.1066025-1-idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e0d0eebc3..926d9a9192 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -783,6 +783,15 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
     }
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
+    /*
+     * If the length is larger than the jump cache size, then it will take
+     * longer to clear each entry individually than it will to clear it all.
+     */
+    if (d.len >= (TARGET_PAGE_SIZE * TB_JMP_CACHE_SIZE)) {
+        cpu_tb_jmp_cache_clear(cpu);
+        return;
+    }
+
     for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
         tb_flush_jmp_cache(cpu, d.addr + i);
     }
-- 
2.25.1


