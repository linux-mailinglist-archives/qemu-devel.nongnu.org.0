Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE82541B98
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:53:36 +0200 (CEST)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh8p-0006aT-KO
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwr-000723-3w
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:09 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwk-0008JM-7Q
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gd1so16677769pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCRHyiBxfCdHSn9JLF03/2mnxPSf+jP5kgzcaj+4wgM=;
 b=N04GvOk4K5p0AnqkIX0Wj0j2pIcvfpejB8Rc6S3RpcwrjhQnEbeejrAnxu4RrPo1Dr
 lzqUdonhPpnmb7DTPjL9PP093FVHPpoMz0A2ssO1eptyOvbuhX2e7Zx1Xpajwe+o8rGq
 w//43SYKUhR+0JQXd1ivERrH5NxtiP1RNzz9WyXBV9/G/258j8kBHpH9EHUp6YVtJmZr
 PDy1DHsCVzyYTFxBuwrMJjMWjTYVZ1/9dwQX1LaVE0ovKX5UHn6pDMLmOrlV6SfLFEp0
 Rlde28i3NsYB62+8Ozks30hrtI2yCxgeavAWb9wtdZhixdUOQI3CqUSrWhazf2d6jHRA
 pq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCRHyiBxfCdHSn9JLF03/2mnxPSf+jP5kgzcaj+4wgM=;
 b=5XcYXjOfyKjFZPGcBNDgrSqHO7XklKvWtKEDYcqpAMLulDG4dfhXAVAgTgYhXBoogm
 YHbTz1lebyolhaoLuvl+Cdo1PWuJzmrSZcjAuGmg8sQSVrTNpr7v5x63ei8yZDoJLFNl
 xcrpefur8YQqJdjCXr/cOiTXGYA90mKUDt2ZhqkPtDlmxkTM7lQNtOG1RscaJXy8SiRP
 dC0bGUow6ZhULkpSsed8Ied6YhQD3+QDRZqrbNC4Xv/aKhaD9yLx6K/rMwbYDhH8mps3
 GgJM0UypipNoAOmMP11AabRY7b6Pp7boIhvK2qjTGX4CAK/g93lqusHSvTb6w90jwkUA
 W37Q==
X-Gm-Message-State: AOAM533bCJQVFYdJ2YYoEF2NjFJayjNMLCFqCcJ7WtBa4nLtANPkp/Hb
 B8YxTArdcvzZl/w2ySR+SqLx6RGC8H48BQ==
X-Google-Smtp-Source: ABdhPJyhTH1Ntm8K3Pvv+eJN4aSA3gndVIY9R9bsb5X6U9DdhK+jsJ63WRvCRGaspLxzCzitN3RKZQ==
X-Received: by 2002:a17:903:2310:b0:167:5310:9f03 with SMTP id
 d16-20020a170903231000b0016753109f03mr21484018plh.48.1654634220842; 
 Tue, 07 Jun 2022 13:37:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 57/71] target/arm: Reset streaming sve state on exception
 boundaries
Date: Tue,  7 Jun 2022 13:32:52 -0700
Message-Id: <20220607203306.657998-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3e0326af58..205fbbbe42 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14276,6 +14276,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -14288,10 +14301,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1


