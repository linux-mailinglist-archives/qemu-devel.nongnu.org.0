Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EAD623002
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnj8-00017P-NU; Wed, 09 Nov 2022 11:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj7-00016q-6b
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osniz-0007h7-WC
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id cl5so26477681wrb.9
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mWA6AJys5VSw6j1hmZeVD4K0mUdWBpZpgITkZq/H/I4=;
 b=GiLR7Nvivm2qPa8n9N+rUAOCoyDCy/ZO/YWwUVbbSfvpWHF6zLluNOEGBtKI8femE2
 al9bD62WZN/Ce7zaZxwuSUX0nrcscgFUtMszswPaNuFaau516qmlZiGt+Yu/gOiBdwZp
 hlcvT8dz5Ue0qkQw9FVYzAQRyNSSOjNGxOFrP82mDCXTAyxZDAyKN0rkAgSiWflFnlOv
 l2fO/NKEFlqhQtLlGt2JycP+WteqxJGK/KoxfX3Lbvx6JZX1OJRWS1DpjdzAavbwByHv
 9hLAjy0tNwS6nSsBgZ/SP0s0i/hVOw1s6KslPwOet7We0rPck6uEJ8qe5JajvotGvAe7
 XTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWA6AJys5VSw6j1hmZeVD4K0mUdWBpZpgITkZq/H/I4=;
 b=rq+OMHTKPnnYJKGX2IbWa6DJx+9cI5liG9RiAdLQ1CoCdyL9WNZ8ikgK9KjWQfLkmC
 VFGllMe1a0Q1Fboy16huXLaHrrPRrndyLOiq/LyhnUvWv/lMeH+P4Kb9o7hYashHGzlM
 9PRUrrBehga/dT14dwdUo+WEYvm1DjKAmS2Cpg/Ts9hqbELAYgmiokCGxhctgzZVzIRo
 we+YxJjBvCrdVc1oU26WNaDVRtftayhGRTS1V6qrQHAFkhnGjAhGV+pbMJLleUEFUIp0
 8LowiRG7GaFENjWt2yiE+ZpF0+kuRNOlaRCWkbpjF5xpkVxPCtvR39buxZR6qg8XMFq3
 nZvg==
X-Gm-Message-State: ACrzQf3rKwIe2qz/7ofGfoG8R1NWGML3EbepJSZoBS1QMuwlmS3HHchA
 eq109yVrsftdeLD21FbxP/FDlzBWjdBmig==
X-Google-Smtp-Source: AMsMyM7cc+2mf4MPtlTaXofAGxylI41td5ZXRnYhkWQ+hV6RHexKgWxLL9/lzSmnUdIFs5AM/7QMkw==
X-Received: by 2002:adf:fd0f:0:b0:236:e8bd:fd0e with SMTP id
 e15-20020adffd0f000000b00236e8bdfd0emr28433384wrr.288.1668010487605; 
 Wed, 09 Nov 2022 08:14:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:36 +0000
Message-Id: <20221109161444.3397405-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
doesn't do anything that's invalid in the hold phase, so the
conversion is simple and not a behaviour change.

Note that we must convert this base class before we can convert the
TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
handles "chain to parent class reset" when the base class is 3-phase
and the subclass is still using legacy reset, but not the other way
around.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e09b9c13b74..220838525d4 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -526,9 +526,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void smmu_base_reset(DeviceState *dev)
+static void smmu_base_reset_hold(Object *obj)
 {
-    SMMUState *s = ARM_SMMU(dev);
+    SMMUState *s = ARM_SMMU(obj);
 
     g_hash_table_remove_all(s->configs);
     g_hash_table_remove_all(s->iotlb);
@@ -543,12 +543,13 @@ static Property smmu_dev_properties[] = {
 static void smmu_base_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
 
     device_class_set_props(dc, smmu_dev_properties);
     device_class_set_parent_realize(dc, smmu_base_realize,
                                     &sbc->parent_realize);
-    dc->reset = smmu_base_reset;
+    rc->phases.hold = smmu_base_reset_hold;
 }
 
 static const TypeInfo smmu_base_info = {
-- 
2.25.1


