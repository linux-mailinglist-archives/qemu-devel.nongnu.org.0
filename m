Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57E2B9D43
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:02:12 +0100 (CET)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs0J-00063G-Ac
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrul-0000Zq-Vm
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:28 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruj-00047g-3K
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id b6so8026496wrt.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IjiHnjxng4qMR4/+51zXvM9fbADFjqwqCwPbseLYFWc=;
 b=eYFPt3srek3zQ8w4Om5FwGBb4agU4HegOwCQderXl5I+EtXCcTNYKmId19umWYYk+n
 207mp0fmYsARpgPGu6AGLS7T8b76vbwX0i74LwRUcV4jGbwr71RfOfkZbEuvmElrDqD1
 iJtcfspdh+y6MBhqF9axptE/9bqtDWE668WhtOaJdr5BaYJ7Jdc0CfT2IrslPNNn5tZK
 W5xOX3Q3vdmowewCNUvCTcnU+s+g6blYmWugi+C6k0ktRMCum3WTjY2T1A4bCHOBASH/
 R/qflPc96a95knU3yB2zPxxAho5foLYz8OjRde3ch+cqYKYHwONvooZrPN1fjwU9BWsP
 pyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjiHnjxng4qMR4/+51zXvM9fbADFjqwqCwPbseLYFWc=;
 b=HKkC8/2XxwoX/x61VyQBhJ6qHKOPgDLxMIWYdz/k4h0KwM7f90AYU0tYVWdvjcnt00
 uNb0BmZBFYe433Rf9siBM+iBmLviDOz6gGRuk98k5jRKlPyifRarle0jxRdbgeBKD64a
 8rdPhF6R5vbZm1caL0VoGaSgo8XrAvKfdv/Vum28YHNMXhff7BnPmwyceGGwEmqG3UAA
 Cnvfc81MqgbNtNhr/zhSvq4d7CuhSQE2s/efzm3UDpZCyfvJE9rOXej9xWXZdfT9rsSv
 V9QfPifsHGehMQAtGIRiohz6661reD1Bc/NJ07PEkMcj0ij7FgJSJdVcI4qOBVLOqnFH
 mj0A==
X-Gm-Message-State: AOAM531Ks8Bg6wq3H9Jkbkt8JhvnwoXeUDzatKVS0VI25iLANWDgDBxA
 5XoGBcYxmFKrp5QKJZqcxndl3Q==
X-Google-Smtp-Source: ABdhPJyYnPU5D4csu7D0UDvEMH17K8t8n65qVkaRe3Xq2mnsO0M+5KBHNiYqgYX99s+0R0OAjHQV4w==
X-Received: by 2002:adf:a549:: with SMTP id j9mr12399249wrb.199.1605822983760; 
 Thu, 19 Nov 2020 13:56:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/28] target/arm: Don't clobber ID_PFR1.Security on
 M-profile cores
Date: Thu, 19 Nov 2020 21:55:52 +0000
Message-Id: <20201119215617.29887-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In arm_cpu_realizefn() we check whether the board code disabled EL3
via the has_el3 CPU object property, which we create if the CPU
starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
the ID_PFR1 and ID_AA64PFR0 registers.

This codepath was incorrectly being taken for M-profile CPUs, which
do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
the M-profile Security extension and so should have non-zero values
in the ID_PFR1.Security field.

Restrict the handling of the feature flag to A/R-profile cores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a4..40f3f798b2b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1674,7 +1674,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!cpu->has_el3) {
+    if (!arm_feature(env, ARM_FEATURE_M) && !cpu->has_el3) {
         /* If the has_el3 CPU property is disabled then we need to disable the
          * feature.
          */
-- 
2.20.1


