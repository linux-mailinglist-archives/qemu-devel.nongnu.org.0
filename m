Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F024B64DBDF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:02:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhU-00074f-4K; Thu, 15 Dec 2022 07:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh4-0006pl-AT
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh2-00049O-Ns
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1743420wms.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3CXHTArsm4UuNjlPNq5RxTfGkxiav15C2fGC40drAkY=;
 b=MISN9LGB2AvG3eYLvgxsGzLv1IdrWHz2JLCrwUSlJGYNjiK1F5ttGRfx1aqmrxlw8i
 2Li/tRMajwKiMnuiCDh8kw1JCcLdzWLp4IQ5GJ8fB5cYpWJrEx/HUF90plXrK6P3hXCF
 hD03jBgOJlSPQS849MEA3fQjytlvpxU0375Dnc+R3+UO9mXBP3civ0j+U/1EiAcB80BZ
 FUYEI3NG0jYtC5Ueh2PGl/YyiXdhbSH2n8BKQjbeUOsm80CM8/nQrjNl8H55vrUTs8Qt
 qZImHOhYeh88pwxHDc/ltCUIGhObT8mbxs9gDzl9wGFbEZjGhgRHQisFdvHwlmrUP7uB
 VzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CXHTArsm4UuNjlPNq5RxTfGkxiav15C2fGC40drAkY=;
 b=q6vN4rmBSUxcGPGt8u005IiLq9un+9vbeR0IQImOJHeQC+rGNwOK8EFqu8k7um+zDR
 1MI6E5/r8C5j5df7/O3nbBjT1HY0ew2xvUXUAlLKU2AJLl2dyvV0M4dgI3HYC2t/zJEx
 dMnADEAuKa+JguDh+U/UeYqs5yjUafF7BSAdUgJgYQZGYDGSZvGL2h3K6Ycnp1S7gNP0
 cUoXfsHwjMyKnPrOgd/RTBpuN5knpUkpPJfDEXGomFV3ElDoZ8s4KNm7gekQ0FNXSW22
 FOhwe0YfmV0UojxDfvbjHEvmdskOFqVyeV7EnQVVGI3qhHO4o1qNYImHlRycMVYQBjQM
 XfMQ==
X-Gm-Message-State: ANoB5pm7xgMDMlaw7ZjHEOYcKjh3swtvL1FlCl4LABvOVsOro70oiSe3
 a7BgtZLMgx1syMIR8h/wUfBQGC6pbvOpAtOp
X-Google-Smtp-Source: AA0mqf6hmf3dbOeS6AYv8E6k4JDlStjGNxFRA7Gd6qyxJenI6zqPaHkVQN7YC7JC7k4rCTm5Q5Ygxw==
X-Received: by 2002:a05:600c:3c95:b0:3cf:e7c8:494 with SMTP id
 bg21-20020a05600c3c9500b003cfe7c80494mr21967108wmb.29.1671108630874; 
 Thu, 15 Dec 2022 04:50:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/29] hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase reset
Date: Thu, 15 Dec 2022 12:50:01 +0000
Message-Id: <20221215125009.980128-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 351843db4aa..642a8243ed4 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -450,9 +450,9 @@ static void arm_gicv3_finalize(Object *obj)
     g_free(s->redist_region_count);
 }
 
-static void arm_gicv3_common_reset(DeviceState *dev)
+static void arm_gicv3_common_reset_hold(Object *obj)
 {
-    GICv3State *s = ARM_GICV3_COMMON(dev);
+    GICv3State *s = ARM_GICV3_COMMON(obj);
     int i;
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -578,9 +578,10 @@ static Property arm_gicv3_common_properties[] = {
 static void arm_gicv3_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
 
-    dc->reset = arm_gicv3_common_reset;
+    rc->phases.hold = arm_gicv3_common_reset_hold;
     dc->realize = arm_gicv3_common_realize;
     device_class_set_props(dc, arm_gicv3_common_properties);
     dc->vmsd = &vmstate_gicv3;
-- 
2.25.1


