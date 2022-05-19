Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313852DBFB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:53:13 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkKm-000235-Bu
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5M-0006a5-Pp
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk57-0000oe-Gl
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id h14so8223524wrc.6
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rnN89DcxxYzvNS/4WReZkTf+hreMxoG7BlOSmlpKk2I=;
 b=lVG3jySOOI3TjrtKTG9rONOkBbA8rH/f856F6JnlTzEyB6NGmFxpMggUmBOzb/pZFi
 zaRMpap1/mbSAulWLcQBNgSmk2ewqRCfuSYfmhQFZZOUiyqDEd8eNlbr6AsCuNrIVwlo
 tp2r5+Q/gIZKxUAODpPdxEUrjq9nVg/wLzbHpb+E+4UFsoggHEvTc5AQWdLf9lMxLFi+
 DnppVVZyLdNifSbUni/KZNfOklxISQr2sKWiiuwYfIFvOOquRAgbQsZEuM8H1Js30R8E
 LvQpC3XVkBV5YizuEg3XKm0ApMkhDy3T0okUVEBO2gUclNvzWTV9NstHSmHBASMo2LOt
 SzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnN89DcxxYzvNS/4WReZkTf+hreMxoG7BlOSmlpKk2I=;
 b=VeKIqLfk7oavNUu8mcAwllQdNfRuPJMxlul+TI+BpaBtc2bsGYSYXYFYbxV8zp2SMw
 i0KyNzJN8evVUrQG0yNbQuu8kOOXKr2dryiv7lBB8z5O6ZE1Gkbn9PVtdxXpAEBm5+p5
 Srs3ZRcSm1XrlstSuiLIpTvCbXdDWPU7vHEXm2MPdQ7FKoflx+mWReGmePp0Lp/DeV3G
 bBHNNHM5SKvaPiuEUxQztkK1lRbfniJ4BTVT8Z6OzRzXZSbho2d/sFWgxsJvIV0TSFnh
 pg3FXS5j80liFFtG9uqoTeSVfTJDK7HEurJEI/xpwSnfO5NHJZKVRnhvFt7GdiDVlPcn
 12+g==
X-Gm-Message-State: AOAM5328F3BCiJA2fea5hpGOkyrtDElv4Rwjf3r51r47e+k8DCMa8S+q
 gQPaCFgsrrgk+L+GgVh0gL3s/+bDmPyD6A==
X-Google-Smtp-Source: ABdhPJzc9W3PTt1QObmSKTeA04LcaKCbWumaFy9rAnbbrPD3jeHN9cjt0gq3L3KnDHfjNxAR2OxMVQ==
X-Received: by 2002:adf:9d83:0:b0:20d:129f:6544 with SMTP id
 p3-20020adf9d83000000b0020d129f6544mr4929031wre.568.1652981820390; 
 Thu, 19 May 2022 10:37:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] hw/intc/arm_gicv3: report correct PRIbits field in
 ICV_CTLR_EL1
Date: Thu, 19 May 2022 18:36:37 +0100
Message-Id: <20220519173651.399295-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As noted in the comment, the PRIbits field in ICV_CTLR_EL1 is
supposed to match the ICH_VTR_EL2 PRIbits setting; that is, it is the
virtual priority bit setting, not the physical priority bit setting.
(For QEMU currently we always implement 8 bits of physical priority,
so the PRIbits field was previously 7, since it is defined to be
"priority bits - 1".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-3-peter.maydell@linaro.org
Message-id: 20220506162129.2896966-2-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index df2f8583564..ebf269b73a4 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -657,7 +657,7 @@ static uint64_t icv_ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * should match the ones reported in ich_vtr_read().
      */
     value = ICC_CTLR_EL1_A3V | (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->vpribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
 
     if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VEOIM) {
         value |= ICC_CTLR_EL1_EOIMODE;
-- 
2.25.1


