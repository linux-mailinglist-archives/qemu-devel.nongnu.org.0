Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EDB3D73A2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:49:57 +0200 (CEST)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Keq-0004fn-K1
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdC-0001xb-F7
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdA-0004wZ-OF
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f18-20020a05600c4e92b0290253c32620e7so1302198wmq.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XgMOQ9Ss4JDoAEWFMiQANwzLP5WjR3DsnYhdpNBuwd0=;
 b=GPoM2rXxUQpj+5GC+TzF5vMgCbS7Gqx+HVoEgAJygRMqPtczAtFbkHroRtUyE+W3eW
 maVRuCDq/GmvylSzoiflRTHhBmwQpurrBG51EjkYMJ++bfPSNDPCUe7IEDg+yFizMkk2
 3i52wgYetN4sxALtUOaIC7v2po6DOnRSeJwd51/9VeuOt0Aa/dgC9W0IWM3Jz15/OdWr
 dPpUFeG/Ql34juAMYy4aM6U2KvytFZjHirqJCKCVycJoQNe2gZAQKR4DwxqEoNtO+RLo
 ZNWKtpeJl/ZVVu7NUZ/hhJrn/fahABUZ6KQbkV64mvGwm7PA8p+MwZlQlVcO3w/cU83n
 cMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XgMOQ9Ss4JDoAEWFMiQANwzLP5WjR3DsnYhdpNBuwd0=;
 b=h9HYaXXtR7B4VAgZpl0FVOJyrRBpzKb1bx2tfQb7zR1iY2oikW53RbaDwqgRmkTwqo
 E7ijt6MEeTEofTbIdBxHcXgyU1ozuOv7yjdYRQnnzdj2nGJi6T/poJURkAnHtIJnYwuR
 m67iRwtJlR/FMdZZtDwDAHisVtdSpcnmUKvJRiL/z59DTq2HjRVpN12u6QyxcEZezvHe
 rEOxGUM65bIRRXSbtmODlT8UW/+COnxcHArJYbCX4HGvU5t+XAcNyDRfXWwvU/A8SO2E
 +RYJ9kWhA3RHpv3HASqr3Z6yTprjlYocQxCiwCGbz5RFqYccBgl5b0bB6/LTme41749z
 yQPg==
X-Gm-Message-State: AOAM532pjyLhEDYsr8fd59iqIJ8j1BJ6swsV/TPBtTD7hFitE/B0j2HW
 Gv8FG0mQ/lmkUIuAlEpXJuEfj8QI3GCr1w==
X-Google-Smtp-Source: ABdhPJwil4V7TjZRTaNrir3D43Qm5K5XuyKbpRbhrR+vJH1s2zgPv39WBK3K/LMsDBDTlcue+nalYw==
X-Received: by 2002:a05:600c:190d:: with SMTP id
 j13mr3325294wmq.6.1627382891238; 
 Tue, 27 Jul 2021 03:48:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] target/arm: Export aarch64_sve_zcr_get_valid_len
Date: Tue, 27 Jul 2021 11:47:58 +0100
Message-Id: <20210727104801.29728-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename from sve_zcr_get_valid_len and make accessible
from outside of helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210723203344.968563-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/helper.c    |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 11a72013f51..cd2ea8a3883 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -177,6 +177,16 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
+/**
+ * aarch64_sve_zcr_get_valid_len:
+ * @cpu: cpu context
+ * @start_len: maximum len to consider
+ *
+ * Return the maximum supported sve vector length <= @start_len.
+ * Note that both @start_len and the return value are in units
+ * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
+ */
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
 
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c1d8dbce36..155d8bf2399 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6457,7 +6457,7 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
@@ -6489,7 +6489,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return sve_zcr_get_valid_len(cpu, zcr_len);
+    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.20.1


