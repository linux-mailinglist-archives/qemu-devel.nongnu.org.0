Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425964DBC7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhR-0006sg-Jd; Thu, 15 Dec 2022 07:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngz-0006oj-PZ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngy-00045j-2M
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1735422wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/8/61FsKkax9rY6lVJh9sK4fG7jg73p6fZusY0m7KIE=;
 b=deQNOFOD9AZqQ20RX3GUt1we2oH13LiXu9ChFvpVPZHRyZ9GQCA8CCHFjvan0G52hl
 hOegMc/yGLUNuiBklMoBhv0MdxCr+j1xlIjCLetDGHv4zzgr1Uc4iqoGKnsqhtUUBSYA
 v3gvK1Na8Ako+aWG+/4RW6Pk4hQgbDNk/Lm5Nyw+XpBHczjHmiztnPHFejR9BisQNLQK
 IqlM3GEqJqbHXAtnstDJ21vUAZT30xFtA7rEiIN49ZLdNxf3L+wBk/04+AaZWZpOX/ag
 SiBUm9uv9lPwkoAhaMXSbF3sLExAe+8SF+ieSwbp25SxlftU0gfTQDd9YZdwrZxvn+s6
 GXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8/61FsKkax9rY6lVJh9sK4fG7jg73p6fZusY0m7KIE=;
 b=7ytTNJzMdeI/w8Hh3kEn+kDLIbmeKGd/nllTZqnZzoD+Sx/GrfLx76E5Zyc35XMy10
 aHvMfY6+mdLp7HRKlgukUYWebWy1ptW3sP9vwMxmeoZJ2AyxCO2KFVAnyAC3WY4Pm/Gv
 CbnrMJHZMK6XzocVaajr+gwDo1AbkqG4ZnsHriySwc+/bwZ7Mg4w55S5S9i7qK4dxcMU
 Dtxnr7P/plqneifViiVJKdkcllHWCJzndzTTD7BBwvoRlwmqC3oqM3U78NMIgUO7H4FH
 bcX2RKxHu9KZvtYmB95x5xfBBLpnSMoU0Co6u+Oc8v7KCPseICVZopvrIb0LW+CdcTsF
 PoeQ==
X-Gm-Message-State: ANoB5pkUWl/MCr743alEXTAvSR16AtkCI83EO1ICPNfvB/PkaEOB0Wwj
 71rdugvR2lOcJ6MQeAe2de4nQTb4ljj5i0HB
X-Google-Smtp-Source: AA0mqf44gWz241F0q5aqmtw8LI+ET5OFReMsb3lfXvr3uSBnmE+rtFzOr95NKrjxXEhNcrgjjJ/lLQ==
X-Received: by 2002:a05:600c:4e52:b0:3c7:18:b339 with SMTP id
 e18-20020a05600c4e5200b003c70018b339mr29915420wmq.37.1671108627375; 
 Thu, 15 Dec 2022 04:50:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Date: Thu, 15 Dec 2022 12:49:57 +0000
Message-Id: <20221215125009.980128-18-peter.maydell@linaro.org>
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

Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
doesn't do anything that's invalid in the hold phase, so the
conversion is simple and not a behaviour change.

Note that we must convert this base class before we can convert the
TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
handles "chain to parent class reset" when the base class is 3-phase
and the subclass is still using legacy reset, but not the other way
around.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20221109161444.3397405-2-peter.maydell@linaro.org
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


