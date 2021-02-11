Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10787318C1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:36:03 +0100 (CET)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC8Y-0000Ig-1u
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZN-0008PJ-Ty
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZD-00006H-Fj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g10so4124581wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sf2dRC1nXWNSxf2XaqvYBqRftdGsja8cK/Fq+AxntmQ=;
 b=Fc31CuyUzmKJ85tLOKWXMlHchDWupR9w7ntp3l46XQeXLwTglRN7kP/eLbdT3Wmg0L
 hWsGCJZ0JtqdiQZqhdHWS1eJU6xJBzCGNu7+u/kHiyBtRTI28KcIXwERiF0QCcBp2pFV
 VS8fYUOr++c5YnW+83bKwznSdRJ8if/D2xMCuUGs+mg/J9tzD9voeVOR0Hctp7bhevpR
 xWMUZCHPT47PqVBbF57x+i6K1a0j8Cm1zHm9+245wT1vC0WIhUzzCjMQg6+Ct6E/Al1i
 CFtoy/MZboIOmVYKRs6kStXWwVsxUJIZlwlRIz6IyMOXFQ+xwnHz1eWJEqE9qndLrtNO
 KISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sf2dRC1nXWNSxf2XaqvYBqRftdGsja8cK/Fq+AxntmQ=;
 b=RDX9UZgcqlA6NP3lz+aDyCH3AibTEgkcIrw28OTemgKXiPgrrEiit42Va/tZP1DvVj
 vL/6Zw0lLW3w6PrG4HSCG1KExFSeglWYP1OQfQUgitmMyyVhcEYtRWCCKhQEgL4F8u1/
 MxJ5evPd1XkwxRyAOTaXtCaoskmIVbqtMnmMudc+kTBhulcgRg2ECAXs72xMi5rNoRHn
 vZFjlxuwvd3yYRJ1MguhG8rlihxAejku9IGmE7BPnekBWD7E+x/7/zoIgftXBoOwOcya
 3NZHd2pT+4fJY0XupQp9vuJ9Ozr9+CfXc8KTKkoTkmiJIzaG6dNytDyMOF8DutjWJcIR
 8jNA==
X-Gm-Message-State: AOAM531wyxF3jKEqWZTkLYzsLN0WGVEbFloc7t6fo2SP3m4qhxP9Tbbm
 LVev+V/ZFInE+y0kB6bD04sg4NM1O6AdEw==
X-Google-Smtp-Source: ABdhPJxJoWhE3uhQz6ZLbsxthb7RzS3wNkRBcB9RJWjQZVm9WLbVerroUSHDW8/xzeq3VPE1XE1glQ==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr5771680wrq.51.1613048369794; 
 Thu, 11 Feb 2021 04:59:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/45] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Thu, 11 Feb 2021 12:58:51 +0000
Message-Id: <20210211125900.22777-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-28-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0f..777fb667fea 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66a..b6a2e65593f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.20.1


