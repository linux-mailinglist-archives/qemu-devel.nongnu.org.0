Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B264DBB8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhU-00076I-Sw; Thu, 15 Dec 2022 07:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh9-0006qU-6F
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:50 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh6-0004AH-Eo
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so4325294wmb.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gbsPptG/9NycljswTXfQ1MSykEPoHxgef4kzxlHWXjY=;
 b=Reaz40tN1/N44x+K+uwRdqqKFy8zv5w6XDtuGAuXh+kqcqg0/WETs5tnl+t/fajZws
 Jb7V9Ipf55Eao2Mu/IoR67R/zN751kqvzMujMc036sfFLl5Ls+DoGQnDNIoXPKLEucjQ
 xeuKuQSZe1Ip17Dly4etlITCg7kkrxhY2tGvDWAezzI/30Ndol3DBZfOSMYFlG00RUjV
 98UxKFay27l0qmVJbz2RWRcTX9PgUnYytAq771j+K4nTMHJ7KxwmSbGT/YABYBGgKySK
 VcFd4vn42OgaT8wG6rSMKSFrCBPz/p8gHjFHAWC4h434fYmUgQDb6u9Kt8EYWxEgGR3w
 QkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gbsPptG/9NycljswTXfQ1MSykEPoHxgef4kzxlHWXjY=;
 b=Cqh/wFjH4PCM3ITIRssqOqVkbw1iTTlq9FIz29BPC/90heMsLEw3ulgkG0VBJOpaFv
 MNq4mNq7kkw/psPVFF1TTYqXtlh3wQuF+16n0aEfwknD0j9cTm1jamPa2rBsEbbjfRGw
 Wy8JWs0hp+48UMTVB2XliQqN9mkwNDZg75PX+cYNe0wlBRU29F8pNH/zzLGZQRpJv/cZ
 hwWT37xMNJbznJookmv0ydr5kqIW1OOlP7zBn4rHpFyx9I6IghUEOaXGB+XLoVxMvJgd
 gCHGT1CAbaVbtgtl1hDhWef08b14laJrpomsJ18wJN2Qt307EzR7fGcIxmfIZk525r/x
 tVcw==
X-Gm-Message-State: ANoB5plq16W1BnFt5Rknef5rxm3+J1b+B4IbvUWNuLhRumxVrIyCWQ2p
 ala7rUXHnjWuwSs+D2JP5SYBQVuEovBTfNVa
X-Google-Smtp-Source: AA0mqf6eB5RzkcS8Qs0+DXtmgfmRql2JKeB2VIDHhp+a63OMrS4dJbCOdLECWzVdFZKVn1vr+vdWUg==
X-Received: by 2002:a05:600c:4f89:b0:3cf:d0be:1231 with SMTP id
 n9-20020a05600c4f8900b003cfd0be1231mr29843875wmq.13.1671108634588; 
 Thu, 15 Dec 2022 04:50:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/29] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset
Date: Thu, 15 Dec 2022 12:50:05 +0000
Message-Id: <20221215125009.980128-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-10-peter.maydell@linaro.org
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


