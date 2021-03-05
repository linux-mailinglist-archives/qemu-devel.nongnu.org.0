Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C915A32F29E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:32:38 +0100 (CET)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFFd-0003DF-Rx
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE41-0007Sk-Se
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:33 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007io-F3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:33 -0500
Received: by mail-wr1-x430.google.com with SMTP id e10so2862301wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sSQp2d6jwLb6DcuGgX9lcMaIg2ApAQ9naMb0a9sdWEA=;
 b=fMG96CrpnLNsEwDfbyYlUf9l4ZS/JTKcPypHOrTtjgQEJ25pICPvoX/vMHcbTj8W7M
 Op2GOBbzSEhjR1xCnUjMqezPL/56q/25VClRdBa/dmilwlb2zDBobO5Ij9YSXHKMA6zy
 pb6r6svAl7cYEFnfdN+eWw3zAEvXRzcHwKkdo8I4z6NxuNvp7hUS0WfbiEnv26YZujdb
 ZIdwYGsEDUlAMTeWBIuDM03FUfmNx3pUW1rVlFW9MbSDaJKZPVaeO55DXNhBwRFQ6d7+
 YYS8rVUmInmZr10aqZoSVThMkTcfqRobsK9NC9ECPttANYDpggTiKuW2ydkJsYUfToI0
 cUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSQp2d6jwLb6DcuGgX9lcMaIg2ApAQ9naMb0a9sdWEA=;
 b=sTk5NiDiaxqGfJTK4qICix/x3fpv8SQYQJPOHLJNEfFVe/pdWfMAi/yyq8h7b+qYou
 z2d3ltSF6V/NbMjzbV05z9oDpsCMf3qq4bEvLoRQQptK/Bi/yR3V+t+lPTwKRRo+rT1E
 btUyAefHhcStx9+IEMGwForXEPZOJIx1dwcY3OX8ibnWMX7JNTaiFKMLSXLVlfuz1aYW
 8BG5fFjojEfMZk5Ehc5Wi3e+SYeWe5rrKej885mlMzrZLX2MtouY+nALYZhDlONcQHPa
 X8AFyFMC2rV7LBiqUQWycgvzhp5X6+3PY6I6YxYINDD6hRASFX3gFa6lAy77tI7xzBZL
 MesQ==
X-Gm-Message-State: AOAM531WN1ATYBgGrKNWUcmazSQY4eIcir92idfwi2LN3ovzWqw4Geso
 lBTx7oNUqi33xmVIY+NhyrWRVVVflFlgTA==
X-Google-Smtp-Source: ABdhPJzNnfAfZDNC+/tcpwuKQRZ6pI0cCYrSc7eMkA9EApPznXYtUSdBeYra9e6l23FB4cJaX09Kvg==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr10613456wru.88.1614964546606; 
 Fri, 05 Mar 2021 09:15:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/49] hw/arm/mps2-tz: Set MachineClass default_ram info from
 RAMInfo data
Date: Fri,  5 Mar 2021 17:15:08 +0000
Message-Id: <20210305171515.1038-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-18-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 26a52b72eec..eaa430e9537 100644
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


