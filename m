Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E32371FEC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:51:43 +0200 (CEST)
Received: from localhost ([::1]:34536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddfS-0006Wm-Pw
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQM-0005rz-Nb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ7-0008FX-Hm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d29so3498847pgd.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQ/PFvnLZRR2lfacHzpGUbL3/llX9Hwwg7oJ4nfVIdY=;
 b=jowBp9g0WfMFg7fwXKX/MJscupWeJktRNM70yuhprUm7+rxJXcUBOFJsO3c12Ysj/z
 Q5I8HbX0fR8Yswu/OV1TcZ8JKE/gSIMcxk0vhynJRjZCdJUZqBF0kuCyq171z7moFM4A
 YUKdR3KLy+eqi9rqm2OGX6wvQcwEqCERRFDOplv/W4xSAwYJbwXVDptCIBvm8YFbP9mC
 4JXr3HFB0P0LHotCL6Fuo32cX+fpP5YhL9T4nGny1zOJgwU/rUWOJT+5CJ+KyzSMpehH
 vf1n/qB19IC06+K+mx8ksUPgWkBPN+5Vca0t1FQupXFL3rgQ9xTZzLhzHy69f7QS+FSD
 YANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQ/PFvnLZRR2lfacHzpGUbL3/llX9Hwwg7oJ4nfVIdY=;
 b=QXx+A8E2E0p/ACQhuS7cGNWPyeROb/eU4rykV1Atkk4GPBD8CzF17RTZxVtWD/qiRq
 2anBEXdzM+FSttdxPua+y+Ba1jE3eEHzyk2soLlMmMsoa/A+jrTSHgimPbFiPAf5myOF
 WFScyvja0XXiYXnv44h2X/tkmiaAIURGCSuZT0HJaHqX18yl4IBZD5LmZ/5YqW2oUknR
 5wyRx8CygPOIl8OwLtHM8PJavv09ZW7iCkPZv0L56ktPofiB7mK+4vK4AkyKZIaZ9lpp
 N5dE4RV+668yVRT4qz9rIeTBgo0Pin1z59AY9bcoUzAFrGvbSdbdF9jEqn79DmC8JB8A
 uglQ==
X-Gm-Message-State: AOAM532eJHFUCLTfavwc38183tqDA++4XGD+rnl8j2ZPbBtzLK14un1e
 +vyTC+qvlrpr+eBjwxStw66i+qXHRrKCEw==
X-Google-Smtp-Source: ABdhPJwmdC6cnJzgWR2mO+Dpb6MUz5OiZEHDkR0ZB+MjWHiHgAPVyMRZgrLcz3vkSamw/XQGQYGnyg==
X-Received: by 2002:a17:90a:d918:: with SMTP id c24mr21240pjv.58.1620066944396; 
 Mon, 03 May 2021 11:35:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK
 into TCGReg
Date: Mon,  3 May 2021 11:35:28 -0700
Message-Id: <20210503183541.2014496-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are rightly values in the same enumeration.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index c612d24803..3a701d9256 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -29,22 +29,13 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
 
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
@@ -136,7 +127,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -145,10 +135,6 @@ extern uint64_t s390_facilities[1];
 
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


