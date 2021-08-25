Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63EF3F7374
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:38:51 +0200 (CEST)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqJ0-00032u-Ul
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG1-0002t9-SB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG0-0005IK-0E
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id m2so3047727wmm.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NumtafSnEiF4kjNIFtDKTqX8sKZowsVsCRz2Ds8yzEc=;
 b=Q00bWC1j9AxWPShu8c6Quhs4xblHUmAJJhkVuPgzaO95Ei/jr7ef0xXqJ0wLGaxhv/
 xUh0aZtc7GNoqhmWOFkzmBXHBn76n6vlSafL/xzf1rSLhPBCHZALHR5HC5jjEWiI3KeS
 tvKf8zU3gPYQfkp72enQizATqwSYexagGo6Rlke1JhLK5Fcy9SlDBBa5Pp6ZtgYt78M6
 2dm7rZVYruMhWU2IfrwSn+pv7+vOvk/BtKF7is24Nyw185PV1Qi350D36pKEomHc6rW8
 CMpqYz53Ew7+BQyxhnRyAYVe+Ri0uocAUbZMkCJPLa1SViZkkIA/Mh1T5ExU7+vz3lEd
 AEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NumtafSnEiF4kjNIFtDKTqX8sKZowsVsCRz2Ds8yzEc=;
 b=E61aZSujrFwYA+f6UIYPef+8Cyr4wF2E0yVKzZ2akB0qSKpO3PvR0arwbOAOhbmGvd
 emBsgYtTWyC9QBFwpGH91Dy2/DVdyB9bck1YUkrMSXvG2pfH4tbaQ291pbKOn8CwGf+X
 +ItzJGAuYagcrZ1ZWyBzqwASltHqB5OMuc3402LuqaTg9/tndwvU/5/rXE2685Ky+Plv
 N7gZN28NVQjtQnOuu21a9wXhwI+pHRU9CHt1ci2fIpy1/zCiKhXhZo5JrUGAXGM3ulQD
 iyyIcq0gioCV/wMRoFfWYWdrWOp4MvxPLWVDSUT9cSyMQBhRgN9rlJ0vt/qE1EcObYj+
 hh9A==
X-Gm-Message-State: AOAM5327UhQxJNBqz4kmXInmpsdQ6+bCQNDunf1zEDsQ2i3sOFVvccLR
 jYs5NJkeIUB3G2/wz7AB4YiI9Vw8VDj6yg==
X-Google-Smtp-Source: ABdhPJxXbaS7qKc4rPyRA31pivBts9PUFYXPqLMIRwHKPxaofUXo3bZzTcuOpwl+dTDeZh1WdVp40Q==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr8442566wmp.156.1629887742685; 
 Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/44] target/arm: Factor out mve_eci_mask()
Date: Wed, 25 Aug 2021 11:34:59 +0100
Message-Id: <20210825103534.6936-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some situations we need a mask telling us which parts of the
vector correspond to beats that are not being executed because of
ECI, separately from the combined "which bytes are predicated away"
mask.  Factor this mask calculation out of mve_element_mask() into
its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 58 ++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bc67b86e700..ffff280726d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -26,6 +26,35 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 
+static uint16_t mve_eci_mask(CPUARMState *env)
+{
+    /*
+     * Return the mask of which elements in the MVE vector correspond
+     * to beats being executed. The mask has 1 bits for executed lanes
+     * and 0 bits where ECI says this beat was already executed.
+     */
+    int eci;
+
+    if ((env->condexec_bits & 0xf) != 0) {
+        return 0xffff;
+    }
+
+    eci = env->condexec_bits >> 4;
+    switch (eci) {
+    case ECI_NONE:
+        return 0xffff;
+    case ECI_A0:
+        return 0xfff0;
+    case ECI_A0A1:
+        return 0xff00;
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return 0xf000;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static uint16_t mve_element_mask(CPUARMState *env)
 {
     /*
@@ -68,30 +97,11 @@ static uint16_t mve_element_mask(CPUARMState *env)
         mask &= ltpmask;
     }
 
-    if ((env->condexec_bits & 0xf) == 0) {
-        /*
-         * ECI bits indicate which beats are already executed;
-         * we handle this by effectively predicating them out.
-         */
-        int eci = env->condexec_bits >> 4;
-        switch (eci) {
-        case ECI_NONE:
-            break;
-        case ECI_A0:
-            mask &= 0xfff0;
-            break;
-        case ECI_A0A1:
-            mask &= 0xff00;
-            break;
-        case ECI_A0A1A2:
-        case ECI_A0A1A2B0:
-            mask &= 0xf000;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-
+    /*
+     * ECI bits indicate which beats are already executed;
+     * we handle this by effectively predicating them out.
+     */
+    mask &= mve_eci_mask(env);
     return mask;
 }
 
-- 
2.20.1


