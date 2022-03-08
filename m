Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D944D112F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:42:03 +0100 (CET)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUTq-0003Fy-L8
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU99-0005Eh-3T
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:42 -0500
Received: from [2607:f8b0:4864:20::102d] (port=53013
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU96-0006Ln-Ho
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:38 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v4so16353597pjh.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hVtoqbC1gYoYHHn2DZhJOouijVB0naPV7yAJTXjEzIc=;
 b=vFdMzqmAiOXr4N3ZdM3PSH9hPhoimvTpZrMy5ZzZAa5p0tLx+emOOlUsduidGST7BJ
 UVgE3Q49Q5KsIBF5ZUcozZEBerIOOKJy0hfZQ6Qe4FgxBN4HJHSp+jRo2hJO+sHXjLuE
 RGioIH+PK6m1x/QQLyIEvDdmnfOZ//VBwMhwJVYFASpszh0WYg+Z2pejf8vW1jYTaIDF
 b57n/go+RYZy6rXWsiKdT6Tpm1uF2YJ72/qdjVhTjm7H7++0XlDLqs7IXhXfADLw4AfD
 0UcJll2pydtVXa9H58JZoW6vG61/sSzW5Vv5CinnKGWiYmQJJkSAv6FV6oZEABr3ztCu
 LLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVtoqbC1gYoYHHn2DZhJOouijVB0naPV7yAJTXjEzIc=;
 b=3+VAh/sLSV6nTcOAkRJvFDaVzbySCARwKEPRDnlrp/36UO9sdCSBXE1qMA09ADjNyr
 ZFG5BEhm03YA5u9/vob3ZlJN5JNf6FZv8B8eRlJ7+bD7xXxpR1kTLl1d5E+dKMxXV2JS
 7odXY2NkmgdGmfcKRoghl52juF880r/2/xlIakD2p5hG5ahG8oAbeVwQlK1Ig1MyRgZm
 aPs0IA//v2XNBJM33OL0xM2QRMgZIjvmJILSiX6z0gRh4cP9wZeGeu+W0I2PI4HRPk1k
 zXxOVtYmx5M6zunHkv7tR6NP7UfqOBv6EJ185JWDsZK3XKshC0WUEDbEdMotUkaBrioj
 LLeg==
X-Gm-Message-State: AOAM5338NMQCfm3tjZBLB/6c1bMFHkGmbdoh4l9FCY6xTQwRWd0ZcSWP
 KAL1liLdjNGgjMSNViKfb+VaXhHn/cW4gg==
X-Google-Smtp-Source: ABdhPJw65j2xFwbja8MK47ScVrjDGPXgBAnIqIXOsUQcl+S2qw9+UOCoJ8JcCl5ZORTcVJTL/bVb9A==
X-Received: by 2002:a17:902:c443:b0:151:ca88:684 with SMTP id
 m3-20020a170902c44300b00151ca880684mr16193129plm.80.1646724034610; 
 Mon, 07 Mar 2022 23:20:34 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/33] target/nios2: Move R_FOO and CR_BAR into enumerations
Date: Mon,  7 Mar 2022 21:19:48 -1000
Message-Id: <20220308072005.307955-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 72 ++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 3857848f7c..927c4aaa80 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -62,25 +62,43 @@ struct Nios2CPUClass {
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
@@ -98,24 +116,12 @@ FIELD(CR_STATUS, NMI, 22, 1)
 #define CR_STATUS_NMI  (1u << R_CR_STATUS_NMI_SHIFT)
 #define CR_STATUS_RSIE (1u << R_CR_STATUS_RSIE_SHIFT)
 
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
 #define CR_TLBACC_X  (1u << R_CR_TLBACC_X_SHIFT)
 #define CR_TLBACC_G  (1u << R_CR_TLBACC_G_SHIFT)
 
-#define CR_TLBMISC       10
-
 FIELD(CR_TLBMISC, D, 0, 1)
 FIELD(CR_TLBMISC, PERM, 1, 1)
 FIELD(CR_TLBMISC, BAD, 2, 1)
@@ -149,12 +153,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define CR_TLBMISC_PERM  (1u << R_CR_TLBMISC_PERM_SHIFT)
 #define CR_TLBMISC_D     (1u << R_CR_TLBMISC_D_SHIFT)
 
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


