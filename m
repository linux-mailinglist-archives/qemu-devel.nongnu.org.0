Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E430E9E5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:05:50 +0100 (CET)
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U1l-0002x3-GC
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tij-0005AB-LN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:11 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tic-0003rj-KM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:09 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so1039295pgj.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16lbvRerppaZSdDTN+VtWDIyr6a+gIglS3gZgOzl7iY=;
 b=R4NvyATnmW0tH/hLoTG1oouQSwlPgDOlAYfc57Mub4FXMUqG45m86M3eHaTp395kWu
 lOoRLPs7CXXYFA0V1XqcdxadaQDwpMjc9gwsf8jryta3GFK+M8BWfJYbv1Dv5WDjH4RU
 8qG8t8ee71QcJ0wEJdADqCwMOCwUTHHvBXFAK3w2fmpC2UPV+CjcOtTYK4lC3BTpcn/n
 olC77t8Cx9+xgK0iFTqsb4ysqtqKA/b9K1EDQMZ0GksDt5Xa6QooYHEh+VBMtQ+JFyRR
 uQeaVpvFD+J0Ulul4PCxko9/uCagWb1N4emJbx8h58PNhfLicgglduBL9iMGjaOPsCb/
 qiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16lbvRerppaZSdDTN+VtWDIyr6a+gIglS3gZgOzl7iY=;
 b=KyeJQZVTaNORYsjinR88eFoKZhDeLDUWTeGZJ8ILxhX36o+a5oSCFUF6DlJy8Dytm0
 0UkVHgv/wKbW2XSd/Xsttl+f7Zqr50GDWrjiQh0cB0jG900n+EbCp0aDF76SMuW2aJjt
 thwbQqaCgKAn+DbH4Wu/oHgyQJnlggd/o2Qw9QJiRxU4DYXiyOLSKEzQcADNCZerstRh
 qXQkEBUxyct5SfuVsAgtpoNCMfkSEembI/kJaZNmm5hWIo+Z7EeH08OYhyWBL4n5SgOP
 WHcN0N6X4VC3KA0bjo25BKNQL3HV/XupoHoR+lGvfRoNnr6hmbDXVi1qsBGD4eRMJGJw
 pXeA==
X-Gm-Message-State: AOAM532+nBaX5JSsdr2IzwNTY2NPhCj9Bn8/uF5uggx9P7G0sQIWH18q
 CiUC3jBFPIODvpOQG0SqqzIEXNwOJPmCVaV6
X-Google-Smtp-Source: ABdhPJxhbnO11OO0tSpM6mH8d7upOhKNh5Y9nBvA0k/CELab2jRq5a7AGD+M2EZFFINqHoRZB2/Y4Q==
X-Received: by 2002:a62:80d3:0:b029:1c0:c5de:ff68 with SMTP id
 j202-20020a6280d30000b02901c0c5deff68mr5690901pfd.79.1612403161213; 
 Wed, 03 Feb 2021 17:46:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/93] tcg/tci: Restrict TCG_TARGET_NB_REGS to 16
Date: Wed,  3 Feb 2021 15:44:02 -1000
Message-Id: <20210204014509.882821-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted in several comments, 8 regs is not enough for 32-bit
to perform calls, as currently implemented.  Shortly, we will
rearrange the encoding which will make 32 regs impossible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 32 +++++---------------------------
 tcg/tci/tcg-target.c.inc | 26 --------------------------
 2 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 7fc349a3de..8f7ed676fc 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -133,11 +133,8 @@
 #define TCG_TARGET_HAS_mulu2_i32        1
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
-/* Number of registers available.
-   For 32 bit hosts, we need more than 8 registers (call arguments). */
-/* #define TCG_TARGET_NB_REGS 8 */
+/* Number of registers available. */
 #define TCG_TARGET_NB_REGS 16
-/* #define TCG_TARGET_NB_REGS 32 */
 
 /* List of registers which are used by TCG. */
 typedef enum {
@@ -149,7 +146,6 @@ typedef enum {
     TCG_REG_R5,
     TCG_REG_R6,
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
@@ -158,33 +154,15 @@ typedef enum {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
-#if TCG_TARGET_NB_REGS >= 32
-    TCG_REG_R16,
-    TCG_REG_R17,
-    TCG_REG_R18,
-    TCG_REG_R19,
-    TCG_REG_R20,
-    TCG_REG_R21,
-    TCG_REG_R22,
-    TCG_REG_R23,
-    TCG_REG_R24,
-    TCG_REG_R25,
-    TCG_REG_R26,
-    TCG_REG_R27,
-    TCG_REG_R28,
-    TCG_REG_R29,
-    TCG_REG_R30,
-    TCG_REG_R31,
-#endif
-#endif
+
+    TCG_AREG0 = TCG_REG_R14,
+    TCG_REG_CALL_STACK = TCG_REG_R15,
+
     /* Special value UINT8_MAX is used by TCI to encode constant values. */
     TCG_CONST = UINT8_MAX
 } TCGReg;
 
-#define TCG_AREG0                       (TCG_TARGET_NB_REGS - 2)
-
 /* Used for function call generation. */
-#define TCG_REG_CALL_STACK              (TCG_TARGET_NB_REGS - 1)
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          16
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 3327ce3072..7e3bed811e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -187,7 +187,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R5,
     TCG_REG_R6,
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
@@ -196,7 +195,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
-#endif
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
@@ -216,15 +214,11 @@ static const int tcg_target_call_iarg_regs[] = {
 #if TCG_TARGET_REG_BITS == 32
     /* 32 bit hosts need 2 * MAX_OPC_PARAM_IARGS registers. */
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
     TCG_REG_R11,
     TCG_REG_R12,
-#else
-# error Too few input registers available
-#endif
 #endif
 };
 
@@ -245,7 +239,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "r05",
     "r06",
     "r07",
-#if TCG_TARGET_NB_REGS >= 16
     "r08",
     "r09",
     "r10",
@@ -254,25 +247,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "r13",
     "r14",
     "r15",
-#if TCG_TARGET_NB_REGS >= 32
-    "r16",
-    "r17",
-    "r18",
-    "r19",
-    "r20",
-    "r21",
-    "r22",
-    "r23",
-    "r24",
-    "r25",
-    "r26",
-    "r27",
-    "r28",
-    "r29",
-    "r30",
-    "r31"
-#endif
-#endif
 };
 #endif
 
-- 
2.25.1


