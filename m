Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766924F986B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:42:31 +0200 (CEST)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpok-0000Ua-Iq
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007AL-Pc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPU-0002RC-GG
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r13so13047883wrr.9
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/FccBwulgnorLUec58TR8669DB+itEmBYjarGh6iH8=;
 b=TqXwTRoPFKLw3dKaLev7l5kgVKISqmN/ga+0Oo/gLzQ0ssEXvdAlK8QgXn8kjjd9oX
 HM0RzlZIYT1XfEQZ4WXdm22B8VXGjfFxMBhbepcdpaFgLA5TJ5j5jFe2z7kAEbBoHhna
 TaXXPmY5BSj/kCbXhJIPjbK/dI5cg8gJA2rTplXiG/lmb4ALcOTfOGhBrNW7nGhvBXg4
 KypwN0Ru3Ps3YmIrLUyR0oqb4s6vX8xClAwmW4V1PHtwo7lAo+F1PSa1U0LXPG46IEul
 cRtd5FQow0iBuD86i/hBlNqxhmwvBWlysT0BHEixJQNBUCBJyVniHeN6mycuB7491HJ9
 tinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/FccBwulgnorLUec58TR8669DB+itEmBYjarGh6iH8=;
 b=XZOf5pWIDKBF7oe4utapwiwtBKF8KWmmca6b2A00rthL8RnWVHFbAnF4wF6x3DaaOv
 IJWM41xh91jjUXh9H5mLDPCWIEjW/GiOvifXvTzm5YgyytCG6XM8Gg24mf7P1m0BFcf+
 0Y97J3RYk6CPuLuHtvohBK1lnjAxSAVF/NgVSCq4TiCn0JqhGTpG51tqlo7X5AmB8vQj
 PtnCSsJP8bX+dV9YXW9dG0aFHhk7jihjNgYVbKHPvWeyjYecpvs8s4CUf3o+D45kkP1I
 l6n6Uoc4ZqnMoFmv3aYmpAlWv1xSux8g6UieNnOgUtTVq4D7oUDG7vN6Qxkfhr8BKLKN
 sTZg==
X-Gm-Message-State: AOAM531fR9G+gL2X6z3RGeWSJADSRtgtG459GKkQAaqainBbkuFqYlId
 slHZ2vZDQV5+uce12t0pGkY3Ag==
X-Google-Smtp-Source: ABdhPJxFx9fGPuIS3YbqkU0P5dbOe+g3qkHJYUpfQl9ryEzAaL9lkdxVflql4DzKeMh1XatJrXl7ZA==
X-Received: by 2002:a05:6000:1866:b0:204:cce:c89e with SMTP id
 d6-20020a056000186600b002040ccec89emr16012577wri.601.1649427382757; 
 Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vlpi_pending()
Date: Fri,  8 Apr 2022 15:15:41 +0100
Message-Id: <20220408141550.1271295-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the function gicv3_redist_vlpi_pending(), which was
previously left as a stub.  This is the function that is called by
the CPU interface when it changes the state of a vLPI.  It's similar
to gicv3_redist_process_vlpi(), but we know that the vCPU is
definitely resident on the redistributor and the irq is in range, so
it is a bit simpler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index be36978b45c..eadf5e8265e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1009,9 +1009,28 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
 void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 {
     /*
-     * The redistributor handling for changing the pending state
-     * of a vLPI will be added in a subsequent commit.
+     * Change the pending state of the specified vLPI.
+     * Unlike gicv3_redist_process_vlpi(), we know here that the
+     * vCPU is definitely resident on this redistributor, and that
+     * the irq is in range.
      */
+    uint64_t vptbase, ctbase;
+
+    vptbase = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, PHYADDR) << 16;
+
+    if (set_pending_table_bit(cs, vptbase, irq, level)) {
+        if (level) {
+            /* Check whether this vLPI is now the best */
+            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
+            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
+            gicv3_cpuif_virt_irq_fiq_update(cs);
+        } else {
+            /* Only need to recalculate if this was previously the best vLPI */
+            if (irq == cs->hppvlpi.irq) {
+                gicv3_redist_update_vlpi(cs);
+            }
+        }
+    }
 }
 
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
-- 
2.25.1


