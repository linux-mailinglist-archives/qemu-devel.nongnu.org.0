Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364F541D15
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:07:59 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhMk-0001LJ-HJ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx2-0007hY-9W
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwu-0008IQ-5R
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h1so15783303plf.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=HoAqVqWW+Wh81IE7Dp8FnwFSqUG7cgPPRTxVSCo7lKL7aKKceTvMGUAMK8E51eALOV
 Tga7x5rRLYKLGcQDWXRSK8X1A4nDUdeVbMSF/ssdfeidJq71Qq88E0XjcWFGSI08QQ7b
 fPNjOnmDBB4k26NC947+iWl3OOlDV0ISDT1oNtFHcu5gzEvQ2zgUUfERZFjyc3igSfEo
 mKwmVk7YDw1vDv4yg2JfXfu3c5KIDoTVvplKXcyOYeHu2yfpw69313GcMQvmP2VUNrYJ
 SeN/icEIT89X8gPY+E4PhJYmWzRDwMQc7Tn9ikOSIW0s1ExqcaFx5y5R5UwSjk7eRwtW
 MGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=TVN44ZnYBZtfS0Usl/4dHiL99s+SVlfRi5TpZUwot2CJ8FiQILfgF7J716xe7IdPwo
 jh8TW8VOA+KOyegpiHCOkEAE+wWk5aryPAdQ70LW2LhSIboOliPQJMEu+vdE98EM/SGK
 wLCHNVTg4hZzcs9Vr0iIOineFAOmsf96SGrderuAvKiFLvzRrBdLZvBwfqMXeCqdenLy
 qiRvlPFGwAaPFVNgG9m9whCyTQpHyd8d4YvLjN4NVLSBSMuAQWVy0YYunCtARPkV+iob
 2S7OXR7BAq0L4ebPJ7pL6V5cNIwCV/0KTVc1lVkl1fyVwJX/4c82o9BQ5nwaTQg4QfbM
 i85Q==
X-Gm-Message-State: AOAM532VVMX1ArwDr5fG5kfuAqEXnzfYgidUb7urOP1W+MzcNDV0O67D
 0soCVp1QpDi/HzJMCQVAcSe8YsxC3oOyVg==
X-Google-Smtp-Source: ABdhPJxlWuoJdWiPrZTAo6pMPQh2y9rJClr05c5ijEOZaQ/FhW8Q0Qj8xuJh/JDM9R2wRRHmYIWbrg==
X-Received: by 2002:a17:902:ecc9:b0:163:e41c:bf12 with SMTP id
 a9-20020a170902ecc900b00163e41cbf12mr30359335plh.164.1654634231437; 
 Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 69/71] target/arm: Only set ZEN in reset if SVE present
Date: Tue,  7 Jun 2022 13:33:04 -0700
Message-Id: <20220607203306.657998-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 75295a14a3..5cb9f9f02c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -203,11 +203,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1


