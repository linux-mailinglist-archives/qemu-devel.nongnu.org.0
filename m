Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98752511F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:19:42 +0200 (CEST)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAbN-0001uM-IG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032s-42
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWs-0000BQ-A3
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id f2so698508wrc.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jO5+b2JhjvqPhcf+OmcGXbwSQuZxOSdmxxpR3rXGCoc=;
 b=YbT/71kUR7LJzoa0chD4nHh1u+sUOaIKv0xF2ddz3mgvSvHw1f2g9wFubtkvy0bAqF
 3GjpX0rLdf4EVvhRF7JvNiWeRnmlEQwcSdlpvUegSn63EMun3YxHjzveJYHQUwX2YhRJ
 37ywqQyB3T1e5ZgjCf0l/U/HBVXxzKF1TXZ63KYSMibsFwP0y3bsxVsv4nfN8+gYZ2h8
 2WXhroAmRDtUGwXN1GuNueHd4QBmE3LUgssJxzFEMyDsFVToXqhGqXCpWAWbzzTrEQ+X
 Xx0K8feVYTNzZXuVBPGUxWG0NSjgDvutODTmlLwiv8TZLFSns6HisotbZ7+x0+HHL2YH
 6UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jO5+b2JhjvqPhcf+OmcGXbwSQuZxOSdmxxpR3rXGCoc=;
 b=p/WlBQ2ikEft+qDkCGGkWESu0zodndHpZDkxW70u1FuKdyBjEK1YWKo9SDQzyRJbza
 +5Fs0u6tsS/TL9SRNqiqBLnAKp8Qlw4yl7SjBw49YTBc+H2iXekQQX5q2lzEiK6xRTe8
 puyuoTZTVZEB+SlU/0xVKeDS66ZM0wFVWqeaeX2laT45jjaYrWnRVudDAX7FPvqfA8jB
 6qmEM4Um7vT3LgwYjUbfSYqQvNk7pG61/vuBj9Y+p+bc1Ixg8Ms+8C5Q20ls8utuXp1v
 ZiFGMjT/GFcJYsE3W0ZBTWknpT2oBXKgiIz1SyBG2jAskBXfUbswAeVXf3um8rCbEhyq
 avsw==
X-Gm-Message-State: AOAM532A36pK6lFYMEgChKrhTyuSuyb0bgjXqWTHjwFhRL71IPzyXqMs
 jO1CyoQil2COp6A8+liCu6lc3g==
X-Google-Smtp-Source: ABdhPJybZram2XDPyaHbe3bo/YJtaESRqP8d/JabHFY8cbuftye1/IXdng+vYmZXnTFby9BIPv3IeA==
X-Received: by 2002:adf:f38a:0:b0:20a:bc71:fe3f with SMTP id
 m10-20020adff38a000000b0020abc71fe3fmr126283wro.47.1652368500880; 
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/6] hw/intc/arm_gicv3: report correct PRIbits field in
 ICV_CTLR_EL1
Date: Thu, 12 May 2022 16:14:53 +0100
Message-Id: <20220512151457.3899052-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

As noted in the comment, the PRIbits field in ICV_CTLR_EL1 is
supposed to match the ICH_VTR_EL2 PRIbits setting; that is, it is the
virtual priority bit setting, not the physical priority bit setting.
(For QEMU currently we always implement 8 bits of physical priority,
so the PRIbits field was previously 7, since it is defined to be
"priority bits - 1".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


