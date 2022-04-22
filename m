Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F250B530
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:36:10 +0200 (CEST)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqe1-0001xc-3A
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA2-0004wt-2N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA0-0002qs-Gw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso7650563wma.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZEhoOIoK2+oeX738Kznp6czGDdThyWg3QrQY8i6NzM0=;
 b=MoyIsUrhbX8z+D1d/v09P6DK6oMWiIkQEzXOLO/MRfPRCpubjk/HgHNJIvjCsGa706
 B8qI/wJx4bEykrOF9x1CY0gu0xc08SX6ew3y36Ao2CzEK23NYQrDWCoEISkA3I7k13N1
 aIE/FIeaG1npI3jRHcuXle16PP65NdtYZM4O1P7DY0rv2gYPql2c5VhvueMjI9FEWAfc
 6O2/jrWqp4GA2LHbvlUMPVcaRCzGGm79UM+XedGTWncoVAWUtrZNwLF2Wka1V8tB0DyZ
 J4KlCUFYohV941cf+yUBNe5nap8BwdJHCOOdRw8X2WQzDSNP/0+pktSWXn8+V/kEu1bH
 K8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZEhoOIoK2+oeX738Kznp6czGDdThyWg3QrQY8i6NzM0=;
 b=5vB7I/vlr8xrvSdwzxDfdOmZplW0+E5w3Q66uezmU2uidiaAdvs8HyCv/KR3ABSinw
 j4VO9krcQpYK3/bP/snQlJkK/81Ic5Jy9lGq2KXi9S1Hfxccmqcyt1xFN5dGYEQRdo13
 sCLWVIzs5M1B4rI/axA4yqNOxVD4dJBvDvI1Ydh8KzsfDTfpmCHtGXG/fDPOre0PZTJd
 RGnwKV/+VH1jRWkuWNjT7HIesXJVrWYuiBdJ25UppjHFUgrDWnZlmtoIB/AR76/3da6+
 MwmBVB+aU97fI/+XTIKyv4ZBpTll8Z4K921ZTX+Ijpqt6jO7IyriJX8QS+lKOI1n61bQ
 v4iw==
X-Gm-Message-State: AOAM530I7qdoapSM+SuH8e2AmE67FKe/sWi90sMN7m1woDB6dHs+4TKg
 O23sMPFGoXP0DcmUJ12CHnwROwLg0RxQSw==
X-Google-Smtp-Source: ABdhPJwU0ehbla9MusA1l3Kp/5rsI0Dykpmgi062Xo350G5mZc9jHB2uHPgKPItALV83iX6xHGosow==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr12281839wma.75.1650621906733; 
 Fri, 22 Apr 2022 03:05:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/61] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vinvall()
Date: Fri, 22 Apr 2022 11:04:06 +0100
Message-Id: <20220422100432.2288247-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the gicv3_redist_vinvall() function (previously left as a
stub).  This function handles the work of a VINVALL command: it must
invalidate any cached information associated with a specific vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-36-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 78dcdcc7621..34f4308e980 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1090,7 +1090,13 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
 
 void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
 {
-    /* The redistributor handling will be added in a subsequent commit */
+    if (!vcpu_resident(cs, vptaddr)) {
+        /* We don't have anything cached if the vCPU isn't resident */
+        return;
+    }
+
+    /* Otherwise, our only cached information is the HPPVLPI info */
+    gicv3_redist_update_vlpi(cs);
 }
 
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
-- 
2.25.1


