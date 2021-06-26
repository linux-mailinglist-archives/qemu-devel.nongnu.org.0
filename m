Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088D3B4CB9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:06:36 +0200 (CEST)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0WZ-0006dQ-PR
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TJ-0006lE-59
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:13 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TH-0008Ci-8W
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:12 -0400
Received: by mail-pf1-x432.google.com with SMTP id i6so9151856pfq.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOIjP++pUZAecpRcUAi86x58Btt1FbABLnvHLDjfasY=;
 b=jp0vbH6tPVp3cRq2mC41TTHIRI0lHDH0Rrp2S8dkDO16hhTZxZbR1OUAiobH0ukofC
 PZ7Jcuw/t8WelgXZIvzQcc0dutO9Jhmq2ZTt5LCLtWBCe90Or2RXsHj+BoCHFKPqAoYy
 V2vaCevlK1fOjtbJQQPNrHPIONBqegLFdWiKTLc0r2ujhFJf+wrg5MsqPJGE808eEBeh
 9f1+2LKcJZmGBeJEPHCotIY9y4a1vEPUy0s3JXxywPAT+WPxKJDR92NzRUFvGLN0chlS
 suyjHHqGYJMc0bfBJnkF8JFjBIskVRTvBnULyTs7boiizjebD3bazL7kPm1vvMdHGAST
 s/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOIjP++pUZAecpRcUAi86x58Btt1FbABLnvHLDjfasY=;
 b=BxXxsOOET9iWSslGN+tWISdGj5Gdiy9ejjlHhdyq8y7nfwqcI0iTroBWzFEGkXuQje
 TfwUyk5iM89AO5j0KzK1q/w6MHTQS3urSbV5nfV1Obkq31czzx0SnNpecwRW5gEJGN3p
 LanCYwDo16oBxYzRkslMHsFEfN/WWvtSlQfM7RKi7PsTO6yw8RGv/ELNLfbHG+flp5lU
 7KgD5JNfoo2jdxXLVVbnGkJHk3vycSsNQpSeIhaLv3Xy4f0+xV79aJ8xFhd7d1Ix3lVW
 y++7KArAjza6cXXZH2i7KuYL67kCeVUD8YBtkkRGHvcvcd+Fzhs1ZAntTPV5cYfc87OF
 Mc7g==
X-Gm-Message-State: AOAM531i9DmYuy0L1q19bzX8qzaOWQaB+K23BWzltO/fB6ixx8IAFhii
 hoa3Bb+m+nK8u7Npz1C01VLG7wY1qxuXvw==
X-Google-Smtp-Source: ABdhPJy3SlmbqNfAwCIDW3pCDxjYrPSb5EwM3bC91LRS0dIpy3HpFsOTsfz93iI5OqPMEaGtRYnqyw==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr13914652pfn.2.1624683789926; 
 Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK
 into TCGReg
Date: Fri, 25 Jun 2021 22:02:54 -0700
Message-Id: <20210626050307.2408505-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index e1209cfef3..eb17657994 100644
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
@@ -139,7 +130,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -148,10 +138,6 @@ extern uint64_t s390_facilities[1];
 
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


