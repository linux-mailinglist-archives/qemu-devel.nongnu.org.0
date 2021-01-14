Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A72F696C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:22:56 +0100 (CET)
Received: from localhost ([::1]:34976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Gp-0000e6-Dw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071J-000205-42; Thu, 14 Jan 2021 13:06:53 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071G-00051z-U4; Thu, 14 Jan 2021 13:06:52 -0500
Received: by mail-qt1-x82a.google.com with SMTP id y15so4173210qtv.5;
 Thu, 14 Jan 2021 10:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AhALz65QmAR7whbzZIT7Pqx8o2PXiHjpaEKq6JAc76M=;
 b=d9umtiB+BpuYqFdENGxfGiFKuhUQ/+MEJVo37pbvYLtvu7NraFn1giI6y9onR9PZQj
 ZgkB2qGuFgjvoX8czwLCmuj1J4JvVtu8HS8/tFt5UmxPoHlsz6ckAt+PjT559VA7gKXw
 qiiVKAKeSQjFlvg6l1sI+nhEcnFbD0pOc2bsuubrUho3x8Wmd6gUBxlv8T1VOgixE7Qn
 CRb3XQp0rxhnUe3D3/2YPRHZGXvK9IJO+uJlSsTTLL8Q0aqf+j+pDwjCS4odNDcoRhws
 Uh0HL1EDNHzdWe7U7yFNn+MWAFNKffuQJT4CFwTTjvkVtcjUg7s0St05mFJIeLbjZ4Vm
 PBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AhALz65QmAR7whbzZIT7Pqx8o2PXiHjpaEKq6JAc76M=;
 b=Y3dWUN7UN+lmIAC2wh6pHjkhV+X8EJeaChPUOO5cvq+fBPD1UM5nA8C138XjzhC2dW
 jS1Y2RF1DWdSeknesWjAbtnFuMi+DJ9TOrhcRYHv2kpG9Gg/X2XxpU0Bu0UrOOXo77AJ
 AngJuwC8L/1GOjrIPHx7rrFmo38WUlfhtdCZMrfJuVdI3bnEs0rQPaQgzdGPhW+YYCcF
 0pjzCLEmWDelZ9wsHYUp3n2GU1Bj9FGnR355xFeZL7mldatzBG+Pt0fCiguBmb2nZCyL
 MdT4i/7OIPtygToQsWv28PbRQbzmuvX+yVpwZhs7nX+Rp7H15LUT/J5W7W4W9f/Ni0aX
 oJSQ==
X-Gm-Message-State: AOAM532wP0kjw8aAxFBITG4nkfsDOorSw/KlEkCictQmt5s5r3pBXalm
 pW5lZf9hkwsmncBjUEe1jb4zo38KZzcW1g==
X-Google-Smtp-Source: ABdhPJybdICHWJWaA0VLeJ8pdU0wpzh1xBKvaxGYIX4GWficmokPiNOLnTnsZCpX/CsRD1Cl7DP+IQ==
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr8138616qtp.198.1610647609064; 
 Thu, 14 Jan 2021 10:06:49 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/7] spapr.c: introduce spapr_core_unplug_possible()
Date: Thu, 14 Jan 2021 15:06:27 -0300
Message-Id: <20210114180628.1675603-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Next patch is going to add more conditions to allow a CPU core
hotunplug. Let's put it into a separated function to avoid crowding
the body of spapr_core_unplug_request().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2c403b574e..a2f01c21aa 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3706,22 +3706,35 @@ static void spapr_core_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
     qdev_unrealize(dev);
 }
 
-static
-void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
-                               Error **errp)
+static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCore *cc,
+                                      Error **errp)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
     int index;
-    SpaprDrc *drc;
-    CPUCore *cc = CPU_CORE(dev);
 
     if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index)) {
         error_setg(errp, "Unable to find CPU core with core-id: %d",
                    cc->core_id);
-        return;
+        return -1;
     }
+
     if (index == 0) {
         error_setg(errp, "Boot CPU core may not be unplugged");
+        return -1;
+    }
+
+    return 0;
+}
+
+static
+void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
+                               Error **errp)
+{
+    ERRP_GUARD();
+    SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
+    SpaprDrc *drc;
+    CPUCore *cc = CPU_CORE(dev);
+
+    if (spapr_core_unplug_possible(hotplug_dev, cc, errp) < 0) {
         return;
     }
 
-- 
2.26.2


