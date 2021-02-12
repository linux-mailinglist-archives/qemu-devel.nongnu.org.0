Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A466D31A4DD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:00:01 +0100 (CET)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdfc-0002WV-JP
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVI-0001WU-33
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:20 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV9-0007l8-OC
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:18 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k22so319916pll.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=NAqieh+qsBpnwEhi/h4XWL8vUtjWq4PqQ3pKIc3+Rqcga8mAT2jDzr1xFlT+8hQuJj
 eySF3lNA6j/B81rTqCYp5DgH4pQFHxmJ4NOw3u0pCECpzrASWOruuP8oLycDK4ItSLVn
 76ZI9g7KkWCCLYf3s5EtzlyGlnSZ6l228GpQ46Gwo1QtWheZasgs5i38yCMXpMHTGn9u
 R+CGZdCT4KIBVSx8NIPsUlQr/ARQLY1uicSjJlh46TD4z8Lm0fMDZlKIPi4SPz6UQqva
 3iYsVeiowBfGxnYkfJGgfeCFO4DAZH1lpHcB0HGYrpwbDDf31c+QAC5r1DyjVH+lvZz9
 I+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=DH/4Ri7iFjJMuq9BjFrqmCUp+Ol2PJXFM3g2GDDgxRI5LtvQsGvPHJGZ5+mhf2Yfc9
 7SIihQRxXlZTj8Pj2udmpdXyxfrkVIR31/B0A6X6M7kbTWcINAoktFqLXpeRXe0ZWZG7
 n6GvkKpPG6ktZZsMfq2gwulS8Tlz+3souDxjHJ+cZUW8WloPoRgb7qDCtyoYpXbuPbp2
 jZUNKFHRLhw5zKpsx6GBFDYSsqmsN1/8x/XMp9LBUm/prce5SVrjJoMdb03auHcw6jew
 z4zv+A4RYYMK4qy6vd2m5YN7D/46Nk/axvxFnIqA1tRpEmj2zsW/HgciUvgplqcIHq2S
 tPdA==
X-Gm-Message-State: AOAM533l8Z0dMmo+dy+BcnIJXW09+7Fda2c+IAzmAH0YQYVTmCDGM6yj
 gvHzVzXVhP3p2fEO8J1oJ4lxh/OwL+lNog==
X-Google-Smtp-Source: ABdhPJzMCeTOF2rSBqhVBjyCn62OXwT/DN604zvvQ6gYOaVIfES1q/Qg808lws97TwQ3jdZbKUBFnw==
X-Received: by 2002:a17:90a:480e:: with SMTP id
 a14mr3793170pjh.167.1613155748613; 
 Fri, 12 Feb 2021 10:49:08 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/31] exec: Use uintptr_t in cpu_ldst.h
Date: Fri, 12 Feb 2021 10:48:35 -0800
Message-Id: <20210212184902.1251044-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f..3f9063aade 100644
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
2.25.1


