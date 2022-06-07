Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588335415C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:41:02 +0200 (CEST)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg0b-00045n-Ee
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft8-0007KK-Ff
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:18 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft4-0007E1-B2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:18 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so16421711pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=G8ki5poRn/nJZL+hfoJ7szwVMJv0HsA41Sf8kg4mIpzhQHc6d81MefRFl1F6jasI3x
 7kLczGQ8+oapdRWSEex7wCKhVnOXGpzxOBi/xbC8JCgGlHS2PS9iSNQ37vnisfuM2F0X
 D49/JGFyPvJ1mvg3ClUmT0lny+2v/jK2/xvTW3+lSuXy/uOVy9kWohBKbGs9pBcn8JSo
 3x7OalSaIDzAkFA5B0LzwBEBxztFYLsMsw849V/0PG8Qe0T7mt51YCI05hVW4RIIFh8l
 tgZHgZAp1T01tVXT5oSGg4qp7wc9PQlYlSE7APkq6QmTL0un7GZebJU/iRJ1JaYApp0O
 yxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=DIqkx2qowqz/EDRJdrJvnQ1/YPdPSmdc47jTjLMM3uwby/YMznsVBRyr70A1j4Y/wh
 nKy8VbeEXF8kyUGLdMZrhaOIeBn8uNRXB9Bl7ChpoOhOZgn5/vIfeBL23tbzl++eyXc0
 Xzioc2/rmZW2o6E9yRXl4OrfMiUdruShkaw1eyn2HUTTLTtjGhiF7aCAw+cGxgtAhs3E
 RlTa+FDRajqV+nZLMn1TydIV5CfRRQ9sgHq4p0GgLBMKQc4/qpeSFg2Kjqxqz/BRy1Ln
 900QwfSLVSxja/wMDLivhXXeAKPKzg+5gffa0uVdmYN2Xz5RjHCXVxPnYo4vMIiccWtO
 ETEg==
X-Gm-Message-State: AOAM533OCwHogukUtWGpC3O7I3mXCbHFu/R2EEFM4NSf8+caY9jQQnCk
 /t9sgSjyV3vNGWxLg8IQMGdevHwa84M8HA==
X-Google-Smtp-Source: ABdhPJzh7x8mhBjYQS7HKItPqh697NCApb9w3hYqlBOMVNBI18UMNIul6FmyDLXlGYijEYxEUg3a6A==
X-Received: by 2002:a17:902:aa4b:b0:164:11ad:af0f with SMTP id
 c11-20020a170902aa4b00b0016411adaf0fmr30974938plr.54.1654633993129; 
 Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 06/71] target/arm: Use el_is_in_host for sve_zcr_len_for_el
Date: Tue,  7 Jun 2022 13:32:01 -0700
Message-Id: <20220607203306.657998-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 839d6401b0..135c3e790c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6248,8 +6248,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.34.1


