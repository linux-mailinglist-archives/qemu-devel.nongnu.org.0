Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639062300B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjN-0001GV-6E; Wed, 09 Nov 2022 11:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjJ-0001FW-J7
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:09 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj6-0007wJ-5U
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:15:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id o30so11149977wms.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kuIn7I6CLp9VWQfNOdiiRV8ytBoQboktwZZOEvzvoPA=;
 b=wfsrMWK9LTJNjPEVGpICwDLtgoHzmdjrg8b+bNT6twp1Y6Q2JhvZi6PRZYTbpzAflG
 lL1W2C8lujVDswv1hWAmK79mc0s8v/u3UR2OVM8QZHD0v7uPOxU/kwEQaFw92WckIMmB
 4Tl3u28pdDVAP7AWDgzxODjElQ+uIWKW3nxeFdqXkj8bleFB/zTTWrgtB/GvILnzRKUg
 GlRo/2JCvv3qH4xDOEFg542IGQQQqDc+VuYQqpyz8rHnD5kUwISIae21FGzNzvnGLWyJ
 NxoP2OnjKTVBAITlL1FzYf+mbRSu6n6OxuyV3zedy+1f2h86mHmlEgS4XIdONZw/Njc5
 zhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuIn7I6CLp9VWQfNOdiiRV8ytBoQboktwZZOEvzvoPA=;
 b=AlRUfL1a3av9JOVA1mvUFC5Mj2w9JUG4zsdsmNuREsal7MRsJV1PDwFr7wuxLTl7jQ
 gl22jaA+kCbRftJSZSonZOSHfAyhtSAeDU/G1n0HkRNKExK+VKuPJ8HYBtSaKeEPZj02
 6M4CiKXaEmOTmBZk+SLZ+viVxj5qH13QVt/Gg+KjeBBk5wG8xSfayaXG+bMbIwaSAmSn
 kWbb4zeEdIPBXt54La4/Bh1rS0sxaAIHT2QJXombJP/VREdwKElbWu++xlBLfUzrUNGi
 pYbMM7F4vMkG0PpwJTDD7HcrfMiIrlg8EY4caRvUyOuN4EP8q2RbFcrGDM2zxxv9fmQ3
 ZjbA==
X-Gm-Message-State: ANoB5pkw6QTUyerdyD4HMx5fufzQYhKZZys/DbAPQz2fPCCZoKEQMpkj
 t4a2XjYVyXF3uRTb8diHeLHBrw==
X-Google-Smtp-Source: AA0mqf6z6kZXA46SgAtRAx5SKHMcQeiQikYOYq02GZqhIc2e7gJUZz2lt8jYWM6S67rJAcJZ7kieVg==
X-Received: by 2002:a05:600c:230d:b0:3cf:acc6:ba97 with SMTP id
 13-20020a05600c230d00b003cfacc6ba97mr10336300wmo.102.1668010494825; 
 Wed, 09 Nov 2022 08:14:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 8/9] hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:43 +0000
Message-Id: <20221109161444.3397405-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 2ff21ed6bbe..57c79da5c55 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -27,7 +27,7 @@ DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
 
 struct GICv3ITSClass {
     GICv3ITSCommonClass parent_class;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 /*
@@ -1953,12 +1953,14 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void gicv3_its_reset(DeviceState *dev)
+static void gicv3_its_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     /* Quiescent bit reset to 1 */
     s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
@@ -2012,12 +2014,14 @@ static Property gicv3_its_props[] = {
 static void gicv3_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = gicv3_arm_its_realize;
     device_class_set_props(dc, gicv3_its_props);
-    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, gicv3_its_reset_hold, NULL,
+                                       &ic->parent_phases);
     icc->post_load = gicv3_its_post_load;
 }
 
-- 
2.25.1


