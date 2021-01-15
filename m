Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E702F8917
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:03:31 +0100 (CET)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y7u-0000t1-Cf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsG-0003gn-SB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:20 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0005G1-Mw
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:20 -0500
Received: by mail-pf1-x429.google.com with SMTP id b3so6421144pft.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=LcG7qzDJHtDNdykP4TizHyjuonvDePY1rRb+OzUOPSISfOdv6f99MecPmI4SQFsF/+
 nl8ZcxYvz6Y0w6HeI1ml2PWZrOym7gftokPucD4W7IZ2EdcVB0OT5JIGYAnNBj0q7FmV
 Amejm4HesUHbbbSrgcxzQEvrP6mzc80yj8xrXqmSpUhp9AeT21VjsXB6tXyXgmqhRh6H
 U/J33hGJT1lE+amylRe5H/zivAw+xyw340BVXyvl9Kg1hN0jR5c41MvjaqhN7KVIMGrG
 XxcXUGr2pISM4z2cDkUFctVz8btNmF698Iy+p6kyzd5W0uPduXLNK7q/fEuYGxmI8O0k
 5C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=KaWcRjQEkSEfKa9wKRipaXO3hcKUT7YX5NR0Pvx5hm2NFkZCP4BGYhoatZPlgzE6La
 5aIBjqXqzTcFeMcN3OMc8hYimpNYhhcTd7iF57farJ9adtS+i2tfslOMx6NaaevtqmCs
 jPQXZkUXhYY7JokT7TfI+nRFdUbV/T5qp1gjQ+VOeEWy0BimXB5h4+w3i0G2XpGiS6S1
 wmE5zpJtqj+QQX67NxuBs47iNbBfwmspJ7bz8KPCxp87uoYHnZx5ZbhZM1wtBoCNz38P
 OuNJbpbAOVrg6ITuLXoEf1HYnX6xn0e1egmsucIUl3c+9jPtPvHBlInNYlmt0Fp1RHF5
 HEDw==
X-Gm-Message-State: AOAM532eeVbNxuaFwG0J8ClZUnsizV0g9aF4sLvEzjQcoR86Pf4a3Anv
 UKv7zCL85cbnZfu9XYntEKt2b1ubCaFvE1My
X-Google-Smtp-Source: ABdhPJzwOvTLazBZPSJKsjMWwkS/+c08OWJK8hkFYuOuyJ3RQTjE+5fr+AWDq+gvDLSF+3w2wI1A/A==
X-Received: by 2002:a63:574b:: with SMTP id h11mr14885891pgm.25.1610750826381; 
 Fri, 15 Jan 2021 14:47:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/21] exec: Add support for TARGET_TAGGED_ADDRESSES
Date: Fri, 15 Jan 2021 12:46:35 -1000
Message-Id: <20210115224645.1196742-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

The AArch64 Linux ABI has always enabled TBI, but has historically
required that pointer tags be removed before a syscall.  This has
changed in the lead-up to ARMv8.5-MTE, in a way that affects the
ABI generically and not specifically to MTE.

This patch allows the target to indicate that (1) there are tags
and (2) whether or not they should be taken into account at the
syscall level.

Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
in the arm64 kernel source.

The prctl syscall is not not yet updated, so this change by itself
has no visible effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..1df9b93e59 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+static inline abi_ptr untagged_addr(abi_ptr x)
+{
+#ifdef TARGET_TAGGED_ADDRESSES
+    if (current_cpu) {
+        return cpu_untagged_addr(current_cpu, x);
+    }
+#endif
+    return x;
+}
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
+static inline void *g2h(abi_ulong x)
+{
+    return (void *)((uintptr_t)untagged_addr(x) + guest_base);
+}
 
 static inline bool guest_addr_valid(abi_ulong x)
 {
-    return x <= GUEST_ADDR_MAX;
+    return untagged_addr(x) <= GUEST_ADDR_MAX;
 }
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+    return len - 1 <= GUEST_ADDR_MAX &&
+           untagged_addr(start) <= GUEST_ADDR_MAX - len + 1;
 }
 
 #define h2g_valid(x) \
-- 
2.25.1


