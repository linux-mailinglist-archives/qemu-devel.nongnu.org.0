Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEB50A49A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:46:21 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ0e-0002HR-Vj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZg-00083W-U0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZe-0006LM-8e
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:28 -0400
Received: by mail-pl1-x630.google.com with SMTP id n8so5190051plh.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQhtYMOQ4P6+FRrXAyEfBDvvJctbpvHCjlgSizfQcf0=;
 b=OQghtm0QZj3+HHxppmQLe/atZnV8fSiPT3ObAQzCpWF878cPhaBVE1IODr/7NfOVJ3
 evOcmh9mv0OK35PyH+j8r2GdlgD6E59FyCfcjj7SG6ZR6Rx9fRwjhBUtJrbZ2F1tG7TZ
 8wdhrL0xqRPUmI7tW/aBYOyXwYfMUgZ+yNajooy/IBooLDXL1HQT1U8lx3X5xeWQNUSA
 dGUq+fo61HvFEVkX9JjqChldODyceDzGB9zptEsvUQD/WT7ET0rSQk3uQUxg19L/NOWf
 bE7yinRuSTBZPlNFnTUTUdwgd0bg03HXdv/9THbXDmlENEALTIqZn2nkEpO76UginCn5
 W7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQhtYMOQ4P6+FRrXAyEfBDvvJctbpvHCjlgSizfQcf0=;
 b=LZdAl1vMTbtcGRaSyoSCxMTtC3zRRj5zciTbu59JZtvDeYkmpk1vOp6+hmBjtiHTym
 MYpeD5kHTfyVprCDUI0FdEZQ2c4hr4/zZtK1G9sJP+JDFoXDjq2mJThB8nyA7ksYmQf+
 1WVDwo/LaEvCWGAmYckx2yVAK+6yba+LsmXJ4C9YRdiowMhpY/nYxQum8TC1A2UcXsXd
 NG/Ank0/hkMjxrCLSHIJscF5+n6bZSriOxhPBLt45i2fGQrLClRjFK1tGlNDDZ02XTpB
 tYuhFkUOhdRxzmm7QzhFBEiFk5nkJj8CQeWfSG23B3gpdbI2mgtJTUHRKaeHTkKvKoQX
 U8Vw==
X-Gm-Message-State: AOAM532Yg5qrCnCcodnu/UtEPj9bnGkh5AoI9f91x4alMqVgRoJqHICY
 g1iwpmHO8b1DZdcBUFa6LuWcgt2D+SKq7A==
X-Google-Smtp-Source: ABdhPJx/JM4wG9GhtQXy24SIC67hKQBTKpvgJIxhQ/d6s/pkY5Kjd2ejGvtE/e3gnmYGfMxPA92keA==
X-Received: by 2002:a17:90a:9416:b0:1ca:9cff:7877 with SMTP id
 r22-20020a17090a941600b001ca9cff7877mr10908058pjo.141.1650554304964; 
 Thu, 21 Apr 2022 08:18:24 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 30/64] target/nios2: Move R_FOO and CR_BAR into enumerations
Date: Thu, 21 Apr 2022 08:17:01 -0700
Message-Id: <20220421151735.31996-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These symbols become available to the debugger.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 72 ++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ec34cebf72..1998a16940 100644
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
2.34.1


