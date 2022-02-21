Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CC4BD8E4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:02:00 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5W3-0004l6-DR
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zr-0000EU-6w
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:47 -0500
Received: from [2a00:1450:4864:20::42c] (port=36535
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013M-9v
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o24so25919601wro.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iMXdQaYTq6z65Mtgg9aHLP5XjipTMw7NVjVyfg18JIE=;
 b=Umxc8GeSNitwwVItnKjCuq2IsWSGURRKTnRHhHLf4Y1nX0/CvKTlyGuN+4NWs4oaLc
 grXAfnaQfMs0OqBban+nzdZR77q8VW6RaZdQeWlL1WQE1QBS520fV2fZJiUgGbueT96r
 QrsJrBXVd5xF+ZvyumXYJsVfJaie3HUC9N8uxPYKDx0wOCYZpQVRN0fRTzdRqsnFLgjb
 PI8jSvgSQ1HGX0n9y6VGxQOu8Vpvi32WhQZbcnXedMY0Mata7z3fmTxpJWT9MsM34rCO
 i8tbdc1nNNt37zVB97PGapflKO8IirzgfVRa2KUmfl8R9eoVtkjhGreDuI58YNQ0PMZP
 +WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iMXdQaYTq6z65Mtgg9aHLP5XjipTMw7NVjVyfg18JIE=;
 b=17Me5f+fhTYmiaiAYpa65qPDI/6lv7pnz6ddXONzFsNomc4quUqGWH/taThlDbotCR
 3e8oaldJV9NL6WByzpUxP9Dj5tyM0ALavK45JcrUN3BVO3DYxNCE9Jw1M1OQmUcXMNI7
 f97olMGSlnc2AKvp7w7Rbuuz6Px0etktjlwpFKvi8MuKBN5NytoVO20wnqf7O6UscePH
 cfEXDA2JzsOhKugpoJ76SClDnI4WYX+qeX9RwoVM0gH5iVdjEqaOnfFBL2x1qk52IepC
 CJhm/KXZmGboXSy7FP1EgpAsP8nIRT4hKLa/l6AXaB8rx/DKEYmuuFvxf8sp6LCmd5/Z
 XUZQ==
X-Gm-Message-State: AOAM532Wiwn0UdyyUNYKHDPP3kZ0dHgtymRJs5V98QUTOwaotDArMcBo
 kadPExwkQESc+vJpHSZ3jEPHZzup0Hifkw==
X-Google-Smtp-Source: ABdhPJyFb/OVYo5pmF5YdTw3S1AgkfXaD/OBoXBjVJBBwr0F89i/E87GSm+8cJfFpxBEiIWKA+xYrQ==
X-Received: by 2002:a5d:6482:0:b0:1e8:330e:e442 with SMTP id
 o2-20020a5d6482000000b001e8330ee442mr15166210wri.107.1645435700234; 
 Mon, 21 Feb 2022 01:28:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] hw/timer: fix a9gtimer vmstate
Date: Mon, 21 Feb 2022 09:27:56 +0000
Message-Id: <20220221092800.404870-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

A9 gtimer includes global control field and number of per-cpu fields.
But only per-cpu ones are migrated. This patch adds a subsection for
global control field migration.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-id: 164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/a9gtimer.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 7233068a37f..5e959b6d09f 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -318,6 +318,12 @@ static void a9_gtimer_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool vmstate_a9_gtimer_control_needed(void *opaque)
+{
+    A9GTimerState *s = opaque;
+    return s->control != 0;
+}
+
 static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
     .name = "arm.cortex-a9-global-timer.percpu",
     .version_id = 1,
@@ -331,6 +337,17 @@ static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
     }
 };
 
+static const VMStateDescription vmstate_a9_gtimer_control = {
+    .name = "arm.cortex-a9-global-timer.control",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_a9_gtimer_control_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(control, A9GTimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_a9_gtimer = {
     .name = "arm.cortex-a9-global-timer",
     .version_id = 1,
@@ -344,6 +361,10 @@ static const VMStateDescription vmstate_a9_gtimer = {
                                      1, vmstate_a9_gtimer_per_cpu,
                                      A9GTimerPerCPU),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_a9_gtimer_control,
+        NULL
     }
 };
 
-- 
2.25.1


