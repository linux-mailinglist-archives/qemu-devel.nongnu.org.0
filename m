Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FB30EA7A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:55:54 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UoD-0002T1-3b
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tsm-0000oQ-Oi
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tsk-0006wR-6u
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id e9so909162plh.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KjNyz2z06X1nzffKUJIUfEvh2+8GuNK8mnSHukJjZc=;
 b=y98clrTjWIslQr7/0N1ZO/1eufhFRNXArBMNDrLF3Dvpv3FwkLYxxJ8qNZ2eMJ7PcS
 8Rz5a93IuM8lRMEPPCWrg8f+QHcPDfavmyLcj6EUxvx/sW2H0iLvWDR3Mpc3h/oaysjk
 mnvLqOh5CGSfrIr13WD5hAL44ooylfq8ZXuhH00yd/8xDlTrmKoKhNdQtKshFs5tcpTB
 smem7YenO9FjFc7xQ1M5fac9KYjTziXY7zzESgU5R14Q/2Xox1RykGpZekn7SDPuhHkF
 SYmuYIXHx5I01NeVKL/78JKeo5FdGYXec8Apb4BOSNO2HzN4+pNzVnB4CvPm/PUzSA7k
 Xcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KjNyz2z06X1nzffKUJIUfEvh2+8GuNK8mnSHukJjZc=;
 b=eeV1FujTDTBSTnqFxcYp3HRV+ElAI3GYJGKI9+oIpcgbyEqd6gJEiOfKwEjsZFNxRR
 gK2GAx5rQEmJqH63qygAPmOtzko9Y/OfIzRXhEBuBg7pGButfQ38INxLTHdbScihHweJ
 BgFvYswRWT60ZJXXEEHym65zfJxtWeA49pJAIElKrqi7NVPqhfGlqN8abfuoSQuAboqj
 vov4NazwJeD7vR0AXZuStWPzEnaEAUDTxqccPcUdHm8OX/oV87rIG0+DixkyM3PdZM3k
 l+cTomCjcYB2+wVmnXP/514BLjTSMmYWuPimYEzFcetY99PybQgOS6PJNBPJPulmlLb1
 ZajA==
X-Gm-Message-State: AOAM530tYpm9c6QI1uG1OST/9DzTojB0xAY2IiK0ZwYsWGiwvpQJiW6M
 iottn9thZfi56urbIJBCI2L0wu6tZ+HfMH6P
X-Google-Smtp-Source: ABdhPJySEGL0NvHgj7Bjbsj8UNW6yDvbXeJkrieXBMwWacPdOfIz/pf9KoiFTeXDlqoJZQpwMwfyBA==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr5947807pjr.178.1612403788981; 
 Wed, 03 Feb 2021 17:56:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id a18sm1432841pfr.220.2021.02.03.17.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:56:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 85/93] tcg/tci: Remove tci_write_reg
Date: Wed,  3 Feb 2021 15:56:26 -1000
Message-Id: <20210204015626.885554-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


