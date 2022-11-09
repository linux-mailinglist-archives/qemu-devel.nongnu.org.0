Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC5623007
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjA-00018f-KE; Wed, 09 Nov 2022 11:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj9-00017z-0p
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj2-0007jg-VO
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w14so26494208wru.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=94zFxEDln0hVAcYsJJAZunaQ0vJlEEsykd+74gFzfm0=;
 b=DeIkwfa++O/IXOpFeGHJ4/EpE2JrAypDl8sAqG4jkgb79MvB0yy8I0jn+PLisceDls
 cCYu55VBm940wKFskjlZ5ytCKkJ27/L8JUsMOo7/7b+kHBiZQtjUxW1L8/VH5LFy86hm
 vmfdasNWnrjU486fWdYa85DZk0lzy+3g6vqpHR0zg1gUEvwwLVZMSGFquec9FuYPhfgA
 wbkj3y+GKZ1rlgqmZiduqpZpeNg1tAJw+PPKNA0q75xV/RRLi7h3z+ALTkqkL2hbk+s5
 rmiQLgKt9awnqeW9irWhJGb+rpNODXNRvNKRGzGFyO5gNcyZJjv8a1ktRHIyH9Aq0lxK
 sToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94zFxEDln0hVAcYsJJAZunaQ0vJlEEsykd+74gFzfm0=;
 b=AP9n/90mCY7RCrCWuFwaUQOdu2x6Y2hZaOVfz9DjM6p04q8NkWMDzu+Yp1uiqagB/g
 aSYFvjFKfbYc01glByOUNUDk9IA1usPjZBZa2sr0A04BoASwQe/N0ikX2xqvogLZ3RLL
 AYuPmNef/R/EiQMeBGZzX4M/td1Oo64dVQnCTkZNlfVXzsFYwNlodjRD0Ckv8VjiCZiM
 7TjxORg/shfzRZah+HRYJYlegXXuQKskZRFZm/+/Pe83xLsQxrawSbyMEErLF+Nrnf9b
 LMfs87qipz5RNyi9MgzSJ+qFTwzNMT5dk9u9LosPSSwwh1DuHwRc2tOUdmzKnh1SxIWt
 HE9w==
X-Gm-Message-State: ACrzQf3BgKIx/I6+dlO5iOKUPAP5Bk4mqPA4XMAX8EQ8+GtdwQ3bjFOZ
 QPTUGOuIliU6Ttxi0Gl7tbMfJg==
X-Google-Smtp-Source: AMsMyM4w/X1ryyE34SLnAVhK8m7uCZYfUViKig5a7KYERrxmTFqz8Lk9Tt/XvWsaZQfxmwBepn5OEQ==
X-Received: by 2002:a5d:6d8a:0:b0:236:6123:a8a5 with SMTP id
 l10-20020a5d6d8a000000b002366123a8a5mr37979088wrs.229.1668010490566; 
 Wed, 09 Nov 2022 08:14:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 4/9] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:39 +0000
Message-Id: <20221109161444.3397405-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
TYPE_ARM_GIC_KVM subclass to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 7d2a13273a4..1d588946bce 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -38,7 +38,7 @@ DECLARE_OBJ_CHECKERS(GICState, KVMARMGICClass,
 struct KVMARMGICClass {
     ARMGICCommonClass parent_class;
     DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
@@ -473,12 +473,14 @@ static void kvm_arm_gic_get(GICState *s)
     }
 }
 
-static void kvm_arm_gic_reset(DeviceState *dev)
+static void kvm_arm_gic_reset_hold(Object *obj)
 {
-    GICState *s = ARM_GIC_COMMON(dev);
+    GICState *s = ARM_GIC_COMMON(obj);
     KVMARMGICClass *kgc = KVM_ARM_GIC_GET_CLASS(s);
 
-    kgc->parent_reset(dev);
+    if (kgc->parent_phases.hold) {
+        kgc->parent_phases.hold(obj);
+    }
 
     if (kvm_arm_gic_can_save_restore(s)) {
         kvm_arm_gic_put(s);
@@ -593,6 +595,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
 static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMGICCommonClass *agcc = ARM_GIC_COMMON_CLASS(klass);
     KVMARMGICClass *kgc = KVM_ARM_GIC_CLASS(klass);
 
@@ -600,7 +603,8 @@ static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
     agcc->post_load = kvm_arm_gic_put;
     device_class_set_parent_realize(dc, kvm_arm_gic_realize,
                                     &kgc->parent_realize);
-    device_class_set_parent_reset(dc, kvm_arm_gic_reset, &kgc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_gic_reset_hold, NULL,
+                                       &kgc->parent_phases);
 }
 
 static const TypeInfo kvm_arm_gic_info = {
-- 
2.25.1


