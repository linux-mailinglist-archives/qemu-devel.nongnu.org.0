Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4730815E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:49:16 +0100 (CET)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G6F-0002z0-Kv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzE-0005Rs-Rk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:00 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz7-00085Q-6f
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:00 -0500
Received: by mail-pf1-x430.google.com with SMTP id q131so4956493pfq.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=KNlwAW2OtJHHam3IQR/lsRk9Kkd/FHpeb5a/HSmXLS9KqdjNR5vGwB1AsZNyaQbEx4
 HDXyNpvJTBMpL+DbLBomdUgTMjz3h5LZcDP0959pMNRP6UGQGWiqb0jKd5mzZG8HQciB
 CFhZEWcZ7u9anNLUUiCn8Uw5X3Hg/t4GwcWfW7wQmgiTWujJabCl2/p2TtNOMOrbyqlZ
 WqZ4nyyKgTgLVQfUZok5n1h1lp+QIhlg6W2sesBuflgJ5x+6+AnKdawZtdFtw6ZNlphg
 jFMfBZQc5g8GPcG/pcYhfKvXsUeJNO/1NcegO1td/u4W4r73BWFfRlJk1+YnD5l0tdgI
 P1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=FIaCpXJi9/ainwTsfEKogWUGKl9ya/5vE1VPAYDAVb6VMQTsmsiumffJOzTopzrTlW
 aczEQK73aSFZ3+viJlMsOlG3yLI+lVQ4EDp/bYnB3OPApVsXu1HX/fUyaBqPwJImMw0s
 93YWTBiUY9O4Rf6fbT48taAhvsWP9L8QG3xZuU0hKPMFZRZ05vWbnWZVYMK6YFpBV8uu
 OJ0qJ/uvLxr+YKF0lSZapKSPDOmrIare8CUi1w64R4JMeHjnS0v6AycicESypdjujjao
 zKUxorwnzS0au5cqVvw0a0qSC7EBNoG5mnl1dF3OAX/ZCdryAtctCezQHJP4mkkvTxjs
 rOGQ==
X-Gm-Message-State: AOAM533WX5C7RUcHavwK2sauhbYoqjGvUh7Z//2E+64SG13+VllSEBU6
 Vudd4pIOGRtQ67DzWVZir1EerAeHF2JRl1WX
X-Google-Smtp-Source: ABdhPJz8RLw1G3hQXRoCQgl7Vd2e7FPt00q/y4DCoI5jZC6TLHhL2i/IY7wuDe9C00oRe5TFnl/33g==
X-Received: by 2002:a62:5c43:0:b029:1bb:9418:b59b with SMTP id
 q64-20020a625c430000b02901bb9418b59bmr1372979pfb.35.1611873711385; 
 Thu, 28 Jan 2021 14:41:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/23] exec: Use uintptr_t in cpu_ldst.h
Date: Thu, 28 Jan 2021 12:41:22 -1000
Message-Id: <20210128224141.638790-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

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


