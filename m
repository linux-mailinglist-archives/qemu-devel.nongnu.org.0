Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB72F36BB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:12:47 +0100 (CET)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNDq-0006g5-9d
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzY-0001SE-Ra
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzX-0006xO-E5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id d13so3209623wrc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E9f67EoxTBsbFvikJJ/TTwZHVpUMqRmi4LByom0Aj1c=;
 b=BqDuAlvEV7Htnn6IfcFA+KXMRHuVBupNLCQvmbhu4GTj3zb/A/iHNmILhp1tK6KoAM
 0mgQVmDf+ojO0FoqVR9dcj95ZUWalAa4zqDqfOZlaYwNOnUg4D4tIOpc6zUHh4daGddZ
 7ILD5NFZPeS3yOcpcKI3SX+a7X9dUgRSZmSmOj2geH6XSMfat3XtDJuGRKIQC44jTYv6
 LAgvcEqVYFOISxoVszl16gNIUtX5yNYtZ2m2zCfTEmZxysHz3BVN40e6RT+8nzuWb+eH
 0flM6RFvS8QlpOe446rtCps6BJyvOqt0T2Oh6LMs7I6Am6g/dJFf/qKawj4bVAmsXM0l
 OWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9f67EoxTBsbFvikJJ/TTwZHVpUMqRmi4LByom0Aj1c=;
 b=WUETBF66xZljcXusy78yjqm9SWR7nOAPwVRfApDB6tCuR2y6tBAt6HYmDpFxXjvhF7
 9HuoTTIn2C4P21p++lrbjxUqawCX2fnKNhy+nPCJhx8iSYR/JuPSN3L8f3YnHAcg074B
 Eh3PMU7DOwppb98YQz43gbtIanl2xmz8h+1aU+rtD0M1ku49f0obc+jshg7DomEieJfH
 6kfVxkTwXTmxer8fZEWbwrVSbTP1gIunzbdx0GB9DWchruXWb0Ym7UJ7tCKib4G7QK1u
 +dwJ0pCho8zDicxZqwl75/cX9uN0RhJY5gsrl8CScy5Lu0pqERwCmoaCyv7wtCMnTfEi
 Ej0A==
X-Gm-Message-State: AOAM532452emFb0HEDYIfgM0t0uao7bjwKVjHjwINtXoAXbkFRTK4WaA
 DWJn3mAjhZLEFEtFoUcndDPgKRL2Gu31jA==
X-Google-Smtp-Source: ABdhPJzgEP/H4nLm0zLru+mKKnBnY932moC8FHPIkBpAWAq+SZBBs8gjIuJQwrIWQmuZWfoW0d+6sw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr5229355wrq.75.1610470677936;
 Tue, 12 Jan 2021 08:57:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] target/arm: make ARMCPU.ctr 64-bit
Date: Tue, 12 Jan 2021 16:57:34 +0000
Message-Id: <20210112165750.30475-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Leif Lindholm <leif@nuviainc.com>

When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
TminLine field in bits [37:32].
Extend the ctr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-id: 20210108185154.8108-4-leif@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fdbfcec2b09..0795c4cc06a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -931,7 +931,7 @@ struct ARMCPU {
     uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
-    uint32_t ctr;
+    uint64_t ctr;
     uint32_t reset_sctlr;
     uint64_t pmceid0;
     uint64_t pmceid1;
-- 
2.20.1


