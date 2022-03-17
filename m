Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348CA4DBE13
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:18:31 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiWs-0003xN-8y
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:18:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKo-00018O-00
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:02 -0400
Received: from [2607:f8b0:4864:20::42c] (port=43913
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKm-0002G6-E7
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id t2so5877925pfj.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6sq5+VxzJ+iyeBdvkBx4ESzy/gdXULWUf0uyVhwts4=;
 b=h57VvCk4FjU05p2bubDNBqzbgSP/9rRAstfd1X3hQDBC75QVfao3zA7/ZWXRUwpaF9
 zPASUU550gKQ4yvjuP1uIeuTvRGqrmusQSCEnVgchelY2vpPJVMqLPjuXmoLDdkuPbj9
 NCMze3wtsbvG0Y9uml1UbjFEXOpd2+cFYrrYwvws7x1M75JC3pKmCMraV6aeCli1mWDt
 SSqxUbi7mt+SHefApxWTMN7XLO7Jk6SEJ3BEhzte2yVe7B5YE3oYCahKpKu5Sz1Yz2m7
 rvKxr9MiImsnzkSHByKcM9WGjtvhW1Zt64+Mownu5jiUQ3D/3dqUecqMVvQYoT3t6nHb
 QOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6sq5+VxzJ+iyeBdvkBx4ESzy/gdXULWUf0uyVhwts4=;
 b=N4z/NhCfdonzkyvc/S/7srqI4qe7VNcFahZ9er4dQMO4mUvWTNN8dkZHt1wOKB/QSS
 HcS6Nju3szFidmy2CHmXtLKL1eH6kYw2RId7sckpTSeLFdH9Q3KG+WkHE4dVWQe4Crr3
 vraY0kh2nley+UJ5P/3bdNibhLE0VcAu0ox6atdmioNt8UalpmwR2FqrSe8frYbrt1qP
 ZeOZIFp9YyNVVQrqhbXCqL0bN+02qN356/z+clYiK3NvpURtdAJpdeKbG3pr836cwrZv
 wEvSuKc5i/B61eVv6T6hSb7WSleoU68Cjjsm1IUh+/U+ca08KBy57KoytT5giD0pLv8l
 mAGg==
X-Gm-Message-State: AOAM5307OuyqA0azmc2A7i4ql7N7KK/+QO3MR9AGh++oHlO3/8OU3H5L
 FPhKc7h1n3gKSaUZezGFt0NWXlUYEM7PVA==
X-Google-Smtp-Source: ABdhPJwAH/foX3/3EP4RBI8Woc3zOu8DBtEunUj0xyPMne37mXlMGWCi3VKBAfYEPoLO76GfwZhWQw==
X-Received: by 2002:a63:7cb:0:b0:380:f89f:c9a2 with SMTP id
 194-20020a6307cb000000b00380f89fc9a2mr2266067pgh.264.1647493558989; 
 Wed, 16 Mar 2022 22:05:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 19/51] target/nios2: Move R_FOO and CR_BAR into
 enumerations
Date: Wed, 16 Mar 2022 22:05:06 -0700
Message-Id: <20220317050538.924111-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These symbols become available to the debugger.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 72 ++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7f805a933e..555972fe6b 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -61,25 +61,43 @@ struct Nios2CPUClass {
 #define NUM_CR_REGS 32
 
 /* General purpose register aliases */
-#define R_ZERO   0
-#define R_AT     1
-#define R_RET0   2
-#define R_RET1   3
-#define R_ARG0   4
-#define R_ARG1   5
-#define R_ARG2   6
-#define R_ARG3   7
-#define R_ET     24
-#define R_BT     25
-#define R_GP     26
-#define R_SP     27
-#define R_FP     28
-#define R_EA     29
-#define R_BA     30
-#define R_RA     31
+enum {
+    R_ZERO   = 0,
+    R_AT     = 1,
+    R_RET0   = 2,
+    R_RET1   = 3,
+    R_ARG0   = 4,
+    R_ARG1   = 5,
+    R_ARG2   = 6,
+    R_ARG3   = 7,
+    R_ET     = 24,
+    R_BT     = 25,
+    R_GP     = 26,
+    R_SP     = 27,
+    R_FP     = 28,
+    R_EA     = 29,
+    R_BA     = 30,
+    R_RA     = 31,
+};
 
 /* Control register aliases */
-#define CR_STATUS        0
+enum {
+    CR_STATUS        = 0,
+    CR_ESTATUS       = 1,
+    CR_BSTATUS       = 2,
+    CR_IENABLE       = 3,
+    CR_IPENDING      = 4,
+    CR_CPUID         = 5,
+    CR_EXCEPTION     = 7,
+    CR_PTEADDR       = 8,
+    CR_TLBACC        = 9,
+    CR_TLBMISC       = 10,
+    CR_ENCINJ        = 11,
+    CR_BADADDR       = 12,
+    CR_CONFIG        = 13,
+    CR_MPUBASE       = 14,
+    CR_MPUACC        = 15,
+};
 
 FIELD(CR_STATUS, PIE, 0, 1)
 FIELD(CR_STATUS, U, 1, 1)
@@ -98,24 +116,12 @@ FIELD(CR_STATUS, RSIE, 23, 1)
 #define CR_STATUS_NMI    R_CR_STATUS_NMI_MASK
 #define CR_STATUS_RSIE   R_CR_STATUS_RSIE_MASK
 
-#define CR_ESTATUS       1
-#define CR_BSTATUS       2
-#define CR_IENABLE       3
-#define CR_IPENDING      4
-#define CR_CPUID         5
-#define CR_CTL6          6
-#define CR_EXCEPTION     7
-
 FIELD(CR_EXCEPTION, CAUSE, 2, 5)
 FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
 
-#define CR_PTEADDR       8
-
 FIELD(CR_PTEADDR, VPN, 2, 20)
 FIELD(CR_PTEADDR, PTBASE, 22, 10)
 
-#define CR_TLBACC        9
-
 FIELD(CR_TLBACC, PFN, 0, 20)
 FIELD(CR_TLBACC, G, 20, 1)
 FIELD(CR_TLBACC, X, 21, 1)
@@ -130,8 +136,6 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define CR_TLBACC_X      R_CR_TLBACC_X_MASK
 #define CR_TLBACC_G      R_CR_TLBACC_G_MASK
 
-#define CR_TLBMISC       10
-
 FIELD(CR_TLBMISC, D, 0, 1)
 FIELD(CR_TLBMISC, PERM, 1, 1)
 FIELD(CR_TLBMISC, BAD, 2, 1)
@@ -150,12 +154,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define CR_TLBMISC_PERM  R_CR_TLBMISC_PERM_MASK
 #define CR_TLBMISC_D     R_CR_TLBMISC_D_MASK
 
-#define CR_ENCINJ        11
-#define CR_BADADDR       12
-#define CR_CONFIG        13
-#define CR_MPUBASE       14
-#define CR_MPUACC        15
-
 /* Exceptions */
 #define EXCP_BREAK    0x1000
 #define EXCP_RESET    0
-- 
2.25.1


