Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC747318BE9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:23:28 +0100 (CET)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABwN-0001mc-QW
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ2-0008Di-P7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ0-0008Sa-3I
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id u14so5650087wmq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cQDWIhDilC+yNy4j3Tp1pvBrVTMvqQhhNRHgD7iTmbc=;
 b=Kf1zQ9i9GUhpktYVj1CTgj/HT0qjH4qSNOPQDk/xq/Jy6hWCN5rL+swqw42t0UiQ/Y
 mBCukuq/mJkJVr9439I4ypKGjsd0jbhlfyBmIt7XHeedE/530N0qjtzDHfRuo2pH8afF
 OsIl2Oc8PAcN4UsHhqjf/cp7z9vYiS3JITW/7La9CwoXMyXnnqYg15DNlHUM6WOPUMmS
 fBsTj5vOZPe9JuVGM2YfGa/A0kidaMnIEI6LQ04SC+3wnyWj8pCwR/uFkzT4sB4V5CjK
 9q2SdN+hC7Pm20zsqdBj+Nznq+8x8ma5n/Ucr+TWezhPoF9cudNb01xxqzGpF4gRCv6G
 vn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQDWIhDilC+yNy4j3Tp1pvBrVTMvqQhhNRHgD7iTmbc=;
 b=AhxyCO2dAdmwsCohiuTBjPrml79xa/GxuSKu3AlfxtlEt4vgcTltNdsz+l5YP6D1hS
 rd8+9E8P6UBzj2simQM+w6LkzyGAFN0XQZtJ6wPrMHN05l+JxGfKyzZPQt59mPzpMB7c
 Rv/TR3/8dgFDiNHMd9rO3t1hcv6Z/4p79KHhNhFQzlPzu6sTwhyEOSPs+PlywV1Cf3SW
 ocNvxt1/f6D5mI+VxgumtEmDy46gBPTgGpw4QH9hhUIvf3cayb5nksvxDuvudjQhuCGY
 FkWrkvlYtSs0x5w+A1QOjVyQL+T4rkDZBBbY5diklN4gOCxFe5uYh6Y0M8J91EAObzBO
 AQCw==
X-Gm-Message-State: AOAM532iEYx/RP2DuEjGFMvr+2c9C5/X+DFvb2UEenWdKJExsZF5XFY4
 2ueMqLhtrq0NBDo6/g7SEWF1ZLW6ciE3wA==
X-Google-Smtp-Source: ABdhPJxRpvA05Iv/nwxnrGuwFTxH0mzQWpBv4+ODIIn1FFSev9pRiYtXUWbnNSwrAcL1h2EVjHWz/A==
X-Received: by 2002:a1c:3cd6:: with SMTP id j205mr4995120wma.166.1613048356762; 
 Thu, 11 Feb 2021 04:59:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/45] linux-user: Fix guest_addr_valid vs reserved_va
Date: Thu, 11 Feb 2021 12:58:34 +0000
Message-Id: <20210211125900.22777-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
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

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d5429..e62f4fba001 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.20.1


