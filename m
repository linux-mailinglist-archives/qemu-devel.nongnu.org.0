Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB453C13F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 01:08:54 +0200 (CEST)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtvx-00064F-OC
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 19:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskR-0001ir-PZ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0000v7-5y
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id 129so5817177pgc.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgDKwyzczRHeCVUcDPOzrXt54ML/m2izvxlxKvoxXd8=;
 b=gjFtRYE1m15O1niQwGJn/daT9cU04KxZLDP03iGS6Xxrtu7RXCl1NDNHVe+btGwc3X
 ljLXZR/nMraSCnTswRwYCwH9hKlHZfCVcLV2MxRd4a+1ybZVI8zyzvUauB7kMl5N4BZJ
 OXUY/cw/LLnZQ1Bn0gzIkwcQ46Bm4xWMp4X6WpKErSaWfT6oCQVZrz5QHkZW4zjOXhbG
 OmPGB47x5uvVjChJz5+jg4prNVljhWyzEXvGuxEX2COD8QQe6na1iS0+JYs4aUrA4mD5
 Ea0JxaIOyudykE3mAZYKDegp54dXYz0sVK8dCAOjn62UjufeTkJ+SQgMzfOIj0LCB3uU
 f+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgDKwyzczRHeCVUcDPOzrXt54ML/m2izvxlxKvoxXd8=;
 b=iR75zNZ+hOz4prlGfinf76tBgjOdQPpGWozmbxBV7No0DkJhMvppo15urqKIo3jV38
 lZoV+8M2LMNPrtMZTEvJ04fW/yuwFEr6/R1c78FrJijbF82gqJr0dinpsacxzBW9MU26
 64pjYf3Ad0XpI8Isv5sHdmKut2M2rUEIqpyYFRG6aX2BEEK8uK10rca3UiBmDBdkWtLb
 DwoDKPGTt9SL7GErDzzMe901+95vT5d2OHpzMrKgAfwYSK4x7jvt9EOkkWnB+Ho+64Im
 MN57yt9NWlNaMElPXLx6/K7AVljYLnAjk0akVRnWCE4Op2bhfLR/hE5BUZBazAuiRSzE
 pEQQ==
X-Gm-Message-State: AOAM533NZej7UkpF0J8RsJVDa8iAfPdjqPSZHqDLeb/FdjLXrkGREY7w
 Jtj88I+dy0U3OI0WpKdqc1EIbl9Y8K+ewA==
X-Google-Smtp-Source: ABdhPJywTG85rB6+y10175Il5a8+2W8bmN2mXMqznvk+9DtYybnLHbfvbZHJSEvVmHQbWy6O5YEIbg==
X-Received: by 2002:a62:3646:0:b0:51b:91c7:fd4a with SMTP id
 d67-20020a623646000000b0051b91c7fd4amr15589319pfa.78.1654206773232; 
 Thu, 02 Jun 2022 14:52:53 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 67/71] linux-user: Rename sve prctls
Date: Thu,  2 Jun 2022 14:48:49 -0700
Message-Id: <20220602214853.496211-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index fdd973e07d..3c2ef734fe 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,7 +6,7 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
-static abi_long do_prctl_get_vl(CPUArchState *env)
+static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
@@ -14,9 +14,9 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_get_vl do_prctl_get_vl
+#define do_prctl_sve_get_vl do_prctl_sve_get_vl
 
-static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 {
     /*
      * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
@@ -47,7 +47,7 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_set_vl do_prctl_set_vl
+#define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..a7f41ef0ac 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6365,11 +6365,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_fp_mode
 #define do_prctl_set_fp_mode do_prctl_inval1
 #endif
-#ifndef do_prctl_get_vl
-#define do_prctl_get_vl do_prctl_inval0
+#ifndef do_prctl_sve_get_vl
+#define do_prctl_sve_get_vl do_prctl_inval0
 #endif
-#ifndef do_prctl_set_vl
-#define do_prctl_set_vl do_prctl_inval1
+#ifndef do_prctl_sve_set_vl
+#define do_prctl_sve_set_vl do_prctl_inval1
 #endif
 #ifndef do_prctl_reset_keys
 #define do_prctl_reset_keys do_prctl_inval1
@@ -6434,9 +6434,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_FP_MODE:
         return do_prctl_set_fp_mode(env, arg2);
     case PR_SVE_GET_VL:
-        return do_prctl_get_vl(env);
+        return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
-        return do_prctl_set_vl(env, arg2);
+        return do_prctl_sve_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1


