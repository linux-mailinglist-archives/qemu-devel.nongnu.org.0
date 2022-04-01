Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79774EF22F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:03:57 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIof-0000JX-0B
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:03:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlw-0003f2-2M
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:08 -0400
Received: from [2a00:1450:4864:20::435] (port=38476
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlt-0005hU-L0
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id i4so4669403wrb.5
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DHc7BQYY98e10RYi3BhMNIgyC3D1Tj1tjFvf8ofOuj8=;
 b=Dh3HV8VWOcYu6JR9t1jjxKF7NZJmGK8Gpn/DSr/NTMXvrdoWfNp4FdhkXrk4WK3lQv
 xrmw5nC0Rg7L3BbRZcKklJclKYUwZ1Jc96I7PC856f+t8OA4sTk9kc0ED6XB6ywcuj7P
 lGUQpXSc7ZITUgKL5kuZNm6gzga22OEvmnJ+W6pu1thsrfw203Wm+PxJYhSc/pzk1low
 5UtgnsU80rXWJfXbIGMtI1jvXNbwTOymIkHXjquxtVK3BjwTt3FIeCoIMPG7mf//lY4r
 fOhqWORw+MNCxF6YOJINkYz1U7Az22Ea1e1TkRAWkobC4RKu6hENJi0oOFIUMhBauaaE
 DJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHc7BQYY98e10RYi3BhMNIgyC3D1Tj1tjFvf8ofOuj8=;
 b=npZUfC6gQV1gnKCu+2xMWThyVtYDJu8S4Iphb+8X0w05adh+sGMLXvOJ9C8ohJXdLY
 R9648GLKS90KdtEaOIkNBMMQqg7aLiGVOp5IokalJ47HXS90a+eTyV0jyQ5q1W6NstQ7
 E2Ox33xPz5f8RaFpIQhwV3OxqpI3S1ZFkYdvXjZCrf1tJhXskpIFD52V2SDusFzR8hVJ
 htP40jahd/yZvnHGbg7tOne2i8jQCg8nXcKiBAYR/bTf6pRnImGGM5YVTfx/UTG8DFE0
 HEJ9YP5eZjLGHFDsfsXoIiUjZqswQ9cAa5fcqVWIARDJSFE2A6n/u7pJCMClLG5MTQi8
 F0tA==
X-Gm-Message-State: AOAM531mq7YMuaxmXnpXg3NzI6gAw6zEjn1ZC9zcWT/ZI5JgliS2usll
 6oCT79/XEumluGLl7s9UlW2JZ5O0qfsXUg==
X-Google-Smtp-Source: ABdhPJyanopvSQInYSgfPGQveLPua3weCpyDVzjNwYU/i5YfLnWFhflPeLFwInPUZlAy8KZqLS36jg==
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id
 a16-20020a056000051000b00203e469f0a3mr8239408wrf.710.1648825264229; 
 Fri, 01 Apr 2022 08:01:04 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] target/arm: Take VSTCR.SW,
 VTCR.NSW into account in final stage 2 walk
Date: Fri,  1 Apr 2022 16:00:52 +0100
Message-Id: <20220401150055.421608-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Idan Horowitz <idan.horowitz@gmail.com>

As per the AArch64.SS2InitialTTWState() psuedo-code in the ARMv8 ARM the
initial PA space used for stage 2 table walks is assigned based on the SW
and NSW bits of the VSTCR and VTCR registers.
This was already implemented for the recursive stage 2 page table walks
in S1_ptw_translate(), but was missing for the final stage 2 walk.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220327093427.1548629-3-idan.horowitz@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a65b39625db..6fd5c27340e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12657,6 +12657,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            if (arm_is_secure_below_el3(env)) {
+                if (attrs->secure) {
+                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                } else {
+                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                }
+            } else {
+                assert(!attrs->secure);
+            }
+
             s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
-- 
2.25.1


