Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913540CEE4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:33:22 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcWu-0006Ac-S0
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV2-0003Vz-CS
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV0-0003Gj-Df
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:24 -0400
Received: by mail-pl1-x634.google.com with SMTP id v2so2458197plp.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96nVQLEZ53b4QwC1lGa1oK9CmjyQGeWueQtnt7IuwWU=;
 b=DLh2YYgVR3drrAyE3Rn0PiwfH4C95MENV9ru2qKh8ebpfjivxTDHBdxFAiOqAsbrbY
 qBdjdtdAATkbmqrIlf/JpM+RGrW48eZASSolE6B4o7Qv2sNTm3E9s2xV47UMzfynyBO4
 G8ldafDFGnlmRot2NTFin0cPFHrNjhln+LK12ihdv+eU9oHJ0PhcFZ2mHQ6e1Wdn8Kus
 xaRuU51pr8lmu7H97JMcRhzkYMRhU6hQbnwFZedu347JzSBo5OmFX7bXcT9ssJuAaITb
 cF/rN5YMOHZZlfh9aQxY6g03gYWqJbgV1WMRui5tUr69GKuWGYCjFITkNFdnceqSymLD
 MSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96nVQLEZ53b4QwC1lGa1oK9CmjyQGeWueQtnt7IuwWU=;
 b=faBGk/EpeklvkDlrGTp13KSpAfhdeuzLT0aK2g3+ntjGk88MSJ+ihZWhboOR99YqMi
 PwSaQn4UFPrCDfUw9gbSpMA70uVNBFvKlo2hfi0Thuk7Kb2cZ++FGNrKnO8Xx6uLLZcy
 x+NimJDVAEIWXLQuN5R40XiINzvkeuNi0eygJYO1xuboJFsmDjq6hQ9By/80y8FBEZC0
 93rkVEbFOtQZrAUacMY8AxYp4Va9ANrb59MaC3Fyqr2JUXgnqJnnPET4e74E+fbp1nj7
 tI8PWXxivcCgpnWhgLKol6w28H0DeRje9MwOa+dZp4eRfEphPGXBym35LkIYhQEwiuVT
 ztog==
X-Gm-Message-State: AOAM53121EUFrOCvTOHrcKkSIK2WddULt9Zrxp0od+yF6d44NEbVarUb
 86iI6I4IWYE9/GojI8aQxzWYhKgKJ7j3nA==
X-Google-Smtp-Source: ABdhPJwSLo8Y/U9LYakEFOVSXvcjdx2utKjrwsSWpkli4XxfF2lG/EtlHzd7MD/QVMAidoeRGH1FLA==
X-Received: by 2002:a17:90a:a585:: with SMTP id
 b5mr10815022pjq.201.1631741480970; 
 Wed, 15 Sep 2021 14:31:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK
 into TCGReg
Date: Wed, 15 Sep 2021 14:31:02 -0700
Message-Id: <20210915213114.1923776-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are rightly values in the same enumeration.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 18d0d330e6..0174357f1b 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -32,22 +32,13 @@
 #define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
 
 typedef enum TCGReg {
-    TCG_REG_R0 = 0,
-    TCG_REG_R1,
-    TCG_REG_R2,
-    TCG_REG_R3,
-    TCG_REG_R4,
-    TCG_REG_R5,
-    TCG_REG_R6,
-    TCG_REG_R7,
-    TCG_REG_R8,
-    TCG_REG_R9,
-    TCG_REG_R10,
-    TCG_REG_R11,
-    TCG_REG_R12,
-    TCG_REG_R13,
-    TCG_REG_R14,
-    TCG_REG_R15
+    TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
+    TCG_REG_R4,  TCG_REG_R5,  TCG_REG_R6,  TCG_REG_R7,
+    TCG_REG_R8,  TCG_REG_R9,  TCG_REG_R10, TCG_REG_R11,
+    TCG_REG_R12, TCG_REG_R13, TCG_REG_R14, TCG_REG_R15,
+
+    TCG_AREG0 = TCG_REG_R10,
+    TCG_REG_CALL_STACK = TCG_REG_R15
 } TCGReg;
 
 #define TCG_TARGET_NB_REGS 16
@@ -138,7 +129,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -147,10 +137,6 @@ extern uint64_t s390_facilities[1];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-enum {
-    TCG_AREG0 = TCG_REG_R10,
-};
-
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
 {
-- 
2.25.1


