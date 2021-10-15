Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357342E80D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:47:37 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF84-0000Cv-I1
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcI-0006yM-Sd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcH-0002yV-4L
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so8448130pjb.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfz53S3QlKXNPBsRIkUXBiTrLPBdQUAc4SLrCyr0OTo=;
 b=A0yhjLY4qMrUUkp4IsRQUircTvsF2E9Goj6FX9hb+mk3KYILAQcKhBJKjmyW3RywlC
 69tgcffCEdhhWeLg8vNReYdndXkzixw2BIrJc4xxR6UESL2TjdFXpSU5HUbQdtELwhe0
 a8wstvyKmmRobT+YFY858l/KJjcsPfjoBdY6+2wV19l/K540V2PYBL/4HUuGauFOumEd
 j2GwVznXKlO7pLDCFF2BY5XvB7I8r9ymL+GDklUp4vC5nYDeRhLZcvSXUPhmzaVw9yvM
 t3cB8AgCtKId9QvGG8aKiy97azkp0Q3nkrjCqgIvGuhGtQ2aafuibtqCm4F9LsVDoYya
 kM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfz53S3QlKXNPBsRIkUXBiTrLPBdQUAc4SLrCyr0OTo=;
 b=txfUXDXsW//8p7xxiO3rO/hhfUgR9CvUaSi3TioZLrwlMC85eCmWgV9+8Q0UlUxlqk
 H5QhSq10fcHixuaMYMpExzo+6DBmcmIuIX5Jzngs90NTq4INAvcLmPUuCigDD+LmezTp
 dg0/Za/mOL1hgFxYwgZQmBtfkBlgJZYzQkKlQFiHccpsND3tLNmJpGAXwoYRLBrhsAcG
 7DgqDnzyy/qMLpuEBT+BWGAF2dO5KgMphfxxsZGpwceIMgSZBRwEpukCql3edi6Ck/pu
 LE7X9zSwtYpZzUs/ob5h31KjGPGO3C/Wvb/x8mnBv9QA2QzZVCFgwN5vLHvjYBwYce5I
 GpvQ==
X-Gm-Message-State: AOAM530Z2TPBTqlHjEDVp/f7fmbjgZBcMdR4jdPbBtnGwRRR6hBcL+/T
 8UgG2ko4OqOiGV7yfZeOjydhWtGiI3hjJg==
X-Google-Smtp-Source: ABdhPJx872YZfcltXh5JP/IVfW4lBXXotPxx66TN/JbNRe2DmOjDCmM0TWAEwYnmR/qlfQVbPJ9LFQ==
X-Received: by 2002:a17:90a:8593:: with SMTP id
 m19mr10609330pjn.82.1634271282199; 
 Thu, 14 Oct 2021 21:14:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 60/67] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
Date: Thu, 14 Oct 2021 21:10:46 -0700
Message-Id: <20211015041053.2769193-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..bf40942de4 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong addr);
+void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong addr);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7d50dd54f6..0473ead5ab 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 __thread uintptr_t helper_retaddr;
@@ -217,6 +218,16 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
+}
+
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


