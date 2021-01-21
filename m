Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37012FF409
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:16:04 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fR6-0001Xq-05
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIL-0002MQ-4j
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005rv-0t
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:58 -0500
Received: by mail-wm1-x334.google.com with SMTP id v184so2445513wma.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBXfwM4T9Rp9h29Xxm0HwwLnhBuBHTwg/UkEmxOGyBA=;
 b=HbQ+RJT+9V0Kaew+eV+iz8pVd8lP/UKHrSmfNy1iwMRa6CoHQdj4DXCeFfV25GpQ10
 flNoPhrMhLBQeC/wIypvM22vfONFPftnK7jVduecv9WsEcpQ5nCNoqq4U8XeqWmwz45Q
 B5OdBtR8Du7sBUx0C7ZhgIIzbK/dkpFxzHAZWF1guIU6i18DdsS1FxPvB2Ed8raYLzry
 xywU7jVHAFFJz7otfgUQR3V2aUzzjXgw217H8uepnVWWJh1HRW7OEGOfEdDcHX90EeKj
 Kl06i3vv1bwHTt/RhFFNGrlHarW+uKVuUauKusOtbubpXuSp6Zj0xTIQwFc4uen2UC1L
 luvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBXfwM4T9Rp9h29Xxm0HwwLnhBuBHTwg/UkEmxOGyBA=;
 b=jT3mdNt71rMtUjWhJklcFtsF1TbF9UPXK5Wh9+BzM4EWjBAkWWhOilXTYzwzem7ARX
 dgnRlsrrE/DXoD/81vuXV47l8qPMaIE2e5iMACDoEyStQJGYE8Q6PFGTm7b0bAzzHjFb
 vi2blKgFz51aemMMon6F3rj2iVDvR1CYHjVJtJnP/4YX3nqAEdRFLxjqk3HPTkT1IbLE
 4f1OgAZIXBb8GxOdCYcAJUZpNOtg5N3cnOi/vX4K53uqijt7ipcquUmyiTFKgqS1Va2S
 JneNWde2rQkgnKwvcSbIvcUameNdIID+CMJ1cO+OA/c/SeP+Tk8u3m1Q4v2uKnYVeCXX
 JecA==
X-Gm-Message-State: AOAM532paaLGng6XNsgRenorFsPMtGd09kq+bfvH/lGBPopZGs0JqglU
 nFv/hg2RoobJry/OwavVuB52nDz1CFrwTA==
X-Google-Smtp-Source: ABdhPJyQcoaGHsbOc94ZqjnH1ru8s3KbMLh5U0RQJErblMK8wUkI74XNObN1orzCtKV1n+tJ3nqmCA==
X-Received: by 2002:a05:600c:29cc:: with SMTP id
 s12mr736043wmd.180.1611255999681; 
 Thu, 21 Jan 2021 11:06:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/25] hw/arm/musca: Create and connect ARMSSE Clocks
Date: Thu, 21 Jan 2021 19:06:12 +0000
Message-Id: <20210121190622.22000-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musca.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index d82bef11cf2..a9292482a06 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -33,6 +33,7 @@
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/unimp.h"
 #include "hw/rtc/pl031.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 #define MUSCA_NUMIRQ_MAX 96
@@ -82,6 +83,8 @@ struct MuscaMachineState {
     UnimplementedDeviceState sdio;
     UnimplementedDeviceState gpio;
     UnimplementedDeviceState cryptoisland;
+    Clock *sysclk;
+    Clock *s32kclk;
 };
 
 #define TYPE_MUSCA_MACHINE "musca"
@@ -96,6 +99,8 @@ OBJECT_DECLARE_TYPE(MuscaMachineState, MuscaMachineClass, MUSCA_MACHINE)
  * don't model that in our SSE-200 model yet.
  */
 #define SYSCLK_FRQ 40000000
+/* Slow 32Khz S32KCLK frequency in Hz */
+#define S32KCLK_FRQ (32 * 1000)
 
 static qemu_irq get_sse_irq_in(MuscaMachineState *mms, int irqno)
 {
@@ -367,6 +372,11 @@ static void musca_init(MachineState *machine)
         exit(1);
     }
 
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
+    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+
     object_initialize_child(OBJECT(machine), "sse-200", &mms->sse,
                             TYPE_SSE200);
     ssedev = DEVICE(&mms->sse);
@@ -376,6 +386,8 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
+    qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
+    qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
     /*
      * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
      * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-- 
2.20.1


