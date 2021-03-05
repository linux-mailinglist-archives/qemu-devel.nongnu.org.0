Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24032F21E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:05:33 +0100 (CET)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEpQ-0000Lq-0I
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3r-0007PQ-7w
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007ju-Ek
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id m7so2112855wmq.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l4pjhFXdmpD6WJCq9k6CoxNoY7xEIvtRJlsVkP5EsrE=;
 b=Zyh3xggAfLzqv0XlReENnQNGt5riC2CUkvLjja5XYeoxkhVDpwkMsp4J1kVIYeyiMY
 Bz2wUGq7vvnFLrNxqHEKcxSYQq1bposu/7oN5/w4x/7Fgx3lhnLC1zkOvBY3T8oYgpE2
 D4DTxrsedmbD8pM4mYRBOfaMotOIe3xaYZ+Ce5gMUSbnlZpluXrGMZ0fWA5S19s2TU+Q
 zR1ZPZy+VtxxYYdPmLzWtQwgdiCVDSfjH9rIAeZ1ZpN8MIK5Gfe6mfINvk6g9jZVpvFI
 7mOm2tHzND0xkqw23N1LXqIVlBo+n+H4eVCU9Fj1d0j4WXiVWeiCDVsUqPGCb/wHAi3U
 RDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4pjhFXdmpD6WJCq9k6CoxNoY7xEIvtRJlsVkP5EsrE=;
 b=XtK+n2pLjMsuc89aRvhBeeWhPdtys8DziSv8wSCsr6HrEcWFoeJVHwFvGrZ4pZCvzE
 orHLp+jD26Pv4OKqVOHOo+VgEzvjnPXFdW+Xj6WpbGS2AFkTEx1xjaXr9E3zZ5C+m/Lw
 3m5kO+rnDmZwNhK3EmgiBWFGLIOryTYRP6JNAoJbhsGlkRaJwtps8h7Olr3jz9rXk5D7
 bddCbxfnUyKfYa4PGmR3aqa/fpd1uKycdslTj/1nwroBhdcsCEkuFd5lUU4+KcJSHxGa
 /R8iDozismT9JfoeLcGOD+NEcyTwGU7HVoDh0idB/UoEXIHlQjMccUxkfMyiQ33nVj3W
 G18w==
X-Gm-Message-State: AOAM5307oleiCHTABqAbaXScb6lPgl1c1fY6cpQrWVEBFFu6nU9jcvlw
 /FgIELyofZb/UwJcKefnf2I7Vri813/Nmw==
X-Google-Smtp-Source: ABdhPJzHN/EXrza2lGLDb6xA437JMzfI1i9B4DAjQZDV0f5KlMoAf+hZUblu75Gvayyr7VvNZvFSCQ==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr9986782wmi.189.1614964549634; 
 Fri, 05 Mar 2021 09:15:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/49] hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
Date: Fri,  5 Mar 2021 17:15:13 +0000
Message-Id: <20210305171515.1038-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-23-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index c1bb52995ff..7466e71ab76 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -60,6 +60,7 @@
 #include "hw/misc/tz-msc.h"
 #include "hw/arm/armsse.h"
 #include "hw/dma/pl080.h"
+#include "hw/rtc/pl031.h"
 #include "hw/ssi/pl022.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/net/lan9118.h"
@@ -132,8 +133,8 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gpio[4];
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
-    UnimplementedDeviceState rtc;
     UnimplementedDeviceState usb;
+    PL031State rtc;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -596,6 +597,23 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
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
@@ -846,7 +864,7 @@ static void mps2tz_common_init(MachineState *machine)
 
                 { /* port 9 reserved */ },
                 { "clcd", make_unimp_dev, &mms->cldc, 0x4130a000, 0x1000 },
-                { "rtc", make_unimp_dev, &mms->rtc, 0x4130b000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4130b000, 0x1000 },
             },
         }, {
             .name = "ahb_ppcexp0",
-- 
2.20.1


