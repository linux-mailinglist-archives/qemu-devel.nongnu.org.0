Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F259864DC08
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhW-000791-G2; Thu, 15 Dec 2022 07:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh6-0006qP-BO
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:36 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh4-00047M-Lr
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1633036wma.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NdfqtkLWyZ9Oq9V2fhNGIBisTuR7jxFRlD6CQdAIeIY=;
 b=ZIqHdKSorxDZyvJG8HURI8TVyLqluXXX/z42TejZVwa7L4S2a7nmqVd6+WUz0QsDN8
 AHCrMuh3Tgex2+E+VR1rrEsdcP4+vjasJL3Knfb5BGVuauShd4pRSwraPFulJgPZOBX1
 isM4rWSmN6Td3j3I0PQCQv6oImG2P8Xd5z7xTXtGMMhTSNSvT5TYTrfIC4iHV8DgGVnF
 nO8HKe3L49aVpBMNsLQ8CHjbC3PXBE0o/G889qOZwPTEvW70ZiNlQzS/QlNA3SIVBVnT
 Pce3J4J3tJkqwPCFvE6YHiuXCvcB3HwC0BfC+Sn815vxJ0p9GPuG0eJnTk+mriH75p4Y
 /FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NdfqtkLWyZ9Oq9V2fhNGIBisTuR7jxFRlD6CQdAIeIY=;
 b=DfwcOC+3HiGkc8MjVtZHlRsLfeQYUR0xeZmvbefwLjucDmwn/9HutrauzsqtWKldug
 aBqdxpfQE50ncQkMkAMniTJF+gV3Jha05lb1LNsn07LRqMn+ijmn4IJCxk2qGlNlGgK2
 GrPsWeIGD58T4u0SqPEUWCagRStabo7XiAOgrFPVrNYc52FYJK0J8EzkWdq0dD+gXE6O
 T4t8EjRJ03uB5YrhCB4vHOjO1HahPXaE0hbwJZpiBWN6Es9I70wuXCoRDRGyZwndVr+8
 BJolOoyqehJbSVmLWiWiyKvhNr/yVeKzZz74YUnuTbi98JxPOaDTaCM2YEvH8pD8lsOe
 r1PQ==
X-Gm-Message-State: ANoB5pnfTZjJfd6HOsFI5JKlltTNgeo6Gd7cGAWrJVZemmFpDVEdTyFK
 xediN9itvmuqK+ppfz8w3mFFVeVJjH/KNf0r
X-Google-Smtp-Source: AA0mqf7C07syH+OZ/onwEvcu43c1sHvWT4YhdgvMYvmbCVzs5QL/KIBWhoWg+ssPvLRWZ2db5zxwsw==
X-Received: by 2002:a05:600c:4fc3:b0:3d2:2fa9:cffa with SMTP id
 o3-20020a05600c4fc300b003d22fa9cffamr8479671wmq.25.1671108633624; 
 Thu, 15 Dec 2022 04:50:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase reset
Date: Thu, 15 Dec 2022 12:50:04 +0000
Message-Id: <20221215125009.980128-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-9-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 2ff21ed6bbe..57c79da5c55 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -27,7 +27,7 @@ DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
 
 struct GICv3ITSClass {
     GICv3ITSCommonClass parent_class;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 /*
@@ -1953,12 +1953,14 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void gicv3_its_reset(DeviceState *dev)
+static void gicv3_its_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     /* Quiescent bit reset to 1 */
     s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
@@ -2012,12 +2014,14 @@ static Property gicv3_its_props[] = {
 static void gicv3_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = gicv3_arm_its_realize;
     device_class_set_props(dc, gicv3_its_props);
-    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, gicv3_its_reset_hold, NULL,
+                                       &ic->parent_phases);
     icc->post_load = gicv3_its_post_load;
 }
 
-- 
2.25.1


