Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FC3D9ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:13:29 +0200 (CEST)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uc4-0008Um-5s
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG5-0000zM-2e
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:46 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG2-0004p1-2V
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id d17so4845658plh.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G21kV/4dKAYRpfbXO1kX4GTHySgKtSCBemdrlhimxH8=;
 b=Gm9P2WwMnGC9iD2EK5YL8ihJiykHBKu9misV7e6zbAJIX4lvELNdAesqiWGGZknDPK
 idEr5L679QhXzusIlHS83AIpcS/uB8eOfWeRR6fEG3sw9sNjHCCPdgt+hjLrhPJRowew
 /EEYOTmmazXTH3UjY+ZHcSTtQfYxXLrP4X5kBRnrXwRqztbRlTFR1crrD76XBC9pP4RH
 6Ibbns3W5E5WVg+FOvdSKtJvyYkVP2h/ayZYRHhpL5jzHU5HMdNnPKvPmcBG4ENs9M7Y
 MF2DU5iicB9fs4pbLCu6uIbLoAYbU5VlMQOYpgjsAtt2+bhG0CFzWe40Lln+xS2HGSCm
 YDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G21kV/4dKAYRpfbXO1kX4GTHySgKtSCBemdrlhimxH8=;
 b=pIRMY/sx3LY0ldpLtKiL3OGebYs9OuOvkBDkrMD7tu/8Imkya6LDP+rRL+j1VS5Fm4
 6itqtcqScFwRTfp1Px3jArXWfBlI5y1iGMO2SobflSUA1XcDnUkWpGZ++hNnkdacp5F0
 eazDVt9m7KSesMGmV5ZTn6Pr94SzWK07WR5PpxVA1WkOWsPDQF8q010FgPAU5aYOfX2l
 X+m9oWG2Ne5SMrfgRYhLUaazKX8vpMzgfgQX1AW2QLAAfyUi2k9MxTlm5NKDyvhWBNEF
 kXjSzRQqTRzyeP4zULKolCxro6jJ76oKaXUdUMy0Ah0tJmtG7qBT9TZP9R4Qf80gwbqe
 DYtQ==
X-Gm-Message-State: AOAM531bKnlIQsu2ajCLLy1urfR2G6FRL0MG3VQOjBrT7olGlzNHIC3Q
 Rar0M/G9W904+QOkfBLbFG8zSy3Jm1P7fA==
X-Google-Smtp-Source: ABdhPJzncNb+YmoiOhjz1R919uiPbf0CkX23I7oFXctlkt07FJDQC66Tp3UKlq882GccCnUKX9xuHw==
X-Received: by 2002:a63:e841:: with SMTP id a1mr1471067pgk.197.1627519840665; 
 Wed, 28 Jul 2021 17:50:40 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id gg3sm947137pjb.35.2021.07.28.17.50.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:50:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 41/43] tcg: Add helper_unaligned_mmu for user-only
 sigbus
Date: Wed, 28 Jul 2021 14:46:45 -1000
Message-Id: <20210729004647.282017-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 13 ++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..a934bed042 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_mmu(CPUArchState *env, target_ulong addr,
+                                        uint32_t type, uintptr_t ra);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e8a82dd43f..5cbae7a7cc 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 
 #undef EAX
 #undef ECX
@@ -866,9 +867,9 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
-static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t ra)
+static void QEMU_NORETURN
+cpu_unaligned_access(CPUState *cpu, vaddr addr, MMUAccessType access_type,
+                     int mmu_idx, uintptr_t ra)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
@@ -876,6 +877,12 @@ static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
     g_assert_not_reached();
 }
 
+void helper_unaligned_mmu(CPUArchState *env, target_ulong addr,
+                          uint32_t access_type, uintptr_t ra)
+{
+    cpu_unaligned_access(env_cpu(env), addr, access_type, MMU_USER_IDX, ra);
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


