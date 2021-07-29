Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA183D9B0A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:24:40 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8umt-00006i-Bf
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCv-0004v8-UD
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCu-0002mK-Ft
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:29 -0400
Received: by mail-pl1-x630.google.com with SMTP id d17so4838058plh.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SSazR+OLe1mYGR1l/kuh/EwzjVq+4cKuEWnRJPsLgM=;
 b=Coy3qhsLhhJ9HJKXbfJWg/rovjsuW1vTIvj8p9BuHodbB2S0XoWPq3DnXhla5gOpnA
 vOPu323CczeCq8VyUrzUlvI1jaTWc2NW215pW4p8To6Dp1EelhDJp0gZVnd9pq7EfmiK
 VWEYOjkU/fkt8k6UWLVBDUaJ+s3gxE4tgYUl6rR7FqJg+r2/RtLf5DGHR7PXykQzNuAn
 85Rdd7Blk08PQTOD/OYLV9B4hkUGNRpXPp1dpG/B5oFT1++hYiElb7XAmu9+6IOqaSM7
 xoDXKgTs7xHfZQXNXUymyqrf+oNlgl3qvw9tF/H+vyX5HoOTvKOrDYg32iPL6hn7Ue4P
 kvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SSazR+OLe1mYGR1l/kuh/EwzjVq+4cKuEWnRJPsLgM=;
 b=uPp7fy8onhKbEcHoY3+cREBhbaH9Cx1Y9L/iTFHfKzyUUgi6V1HRj24Ec/PsutKJPm
 h24VPj9H5KcolrrbdoacL9wEVKw3/fRcGLlDDY3r9CvQgZydUZQdRfkUbKiMnGolRjp0
 59so481/LFPkry88Z5sDRcYoLnvc6ryRdDMBGB/4PHD0JBYYW8vux48CWfsu1C6nGOBx
 +A8B3pnuo0bLKxuoO9vVLJ/i9V5exRKTeUgdL+aYrrZ40YwMI+d1gN9GwLOovafICPio
 2Rl9GgNJUcQULY5xxznL3+ho2Ex5ecKKmQ234WU+MYZTi7Vc0IK7cj5qV3SMnlUSmxSp
 Ba5A==
X-Gm-Message-State: AOAM5334s5qWQJl2ovl8SwGgqAjZ2+yAKw9dcVrlAW5oTEUZiSwEFMRD
 iFIcJJyrPGvGF9N/Bw8dmx2h/anheYwrwQ==
X-Google-Smtp-Source: ABdhPJwR+Z0WLpifudJdbx/1uxSQT7X54sIPYEnjgL4Ksw2lB2pvsNzTKmmFCqisIqQuin4uub2mBQ==
X-Received: by 2002:a17:902:7c01:b029:12c:25f:be9e with SMTP id
 x1-20020a1709027c01b029012c025fbe9emr2121434pll.75.1627519647134; 
 Wed, 28 Jul 2021 17:47:27 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 31/43] target/hexagon: Implement cpu_mmu_index
Date: Wed, 28 Jul 2021 14:46:35 -1000
Message-Id: <20210729004647.282017-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is trivial for user-only, but still must be present.

Cc: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2855dd3881..bde538fd5c 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -144,6 +144,15 @@ static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
 #endif
 }
 
+static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
+{
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
 typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
-- 
2.25.1


