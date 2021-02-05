Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09368310F13
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:50:18 +0100 (CET)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85FI-0003I5-VJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tz-0007AB-Lc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TW-00048D-It
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z6so8407581wrq.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jMMA1bcWT9Cf0LVPoBI3bN3FRfuppErnoBYF5x3xFs8=;
 b=BSJcvNylWfV2OAx7I8JLY6GWD/PmR3i4voRQfrQKWyM/3t9MFuKLq4uzudSCTBIuET
 4Wa3g+TTtnbNYd3qOcAeU/AtSAAzYUU84dzVZuA2rxwkSZ9MJN+F83Rv8UapQhQoB7dL
 gBMZCirI7DMXm2QLCqvect23rgLEHDCOhZTiwsUyfmM6quzUUZYuyk1qF5mOwLB04oip
 JID+RVC99OqtNXwHF/Hu8Szl/IjtRp/FJgo4qJtO21BIiuYwOwJVsICU/Ht2LmPenfMG
 csCpH2eaaLcriYi3J1DS/vZkrlpg7D+4Y51B9v4M69kiuv5KxqQRdtyGA8XA2vTD/GZ1
 2TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMMA1bcWT9Cf0LVPoBI3bN3FRfuppErnoBYF5x3xFs8=;
 b=DPWv5Af/pTPec8q6xzF+C27ccSiqidraJQjR/F6crC2RkgPlstN46/KPdwfVo1Ml9B
 1o3+fd6ilpF33hKbDIXmOMKOI6S4YLp2IzVnzMYfBaxqquKM6iks4dAFogU9+yEIm7j3
 g6jffh8Q0TmIrAmhbMlas4xDfz6MMzIcSeJ/INoCjdxqdO2E4eCZmVNOHMUv1y2/8f1K
 OXYINzJk9eogC3nuWQooRNeBjVuO6wcmMI6xTUb2YyLSRi1lCx6iaI6oe3uyLyFddAUO
 hvmAl4iP4pW/QPkQ2CBvIQSy4REgqGzX6JoCttOnoYwLIO1uQBU+LKvSIj1dA168iaPY
 IdYg==
X-Gm-Message-State: AOAM531v+uBJhOq6hT3dNGw73Yfxf4Y/vq4B/WalFcnimNIRvQwshlsW
 0fKrONGCgUETDgyRdeJbq/weGRfVBnYoGQ==
X-Google-Smtp-Source: ABdhPJwDNEip7+TYbg6JbDRaHAz/Ef5YXQtGRmHoXJIoigMPugWKOReugGuqQcUEkLZCE0D2n90ZPA==
X-Received: by 2002:a5d:6311:: with SMTP id i17mr5988743wru.195.1612544435474; 
 Fri, 05 Feb 2021 09:00:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/24] hw/arm/mps2-tz: Set MachineClass default_ram info from
 RAMInfo data
Date: Fri,  5 Feb 2021 17:00:12 +0000
Message-Id: <20210205170019.25319-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Instead of hardcoding the MachineClass default_ram_size and
default_ram_id fields, set them on class creation by finding the
entry in the RAMInfo array which is marked as being the QEMU system
RAM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 1e8dde768c2..b46b32746e0 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -811,8 +811,26 @@ static void mps2tz_class_init(ObjectClass *oc, void *data)
 
     mc->init = mps2tz_common_init;
     iic->check = mps2_tz_idau_check;
-    mc->default_ram_size = 16 * MiB;
-    mc->default_ram_id = "mps.ram";
+}
+
+static void mps2tz_set_default_ram_info(MPS2TZMachineClass *mmc)
+{
+    /*
+     * Set mc->default_ram_size and default_ram_id from the
+     * information in mmc->raminfo.
+     */
+    MachineClass *mc = MACHINE_CLASS(mmc);
+    const RAMInfo *p;
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->mrindex < 0) {
+            /* Found the entry for "system memory" */
+            mc->default_ram_size = p->size;
+            mc->default_ram_id = p->name;
+            return;
+        }
+    }
+    g_assert_not_reached();
 }
 
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -835,6 +853,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
@@ -857,6 +876,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static const TypeInfo mps2tz_info = {
-- 
2.20.1


