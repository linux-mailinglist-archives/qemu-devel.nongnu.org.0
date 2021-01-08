Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6E2EF4FD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:41:28 +0100 (CET)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxttH-00013q-2s
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoU-0004OJ-HG
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoS-0002qb-RS
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m5so9401336wrx.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mE99S3UkDiamuGx6t5YBtNr2w1FyoGDj+zB0sQ6CfpM=;
 b=rwIcor+ZUwRDpi+aLwOMAmM6yN1iU99lCtYqgG+vVEfHAN0FjekXEQyPr3PGGq0i7U
 EZo3ysH8G9C3VDYeqI/YKohR9rps41gW9mV+hzeZwrL03DVyd1PyVU/sH9aTjmqRWRO7
 /QntmtkuzCcjk2mtqvNWRK70l/RIit8LFld6IrsJXRhflQF7FdNTjYUrc9YNOV5z2D+v
 WDG3arIExToHEMnkMWA2CyLBgEM7+qYt7WSkInLHrAAfF+0oN/i5keAhdhcvk80MMH4q
 DhgBc8WOLFPozREHFjsN0IGEVXxnqSnOMNlNjgXyx19T6GXVmzdBOokSpAxQFhW2IkxF
 ekOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mE99S3UkDiamuGx6t5YBtNr2w1FyoGDj+zB0sQ6CfpM=;
 b=WkTuothWgJiD8Rdv88c/M00qVBwFY6rg2Z4PmEwJbzAnFlGU6TJiQq86RV+Bkidb/M
 8FnsQtxbRVrQtGw9THCo1OlRH8fLB1ul1kmCRNjXZ7w0bxYmQricIwJH18CMBWO0ZkoO
 6pbvZ2TTruDXxX3/9QQQQVnfU3bhxPNyIKNK1i03oeYjRb5zr8KMdFCikN0UdjdF/0un
 YuICx01YgYzyVUHWHa+nf7EXJx/6g/FxQ+LAWT1dq7Z+w1paYdoYpsTuTQ4k32YxVdcC
 g1XC89zfRUxwtj5lJJv/x7/dE6n89QTv7RDPJSfAC5qL0KdK8bQjYfMRon5ldARj/A+P
 t8Eg==
X-Gm-Message-State: AOAM533gyFtfpBsqOMJeqXD/ZhmOJsB8X2WZGGcOQrDSNEjka+FqG2zS
 VYcQxBrKP+4FsS8xwJAfPb7M2UZNFISHgA==
X-Google-Smtp-Source: ABdhPJzh0V8VNB89DkAIB1BX3JfxjfZ52JCt7BUMwSQ0mN2mjdSr+44TGy8OWUkooyojCMWL3mJzOQ==
X-Received: by 2002:adf:b194:: with SMTP id q20mr4250243wra.199.1610120187425; 
 Fri, 08 Jan 2021 07:36:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] target/arm: Fix MTE0_ACTIVE
Date: Fri,  8 Jan 2021 15:36:01 +0000
Message-Id: <20210108153621.3868-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

In 50244cc76abc we updated mte_check_fail to match the ARM
pseudocode, using the correct EL to select the TCF field.
But we failed to update MTE0_ACTIVE the same way, which led
to g_assert_not_reached().

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1907137
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201221204426.88514-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d0d4cd1e10..d077dd9ef51 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12928,7 +12928,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF0)
+            && (sctlr & SCTLR_TCF)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
         }
-- 
2.20.1


