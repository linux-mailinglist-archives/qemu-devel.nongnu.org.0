Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1194B1BA7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:53:50 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL89-0005rb-NN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo6-0005Uk-Ig
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: from [2607:f8b0:4864:20::434] (port=43562
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007Tx-2h
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: by mail-pf1-x434.google.com with SMTP id d187so13456910pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9IlxASYWdMKhZxsDfqVFvhQfn78zXXAMRB1dUwXGuQ=;
 b=UlIlf16oOuJoFR0t7BqFNOP/xcfHzdiK9LLvSkxBjqbjQkUN4WW2ZkWpgx2HlULufB
 35ZEQATtQOUmjGSRvmLgBvSWPi+DboIMj53FAJqk4TRC57V5NxBSajW/vek85vlhA0QJ
 UOlqpp615uwKCaGJeApPHkIgLJX7WjO+9SQh5nDr6krJC5Pezhuvsb1BRh2ds4Q6cfez
 FGZwztoNYnZEdI5DVOgbtrsxpmezgOUfU4MQFwK5qu65t12oyM2qUNwlMH1lYc+2YAlB
 Wa0x9WRdflGMXS1O2VqrRsS4YbiYgvTSlFt98XeUXUSeWBzrTcbhTXf8W27WTLsg90cP
 ipew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9IlxASYWdMKhZxsDfqVFvhQfn78zXXAMRB1dUwXGuQ=;
 b=IhxkulpgfhUsiqws6sMElSoq5bSN88ItMNIiVujT5VWMmtvkZ5dhrhQag8WjCYrNb+
 X8HAQP7IXI+02ktdlrxLMRwecywQrBRdNUfeXOgtaXW/jiC9zrDy3s3bxOv6QI0Nzwg0
 UnAu1RIjJ0XZvWSkWWUXsn6IkeO+OF5QTrKFSPQvhY1udlgLb0cAPw9HJMPx2XDkMe9Z
 9HaRkgr651ZhD1gJGxbQhOprKaeGFU/J7UqHrI1rlvYkdOXCB9S1RIJHI2XRafufmTOz
 IgVc644Ddxd15BRvLy/YEgzwDpo004p58Hdylx8ndXZIBbJmw5Hg8p/H7lYMbfDHDFkt
 DiNg==
X-Gm-Message-State: AOAM530WyUuLnlruW1BQPZv28e8Aa9choNqCGh9lu9rh2BAOXS4JAofu
 ZUgcCO48tFMMMPG5aHUc8Q9LXmp09ajG5aja
X-Google-Smtp-Source: ABdhPJwYjMsuT6Ny8dNL9xh0xSXI+tetECsG1bPKTaDuFaHhPfMheWaHkJi896uUzUgtYw8ZVLyMJQ==
X-Received: by 2002:a62:1ace:: with SMTP id a197mr10230551pfa.63.1644543167626; 
 Thu, 10 Feb 2022 17:32:47 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/34] tcg/sparc: Improve code gen for shifted 32-bit constants
Date: Fri, 11 Feb 2022 12:30:54 +1100
Message-Id: <20220211013059.17994-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had code for checking for 13 and 21-bit shifted constants,
but we can do better and allow 32-bit shifted constants.
This is still 2 insns shorter than the full 64-bit sequence.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 7a8f20ee9a..ed2f4ecc40 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -462,17 +462,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
-    /* A 21-bit constant, shifted.  */
+    /* A 32-bit constant, shifted.  */
     lsb = ctz64(arg);
     test = (tcg_target_long)arg >> lsb;
-    if (check_fit_tl(test, 13)) {
-        tcg_out_movi_imm13(s, ret, test);
-        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
-        return;
-    } else if (lsb > 10 && test == extract64(test, 0, 21)) {
+    if (lsb > 10 && test == extract64(test, 0, 21)) {
         tcg_out_sethi(s, ret, test << 10);
         tcg_out_arithi(s, ret, ret, lsb - 10, SHIFT_SLLX);
         return;
+    } else if (test == (uint32_t)test || test == (int32_t)test) {
+        tcg_out_movi_int(s, TCG_TYPE_I64, ret, test, in_prologue, scratch);
+        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
+        return;
     }
 
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
-- 
2.25.1


