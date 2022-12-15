Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB664DBBA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhR-0006sj-KM; Thu, 15 Dec 2022 07:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh6-0006qQ-C8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh3-00049Z-9P
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1786427wmb.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YeQ3kvahs94WhbLIqT4du5oVyKuAmCQx8YIV7LpenHE=;
 b=tBVpKu3w+SQ/CDz699809OuPGUp8m0/4rcQGYAT5I8MR0hb55rH9eNJ8FzvP217Ii0
 H34LNizs3uc4O3QSBFbmdWM52mPqmJmiwCNmog4D19fVg6MGQfn9znASZHf6fNzMy83d
 0uZhEKsyePuLxPl2/xdWhqrz+4VTsDR5If2LC8t8oZAUpIzj3QRzfHp9aLN7TZj05f2X
 FvuLL/IfGQZudpIIBESLsaVWhgKr5QHDkiRBYPgdIs5WWnZwwZGeNa9s6Y/1Qob8vGrk
 XHBW7fwmahOQ9Ky3Uf3qislqNtjbCpLoUdfC8dmnWjkrR2tP8bxxogh/Pw1S51OFFCok
 nDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeQ3kvahs94WhbLIqT4du5oVyKuAmCQx8YIV7LpenHE=;
 b=zhUUlZpFP77kRtGjEgnu52wLjEgVblnHu55D9lJF2014owJuqItjiIVBR4nyUSNwNN
 l8hLnBXTJUKkj/mh0zJnxlp13z7Oy6LLhxjksajgfPG25qYC4NKegnP2X+XMdeJQpIDa
 6RjnSflMh4tk9AwCeMY8d0tHp9IQFRK/MUWyN5IYexyOMcpaZS7Tx0pkS6dplARSK6AX
 7E1zNr0aQ8+mSGm+Gi7N/ZLwQxgzu7pTqthMze3ayECvvQ1cGY7a049k3rOJYybHmmQ+
 rUs0kUPuuxREXvuIYaAXBkpGupMEZbnxQDkbZ0pc7/qv3szvYzRAflapr6Rjo3jQUlo+
 733w==
X-Gm-Message-State: ANoB5pkBZELKeu49kme3DhbC2ZuEXqMy1GcvCZPVnL0vEYqZuZ/3hoYU
 3qVt9DWW5Vxt1IlonqDX2honHogEr3lpPKnf
X-Google-Smtp-Source: AA0mqf7bJPnzJY6xwUZLZlDYQhr7AEAgH/Zd7qSRb554s0Wzre1w62FR31A3+0hk2sQ0SoR46wZk6A==
X-Received: by 2002:a7b:cbd2:0:b0:3d2:191d:2420 with SMTP id
 n18-20020a7bcbd2000000b003d2191d2420mr15622346wmi.7.1671108631888; 
 Thu, 15 Dec 2022 04:50:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/29] hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase reset
Date: Thu, 15 Dec 2022 12:50:02 +0000
Message-Id: <20221215125009.980128-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-7-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3ca643ecba4..72ad916d3db 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -77,7 +77,7 @@ DECLARE_OBJ_CHECKERS(GICv3State, KVMARMGICv3Class,
 struct KVMARMGICv3Class {
     ARMGICv3CommonClass parent_class;
     DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
@@ -703,14 +703,16 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
 
-static void kvm_arm_gicv3_reset(DeviceState *dev)
+static void kvm_arm_gicv3_reset_hold(Object *obj)
 {
-    GICv3State *s = ARM_GICV3_COMMON(dev);
+    GICv3State *s = ARM_GICV3_COMMON(obj);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
 
     DPRINTF("Reset\n");
 
-    kgc->parent_reset(dev);
+    if (kgc->parent_phases.hold) {
+        kgc->parent_phases.hold(obj);
+    }
 
     if (s->migration_blocker) {
         DPRINTF("Cannot put kernel gic state, no kernel interface\n");
@@ -890,6 +892,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_CLASS(klass);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_CLASS(klass);
 
@@ -897,7 +900,8 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
     agcc->post_load = kvm_arm_gicv3_put;
     device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
                                     &kgc->parent_realize);
-    device_class_set_parent_reset(dc, kvm_arm_gicv3_reset, &kgc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_gicv3_reset_hold, NULL,
+                                       &kgc->parent_phases);
 }
 
 static const TypeInfo kvm_arm_gicv3_info = {
-- 
2.25.1


