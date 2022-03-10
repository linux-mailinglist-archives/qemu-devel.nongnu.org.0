Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F34D4655
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:55:26 +0100 (CET)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHO9-0005so-8U
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxS-0005cR-IM
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:50 -0500
Received: from [2607:f8b0:4864:20::1031] (port=46034
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxQ-0007yV-VT
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:50 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so4944991pjl.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6sq5+VxzJ+iyeBdvkBx4ESzy/gdXULWUf0uyVhwts4=;
 b=ckV13nbAONqcjv7XIU0kL0eomQJTYp8RKRCHlrhu6he+2yvYE3j93z33QptmbrQpoe
 IezDqRCDeABj0npYedzBT877LqywYC7/kE/+CC0JXCCwESg4lqyXXEFLaMsPvL5GYX5j
 gkiBSmcserLjGcMSYUur+JEvOcv4VKDLqpTOOoA0+5p4xs/YN9IlQR2UeSyZjPBlQWRZ
 bnLyENDq7Is1kfC8Kuud/4SHWFDuoQIj94AfsNbao/fFoc8cGTpVtSxKWUqi+VCPhc+V
 YbUJJv449CMjG/BSnZEoB7sf0vD9fczIuUaQBiMekxuJdgOpKDps2UDwTGn0IE8a/1HU
 MTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6sq5+VxzJ+iyeBdvkBx4ESzy/gdXULWUf0uyVhwts4=;
 b=rxmIOAftXctnoiDvxbo8Jra6F6UWJSr1OW0ZCuBEmHcJmN4Nni8ZcI3mMRsgJpWE0T
 xHt1MR2KYrhPq2btIW88Wn2B1FOwymyA450RPOoDWdRl+dIm8sqcBI9j/urMaNhRFw9e
 e3ZfGHICCzSLiWu6bFxdWq77AJjLtTwROoPin/JYr6mbVjbOi0vUqR+rdAT5pyDw4T14
 ISyCOEz3WCVAqFBam7pYgmPnTl50rGZRnkkK28vDiXtmOTDYCRgf/d/TZEoUl/pgKFHH
 dTkrqfm6bUCYgHvbr7OYB6Sr0R2OqUUk0WR2f+ofF62AdA8O9ip5On0VEm0Za9uFqcG5
 IJ2g==
X-Gm-Message-State: AOAM531Zn5tfSuDpPp1zTvN4R5VAvJrRgSFxg0xjQSFrDQU8QkgeW273
 nkXxmBq2mpWseTvBEDFpxtPao5YCLRbxbQ==
X-Google-Smtp-Source: ABdhPJzD1wjJk9oHn2yWpmU63kNSPcRccQsvISaTNL9jX+2eMTUZ7MqeGtPBmGyDQ7Vhy/uVsFTZnQ==
X-Received: by 2002:a17:902:d482:b0:151:ef7f:f5aa with SMTP id
 c2-20020a170902d48200b00151ef7ff5aamr4456489plg.58.1646911667698; 
 Thu, 10 Mar 2022 03:27:47 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/48] target/nios2: Move R_FOO and CR_BAR into enumerations
Date: Thu, 10 Mar 2022 03:26:56 -0800
Message-Id: <20220310112725.570053-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
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


