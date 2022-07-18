Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA557858B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:35:41 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRqW-0004iy-Gv
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHg-0002Aa-2z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHc-0003BN-K0
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so7383727wmb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WLcuE5tjCtEqKCJRkl1tlMmWsSxVcZNfqF25uGydMws=;
 b=fYKyNHXSBBvyuI4ylw/1BSjyAcT/gtUPYB0/eyxTj4WTnjemB3qyMzif1Ckd8nQQ/S
 wOItfR1R1Jcyn9RuaFCpqRI0isZpuyvc0nugCgGn5W2wN7dsAJ8vTgcM2lhSrXhOfhJQ
 +uoo3b7WlJ5npBbnlDtmkYhuoyHjFFetYVijsY+7JFyj+cOEqCPMAQAXTtSI0/ZICROx
 b9QNd10LIA2fvyZJJTCLuyAEFFvL10MeQoDuSAqwc4w5utrCqIdNcr2iH7bvAK1FwqkE
 u2e4LuKi6Y28Jc90WOXn6GCj1QPMthin1YdmjCwYKQqUrLAOehn48wMctMlxcRY50NIo
 idOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLcuE5tjCtEqKCJRkl1tlMmWsSxVcZNfqF25uGydMws=;
 b=6pLsrs7NSpE/CP8Ld795DsdGwlN+te22ZAfya+HuQcnMELbimE8ynXDa0T12/zOFjG
 x8IdIVhY+uWBgGJ0QeQx2f7V214HUFp5BYilGTcwfniNLK31vdGMUeDsCva16Qh3jPwR
 7VQnXyMkMPMcrHDDCtzYeCJlVR/NXT8fdcMvRRPCAUERqmRnfnREgTDElDcR3Fe2Klcz
 ZH6y8AaClG6x+SrfN/Bsic5mIyFaeVYHESz/Ckngf1F7xRg5+g7KW2anh6xpA/tzg7v/
 aLiQvmmjZLCPaH8Mdnjw1LvpdAQUvjNT+gB+nhd/nFO/hbvrj5qMJl+KM0A3BqeJpx6Z
 Tahg==
X-Gm-Message-State: AJIora/4RUpXtFOi9tteR/PKDn9Jys9xKHYSBD1S4mcBFPUHWeAod6G+
 oPqQ4pwNPcqBnc3EkzTGguGzqdhxSxjG3g==
X-Google-Smtp-Source: AGRyM1ukpoeDg3et4ykUry7JCnSiAVEcvVu6WAzp16PfjPwnxLdNpbBI+XqvmavS2fU6l067hJGu2A==
X-Received: by 2002:a05:600c:3786:b0:3a3:19d4:293f with SMTP id
 o6-20020a05600c378600b003a319d4293fmr5745802wmr.116.1658152773460; 
 Mon, 18 Jul 2022 06:59:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] hw/adc: Make adci[*] R/W in NPCM7XX ADC
Date: Mon, 18 Jul 2022 14:59:18 +0100
Message-Id: <20220718135920.13667-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of write only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220714182836.89602-5-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74c..bc6f3f55e64 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.25.1


