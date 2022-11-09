Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948F622FFE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:17:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjB-00018p-5u; Wed, 09 Nov 2022 11:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj9-00018O-Jj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj4-0007ry-Bx
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id w14so26494342wru.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ca3S+uVbBJTLXkcc5so3RKCbYfZ7cQitrV38GQNpu6s=;
 b=UGq0qXcbl2HlNTdkgFa5D1jeNMUB9ZJ1xrdzsK4RAMl48TSW0Tlurz43wCkPCjzpy2
 nBHBuSchvHFh6gkomwOq0fBNBlGYX7U8nwVi9myj+zshOpXis+1mmIWw2zX7IZx9QmlR
 Mr64OQ7pT8bRV8L8/eG18Uw2JhQjYEbPjkshSjAjr4auLjO2cw/HmfZgaZGtvn0JVuKT
 cl3+k6tBzSktghFknowxBA03r+w5jYK7BqgyNaN+1Dx7QjFBmDc0mTKFxfE25fxsPH8n
 WtsS+vY8lN294+B9SgJSDu9SyLNMJZ/K+KkUCzm9UYUmdtNjLsGnwjFLMWfvZR0fq6cS
 4Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ca3S+uVbBJTLXkcc5so3RKCbYfZ7cQitrV38GQNpu6s=;
 b=kWTUZAFgBQJboqIRvjTfhVWKREW/kTlsHOiOd+PHzRZ8bMHGc/atn8uQwjSBeVmu5+
 Vno4QnPDtqPpp+Mo0c7kczKoxEHrLEJxJ3FwKT0o2k82J9eQyvBePXV5Oq27DcQfZL+I
 7F0KTGQn/ZdEjtIJyZNOr6pRwKQw+EfrZdgGNEjV04TFCdi7UpMKyEMaat6VQWFiR5wM
 JQyNrV23FeDcDjA3wreevek5J+hBC3rvTTCj70aGngjoWp6wpLzvh1Wz3Z/LD24I955z
 PpunyODPBJEHUwN/lVDr9k1BDZV9tDI4E/pNkMnYq1HQ3p1QjuJm20HnUsCKWwj5h0fO
 IQyQ==
X-Gm-Message-State: ACrzQf03Kv5bmouUePDTC0ohWyGsR4lIWP1RbjvsyNhRXkZg9ATG/irk
 am1xzqgW9IYvV6PPDDEBhrUIsA==
X-Google-Smtp-Source: AMsMyM7/hMmrWXOoF82HwcguJRGFdcjc9Gpy6XlE4EPVN1egaaRFhpITxVPthfd9/vy3T+MZJKdAPQ==
X-Received: by 2002:adf:e0c8:0:b0:236:d9e5:4a51 with SMTP id
 m8-20020adfe0c8000000b00236d9e54a51mr31991642wri.168.1668010492632; 
 Wed, 09 Nov 2022 08:14:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:41 +0000
Message-Id: <20221109161444.3397405-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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


