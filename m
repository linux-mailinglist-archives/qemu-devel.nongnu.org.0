Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4FF65C633
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrb-00007M-71; Tue, 03 Jan 2023 13:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqt-0008Iq-KF
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:39 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqr-0005C0-K1
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:30 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id 3so32566037vsq.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rb9AmI85idWoLsBzV+dL4jn39dqWdimKW4r1L8TYKqA=;
 b=pfzsU4hUS7eJ60VWnkOCuLpaIRDZXdbEFaIqCvOsgmTbMyCr0GswzE1AQchfGtB/j5
 YkjFai8/QXqMczksbZHDRj5d0UZNYsZY7gOKEs1KsGoKv25aTatLLWWM4WHHr3bo8J/2
 WukTFFKYgIfI+zw+vtK4JIuxmvcjy5huRJgqZZfrxTHshROpczXxIYmex3i3xUqnuKQ7
 oMS42Fedlmmj491FUYzjztVxNCeZxu+3fppd9+gZxp0Rl2QkXJpiD1oVYPH9s38jWuwG
 EeYL7jGP6eU+QoQIf+Ot23U3qKFKVluk7PzxGHjF0dMXXHIrO6yiHBEUCrPxMXcRMynU
 zR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rb9AmI85idWoLsBzV+dL4jn39dqWdimKW4r1L8TYKqA=;
 b=ad3fsIJEQJO1ANSUQ5g+YUohlLoDWa/H/26TQDXFdYS9I7brxBvwB0QxNJ9vUv9eJn
 TUJuBumOYdAv5r8Dblr2IFMtz9Lb3ioh1k7wAQjZ7NUtI5DdjB/v40lBOf6vDSq+7Ry4
 ZALgiRAuVA3CkpQg0Qze+BNWY93orTir35FKE+LOoVMNnn0OkwfDWGo/mm93LsUVRUA4
 lqL6KO0uJ7jNSgqZSwq5+/OYPM4a9CXIa0QX53gfj75hJJNwYTNO4sMPRVsSm5iOlzw1
 +d75Eh89KBrpCt2wN1eUN25mzRFJMU5PmXtOEmAqT+OlYArYTEdf81QbAzGnXXIHurbI
 z1bQ==
X-Gm-Message-State: AFqh2kqLEqteeGpPL0a50ra1PMFX7Z+sJiItKfNXH8ooooVW09XnSAXm
 TcVDcMdMFcqafhCkzFQUbBeJzI376WnfM8/e7OM=
X-Google-Smtp-Source: AMrXdXuv2vDhEVghaGj6c6LAnjAVxB7rcj4D40U3MPuXXL8PPDMJ+aY13z2JjP+G2LdNmMF8sANNeA==
X-Received: by 2002:a67:e983:0:b0:3ce:8419:3cb7 with SMTP id
 b3-20020a67e983000000b003ce84193cb7mr4983696vso.5.1672769848845; 
 Tue, 03 Jan 2023 10:17:28 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 13/40] hw/arm/bcm2836: Set mp-affinity property in realize
Date: Tue,  3 Jan 2023 10:16:19 -0800
Message-Id: <20230103181646.55711-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2f.google.com
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

There was even a TODO comment that we ought to be using a cpu
property, but we failed to update when the property was added.
Use ARM_AFF1_SHIFT instead of the bare constant 8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/bcm2836.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24354338ca..abbb3689d0 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -130,8 +130,11 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
-        /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
+        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
+                                     (bc->clusterid << ARM_AFF1_SHIFT) | n,
+                                     errp)) {
+            return;
+        }
 
         /* set periphbase/CBAR value for CPU-local registers */
         if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-- 
2.34.1


