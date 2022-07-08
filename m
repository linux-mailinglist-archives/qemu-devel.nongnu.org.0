Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93856BE0B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:09:52 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qYB-0007QX-7t
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmq-0003Mv-Ns
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:20:56 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmp-0003F5-1p
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:20:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 145so22594005pga.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=dytHw4yHn9aQZiiETbPqvNBq7y0fHoTgmVXEA9wNgNhw7/wa5b4S8S/vO4hv11wdi3
 8TxSlDY2MXKDKNSxyaYf7jMszGmUVtU3zmM9NXy4Sz+s2ym9yfJli7Kdt5ciRFkeC1Bi
 Tx8dA+9YaZTTxVaS3riauBtUxI4mSVh1oZaniW4renTeJn0vcFTCy/d9ceezLUIoCVIz
 WYzAq9v7U0upxK5f2an5o3P+PiLg1Ll/S72XwcyB+ZWcbQUEUd557+GuWen1zCVHqt/W
 RAhNMNk0TpAqdQGEE3uVxh1tzVuUXiLzkeSnDqrcMyePuIJTWcy4DtacOxQJeIyqjw//
 3ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=a2h7PZ2paT+30inD305BbI/QH1NS59tx8MCkSVWrH+aesDsF9viOU8YaObn2+Phccd
 fzRX0IpwokFr3p+o32FegtTH86Pei5RZym0ytGWU1CeSOuLNeZSHRXa8HuBKnEJQymJf
 8GaSYs8WZTfTDCcw8XETE43z30U6nyai/RCsAqRnnAvSmuoPZk27m6tM1cl4LKIEBjP8
 KfL3Fkr7MXgduy/i4TtKDtc/cPCFPPMld413uKpdIb6uEtEEGebq6o9BpS5v6mkHf4yI
 52rqGT0LHc2W4OgCynyIxkgEbTgd4YaVdI4VKgHj2epHcOE5bYDvUQ2RNnk/aNYjhpjy
 69nQ==
X-Gm-Message-State: AJIora8E1Nu9/HAQQao1my568xL1VwP3Oly9Onri4VqMRtBEnrePcqhH
 Uj39/vfGpa994ne3sEF8pBgLfbExcOyRlEq0
X-Google-Smtp-Source: AGRyM1vhWvWAoq3Pn2YIBCjUc6kze1JMVknL/i6c8RjTWxQvqey4vNkvdMYxXSCicTo8tfV4we4UXA==
X-Received: by 2002:a63:460f:0:b0:412:7a8b:128c with SMTP id
 t15-20020a63460f000000b004127a8b128cmr3968354pga.270.1657293653809; 
 Fri, 08 Jul 2022 08:20:53 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:20:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 41/45] linux-user: Rename sve prctls
Date: Fri,  8 Jul 2022 20:45:36 +0530
Message-Id: <20220708151540.18136-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea..40481e6663 100644
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
index 669add74c1..cbde82c907 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6362,11 +6362,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
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
@@ -6431,9 +6431,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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


