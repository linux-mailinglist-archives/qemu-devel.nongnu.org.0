Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A95488208
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:12:20 +0100 (CET)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65tj-0001KS-PB
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LS-0005dX-P9
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:54 -0500
Received: from [2607:f8b0:4864:20::432] (port=35529
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LR-000475-9u
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:54 -0500
Received: by mail-pf1-x432.google.com with SMTP id v11so7102997pfu.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm/3m5hyAUdcKM+wbinoSBlpdmK7ofC9QaoVC3ISJrg=;
 b=u/mv3dUB3a7pbw82qL10Fs39mZinB29WdW1u+VaBalJzfKPEAUmPwntiwCAYA9bDXy
 D47yTH/SasLl+j9RLiqjbprHWxZQN0eqwFEfesiKORkvxg7o/C2yrwxIodV75J68qbO9
 byQIXGffLkE6QNhhQJfAX7G0FMSNlmcY/wE1xI000yKr8WadXW67HpF3Ui95ZMcjvZAh
 9qMkZko5/teB+V8A5WqQMf/CnATn+SU4Bg+Z9TnqElROAfr/pE3a7zsHtIVfoQYg+kAq
 l8qY/uEeeadq3v79mGr598z6b1olZDCS1TPiBoeEo2gwwnOUE14rO3W7rB1YQwItlRPd
 ch3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm/3m5hyAUdcKM+wbinoSBlpdmK7ofC9QaoVC3ISJrg=;
 b=qOqiEMiZfehJIwEwq2LcvDbNebo7UNWfBEBSa2XTFnpupu5OHJwbA3jbjeFD6pU9IQ
 3CSi9LslxHT1GT73E6+vD9g5qNwbIie/0QbTzhXAEAco59i/hFNMvbTDbsxSAA2WY8RK
 TcqVZnPBuuRK8dGJt+D0NhxGpWGj34ZqBvGHwN8fVg52eTTLqc0/zzIVD9/zU213O4T7
 vrRU34dbsyGxySZzviBKihRXbH+PObKUzkl6FEkdn6fI8jdPT0OvzlwKOF8PeAewPcdU
 uYWSP+3rDw1Tzq8da6pLWzuCRUMhGctZf6dyA4hXpSKDVimZS6rs8Tc/JDyh0KUr91Qn
 QNDA==
X-Gm-Message-State: AOAM532yrSi67tc2s5mXDq7jLB1scyeBLwySNyTvKjg6u0kZoRA78yu5
 YVfKqX+TP8Agu7Xf6mzqB/KUxbp1BHsbhA==
X-Google-Smtp-Source: ABdhPJxh4y38xNIPkfYVa82ScKutBfd5CgRcxlKymO5QqtGwCjHBouSoVWJAl2AnpQUxph8jc6AcnQ==
X-Received: by 2002:a63:3606:: with SMTP id d6mr18472282pga.486.1641623812017; 
 Fri, 07 Jan 2022 22:36:52 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] tcg/mips: Move TCG_AREG0 to S8
Date: Fri,  7 Jan 2022 22:36:35 -0800
Message-Id: <20220108063644.478043-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change; just moving the saved reserved regs to the end.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     | 2 +-
 tcg/mips/tcg-target.c.inc | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7669213175..28c42e23e1 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -76,7 +76,7 @@ typedef enum {
     TCG_REG_RA,
 
     TCG_REG_CALL_STACK = TCG_REG_SP,
-    TCG_AREG0 = TCG_REG_S0,
+    TCG_AREG0 = TCG_REG_S8,
 } TCGReg;
 
 /* used for function call generation */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7682059d92..5702a6ad92 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2548,7 +2548,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_callee_save_regs[] = {
-    TCG_REG_S0,       /* used for the global env (TCG_AREG0) */
+    TCG_REG_S0,
     TCG_REG_S1,
     TCG_REG_S2,
     TCG_REG_S3,
@@ -2556,7 +2556,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S5,
     TCG_REG_S6,
     TCG_REG_S7,
-    TCG_REG_S8,
+    TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
 };
 
-- 
2.25.1


