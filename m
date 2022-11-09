Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBB622FFA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjF-0001CX-BD; Wed, 09 Nov 2022 11:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjC-00019m-6c
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj1-00078T-CA
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id y16so26433643wrt.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TkW7T5S7zm7opSYfPV3c9ibz6QYvnDa1N5Ybi4vqCbI=;
 b=Ww8G8SPu2ZcSeu389lYats1nfHf8H/jiGw+Y1AUKWgcF5FSFoATUL/+fnIKupfWtZ8
 poG4POP/tgE5CTKFZxV49FNeL0kynclNzFBqtFkNI3Oz2NQAMdYbAp/JOztn8nic3d+1
 fFqfXLGz5bZ3JBPWH9r+L1hhg+64TE4GC9rqVBa/oMruboGpipc8mIuj0tWtsww85Asg
 q9r6QsZUmYjCPBTwT7lEHxvqu418AfS9rIpRroIPp1ktviIOICmhpTfhw7wVvYgliWDu
 HFigr2yn4lYRqap0bEaFQNtNqQdkCM8Zsco+X6eTc/s/Zip/wkLkKKOYifdM6HE44FWc
 +dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkW7T5S7zm7opSYfPV3c9ibz6QYvnDa1N5Ybi4vqCbI=;
 b=syTd8DB0w3kQgnJT3slcCqyruoPdmmi89rFw3QPXHngbmdYO3+5yyrik4BpE4EQSkU
 XLqKAPJl1uK6cdHyFFVAwQS0dkmUOqSQLXzwxlly9hPTJvmgVdH3/IJ7gw6Dbcq4mxC1
 CafU9hZqAeDTKQhWBvY91l38dcLAbcOcnj84Y199DVnpEkcRY+d/OUR6+PlQDoIdHl+W
 11u5d0F0ojic/L6dtQBm53HD/wZNT9qzbZ91K/mIz+b8SVuQq49FpHh4EFmFo3qpAwQB
 +mLNbcrxiEPkHKOQzNl2qGjARO118j2AE1Lcmtrh+DzNIV8zRs6/56NQDs/CHeYk3trT
 n00g==
X-Gm-Message-State: ACrzQf1fCEJOgGH9WPnSU13bl0AM5eEEJLzVGqHYn+BzBoV2DTsX8fJC
 J27pQsquLXAWRiiXa1BDMaX08FtEWXNUZw==
X-Google-Smtp-Source: AMsMyM7H8cjdkDB9YdixUgziz3U2ogNOYwDbLo7sJwhoPr6+65Vq8tpw7y6jLKtXXTQE+SRE9chvCg==
X-Received: by 2002:adf:f687:0:b0:236:481f:83a6 with SMTP id
 v7-20020adff687000000b00236481f83a6mr39697164wrp.342.1668010488625; 
 Wed, 09 Nov 2022 08:14:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:37 +0000
Message-Id: <20221109161444.3397405-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
reset method doesn't do anything that's invalid in the hold phase, so
the conversion only requires changing it to a hold phase method, and
using the 3-phase versions of the "save the parent reset method and
chain to it" code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/smmuv3.h |  2 +-
 hw/arm/smmuv3.c         | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e60735e..f1921fdf9e7 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -77,7 +77,7 @@ struct SMMUv3Class {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset   parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index daa80e9c7b6..955b89c8d59 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1431,12 +1431,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
     }
 }
 
-static void smmu_reset(DeviceState *dev)
+static void smmu_reset_hold(Object *obj)
 {
-    SMMUv3State *s = ARM_SMMUV3(dev);
+    SMMUv3State *s = ARM_SMMUV3(obj);
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     smmuv3_init_regs(s);
 }
@@ -1520,10 +1522,12 @@ static void smmuv3_instance_init(Object *obj)
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
 
     dc->vmsd = &vmstate_smmuv3;
-    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
+                                       &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
 }
-- 
2.25.1


