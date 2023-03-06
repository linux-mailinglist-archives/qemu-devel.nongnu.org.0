Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C96AC578
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrY-0004By-E5; Mon, 06 Mar 2023 10:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrU-00046H-QP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrT-00028L-9G
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso5467969wmo.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eHmyDubzG8vE68B58KfrFN1VX33V9Ex12FkKohFAAaY=;
 b=OXxTZSsN+9Uq1p+GthgrpcYWolXQ8Uni5ioudhBRcG27bn7Y5ivdYOCa81dTuxhZZk
 erhRoQEcs91g2ZgsdAG+v+lSCbT1ISaZQD52UpAP/IVB4TFZpLz4pYA9USf8KHIvSNth
 UFmul2XzotIay2r4yuXMaAghABls9H5HCgHqvNKUrcxzP4RkOrGsLQLXa5Fg3Kn4Uecw
 ABnn7zZmEwcDlip17FIo9hYuq+SB7J0yiL12H5zVUpobS+/CM6B+s2P0fXqmIv/XH+71
 cQJr8Swu1epwlSOqIX6w4K85sLeErwfvdnECVQp3MguG8OpjSJRy5XvDw7WTU63Ar/z1
 BFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHmyDubzG8vE68B58KfrFN1VX33V9Ex12FkKohFAAaY=;
 b=VVL+Na7T60cJgzVYdZ4Y4gVV8TOHaPRhmF4Uvj3RI+gWX90jS/toCPFAuYyTLjRAb3
 zXq2sq38Pq1a8jMa7PHNohLLp6RRe6tg2fne+PscP9ZVvKfBf3+P29EGh9Rwn/ovkh6Y
 PyEKyPFK8xAJdhYHBBAJD50EE2adVjfzbbA02Zp94YHWvOcAnE8Uqef4hoFcFumGrm8i
 PXm/2igiANAyFfHzz8gx4ve7bh/zZPi13KrJwTghJUP3D9WKBRd+0PUi+R9nnjIzOR7A
 VumTHkR/dM8wE0nxDbODDwHzvB7NvsvPNKW58pP2UWluEz8IqTT8D0yGJCQ6NZezFR1u
 +JAg==
X-Gm-Message-State: AO0yUKU758Viw3oAHQNMHygPwee/Fv0c9v9yKfoMfdFlZ+55bPjNxdYt
 gsDLyK1g4rNue3Uj9ur01RVrPC6BXegMHKPtVd8=
X-Google-Smtp-Source: AK7set/XqQFCpfnv4NFf3QAbySfAk2t9R40reFtXU8AKlzk51M+fRnx1lFEStrMJX/MRgB48yBNoIg==
X-Received: by 2002:a1c:f714:0:b0:3dc:433a:e952 with SMTP id
 v20-20020a1cf714000000b003dc433ae952mr9368835wmh.33.1678116890580; 
 Mon, 06 Mar 2023 07:34:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] target/arm: Diagnose incorrect usage of arm_is_secure
 subroutines
Date: Mon,  6 Mar 2023 15:34:31 +0000
Message-Id: <20230306153435.490894-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

In several places we use arm_is_secure_below_el3 and
arm_is_el3_or_mon separately from arm_is_secure.
These functions make no sense for m-profile, and
would indicate prior incorrect feature testing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227225832.816605-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ab187012770..c097cae9882 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2384,7 +2384,8 @@ static inline int arm_feature(CPUARMState *env, int feature)
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
+/*
+ * Return true if exception levels below EL3 are in secure state,
  * or would be following an exception return to that level.
  * Unlike arm_is_secure() (which is always a question about the
  * _current_ state of the CPU) this doesn't care about the current
@@ -2392,6 +2393,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         return !(env->cp15.scr_el3 & SCR_NS);
     } else {
@@ -2405,6 +2407,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
 static inline bool arm_is_el3_or_mon(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
             /* CPU currently in AArch64 state and EL3 */
-- 
2.34.1


