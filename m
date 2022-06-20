Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C171552368
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:59:33 +0200 (CEST)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LgS-000054-Ex
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZs-0005TQ-31
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:44 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZp-0001L7-Gm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id k7so10385861plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=38/RXM+WBzUHBMMyw1UzayoHMGrAYWzz75ajNBMC4nI=;
 b=ALhXlJpgckf2Tf2jQoui0dflUa2+yJCVBBg/8tL9MsW8LuqDBe5OAQ7B1qunrauCxp
 pVQjyUs1JQDfog5wLLrkDMCpXPisxiEZvALe/j3CTJD2C57OiDZmuUpeRAparqeI9hBY
 AZ0OPlfBDuDfVPv6A6b1IpoHoL3QyvJ0JJLAfx5qotfYnz/vSqnb/wRscjXHKMl4OkyI
 yq2sZDNp666cbZXMOEmYnZUotI6g+0/LB6Wjgstl7UNQpqVNxq3TbILl0NxJGlNEdmjx
 y+l1WQBz6sC+yXX5S8LI8p5y2cTdN6XIYaOdZm5Q9hVzFTL/E4ecH84+fNOWyY7/Bnvh
 TDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=38/RXM+WBzUHBMMyw1UzayoHMGrAYWzz75ajNBMC4nI=;
 b=z0moRp03oadaDQFPg0zQtR869GUqfhHcnbwzmf7SY0ciUyetfxhM5pfjS4yHps3t5r
 vmkXe3dxEQ1KcZJit6BtaKAiIHm/00rUfoGLXAaPKsw4hCLtvQg6wqh1yeEyFwPfVF3B
 tshn6UxUFdQ2CGf5D4cokrhG6KuxXBpFzFZEsaUhlYTCbLzPv+IKS/+pPVMy///aNkQi
 9vdqwZFqE/WqibcimNA44FyCMp9GR9iJStBUaPcP6N+b9k7toh94kJImmIZLzvEm7UkX
 eMinIVVifj7znX+1vF8ajo4MIgCcWgVFqpg1sS5mDLa6iMxKx+OkSeFfrS/lWcVrdAwz
 QHJQ==
X-Gm-Message-State: AJIora/TxderrzS9Kz7tRbZAU9vM4dKi7ZsqklJPuaPo+87MQ/a+KgfC
 QnpThV4juwrMnI+LpqMg8xRLZ5zVtjLvIg==
X-Google-Smtp-Source: AGRyM1tztUT1xbW3o8rNoA/ypgWurJI2H2UETXSwaGgFXWk/8dMzsS1WIWsYIlTtCXdL4pfgiVXHlg==
X-Received: by 2002:a17:903:2494:b0:168:fee7:6daa with SMTP id
 p20-20020a170903249400b00168fee76daamr24474943plw.39.1655747560186; 
 Mon, 20 Jun 2022 10:52:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/51] target/arm: Add ARM_CP_SME
Date: Mon, 20 Jun 2022 10:51:48 -0700
Message-Id: <20220620175235.60881-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

This will be used for controlling access to SME cpregs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        |  5 +++++
 target/arm/translate-a64.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d9b678c2f1..d30758ee71 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -113,6 +113,11 @@ enum {
     ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
     ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
     ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckSMEAccess().
+     */
+    ARM_CP_SME                   = 1 << 19,
 };
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9a285dd177..8f609f46b6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1187,6 +1187,22 @@ bool sve_access_check(DisasContext *s)
     return fp_access_check(s);
 }
 
+/*
+ * Check that SME access is enabled, raise an exception if not.
+ * Note that this function corresponds to CheckSMEAccess and is
+ * only used directly for cpregs.
+ */
+static bool sme_access_check(DisasContext *s)
+{
+    if (s->sme_excp_el) {
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_smetrap(SME_ET_AccessTrap, false),
+                              s->sme_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1958,6 +1974,8 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.34.1


