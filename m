Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C5496D4A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:30:36 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBL9l-0000IW-Gw
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:30:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0005hr-NT
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:14 -0500
Received: from [2a00:1450:4864:20::32e] (port=56251
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4N-0007gL-Hb
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c66so20199246wma.5
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8JHQV9Rxu6y5Kq3DIwbkwHmKbpxctF1sxkGjMJbHmw=;
 b=ePem3qcNADxccA6TrK7qqEZNXQY/UIXXaSvT+S11T+ltaOwP0uSn3P48ciswyTWDhk
 EjhQIByp5abFpx4f1JzJZaXCm3MTxChQOlbeGSOhmhzi+b/qakdrs93RbnOh4az5YRR5
 IeKuFqsd+3jd/FYTy8rODnczwGvHG0dW8iGnE6pg3t7yH+YFQ+fkbXB9zT9e6qu/Ybv7
 UVwVucPlBKYMQE7HLkB6V13NO9ZdtgREes7wZcTl12LZeONmM0zJqtOrezLgEM46AuGR
 VRF9l4dx0g3fEsdYrLJJs7nGI6h1CT/Vi0ZMFork0Jkn/zCGPsTUuPlIomSmstyHPx65
 1GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8JHQV9Rxu6y5Kq3DIwbkwHmKbpxctF1sxkGjMJbHmw=;
 b=zSoz2NWFmtYB+B7XB9p/vOg/5OL0u0tIJEV2JdyFmQprRAlwtpRGeoVq4gWU99CYxW
 SUT/R/DkqQKoYjMQo0pVnUdVOJIo8N3iygIkT4vUP2508HgJExz3qam10UzBR/YNSQ0D
 FyMWn8S1OGiSXLu7QJF+mgEBMJBd1pG3B3+/osrFMZiej8Uk5KxngF1s+WTQHQboM+Gj
 g0yIYe7p40CGeWMytiXW9BoB7tYclk4TGDTvi/i18i0VOlDnko0bnFtyOMoeD16WvwgT
 FA2i8sVnqWkoB9Jed4TWgH68KWAUY2QLeDHqH7d5XLWxy1YmzvBeQkYIJ97aYxGfyLe0
 CLCw==
X-Gm-Message-State: AOAM532jCFCudv++xFaQiwdsv4i4gVqf62clfPsYGKlbqJbvCeC9m3Xq
 1SqVGkp5L1eVb9jsLof39vJ6sg==
X-Google-Smtp-Source: ABdhPJzuU4vHBLMLf8ckvtJYW7efh51THXD8c+sVd4BRBpBwR4L3xx4q922A7OPuv0Xqy501RduOPQ==
X-Received: by 2002:a05:600c:4e05:: with SMTP id
 b5mr5355919wmq.51.1642875888339; 
 Sat, 22 Jan 2022 10:24:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/14] hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
Date: Sat, 22 Jan 2022 18:24:33 +0000
Message-Id: <20220122182444.724087-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


