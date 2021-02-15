Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D631B8D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:15:12 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcmV-0000VI-4T
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQt-00008c-NG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:51 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQr-0004BI-Vq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o24so9023836wmh.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EqrwKzWHzWMN7lxcV1Y9F0BBb0MV1m8CQjXEiMLLrtw=;
 b=JaRD7M/r+GAtMCQO5rNqqmKWe+rERAZB3+aTPn6mhCfppub3MW3j9u+5Hpfg9l5d8g
 EdcTOmGZyZfCvD0W9DLWN/jXya+4SXFcUQ/qyeqcusE6QjdPHpeVxChlBpcVUwB9hupd
 UOVJgXzYVjrs/X9Y27pU0zaHo6gRlM0ifnJSV80XUVRGVdOb9fV6sskWX9n68nI+YZYG
 2zFHTngKKcHnnH5O3y1MXslYp3uZ14eEFLZwdyGfDr6FkobGFI4xlcJFLOVu1vibYOfk
 0aD8UOzlLLITSDAkIozk+1UDvFUowgXAmst/Vp8Nbwy9Kj3oHGzt2Er2YCXygkX5D/61
 7WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EqrwKzWHzWMN7lxcV1Y9F0BBb0MV1m8CQjXEiMLLrtw=;
 b=DJjRS8FkYA7hnoyDhQ4bcOS2zNDbbQk1GyKsTPxXOUYyRmctw25h6+pu6Pubee8EwI
 UTyMQm9wxRGJo/dEkGk1Kpm3SdLjxEh2SSi3sU4H8GIhhukrdWS1b0vhXDUJ/VHb5LYQ
 4dvDlRhY/eqHAMLBXWC2keaA1E7VXcajL8JmZanfJUKZ/NAMes8w/hNnlGs+MWfzZK94
 Tf1gEIrP1TWXDH8XxEuCeXxB4pBaKIxemTMTisLVma00HaXG20AbG+BN2JIkIviSGc7F
 WEOBRAT9hZAcyKsb0gmQeRKy36lSLE0Q9xYXJvZhBtDCVbN/WRf73V9qraR45C8qsIzM
 W2wg==
X-Gm-Message-State: AOAM530DU7z8lueO7yVqBwp1C7cL7IjMEdaV2RIf48pa/Lbqr/iVFRi4
 Xr0PqPPU89f4UbNODNsFgHvPID6uXDoANg==
X-Google-Smtp-Source: ABdhPJxvkyKF7c9ptsFXkkYMjc0e/dQ/fwx+UMroPUS2a24hwlOv5akOJLFJ3a1P5aIqwHJtwJOTdw==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr14086741wmj.76.1613389968665; 
 Mon, 15 Feb 2021 03:52:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] hw/arm/mps2-tz: Set MachineClass default_ram info
 from RAMInfo data
Date: Mon, 15 Feb 2021 11:51:31 +0000
Message-Id: <20210215115138.20465-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 18f75eacfcd..08dd2cbaa40 100644
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


