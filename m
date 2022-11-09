Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2262300A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjN-0001Hp-S7; Wed, 09 Nov 2022 11:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjJ-0001FZ-Kp
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj7-0007wa-B0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so1638357wmg.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MhXy5FBRE7GB4BVHsReuiuVjoZnsxoIVvRZtpjaxie8=;
 b=hUGj8q8O+4hvifMlG0jW7Iw0N0b8+DEurQN/UXJDLq6Gp7v152t4gjzX+zuhZjfjce
 N2u7LCHUUl4VH1SZ+2Op2Hn71TX+JoUDDnjlzENFPZH8rVxGAOggYUoLVF/foYTychst
 WubtShLpNo9ce9UmEvyjloNEK3CgiV5rd6MSdrXIauNUpaoYHHcVxLx8mc6T7be9aFS+
 GuEOQyuNYQvlWBJj7N9IGQxe+q6yqZaKWdirguz64OsCr4oweZWK0r2XsImIxd8Y0Dry
 Qqf/iCmHnhvCgCAl8TUghZRkf9+VxGvCVqD2+mpVW9ZVFdqJhAD7DJTzJFVHwh/mtnB4
 FLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhXy5FBRE7GB4BVHsReuiuVjoZnsxoIVvRZtpjaxie8=;
 b=oXGRCktgV1gaKS3YNClgq4beTY87/7+T5oJ/B6VM+hh9XCxUT5VqcuoInuC7A7Ib7w
 00/1bYXz3PECI/fZlV325iCeshlrS6IDz4hQsb7qH+G0TDo/DfZdcZkCfmkvbFUUjj3e
 phVosWUD7pOFD8GO2DZtwVrIoVUgzZRDHzP2UFoZl2fYia1OtmcnMQrslQYrU8h36pPU
 mm+hc6Ip7/UznM/qhzVcZ5armSi9pQS/5Ut7hBcbrBFuCspOl4bi+ug29+kQJKWsAQhf
 WEnisXauEPIfWzqCqep1B6QcB5M95e2jVQi7fmN66DLpzSbfGx0SWw1+YIQvilUAQfYJ
 dMbQ==
X-Gm-Message-State: ACrzQf0nzLMGt+rS6y0qb3jML/9yjqrnHE5fFOOSsTpjx0ToJ10AcZmD
 mVmx+OXrr/ItAwY/j2UMOv0kRBfWal8qWw==
X-Google-Smtp-Source: AMsMyM7GjX+GOvy7gEX7uQBbxovWOfizMjyFHFXRnZS0dz1ZmWZ3eduLNICHKVjH3v4pmfg0jVNNvg==
X-Received: by 2002:a05:600c:474a:b0:3cf:a197:8039 with SMTP id
 w10-20020a05600c474a00b003cfa1978039mr14928912wmo.179.1668010495889; 
 Wed, 09 Nov 2022 08:14:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:44 +0000
Message-Id: <20221109161444.3397405-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 529c7bd4946..7eda9fb86ea 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -37,7 +37,7 @@ DECLARE_OBJ_CHECKERS(GICv3ITSState, KVMARMITSClass,
 
 struct KVMARMITSClass {
     GICv3ITSCommonClass parent_class;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 
@@ -197,13 +197,15 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
-static void kvm_arm_its_reset(DeviceState *dev)
+static void kvm_arm_its_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
     KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
     int i;
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                                KVM_DEV_ARM_ITS_CTRL_RESET)) {
@@ -241,12 +243,14 @@ static Property kvm_arm_its_props[] = {
 static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
     KVMARMITSClass *ic = KVM_ARM_ITS_CLASS(klass);
 
     dc->realize = kvm_arm_its_realize;
     device_class_set_props(dc, kvm_arm_its_props);
-    device_class_set_parent_reset(dc, kvm_arm_its_reset, &ic->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_its_reset_hold, NULL,
+                                       &ic->parent_phases);
     icc->send_msi = kvm_its_send_msi;
     icc->pre_save = kvm_arm_its_pre_save;
     icc->post_load = kvm_arm_its_post_load;
-- 
2.25.1


