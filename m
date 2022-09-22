Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AF5E6B16
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:38:48 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR5z-0000rQ-JN
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0002CF-1S
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB2-0005Qb-45
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id n15so9518379wrq.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=1rDY2/LSnTUCTndHvs7H1iIVK1L+jcasQz21+xSz1h0=;
 b=a/+ZIOel66wrCbEc8p5P3CfiCUfnDlH6dgl330A94JAxbs+f1gdYVjI/vE1SOJY3vZ
 3Q9wE8KU85h8PJPdNRlej3+wWozVZKhYoDuvQHQNM4Naxx+DItNnD6bg3RJ+nRfypmlN
 HopO+eYecWGVuYrscNgyD5aErMlOK1nmt2j6GR4YOeHXqe1HZM93jsBfAIhvQyYes5AB
 5SwAHsHXYt0lRW1m0Wud9aTTQ/vrII6h9eCj9GN5xZ9SbnffCZCVrn47bcNLcxC7Wfcd
 4fmhwit+gJkcIVzQYDNwvdWusvHaTBeRVmKZA1Bfcs4IyNK3FQYg9Ygdx45B8VjOq5AH
 1D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1rDY2/LSnTUCTndHvs7H1iIVK1L+jcasQz21+xSz1h0=;
 b=NdQAY+ULghI8xEz4u8sJJbA1OSSrO8xfKyy9PUD9HapuJ7nWWeXMBpaKTzYId4zlTN
 i5TnQfKwmHEo7eExi58T+gnDPw8lk3sF5AKdxbiHXuhtdhnMuo780e6jqv6Pq2axthDG
 FfJT+o2sLiiEkOeJmOPwgzH/pTlthCVF3GxhtNGma8gfDKWIabTOqiqAzLYT6ndIHbcd
 xrjAbIXxS4M+AacLyELlOjfHSNlc8w0/pR5QEXbLf9mF/lwE+YQjpJEWkB4nLozhsveC
 f8vXHl7GF+zsRz8aBrnPiLC9ilN79lXEMiCVq2eGRpJisD87+o8xuveEpYQkCOqy7SMN
 tUaA==
X-Gm-Message-State: ACrzQf0amay8ltyO1RNJyKt/Ufd2BVcruU6Id0KEyb+hMBPdVXlQtBUd
 oKIs7GnLgP9YYiU9elF3QO3lyC82GnxelQ==
X-Google-Smtp-Source: AMsMyM4RD8Amj0S3dw30K+oGr5yuLh4QY88JTyV98J8oVctvRc90XerHPh/hrhlTGRjtyJyfG6wbkw==
X-Received: by 2002:adf:d84f:0:b0:226:d37a:b2c4 with SMTP id
 k15-20020adfd84f000000b00226d37ab2c4mr2705460wrl.42.1663864550518; 
 Thu, 22 Sep 2022 09:35:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/39] target/arm: Add secure parameter to get_phys_addr_pmsav7
Date: Thu, 22 Sep 2022 17:35:15 +0100
Message-Id: <20220922163536.1096175-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from get_phys_addr_pmsav7,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-19-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9e1f60d10b4..1e81eefa47a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1510,12 +1510,11 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
-    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -2418,7 +2417,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.25.1


