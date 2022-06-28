Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABEC55BE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:57:45 +0200 (CEST)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64EK-0008Th-K6
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nf-0008WO-53
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:07 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nd-0004NN-Gy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:06 -0400
Received: by mail-pj1-x1036.google.com with SMTP id go6so11436963pjb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbE60MKW9MqcBNahx+13s58wIA5fTI9eDU3V2q8ulQ0=;
 b=Hyi9eOgtLrj8x5NdCzoi7vDogIWt2Djdhcz8wNfkMidl9lM0VZ/TWBNG2ByuQiAN3h
 BQ22zDkqjvCW4xL6Czb02IKxTCsnF/qyItnqTmCC/fHbO9Y8ttDVOBMFvqks9M5iuZlb
 oMtIfK5IDuUhww90GFQTHhnoZyERrF7W3fAb27SyXKWjfcLRwxGrbn3iHPbDeaiAw+hV
 Af+OVTEptelCC5fi6htocU1adyY1N7uYzUVNNqcnA2Q9TEMxvJRdcNlEtenXoNJST/ML
 aJAZI19jmvbKPoYc36+ezwrLZaEMCWTIRtTYF02XdUYQq3m3+0wXVaeV0/pfwbvQuUDy
 mZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbE60MKW9MqcBNahx+13s58wIA5fTI9eDU3V2q8ulQ0=;
 b=ZpM36ieQ9lP5DXdO8CvY1YRdUBrRYcEj9bTQPxeamWiVkIpZUgW6dGDMKcb6Tqe4vK
 yVIWb5J5pvXD3uvKQKPoD3iIxHhiOUFVo56hhoi6MbfGbjxscW12bTGCRWV7hP1uJOLN
 TnOwsuoBQm99DpMZqu9JziR4EHNFhfuLWgiBVuN1oOB42ZW/kl0W5gCZ5rUmi1NiJjos
 s9ELj7ojkf0kFyts4iKvNs25otJTPA/7HYrAi9fUrtB1qWlnmWDEeWLx3lsgNTv+NWLD
 hlTeu4wsMUDRwHQxvfp+Y6p5S3jdre3Gn0F9T6B+J1y7gvMAY8yOct3JndhAoP0fHRJ6
 I7hw==
X-Gm-Message-State: AJIora80/ydRJmBTVMeobIVxp6ffyUUtCIdPhXKr7MadyKGEYGVU/Mcq
 rxh5dNu93bl2CxlLrzzdpIbzJ1n6nqhPOA==
X-Google-Smtp-Source: AGRyM1v1+C5e0dGtI4kYqJb5gdXVDG4OUO8vh6SCAB/Aci8B6FsPkEHf7GNHfIkxfAs/Si4OAhy/rg==
X-Received: by 2002:a17:902:bb8d:b0:168:e48d:86bc with SMTP id
 m13-20020a170902bb8d00b00168e48d86bcmr2961811pls.93.1656390364023; 
 Mon, 27 Jun 2022 21:26:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 41/45] linux-user: Rename sve prctls
Date: Tue, 28 Jun 2022 09:51:13 +0530
Message-Id: <20220628042117.368549-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


