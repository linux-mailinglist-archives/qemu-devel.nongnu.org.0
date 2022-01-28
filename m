Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB5D49FE0D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:28:20 +0100 (CET)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDU6m-00041X-3S
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0002B5-DW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::42c] (port=33704
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD0-0006QD-3A
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:48 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e8so11670040wrc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9SyNcRrVuvovEvSkxrvxeCVjQbfrBwz9kaivzr8f5zc=;
 b=rgRyz2loESAPI3X0p3n1io84VmrtIb5mWV+Sr9YuXqXRvdUK4wVr6XbVc7mRb8MQvG
 NTQq9+EmnTzJPx5flS2wJB/btSw0MQwtmPg5ni6z0JDT4O/L/cUnlHLB26JSsZLeWFlJ
 EFEQO+ZvsfmE1bMyYFNQfhZVDnkPplGk8RdMLVAX6mxLhC8MFX3wfcb/aVwPPq3SVYDr
 aoDR00L8oFL8kIbI32Ve90vROE/L2QK6dn0GjxHgpd0XSgrhwgFzMyfto/frNymbVuar
 vk/Jajg6s8cYSDeLhmLa+4aAJUiS890kknwaGVrf6E4VCZxth0YDHn6wf+UJOpmd19LT
 smLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SyNcRrVuvovEvSkxrvxeCVjQbfrBwz9kaivzr8f5zc=;
 b=hjW6m0C/raBdsMdpffq7D+vapECb0k3lVKuTy/SoR+/X1lwvlLGkYzRF2Y9I04NyLL
 h7ksHX8efOK8msu9eEYE0nXA/p6BUIUYDYGKfLZIV6U3kxH5+DYxM59NVmNjLcjDehYQ
 JviBc5t8eVNQ0qGpJtVUZpYY1Y9TmPO0bsKaaYThGS8LNqDK/MHRBial5CXFyjvjDmTF
 IJzWl/ucfUk10CsXrFrryO8E1XlYbsoBCFb9BC9vLtfSRtfxn8hwLYu72se/fSby8VPF
 9P1oR65mbg+UeyQvKYUb+10MJxVZAY+ELIajP+5I5BPE4BY9i0vtRHBwYesg0azgLWeF
 0cHA==
X-Gm-Message-State: AOAM531A5wDix667tN3JD7EsqG03KIpa64ONxk5Q9a39Jwckf5REzTCQ
 +NgQ7RYKwlCaXJnzuyG2ryOCdzY/qpRjnA==
X-Google-Smtp-Source: ABdhPJxu67oQfKMUE5gxMipFPYQE8C9U7Kcdjn1APMKvcmFFSwPiAnfEBIg2SV421ElnPjllHsnxhQ==
X-Received: by 2002:adf:d1c7:: with SMTP id b7mr5867113wrd.506.1643383833683; 
 Fri, 28 Jan 2022 07:30:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/32] hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
Date: Fri, 28 Jan 2022 15:29:56 +0000
Message-Id: <20220128153009.2467560-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

In our implementation, all ITSes connected to a GIC share a single
AddressSpace, which we keep in the GICv3State::dma_as field and
initialized based on the GIC's 'sysmem' property. The right place
to set it up by calling address_space_init() is therefore in the
GIC's realize method, not the ITS's realize.

This fixes a theoretical bug where QEMU hangs on startup if the board
model creates two ITSes connected to the same GIC -- we would call
address_space_init() twice on the same AddressSpace*, which creates
an infinite loop in the QTAILQ that softmmu/memory.c uses to store
its list of AddressSpaces and causes any subsequent attempt to
iterate through that list to loop forever.  There aren't any board
models like that in the tree at the moment, though.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_common.c | 5 +++++
 hw/intc/arm_gicv3_its.c    | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 9884d2e39b9..579aa0cb9ed 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -357,6 +357,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable) {
+        address_space_init(&s->dma_as, s->dma,
+                           "gicv3-its-sysmem");
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d2549e64b1..67f12d98af3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1194,9 +1194,6 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
-    address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
-                       "gicv3-its-sysmem");
-
     /* set the ITS default features supported */
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
-- 
2.25.1


