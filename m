Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B438B361
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:38:14 +0200 (CEST)
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkkX-0003PQ-4K
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbT-00084H-Lu
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbR-0000gq-4C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5674734wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UgJyl6SmpghGPffAzR64zbb98zEqURj95gernOR9oB4=;
 b=ltOff0KfVmFfHNnp9Q6l6JrPCOGaOOzh1ZotQ/fmpAcmhFRPxxhQeN/IGm+Dqnz/gE
 /ux3Ic6wIt7MLuQFWRRwsHS4L2RQzEqI7Ol3RgB9wrxTIwYIBRMf0Hu1DTGngjubYL7Z
 /fzLLbi+zkVqK/GJ2loXtIu4UmwNztUgvDyRTfqPQuQY7+GCi3VIYWIhTbio1N0s8ByP
 cC10blu4mFbs6PVjpGPy5P/ML1sVh9CrsFrSLcYVEDbUJi52MXQdZT9Jg5mv47Nq1x6v
 vOOgynulybouxM31s2BYBDybNmXOLm5VyD5Df0uPQJdGKw0kU16D2jNUndyvJM8sJ1Ia
 Jv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgJyl6SmpghGPffAzR64zbb98zEqURj95gernOR9oB4=;
 b=RKpwko5scy//F16ubgKASMFkRooVTdTW7GMvFW/xFdPissIHYr1MlMR6QdDUK51RuG
 In9QhRB0aS9CDYSJ6ZPqkEtjYNSx8N5dRGsesX0J9VlYgKKetE8N+b/UtmqdC8CqmOmH
 MFerZ/jQl8xu+pd+47lWkrlDXBiu8agGGmqO1/gGbCO9HuYrfC97hwrtF8QGll1b4Nbn
 /MzudO0SHisOr/Us1X+VvgeYUoiX5Rla8u4I/p0ayM29tKxMdaFuvKT1xeIkPtTcWKDP
 gu8E1KVfID7a67F2bZxMRoQjlolyG/WXRWugfHKPqIkLKPmHWnv/7s1Mw+MEeH2T3arD
 9JHg==
X-Gm-Message-State: AOAM533d2hIdF4adBmNnC8C9wTk8k0ws5IQqJY9hIl1XQn+3vgfa944B
 1uMwvcauR7bMhDULTN7z+aQJ0w==
X-Google-Smtp-Source: ABdhPJyHRhlZN19k7D3+xBCkdk/lfkczfhY6G2sv1zXXmCei8h4SccPpxiGK2cLvuDZbuGDPWQKCdQ==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr4709920wml.122.1621524527742; 
 Thu, 20 May 2021 08:28:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/arm: Make FPSCR.LTPSIZE writable for MVE
Date: Thu, 20 May 2021 16:28:38 +0100
Message-Id: <20210520152840.24453-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The M-profile FPSCR has an LTPSIZE field, but if MVE is not
implemented it is read-only and always reads as 4; this is how QEMU
currently handles it.

Make the field writable when MVE is implemented.

We can safely add the field to the MVE migration struct because
currently no CPUs enable MVE and so the migration struct is never
used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 3 ++-
 target/arm/machine.c    | 1 +
 target/arm/vfp_helper.c | 9 ++++++---
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b0237f0dc83..0e33db88240 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -563,7 +563,7 @@ typedef struct CPUARMState {
         uint32_t fpdscr[M_REG_NUM_BANKS];
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
-        int ltpsize;
+        uint32_t ltpsize;
         uint32_t vpr;
     } v7m;
 
@@ -1561,6 +1561,7 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 
 #define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
 #define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+#define FPCR_LTPSIZE_LENGTH 3
 
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 62a71a3b640..81e30de8243 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -332,6 +332,7 @@ static const VMStateDescription vmstate_m_mve = {
     .needed = mve_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.vpr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ltpsize, ARMCPU),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f7..e0886ab5a56 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -195,8 +195,10 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
+    if (!cpu_isar_feature(any_fp16, cpu)) {
         val &= ~FPCR_FZ16;
     }
 
@@ -210,11 +212,12 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
          * because in v7A no-short-vector-support cores still had to
          * allow Stride/Len to be written with the only effect that
          * some insns are required to UNDEF if the guest sets them.
-         *
-         * TODO: if M-profile MVE implemented, set LTPSIZE.
          */
         env->vfp.vec_len = extract32(val, 16, 3);
         env->vfp.vec_stride = extract32(val, 20, 2);
+    } else if (cpu_isar_feature(aa32_mve, cpu)) {
+        env->v7m.ltpsize = extract32(val, FPCR_LTPSIZE_SHIFT,
+                                     FPCR_LTPSIZE_LENGTH);
     }
 
     if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.20.1


