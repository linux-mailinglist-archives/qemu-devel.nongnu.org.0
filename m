Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D864DBB7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhT-00073P-Iv; Thu, 15 Dec 2022 07:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh6-0006qO-CU
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh3-00047Y-Dh
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so660382wml.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FQo9Y/PQ+gSmSXMPIhENR7hhWLKzE50YR9SZb6U2RxE=;
 b=u7lqJVvX0Z5ElvyiiHxYDXGrwt5vZKNRnupeVU4h9PWtDo3CcF/N577pdpRaECC0/G
 HJVdMYNKnRf6f2kj9R8A2X7W22zNEFP/Pbkplmt5UhY/blebG5Ez/yL826K2LkZoWfov
 1Cmyb1FErNGPQSJVFjn6uk6Rxa+AhNWU7Zji+CHnQC+gaS2xrA1STPLcaD0en5rYxu0o
 THe2qg7Q2LPRdkZZLjhmugMSIDFbV4bpYS3bMUAd7W3ZQL1uJEZ3cUr7HCQoqFTMXa+5
 9mWh7Ovt/DNk8OxUSaggYSG/6YEx+NgA3ObdZiLCL0ToxQtrSvsMr9e+jcLbChNZdpd7
 fu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQo9Y/PQ+gSmSXMPIhENR7hhWLKzE50YR9SZb6U2RxE=;
 b=fWTplq1XmoJbaWZaBNtm+hTJrFyftcZZeQmhdyGnzmZYcmkdsdRlQADFeF1hEl22uI
 qAJ7bfP1roZ8IlSSetNRtBbhslQ9AQh4W7G/+wRfweqlCHN+3Va9ewpy2vhdB0FfSIDz
 GMeDAXZ7J5zJ2ZpFrFmZuS86GYj0/NNGyGAAfNsQZEBu5DJBTTVbiBFcMYeP80NQkJRs
 WxdLoKpiTxpXqe31jACL3dveLjBa12cqxkMKY1EAxFkDcquxs6sS/Q3uR3VrlC+GR37z
 kDmT7pryrwmdix1YjmHNXS7V2bkUvBxbB2xvjExJOBoj5No5DSsTf9+PAWvkm7aAVdU2
 K36A==
X-Gm-Message-State: ANoB5pkMIRCBpZf9v8nGsT2U0GqByEK3Y6WfJMQZYbOnwUjix5k/sKr3
 rpKLQdUkJZXYl6NfWwS4dXwZTRJw7kktDzaf
X-Google-Smtp-Source: AA0mqf7xl8qKVSt9Qg+WSql+0UhHh9rBC9tzxhHnbjijMFwKfXyn8fQvdN88Lb6gEe81FlIAhp4y1A==
X-Received: by 2002:a05:600c:500b:b0:3cf:6d5b:8768 with SMTP id
 n11-20020a05600c500b00b003cf6d5b8768mr21256509wmr.8.1671108632755; 
 Thu, 15 Dec 2022 04:50:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/29] hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to 3-phase
 reset
Date: Thu, 15 Dec 2022 12:50:03 +0000
Message-Id: <20221215125009.980128-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Convert the TYPE_ARM_GICV3_ITS_COMMON parent class to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221109161444.3397405-8-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 90b85f1e25c..d7532a7a899 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -122,9 +122,9 @@ void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
     msi_nonbroken = true;
 }
 
-static void gicv3_its_common_reset(DeviceState *dev)
+static void gicv3_its_common_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
 
     s->ctlr = 0;
     s->cbaser = 0;
@@ -137,8 +137,9 @@ static void gicv3_its_common_reset(DeviceState *dev)
 static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    dc->reset = gicv3_its_common_reset;
+    rc->phases.hold = gicv3_its_common_reset_hold;
     dc->vmsd = &vmstate_its;
 }
 
-- 
2.25.1


