Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7B55248E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:26:47 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3N2s-0004wi-Io
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdU-0002xY-Ac
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdM-00024M-RE
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id go6so6044933pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=vOZ6WjVfq6PlWLWxHF1KA1SQq4/Xh+RW+M0BmTlonYHyzfaNeFv5rNpI7CxpcNwlEh
 b6iZD77nMbVosz+qSccHvgMQuLqUDCkHOIJ0emwnix8ROXczhmOJdQDsLTx1f7E65IW+
 h5BIjik+8O8bRMCt10Qw9zBxwsz90LKyGF2mZXBHQ3reD7Ah2JA/txS6fDl+b/iFhoPa
 tlMK1s3cCUGaVM2LqFrq/F9ShKYPmUL0Dw0LK2JaaG1i3x1Pp3INBHPvpLqleDAiIbPh
 ttHToHqd2GQvY9xv/sLIpYANx61K35muwuMJYrYR1mrSiCoczZqvIobXZ623IekTNdyQ
 xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=aRoXUcWizFskriAtkOVPHosTs7c6c095ZxB0dt6jwutTxVLmevrkfQt55hs3gUEikg
 2qUfBQ9Y1jCPp7VkeFdrF7wvfuoEfybVbRJ3dWhODiwsep7/mdU2gyi3V7LlqbO6y1Da
 /1ceYUkRN7vvJGRBlNktQ/nK7vTZLiih8oVQpup1qENxaP8uJ2kcM6w2gjMdd7ByxAnx
 egEgS7e9ls1aSgDL/0eo40laskVKtL/BsTget6FRRrCto4pTUlWMT274wEeb4Q5vWV52
 MUkZEdCWKvI2xBV7jsh9RnZav4yCiSkhKscNOpHnpyovNfk5asZ9XDdSpGorBIarPbzC
 WYNw==
X-Gm-Message-State: AJIora/ziivPWOE+9B6IFWUJ6/deKbjWWaOoM0428tCwMT5/0RmRAImq
 +dPuJJ33QOZJk0x52n7ExsMHPbqZ6NUn2g==
X-Google-Smtp-Source: AGRyM1tMTZtxlPr8CyHGQ6tAlPhzxXFxJQCdfTlP5gBRWmd5BXENSiKQXaszv/NJuiTHn+LgLlagXQ==
X-Received: by 2002:a17:902:74c7:b0:16a:1be3:b7f2 with SMTP id
 f7-20020a17090274c700b0016a1be3b7f2mr9273904plt.42.1655747779598; 
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 49/51] target/arm: Only set ZEN in reset if SVE present
Date: Mon, 20 Jun 2022 10:52:33 -0700
Message-Id: <20220620175235.60881-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


