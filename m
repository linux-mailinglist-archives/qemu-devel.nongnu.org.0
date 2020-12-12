Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AF2D835D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:21:57 +0100 (CET)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsfc-0005of-7T
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZo-0002c1-OT
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:58 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZe-0005e5-GH
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:56 -0500
Received: by mail-wm1-x344.google.com with SMTP id q75so10099626wme.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zroCLEiICIgvxuK7ZREbHz2wYPanCNf9f/IoLbAJmp8=;
 b=Mc536N9XW31qdTTtam3RRnyCgViwZDzYS/stIECTtCD7Ugg3hO52EAGYUxR+mb+Ojl
 /Ejofn1iqDFJg1RouSvjNy9SKE0t/yKNAIwfIl7RT+2u386/jQSkCbNvNtn8V5tbqZIU
 /G1hlqLTHEvHk6nGYL+q3uUfLGQ1qXW0/HeDL/D7FBgyy///Ko55FOifiwclrJ/8MU7m
 m66JDN7SETJUkFk06OnOpcLOp7cgaKJIs0G9dvf1sFtQXTSHkEiUPBCLnpzo9nrj8KP4
 nkYIefhEvb6S09C7O+hrfDx4P5sH7JdzcuRZGYG8jSSW6dDcWQlkjoMwWAWMeJz4IfNn
 95Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zroCLEiICIgvxuK7ZREbHz2wYPanCNf9f/IoLbAJmp8=;
 b=pHe0uqxAwrtkFCQvMd/kyExGb4i4jyRvmJndPFUEUopscie3lZLHxUVxllc9vE8znP
 P5nF+yIBL9+fKR+PThC6iN6ZGy06Sx+Z2MUb+KVkOmnFR4x6h58thjEh1tY3f4i+p9Zu
 e6UN1UfR+T3CYJ+u937ynA4Q1sBBYZunzw1UQKWOBeu+9992Fep9z2AaGwGy3J3Y5Ut2
 r2GKbYvpfuhxqC7U4ymP2Ov1JBjCYqeOMVmK80kTWKouy3ozZR1ixJy0Aw2PAcao5GQ6
 QO6qmiY5lS5yB9if1sVsyIdG2myr+5ZjrJSnjG5F+j49ydpkf/JB7GPyzmKPBset/4HW
 iTkQ==
X-Gm-Message-State: AOAM533fClRHVLmgOfnwvn2RF9qxdx1FtMTV68L/OXZ9WHocD/YIFKqv
 eK+SqIQqdHvSZGYan9PeIwU4mUoktFkUbw==
X-Google-Smtp-Source: ABdhPJxkGItSaPaTaY6m95DhNOGMUiDdCujkGNrqpydgtquiKiDm576PZc6kM9zfq5ON2NWUAbYLDA==
X-Received: by 2002:a1c:7909:: with SMTP id l9mr15984917wme.120.1607732144042; 
 Fri, 11 Dec 2020 16:15:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/ppc/virtex_ml507: Drop use of ppcuic_init()
Date: Sat, 12 Dec 2020 00:15:32 +0000
Message-Id: <20201212001537.24520-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the virtex_ml507 board to directly creating and
configuring the UIC, rather than doing it via the old
ppcuic_init() helper function.

This fixes a trivial Coverity-detected memory leak where
we were leaking the array of IRQs returned by ppcuic_init().

Fixes: Coverity CID 1421992
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/virtex_ml507.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 7f1bca928c1..34767b11cad 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -43,6 +43,7 @@
 #include "qemu/option.h"
 #include "exec/address-spaces.h"
 
+#include "hw/intc/ppc-uic.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
@@ -95,7 +96,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
 {
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    qemu_irq *irqs;
+    DeviceState *uicdev;
+    SysBusDevice *uicsbd;
 
     cpu = POWERPC_CPU(cpu_create(cpu_type));
     env = &cpu->env;
@@ -105,10 +107,19 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     ppc_dcr_init(env, NULL, NULL);
 
     /* interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    ppcuic_init(env, irqs, 0x0C0, 0, 1);
+    uicdev = qdev_new(TYPE_PPC_UIC);
+    uicsbd = SYS_BUS_DEVICE(uicdev);
+
+    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
+                             &error_fatal);
+    sysbus_realize_and_unref(uicsbd, &error_fatal);
+
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+
+    /* This board doesn't wire anything up to the inputs of the UIC. */
     return cpu;
 }
 
-- 
2.20.1


