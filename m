Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C44EF22B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:02:53 +0200 (CEST)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naInc-0006Vl-E4
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:02:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlx-0003gj-0g
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:09 -0400
Received: from [2a00:1450:4864:20::331] (port=43995
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlu-0005hl-Fy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so1638793wme.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n69SDyB9UIAW3KHjm5y4sX5YK4nF3J1IMIpH0a4tlR8=;
 b=vNFjxZ42fXfviIIYweayv3HL0i9k5v0qAUMMCeqT0aZNbSRoinV2GcMBf7jB0K4eQx
 VLCS8BhXzFbjknvxu22KAAJnUUDYMLjLkrw3aLpVMiTq08vuAHgFdEsgf6qQlcR65JLs
 CXsvzrpg+e1NF0lCHImITKt90B6lIHOx8E6YrL+RbuMKjg6LyG2nHl1YTc4aK9alF0Aj
 1d8ZQ9AqlX9qbLmsXPOuZeAAQcubE7Ls3a316/deMgEAoAYjqWx0QvkKmu52Lu1eWVe6
 Z/iyuE70PmXgD6eqe9SaQltC+xjVWIjak0mqe7qNvxMy1SLcqA6TldxTHMOngsIVRJLy
 DviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n69SDyB9UIAW3KHjm5y4sX5YK4nF3J1IMIpH0a4tlR8=;
 b=v1ZJyFuXo/+MAAXgUSFPEbDqCafEjiFXodUBRN4KlKKJ2gz9piEQxzXLfp74rrHPqx
 TiRN9vV5QHvyNUO/11IM3Vz11lY5rXvundpuPSEl8DzoHnN6Ep5m3zcU0SxgoW4MHNEw
 5vChST6QX/99uQa5pzh2D3vEwZj96KumM2tf+L4zO1tUgb+sKvJpGLg6oeFsQZnK28is
 iqUU3eLOI6vyvNWOr3lB+zTHkRa9ewBDhEc0Nir+v54ymMAXBjvi8GM+i69nw3LASsxI
 kbFvLKdcNY5Z6IutJJXQRZrmj8su/0sNHVMGLE0HGNsjFQiKktJOwiobXvA5tPO+zWz7
 pVbQ==
X-Gm-Message-State: AOAM533LsMoOVfqZtFwHw+pv1MuvGI4qVFOWAJi/6hiHI8vNAyRLDi+1
 8Di/Bz07vSwYb8C9FmYXPyZ7idI+qT8fbA==
X-Google-Smtp-Source: ABdhPJxMKPCylB20c7lwGJlzcLBmDfbpUvhGrp0LPZKB4tOGPbUKl8V/GdYJrD9glbxHJHcHtAsdcQ==
X-Received: by 2002:a7b:c14d:0:b0:38c:801a:a8b3 with SMTP id
 z13-20020a7bc14d000000b0038c801aa8b3mr8979351wmi.40.1648825265078; 
 Fri, 01 Apr 2022 08:01:05 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] target/arm: Determine final stage 2 output PA space based
 on original IPA
Date: Fri,  1 Apr 2022 16:00:53 +0100
Message-Id: <20220401150055.421608-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

As per the AArch64.S2Walk() pseudo-code in the ARMv8 ARM, the final
decision as to the output address's PA space based on the SA/SW/NSA/NSW
bits needs to take the input IPA's PA space into account, and not the
PA space of the result of the stage 2 walk itself.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220327093427.1548629-4-idan.horowitz@gmail.com
[PMM: fixed commit message typo]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6fd5c27340e..7d14650615c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12644,6 +12644,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s2_prot;
             int ret;
+            bool ipa_secure;
             ARMCacheAttrs cacheattrs2 = {};
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
@@ -12657,14 +12658,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            ipa_secure = attrs->secure;
             if (arm_is_secure_below_el3(env)) {
-                if (attrs->secure) {
+                if (ipa_secure) {
                     attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
                 } else {
                     attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
                 }
             } else {
-                assert(!attrs->secure);
+                assert(!ipa_secure);
             }
 
             s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
@@ -12701,7 +12703,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             /* Check if IPA translates to secure or non-secure PA space. */
             if (arm_is_secure_below_el3(env)) {
-                if (attrs->secure) {
+                if (ipa_secure) {
                     attrs->secure =
                         !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
                 } else {
-- 
2.25.1


