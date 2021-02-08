Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A431294E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:24:41 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xAG-0004BM-Ao
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSh-0002yQ-Hj
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSf-0006Cq-7B
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:39 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gx20so7943328pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KjNyz2z06X1nzffKUJIUfEvh2+8GuNK8mnSHukJjZc=;
 b=EyS5RtXdu53W1EcUD9CnTS41D013uMQwN/eqZzRcjoa+b31jlow16/QEK7HkX2PlxD
 Fbfn5ll/ivHaz4wJI/bp8f+UYhxsRcHJbELppnhF/p1AS3Bj8+Iq9k1969N2WM+WkpaW
 cJQIZF1+qnt8hvzzd68MPRiW2RfCBq1YOHHzD7Ku5I+pk3s6rKDUrrZ/+PVffjQNq56m
 4JH2zIbNgRdXtxVlS8nEKiiY+zgjuMEwILwRplJ2HCq3KSsq7mdLuL8aefdbJpELlJPp
 9z6zm7UaOSRQbko+5Tk18SM0Oh+vVhUNvx6UicWq/JrNBjz4TWzfJkNo+qDMEc2r6W65
 BYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KjNyz2z06X1nzffKUJIUfEvh2+8GuNK8mnSHukJjZc=;
 b=Uz2l0/xTxuoAZQ4t7dUPojsgLNpMsGADcVKLwhyBLnaz1mznEHbwKLG/JlVvZR54Id
 qR2kD4mrzdbARkcxOkJoygUS8XjoCV3nrV0042mIfBlXJjETyIHMbg6ysrwaM7YQyz6R
 V6eyCTl0vB6dkvYkiu/GeGEPy3RwfvE3HSrkfIfCDaCebW+LrNwt/RqYhfWph84FOuba
 Dei5kYGbgXy02BNpQDpM8u4dfo4U+edll0N7co20s06Hy3FOHinsubK9is/+i2viAHqZ
 ynkq29DRZAZTWM4fb5UHMwqdM0/1DRcZ2CZxga9VALlsTlUKi+/R7GtDRBanWIdxYIIG
 bpdA==
X-Gm-Message-State: AOAM530/30VoVLKPESCCEqYBvnov4kgcH6oRUL+r0Zkx3tauTbyAtxDT
 xb/Id6MZi7yObk2fz74c1boYPnwTa4qO6A==
X-Google-Smtp-Source: ABdhPJz/dSks42GzfaWD9Ay7JzTjTXBvSEI6kYxUDHuj9hxAbl/RQZ17+BEAg9U475LDk/JDQVUaoQ==
X-Received: by 2002:a17:90b:4b02:: with SMTP id
 lx2mr8150869pjb.178.1612751975961; 
 Sun, 07 Feb 2021 18:39:35 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 60/70] tcg/tci: Remove tci_write_reg
Date: Sun,  7 Feb 2021 18:37:42 -0800
Message-Id: <20210208023752.270606-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e7268b13e1..4f81cbb904 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -36,20 +36,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


