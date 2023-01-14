Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062F966A8E0
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 04:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGWxz-0001u9-Mp; Fri, 13 Jan 2023 22:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWxw-0001tj-5E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 22:12:21 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGWxu-0006Yd-2L
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 22:12:19 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso24462636pjl.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 19:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t7bt1moGaa/vnBd5cAzAfOuxr+X1UUfglkpPnyEpm4w=;
 b=mefwG9gnXOpTurTFADgvQxF7TEAQR9MK0zcHKuDX/vR/OcyBDa2a+xSGxhPhfuexPf
 +8lwlm2t+asTzNr0lTZlaumavhPoKcDg7UHaTxj1L4uTlkGqT6KU45iaO3OPMw/Dezjk
 bVikELuX+U9korZLyC3YT8eF3xJZhmjmoqqGrMGNH+uLNdNhcbUVGGYAoEBYysNx9wGX
 QBO3brCieIR+GfSNToqBUCZ/FeWQ6gR2ZbziKXcpDovvaPB5+8SjoDfSOtdluwv6M32E
 f9j3l2nGAbOS0iOEEzl5ZiGTi8sa9R2ZI4PAaPedXzNgWNPLkE9flJY2tlOT0VArnoZ/
 uxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7bt1moGaa/vnBd5cAzAfOuxr+X1UUfglkpPnyEpm4w=;
 b=VcLM7bK20Z+dgA8S/xxFGnPt91G8TBVyJ6Cb6aSFIXu32+vS1JspA13cK15tn9QT2N
 lDqM0RueRVKYpyAmvLECnQD45rlFRAMWtqqcR7ZrnIlXgctdjCIGCgIjd6Ix9r1AuH58
 zbFd1KcUvc7NiiEYLoGIbAdqRIwm0HjDem2RHp2m3IQTzfACgrMbipURyK4mOnzCMIC/
 8vYcchZC/cN9ZtX29GNi4lqAUMlu10PlsYj/4i9PlEpCQXev+6d2EuLNYdId3T06VBMp
 ZI4Dv31bvgLM9Z7FeJeRJuIdjoe5lHjHRI4P+YCz7bp3riN1uv5qRHFguskUmZvepxhx
 J/SA==
X-Gm-Message-State: AFqh2kpaPOstpCVts4N6KCGdP6nrz0sJNNkYa5w1IeB6Meph3W4HHoPh
 mv6/zSp31P9fPzL8uKa5NDIWlTB/0j+nGYuH
X-Google-Smtp-Source: AMrXdXvVv/l2qU8HGTgPSKsfWBHeuhLKozMLzuKJKzIRSI00sQ8fi/fQ9P8i7YHsReibjHUbWsMHOg==
X-Received: by 2002:a17:903:189:b0:189:ba1f:b178 with SMTP id
 z9-20020a170903018900b00189ba1fb178mr130219151plg.9.1673665936244; 
 Fri, 13 Jan 2023 19:12:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b00186e34524e3sm14880061ple.136.2023.01.13.19.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 19:12:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Fix physical address resolution for MTE
Date: Fri, 13 Jan 2023 17:12:13 -1000
Message-Id: <20230114031213.2970349-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Conversion to probe_access_full missed applying the page offset.

Fixes: b8967ddf ("target/arm: Use probe_access_full for MTE")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1416
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 86b3754838..98bcf59c22 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -142,7 +142,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * Remember these values across the second lookup below,
      * which may invalidate this pointer via tlb resize.
      */
-    ptr_paddr = full->phys_addr;
+    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
     attrs = full->attrs;
     full = NULL;
 
-- 
2.34.1


