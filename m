Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C525572CE0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:04:02 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBUXZ-0005Gz-A4
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSj-0000xd-1i
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:59:01 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSh-0006rE-HT
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:59:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 23so9451881pgc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 21:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adgTAr9VDfDVcGX7dOUKK/5iltOe5AGqwdazS0Dpj50=;
 b=PqX9403U7TMHZ1GrCG2x6F1rPzzkR7rnFAuEeXOCRi2vgmBPFprTI5Wgh2QHvyCO8q
 F5tRyR+DDq4PZxbsoIJTVW1rhNAMM0JSRvlX1JpKdQy1vn7Iwfh4Sb81IZpXeuPwe0k5
 2KxZNAEZiPkUJPggBgfi3ys9X9/miDHo/wGR7qQ502KcGpIAmc+m2beRIEmM69Zplouz
 +259hy+5EIv9GD2urFg0qjYwDXWZV5zgxNRmFDy48eygsxyO5fQFQvgZ773DrlzxSqa9
 FJAHilhUOzSIbe2bQXAfVWycTdyQd1vmAdDw5mFqeBJGCPCGaOPKDa7UI1QUNM9NaBOk
 hwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adgTAr9VDfDVcGX7dOUKK/5iltOe5AGqwdazS0Dpj50=;
 b=mM/qYYGxtgiDzyKJlhCR79rZm/DP9B+tc6Rs6RBK5/DjYkXz1n5BFWVox/nRu2nCHD
 gFTChnEZpO3xm+MXlKBmOOhh2XEu1XQqX0+k6ktquhU0iLuhuY2hFlzt2kxyMBDZm3zL
 vShIjoJYCZDN2ey7e1zLp/18MsaLTndhoA7BcBCTmN8aN6Rf9ZvQ4IpgDGKqNVucQel5
 kxTn93CqJ9mOnWmIl3bkOKFjM51g9vFDRXIebiOd3FSj8UyVUrgQGdp65uNQSu9HIynM
 iPrFllnwKIe5scwy/XyDiU/xIW9wDXOUYLM74sGo/++bRiY6JLFXgCaQf6k1bY+6R+1p
 lC1Q==
X-Gm-Message-State: AJIora+wbgBQwzvP3lpo2+FN4XGExun21PlDzltagMpOoXXF7zpTc6gZ
 GSqiJqrTQwUHm/18rNhJZ2X3s2jNT6TqtNAB
X-Google-Smtp-Source: AGRyM1ubvQxye/Ru6/WU37Vudd+eqgvWQD0orpVzVdeNloHSGXPWX1tEMkGcopk8RnnDnSSe8RXZeA==
X-Received: by 2002:a63:20a:0:b0:411:909f:8ae2 with SMTP id
 10-20020a63020a000000b00411909f8ae2mr1523086pgc.132.1657688338182; 
 Tue, 12 Jul 2022 21:58:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:58:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Fill in VL for tbflags when SME enabled and
 SVE disabled
Date: Wed, 13 Jul 2022 10:28:47 +0530
Message-Id: <20220713045848.217364-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
References: <20220713045848.217364-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

When PSTATE.SM, VL = SVL even if SVE is disabled.
This is visible in kselftest ssve-test.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce0..6fff7fc64f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10882,13 +10882,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         int sme_el = sme_exception_el(env, el);
+        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
 
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
         if (sme_el == 0) {
             /* Similarly, do not compute SVL if SME is disabled. */
-            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+            int svl = sve_vqm1_for_el_sm(env, el, true);
+            DP_TBFLAG_A64(flags, SVL, svl);
+            if (sm) {
+                /* If SVE is disabled, we will not have set VL above. */
+                DP_TBFLAG_A64(flags, VL, svl);
+            }
         }
-        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        if (sm) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
             DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
         }
-- 
2.34.1


