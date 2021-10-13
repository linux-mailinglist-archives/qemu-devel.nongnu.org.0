Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F342B306
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:00:54 +0200 (CEST)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUVh-0002t6-3i
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHy-0004wo-D8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:42 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHw-00056N-Qw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:42 -0400
Received: by mail-pf1-x431.google.com with SMTP id t15so1120425pfl.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfz53S3QlKXNPBsRIkUXBiTrLPBdQUAc4SLrCyr0OTo=;
 b=TyH11BbEZlhZZ9CwLFfuKqI5Slkl3q8NgO2ONI2unalRU205XAqYLYiggtzAHObMah
 Yh2m2uiMIaOTnLzcAY1dkt+VN+AtrwVRE2EIHmMWIQfkqVD+GmgnEWdDN7v0+hYS2Obm
 vwjQvMgdanDVN93HsVSLX3ZnsKcqsWVuLnRObWWs1N2D3nYm4etBfJMvM0lV2pWUURoB
 3zifmzISTh5CxScwTJXj4vyBCCq9PBuYhds1LdAdZjAKWOeYtwRa8/BkHfB9kr2yIHhi
 icW3lnlsaL9cF2W2Aai5aK+uk1/vvPOSHiV9PrL1G4skbHlG8Lm/Weuj34duCD7jmonF
 aECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfz53S3QlKXNPBsRIkUXBiTrLPBdQUAc4SLrCyr0OTo=;
 b=Baj7+qWkr/pbMRJkPOqxcjftlXkwiMeE6OFdkJ3nC21BzVMjCNzb2rJBOVnoRkBwDv
 Ar/vpCiPn4DLOWZcUUrCxiwENZy2Tw1Bgb/dIPr35NCpl54Ttq+JXB6bbXi+bXo+75re
 plsfQbRKDeEwt77hzQOdUwYMY4aBSXoRxOd9x6BePKxcwz3wDSe+EBI85/o3Y1QLPcjh
 Uqew9mRmVRi6V3F8x+lo1J6AWtrm+ImOZURYHbsYty2tazti05+4n9OL9Gma4hhG7xmg
 Zi65YIAsc+kjd48287V7yj7dW+DdVGn2c/Of6PzPjutrww0qgwNJd1TT4WZaGxJKFRRc
 P/3g==
X-Gm-Message-State: AOAM530TA9QOFkyDcwPRpwDrFnxRbch60FkB61VBWENT5BS1ehwMp7aj
 rJ8pxqHTT/W+tmUUnht/OGE9oxKOBfM=
X-Google-Smtp-Source: ABdhPJx6rqXrPQr6y4yzMuTZm2Ro76uZBz/D8zl582smojHHwRxpGSMsqC5HkFvVxnOxKvdZnQy5Hg==
X-Received: by 2002:a63:b214:: with SMTP id x20mr25777738pge.460.1634093198930; 
 Tue, 12 Oct 2021 19:46:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/48] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
Date: Tue, 12 Oct 2021 19:45:49 -0700
Message-Id: <20211013024607.731881-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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


