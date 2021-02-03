Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D775530E329
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:21:38 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Nib-0004jh-VM
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOK-0007FX-V8
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO8-0001Y2-Os
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:40 -0500
Received: by mail-pg1-x52d.google.com with SMTP id c132so393813pga.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=Dn4NrvSlD5Wc8XuliQ0uS/M5JLx5yDp8v/YOLQdzU2aXobGqP57XatSTTy9rpRhlK/
 WGGsSj/YsKvnmIEnTN09yb/OFmaG07FUXwkvtAIKaf2zIxmoETJt4hdMpsvLKWXnAB7J
 CEDXd4JEszREQDX9j/olQddUEArLw6L5c5+Hj4+yrieISWxAfxIH9LZVIkQdbNQU6hUF
 NEC6z7LcN/jqxRvDKI2U4B0VUj77fKL6Ug9A/roX9RIT01BmjHEcU+YX0rc36iPUWcyt
 /AGkoUKWCVVszsyBenPXlnKCEC887GYHiZT/06FQQ3SWOLHuoONQy0eOs5HqWoF0lHZv
 7lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=W2OEHrr7irmZHYKlaDe8JT6Y71WpZnSEYKAjzwU1LMk0igjsl8c8LBlvF8b4HBQdBB
 33irbIFVwaHdPo0SWEQxItbnZ3dzVwFcgRwWqKb9rLchEL1sBYEjDpbnGqjrAxJgvzFH
 hCyT8wAhi3j8JkJvwNKNH0n2lpogDf5PplKH6jlKxH9m5Mud/J/sq1o5Qk5zp6lGW8QJ
 8Jr7UhC0zVL/FYTKXkD9hCekXA2ctIVzRWn2JhRbNXOhwfybIO0CddlBfS23p6ULdBW/
 UnM6pBc+UKf2QOiJnWOmijA2lDNO8sVqBq0mSpECcbpaWEhkwbkSZrDDkd9tPBvCbiML
 wsDg==
X-Gm-Message-State: AOAM533L71vLtcQRsKGh3Edo8uSOmJqVeqWzkyaAVZko8mh+ICd3Lh8G
 shli6ohzPZrlz/spKLiZtialixCLqa1DUJdD
X-Google-Smtp-Source: ABdhPJz0YjafOfpAoba7aWrz5ErC9sYAbn3GhwjCbtgXYLIicGpbMzFV6e6xM6UWbSwdY5IUHnz1JQ==
X-Received: by 2002:aa7:9d0c:0:b029:1bd:1e1f:8885 with SMTP id
 k12-20020aa79d0c0000b02901bd1e1f8885mr4468954pfp.48.1612378824321; 
 Wed, 03 Feb 2021 11:00:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/31] exec: Improve types for guest_addr_valid
Date: Wed,  3 Feb 2021 08:59:44 -1000
Message-Id: <20210203190010.759771-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1


