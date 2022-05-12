Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114D525113
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:17:28 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAZD-0005ca-5u
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032w-Mw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWt-0000Cn-4E
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id f2so698562wrc.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFazlkHMmhQpRiaZlAgor2aleWAxzk2mzxtr5ZyM5M0=;
 b=Ggoec+30JRP6CU9tkY5yT3493FYw37Z7c5pLDCRIPElqYCeN/jcA0VHEPDc/8rm8GK
 Me511zSVA95XQ7C5stNbqZ8NRWVSfiA8OTHV88YFxvBwGW5JGUnEwjIsJRsWu2FkuXK/
 pDM/6FvfIAVnWzs7aXdQRuwqeSL6aaSn8ubJ8LRC41FDSh03KjzBJL5gcz/YQpPEAoTb
 BWlb2OIhnCc2b6s9s/UMmal8EkYraDvE4a+31H+WeZsFVW4bWAkWMhHkGXu8hEu6fF+R
 EOj6XP+YT9w/W+tZlC/9WNvzzZZymdaB8ezyQ9n2CGKB3r/QHmPfR6EXC3swEY0mMGfo
 25bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFazlkHMmhQpRiaZlAgor2aleWAxzk2mzxtr5ZyM5M0=;
 b=Z4doQVPnhpTAItGzwiluG10Ois3kycw3mODqPUn4LvQ8Zq9li/Y1/7WVu81Y8HIGnK
 bfbOdeEZw5IlhPHxRgcydvFiBijAp6emK+nupcK7c7MYJUG/4ZGmrKZ98Ozcz5QODKOU
 FxY8YOWt9wf9Lez6zSfsElvm2JNseLN1EXTD+fo9CBe2HAQg9Lbld1BFYWKxXu1NsOK/
 jrubDxA7iyLqzmgE74UOU/a8RzfsVMN8A1DP/ls3lChN0vjy865Rm4+qKGnvafVbxNvS
 YZsqT7fcxAAwtnWhQzZq0MY2Ti34QKuvmefR4v1m49DPCcvJYgvX5i6nVOcGy90z8trl
 fNjw==
X-Gm-Message-State: AOAM532Z4CALqgIvuJbDCZVUOpZG51Q7jThRE96rLeINWMD/XgTneG+6
 KmLnLltp7TwEtorxKmfK6+6NIA==
X-Google-Smtp-Source: ABdhPJxPxT1/Flx4/WWdgjRkSKkMbwv/avsZ28xt7lccI8rjaR/Nrl0a0vI12dB1OGX+ZnjsKM8WeQ==
X-Received: by 2002:a5d:6183:0:b0:20a:db51:f21a with SMTP id
 j3-20020a5d6183000000b0020adb51f21amr126211wru.127.1652368501738; 
 Thu, 12 May 2022 08:15:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/6] hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR
 constant
Date: Thu, 12 May 2022 16:14:54 +0100
Message-Id: <20220512151457.3899052-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-3-peter.maydell@linaro.org
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


