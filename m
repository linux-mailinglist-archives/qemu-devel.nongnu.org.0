Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0A4CC70D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:29:11 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPs4U-0003hQ-TP
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzL-0001wT-Mk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:52 -0500
Received: from [2a00:1450:4864:20::330] (port=33255
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001ab-9T
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso3129603wms.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xKReK7BLUtScKzpLEmLwjn4Pt9dG6hDPDWKrdARJTHU=;
 b=FxxjCgcDHZwQsUyp6QeRLD3H+nQyw1V2wfkP202duNc+5jC56dwCux1o2tsoyHqFP7
 oDtQa3GuiUhQsR8HGGmH5ZJkcGDegzl2LQPOzpiPU99FFJUVUtlSGtks+ojYWlwkEmt0
 VUZLf9veJ4sWobkZp44Vv0Lg+w3j2+fDpRLgLrwtfti2f+oW1HNYV+x4YS48fUL33hA3
 D5lc1Xt7jZdtsBFfBU0X7vzjlHekIlOmRB+ozOduLBZmWPvPKtgZmGObMCveGqUUgROL
 yqje+Qe35Oh37tEi7nYGVY3cHAvsuNmDRx+bpptrF17XLSzpfl4OUGFYAZspTK1+QPoO
 t6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKReK7BLUtScKzpLEmLwjn4Pt9dG6hDPDWKrdARJTHU=;
 b=cWrfwgPSd847A1cTffQpPcjZn9DRvRbQbYuxAPbARj6Gc2d6Hh1HBNE3khdEjBU1Eb
 Fcywj9C2LlpOQJ5qHGj9B+BKEZIUI1LUCLqHMTN0NjHOikH2fjt/5utWI0jDXPOEy95A
 2jk2ETjA+kkB90F49h6Do+xBOC4lr5NIN5b4a7nIdbIBbW3jgqhQzkFVS5j85WUFUa59
 sYfPbDsRnOy+ZnCxpSwgc5KiardYNoeoRjXSDdjNXynIbFPAvNF0hdGEYbX6FLhFghHb
 8BkrfChem5fwhG7pchjPE+/nMl6ehRubQTOKteghLRAa1d4GVATeoMK88T+wsjOm4VmL
 HRSw==
X-Gm-Message-State: AOAM531WJLY+wa7tsD7HTxqOIK/6sBOfKl98tnAhi2enHD/8avuz2CQp
 hEKP4mhUkxLzdNdT7cPU+t6xRFim3Imvvw==
X-Google-Smtp-Source: ABdhPJwm65ESyJkwnPPNttg1N8klhQnPFvAi2Dm4IxOtVdewuf408aSCIAZ0AOkKx0cT3v26ZqluCg==
X-Received: by 2002:a05:600c:3c98:b0:37f:2f14:7be7 with SMTP id
 bg24-20020a05600c3c9800b0037f2f147be7mr5143205wmb.180.1646339028719; 
 Thu, 03 Mar 2022 12:23:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/intc/arm_gicv3_cpuif: Fix register names in ICV_HPPIR
 read trace event
Date: Thu,  3 Mar 2022 20:23:41 +0000
Message-Id: <20220303202341.2232284-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The trace_gicv3_icv_hppir_read trace event takes an integer value
which it uses to form the register name, which should be either
ICV_HPPIR0 or ICV_HPPIR1.  We were passing in the 'grp' variable for
this, but that is either GICV3_G0 or GICV3_G1NS, which happen to be 0
and 2, which meant that tracing for the ICV_HPPIR1 register was
incorrectly printed as ICV_HPPIR2.

Use the same approach we do for all the other similar trace events,
and pass in 'ri->crm == 8 ?  0 : 1', deriving the index value
directly from the ARMCPRegInfo struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d7e03d0cab8..1a3d440a54b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -612,7 +612,8 @@ static uint64_t icv_hppir_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    trace_gicv3_icv_hppir_read(grp, gicv3_redist_affid(cs), value);
+    trace_gicv3_icv_hppir_read(ri->crm == 8 ? 0 : 1,
+                               gicv3_redist_affid(cs), value);
     return value;
 }
 
-- 
2.25.1


