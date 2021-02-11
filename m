Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27A318BAF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:13:47 +0100 (CET)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABn0-0002jU-91
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYx-00083G-K8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYw-0008Px-0l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i9so5656930wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4Zl9k+RBMwhw8/WWyjo+oRnYDhbgHyVsV5EaC0rKvvc=;
 b=S/CYV782LDcyWg5f8OK3hc8hRSN1iVm4P9f+hnyTPLj2LxqL5C0R3b3q+tKdJeDS3K
 KzTMxMFl2Mf+3mbv9sJ8P7Cpd1jfauvxjgVwiJ5vKcxlOa0hwJQ0ZPgg1lHXG6fZVm3r
 xh2+m1qdgH/c2CTE+CUnXxeC64koxnJXBrcRH2iDC9fn9Wxksrgl+WxBZAZPz/8ymdoG
 Q1gQgyM4BHJb4azu9HdDMvz97uQnN4KU02cHGYQTAsNlUqc/up2k5485OlVRIdDb0PaZ
 V9qjnkPrjL368PNIKh7xUKmzC1rvRTDMLtyORY6MwkLc5XSFZpXX2FgppjXWGmvBgmF0
 oQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Zl9k+RBMwhw8/WWyjo+oRnYDhbgHyVsV5EaC0rKvvc=;
 b=UDxuY6aaFS69Ct2kwUIkoB1cB65u2RxWRnIDKStykTLEaCaer3VcHY5l2Bk2O6EdyX
 VwZK8ugoUblZHizIb5etZGGZtjrCniVrRg6qMCQKUTc+SUL2pW0nnREYGCbvwjaSY8Dx
 RaKdOzjbxJJuXGBwPvnW2kksdijZR645VaczUAqlL/FZrNUvW0Rf23PMC5YBvxU2jY7Y
 wf0BVJZkiuFiOltFkahD/fJOfjNLbkzQq3IkOlC4DQg1G0iZ8g6rUKutE4m0gwGJureO
 QOy8zexmHlrxBu5cIDbhgpaCY35bZ8+DtPlpOWbCyvcRUBDNTxLS1YxJgXdPutaf5Yl1
 930Q==
X-Gm-Message-State: AOAM532oOKfy2y05EBjge+a3tRqp4hw9HhrfZk/82sa3EwKRCZ4r3Bm+
 axRbOW8s+7LCQI9H9TqF3R7QD6SxV944lw==
X-Google-Smtp-Source: ABdhPJyVp0+rceGyyOSU2Wc/Frrrl9XMMNAIXr3Rr40J7/VUetLo5YCqKcRdDVtsogPXkBOAWDEUOQ==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr5128926wmf.64.1613048352752; 
 Thu, 11 Feb 2021 04:59:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] exec: Use uintptr_t in cpu_ldst.h
Date: Thu, 11 Feb 2021 12:58:28 +0000
Message-Id: <20210211125900.22777-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f8..3f9063aaded 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,14 +70,14 @@ typedef uint64_t abi_ptr;
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
 #define guest_addr_valid(x) (1)
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
+#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
@@ -85,7 +85,7 @@ static inline int guest_range_valid(unsigned long start, unsigned long len)
 }
 
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.20.1


