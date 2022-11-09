Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B9623003
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjK-0001DZ-6Z; Wed, 09 Nov 2022 11:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjE-0001CQ-VI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj5-0007w0-3H
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso2916602wmb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7mC8UF4zmF3jcxIrFTqcyevksmdmVsanaUTLeosn6Mw=;
 b=C4v2Kd9zXnnWmmFHMLRVYW4xfMM0ogT6CjsMfmS9FbeDw9QzS48Nz9qzhWlf7lqA7x
 vrNEhVhYVLfy2ytTlhT+evluv9+EgS8IuUZGC96M1wMNKLHsCxbm1a45i199XftcdtQt
 YZJNQGMFtOY2wJaLXXOpmbzEBTXtlC+njwfzS0H+wiAyhbvoSXpKv2lw/VchiTTL8i1P
 AmYORPh7zVzPCIOhlvsFYB5OLU70aVb0hWl5gUINXcREUoFVfNI6f19RmkY1SUFpY1vj
 T7/5V9798ftoHwo084/hN5UaEO/eh55aakEHxXHbg0YMqUocCf+QxAcIGwY3uxtOBicT
 TEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7mC8UF4zmF3jcxIrFTqcyevksmdmVsanaUTLeosn6Mw=;
 b=4nOW6jcVXKvRaORwdG90rlfRFj5tG7Ak972G6TFErC5zeZhzHQzJfSJOqR79P83b/2
 5RnoKkLU4JQU0kgveX/XxpXfQ1xTGAgSFCtVH6rMEXziyQVDrPf+35nyLK/YCIXJrP4J
 SnhBl1noLryRj6bTLICVhCDlFKl5ELdkcfI0Pp3hEMXXTs46UNKjaQgaMGhBHWGBS3jw
 8oYvmoJntMjX+lw/6JAY20SBoFPa3/BaZW14WQ760WFmBImWQ8FDpZ9SiIGDDBnKGjZV
 xr4QacjG4Hmsy5Wz0wVc0NZ51T+hGT99Wzzq/0dV9w6TK+XZbv2om7YvEpHGaOS04JPn
 b7qw==
X-Gm-Message-State: ACrzQf36FkKWOb3XLgF4MfxLz6xS/Sq4Wg4dknZPOMKOQfTCW98LqU/7
 Rdb9eaXK7uZHC5a28wRvHoRmDRNBsU+sig==
X-Google-Smtp-Source: AMsMyM7dYDFzxMsPC8rIBEheKWHCYL/Mm5I+IqRvawQjO+ur89mABRnlBjpSMRpIleS5mmVapuoTsg==
X-Received: by 2002:a05:600c:2c4b:b0:3cf:9cd9:a850 with SMTP id
 r11-20020a05600c2c4b00b003cf9cd9a850mr18142884wmg.135.1668010493822; 
 Wed, 09 Nov 2022 08:14:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 7/9] hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to
 3-phase reset
Date: Wed,  9 Nov 2022 16:14:42 +0000
Message-Id: <20221109161444.3397405-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Convert the TYPE_ARM_GICV3_ITS_COMMON parent class to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


