Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C351DD97
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:26:01 +0200 (CEST)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0mG-0003VF-R7
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i1-0005NN-3a
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-00052r-PS
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id j15so10713902wrb.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s5hwKzJz7oHObalRn4AoZXqvpOR58c84KtTr/3Ljs14=;
 b=pLXF4dt1YULS2dJNp1N6sAxWyGU+7tQPTqookMr1nTArZbRuQGq6EW0AN+WYacusDS
 Ts1f0Sh1jRjEZ3AfGdAsgWHJb4PzEfmSTFaSW7H+VdP8SgaiQaptuLhJ/hqs4p5UqSQw
 UUVBnFaNlMvGMh8y5H3+bXAOhyxsertWQI7N+uJSXOuRAfIJR2CclmeBgdN86ti8vjMa
 1zZYYuceJOnYKWE77jQHld+hePRci16VFE1JnHGwACjGPqpEdV5Pxl37IwZ3tlpLpl+d
 3cZwfzyNAt+fosXCQsMrxOl2UUK/VpzkUuwEcpoRVA+x7JPWjDNxviS9HQKm9kQRSEBY
 Kykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5hwKzJz7oHObalRn4AoZXqvpOR58c84KtTr/3Ljs14=;
 b=ufO8TZ+tN9coGagSkLt7GinvB5ExUed8wesJkd+tPa/Mpp7NeTpTiAntWCHY8P3Pz5
 c6GMypj1VmqJDW0Zz2S0vtS1+1WhPlXw2qvU0hTvm50HDTIVC9gISkYiDfQdOA4y7vwK
 DAHdgWeVe/CYNRxDoPV+RVYytioK1IcIJ/4RbnQIzZtAvkfsmzqQiXSXnlRtg9Rk7/Gi
 gm+xerF+7t5lhVa3VP8Cdb6QuknU3v0N0zLGnOPChmLAJ7qxWd5Erufea5R9xD8DFJ2i
 zfiWie3564I2C0iTG62rbKyt1gmpI+vB/o8qq16gXXYVGrxSgra+e/Zedi1EoXTH/2SK
 pMqQ==
X-Gm-Message-State: AOAM531oJevyWoIH3J3DV8DybiT9jn/hUKvJVoBkkF9yEpBqvvyJO2yH
 ljNppBjI9nI4V7H03aSdcejdlvbvgXHQ7g==
X-Google-Smtp-Source: ABdhPJyhNxVDAiC6m84dnavs8hXp7Zj49R8iSAtkm0h3keczPIrG/L5rEMjNIlKZ+7AITPMr/ygl1A==
X-Received: by 2002:a05:6000:1868:b0:20c:95c4:ed9a with SMTP id
 d8-20020a056000186800b0020c95c4ed9amr3302258wri.243.1651854093461; 
 Fri, 06 May 2022 09:21:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
Date: Fri,  6 May 2022 17:21:26 +0100
Message-Id: <20220506162129.2896966-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The GIC_MIN_BPR constant defines the minimum BPR value that the TCG
emulated GICv3 supports.  We're currently using this also as the
value we reset the KVM GICv3 ICC_BPR registers to, but this is only
right by accident.

We want to make the emulated GICv3 use a configurable number of
priority bits, which means that GIC_MIN_BPR will no longer be a
constant.  Replace the uses in the KVM reset code with literal 0,
plus a constant explaining why this is reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 2922c516e56..3ca643ecba4 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -673,9 +673,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     s = c->gic;
 
     c->icc_pmr_el1 = 0;
-    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+    /*
+     * Architecturally the reset value of the ICC_BPR registers
+     * is UNKNOWN. We set them all to 0 here; when the kernel
+     * uses these values to program the ICH_VMCR_EL2 fields that
+     * determine the guest-visible ICC_BPR register values, the
+     * hardware's "writing a value less than the minimum sets
+     * the field to the minimum value" behaviour will result in
+     * them effectively resetting to the correct minimum value
+     * for the host GIC.
+     */
+    c->icc_bpr[GICV3_G0] = 0;
+    c->icc_bpr[GICV3_G1] = 0;
+    c->icc_bpr[GICV3_G1NS] = 0;
 
     c->icc_sre_el1 = 0x7;
     memset(c->icc_apr, 0, sizeof(c->icc_apr));
-- 
2.25.1


