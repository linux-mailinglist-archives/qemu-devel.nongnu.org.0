Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000731CDED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:25:25 +0100 (CET)
Received: from localhost ([::1]:48274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3AC-0008LB-V2
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32U-0007CK-0L
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32D-0002Nw-0a
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id v14so13772300wro.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yx6GjGifPHZR5LcFBsAiUTfVfcMj2IHIVadIskasFHE=;
 b=tasx1bAQO/VJ/uXq0eiuZUfnLBeqxjhcfxUfZmGnRmSdOUQyo/FbYMbAOGzexDEn4/
 kSyGDgK8iYI/0dIFx1fBAZ99qqPpHXTp1CZIk0Q5mDxgkSXcoo1IlNVgU/y3JKr3ciwG
 4mmEn094NmAlthXWnhTY3nPGNqDKuHVyGQ2ed8eGyGS/L6dwHaJgt4tUx54VjdgGDmsI
 wuPXZ0ULa+z3/0O+vuA8UOTyJL+xSW7p4lI2LRfi/5i+117W8g722BkY+kSpKvxi5sYH
 xQoJRR3NvMq6TyarAMCBmBkDVHG0Egn/dH9efC/Gq/cwcIHaWgvfdcWkpHEr4QxbFLLb
 kqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yx6GjGifPHZR5LcFBsAiUTfVfcMj2IHIVadIskasFHE=;
 b=gMEIAQbo49uBnb6yKEiR2CS4D1Xw5A6zdvsy+O/fNuGBcbXTKlLDRvOL/6uBT/V7XZ
 EE4sPlGL+heDIG0ykPDx8K/TtlNHjpHmQuXxUANmXBjw4vVXsrYawlT5iNdb3H/a0tFb
 M2wuuEnxYl7vna03o0vBZuwv/y1go3H+ychYA73Ui0Yx+dOHH0AwC3ssWwvqiPtGzedu
 H2zExPrMJhMYfmReII+d/9mQ+eEj2E+MBYz1XNkC9cZXQ6k8pK/AMgob6tR3s5mLdahu
 0mHy3vy8dD4I452Jop3bnT7fN6IvO78jtKXRT9UagyGLnMgyZC1n7k7v/pk6OpozsZCe
 iHKQ==
X-Gm-Message-State: AOAM530yKl5GQvqn7t/H6GvEbufkKLvCo62t7hJqvHEyY3d245Lseasi
 PYyC8bFEWF+JY/f8SMd8P2GT1tq6oTqMpQ==
X-Google-Smtp-Source: ABdhPJwWk7wNW2T1T+ExEkGCXjDlKvaawuLWlptPZt+g/nLbil0DTSbnT0iX5OjWav2Y7ZedMinUog==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr25315049wrn.146.1613492227544; 
 Tue, 16 Feb 2021 08:17:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/40] exec: Introduce cpu_untagged_addr
Date: Tue, 16 Feb 2021 16:16:29 +0000
Message-Id: <20210216161658.29881-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Provide an identity fallback for target that do not
use tagged addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba001..d9dc1de414a 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,13 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-- 
2.20.1


