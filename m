Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49823310FC3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:18:51 +0100 (CET)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85gv-00011o-SQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tp-0006y2-Rf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TQ-00046f-UU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id u14so8485423wri.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fbSQXUXJEDGMaGC9KOnv4xEcH7gCV3geuE6p5sgHfh8=;
 b=Hte+PatvB/wD6GEvkwc2+vBLqw6TWp5P6EGpVjHY6DYpftiUEYd0/TXuSJQqbe/smp
 fTwC12Hb6g84oP52inUgUXsuH8iVW/pXtLL3wD9D/3OHS4Q++PCN7rmuuxURTQhMGKvB
 omEv/5PVMGLYfnlOkdEtdQaFTdvfVIHzNWoMHlqJCv44zysIBrap5SbArmG0sLRpuaa2
 YxENM/axDVe+q64TGSmU0e/qoyGPiEdJkvMNdKHqVSXVDVVUYEoGYu3AlPg6O69UpV/a
 YFpusFTYkXTQOT//ERABnLC+O1Za485byjNDPX5F9mn8Yi+SrMkKd/2ZessTcJsihNUW
 RENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbSQXUXJEDGMaGC9KOnv4xEcH7gCV3geuE6p5sgHfh8=;
 b=O83OFBWqeGEUU5oeRknF6ydg/IO4gWvswureK/2TrCpB+lUKH0nfIHop49gsAbwctR
 U4/60KyupUGRo+OgHJNa8kykZh4SUwebfFXBltlmOIaPOFKY8UmKTF8C0yvPRb9EjwVw
 nJImpBITv2WtNfzH90jhp5pVNy7cPpsTL0cHI4kmpGZjzDZjYjCTpAMLYdXoYlKA/TJV
 RI68JemrhaGabzPQhapGn8SmzksWvlFsHHxmMRtlN/i/MIgDCTAzlOjZj+DUo9zhUi2F
 wVUqJ+M2KWXaEbW9ShejlyGCsxzrU9XGiiHgGrpXXn3qAUPEza0q4c5YoclFZl7omk2q
 5h5w==
X-Gm-Message-State: AOAM531/IoJT8P/V8HQ8npXN4gflDw0WTgcQ5YCPJv79Puc1TzOnG2N9
 gKcHb2e8iqiu5vCK+HOvg7KqRw==
X-Google-Smtp-Source: ABdhPJz+OXQX1Mq8/xcv3ZWn6/CIXW4Zo8KcjqH8sEoLPtDkyhOcVEuBSvih3ddxK48paaTFJVTKag==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr6085659wrq.168.1612544439505; 
 Fri, 05 Feb 2021 09:00:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/24] hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
Date: Fri,  5 Feb 2021 17:00:17 +0000
Message-Id: <20210205170019.25319-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The AN524 has a PL031 RTC, which we have a model of; provide it
rather than an unimplemented-device stub.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index db1afa4bd22..27feb36616e 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -59,6 +59,7 @@
 #include "hw/misc/tz-msc.h"
 #include "hw/arm/armsse.h"
 #include "hw/dma/pl080.h"
+#include "hw/rtc/pl031.h"
 #include "hw/ssi/pl022.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/net/lan9118.h"
@@ -131,8 +132,8 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gpio[4];
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
-    UnimplementedDeviceState rtc;
     UnimplementedDeviceState usb;
+    PL031State rtc;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -595,6 +596,23 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_rtc(MPS2TZMachineState *mms, void *opaque,
+                              const char *name, hwaddr size,
+                              const int *irqs)
+{
+    PL031State *pl031 = opaque;
+    SysBusDevice *s;
+
+    object_initialize_child(OBJECT(mms), name, pl031, TYPE_PL031);
+    s = SYS_BUS_DEVICE(pl031);
+    sysbus_realize(s, &error_fatal);
+    /*
+     * The board docs don't give an IRQ number for the PL031, so
+     * presumably it is not connected.
+     */
+    return sysbus_mmio_get_region(s, 0);
+}
+
 static void create_non_mpc_ram(MPS2TZMachineState *mms)
 {
     /*
@@ -845,7 +863,7 @@ static void mps2tz_common_init(MachineState *machine)
 
                 { /* port 9 reserved */ },
                 { "clcd", make_unimp_dev, &mms->cldc, 0x4130a000, 0x1000 },
-                { "rtc", make_unimp_dev, &mms->rtc, 0x4130b000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4130b000, 0x1000 },
             },
         }, {
             .name = "ahb_ppcexp0",
-- 
2.20.1


