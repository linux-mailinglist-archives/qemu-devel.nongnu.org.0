Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34F570694
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:06:27 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuzS-0001Cv-L8
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvs-0006x4-92
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvg-0002vo-3V
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y22-20020a7bcd96000000b003a2e2725e89so2774812wmj.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3gpC6QDBrlRqoUDnAZkgkjjrqEX50o6S3J99cjzYYnI=;
 b=WsOSTcmbQGcW5CgXPNGpklEtAAf+IcnKQvWGsI/PkcpiHsct/hSLwlKRQLArKhdsi9
 BzxnxTBuE48gmYL4BsajatA9uSuUPrRQXGvYCdjZMB9B4alDrg8uei9nUOxObKIuJuSf
 s1FOI+stDg5Odl+Vfuc8N8b6u0O4XyvoeQLnfIDRGAZ8wD3H9Wk0q0J4aFK3v1OyzhDi
 mVAmjVghljtTl+hWWN6fSkMz3JugwljoevM1ZupXR0g+7Q34M7KgrPErhAC1tViAAi/k
 3+IId3ZqHGW6fKR1Uz60qyvIxR7FNfeko1NP97/73CLTh0hIE20jqH2exU5h7J9UeVeB
 8LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gpC6QDBrlRqoUDnAZkgkjjrqEX50o6S3J99cjzYYnI=;
 b=HYSz3087q5QDun2yPpbUYZQjmZQMi+I5VFYqYHjbbCpsnQT/67/QZN8X+ZbPaKUils
 3U+WhC2192bz8cdMaI4/QTxOWOkuI6glZfclHNSS+uj+4dTEiyG4tbo9ilFrgsemEB3w
 byR3oynUSGjbLS3HyXnv9jgG+pU4V0/aHAWk6ZCqVbnefeFHvRzGOwnPaqgEverx0cRI
 wEGEE7hsX67ew5aP5aj7UzlyBxTJwTYInvNTUEGUBdw8gMI5OiHtsyH7ReYTpoTpYBXz
 RKheagHhHQRif3I7DUH99g4JG3Z17c6vNGr895jt7J2HSyGwHi1Fyg3U70rYfk7q5ZuU
 drUg==
X-Gm-Message-State: AJIora+eFupBEvN7y/4p0O47GW0rQHX53t0ncgbWWe3+k77zWyza/2wK
 wXfru+gQuJBDUxg8x8HblEeMMfXHQh0kng==
X-Google-Smtp-Source: AGRyM1vGvKSq1ai+d89INlmkyAhgpOinAxY/2fy0o2jEr4Cqu4OZ1r/H2WUloX1pYnQNGGDS8WNpmg==
X-Received: by 2002:a05:600c:3b8d:b0:3a2:ea2b:d0f9 with SMTP id
 n13-20020a05600c3b8d00b003a2ea2bd0f9mr1574091wms.120.1657547906235; 
 Mon, 11 Jul 2022 06:58:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/45] linux-user: Rename sve prctls
Date: Mon, 11 Jul 2022 14:57:46 +0100
Message-Id: <20220711135750.765803-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-42-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea4..40481e66635 100644
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
index 669add74c11..cbde82c9076 100644
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
2.25.1


