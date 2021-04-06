Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473F3553DC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:29:59 +0200 (CEST)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkqD-00070e-KW
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AG-Fl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn2-0005lG-LZ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so14012675wrw.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S/1BOY0+FoVcdWIzGFamWQ9aB5zoz/Z11SGt7VxuGjw=;
 b=LoEqewYCNzuy1q5jfNu7sMwQ8HQRs9jtr4ekA3XwqUIQ1uFVghyC4ZuVPEg7sddyEe
 Na33gecJLkDYLdsmL2zig5Tz3je85UnBRomopaciYbmX99SwP9BY4HFKYJA/tnESnJ9M
 Z0MquCEl+rTON8wF7ejyswRWwO5BxXAkcv+5v/MCPkyIRS3YGVJTOiQPuTTXATBc32zp
 3NYeQPn/IMdYF0k8ByzKNphgG1SkbblZSjWsz3Y6PZr/WXclEaCDJDXO3alDv1b72JXR
 /nnhkB0UBRx8+e3VRanSsV6oeUsnwVSA9C4CdHdDVMdRNdn0zD4A2RFOg6LYZfrJAPNu
 DTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/1BOY0+FoVcdWIzGFamWQ9aB5zoz/Z11SGt7VxuGjw=;
 b=AP2c3CLBfzJ3r/gwfbFreuBf80JVZ0snzJOKG8zUbVpKyQmD1srk5zIeKvX+nkxw5o
 8Ob4cfV5BlAm+xQr/kRjuMsG5OM9QqZrIltNh0Z9zuzCy8e088LbWeojjeOWmiMgzUXf
 Ly3eM/iNH8SLQOYt2XnDfIYlnIYKNex8sg/PzDsTrJ/5X+JpOf9Tu2s7QEAkAD/nN0VG
 WGz1YOB7myCBnTfnas7pg0pop2ahM4GEDNXvI6pBs4dk8rH/olTLIqGrWGUKwCcvh5Qq
 LF7ruSNIYNWP/tRA4sJj7N5+CMY8rI67ky529Xlx/mWcIBc12TOzvk/Z9Ul+a9/zxdLt
 4Bxg==
X-Gm-Message-State: AOAM5329uVm2QCnqXOBlFRLs8eJVW9oIclfzpsz65t/tR5zOi96jLr0S
 7HdxUz6/WVxQi2zJirskMLDhwn+SDfgrOlH9
X-Google-Smtp-Source: ABdhPJyuGo7VWL9Z+9CtQhyZ+3qsVYv4OA3vvveZst7isXF3DpXkt6HIo+zlvLkd1dP8rgPhp0lrFw==
X-Received: by 2002:a5d:5082:: with SMTP id a2mr6375642wrt.267.1617711999362; 
 Tue, 06 Apr 2021 05:26:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] hw/arm/virt: Only try to add valid dynamic sysbus devices
 to platform bus
Date: Tue,  6 Apr 2021 13:26:32 +0100
Message-Id: <20210406122635.28268-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
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

The virt machine device plug callback currently calls
platform_bus_link_device() for any sysbus device.  This is overly
broad, because platform_bus_link_device() will unconditionally grab
the IRQs and MMIOs of the device it is passed, whether it was
intended for the platform bus or not.  Restrict hotpluggability of
sysbus devices to only those devices on the dynamic sysbus
allowlist.

We were mostly getting away with this because the board creates the
platform bus as the last device it creates, and so the hotplug
callback did not do anything for all the sysbus devices created by
the board itself.  However if the user plugged in a device which
itself uses a sysbus device internally we would have mishandled this
and probably asserted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210325153310.9131-4-peter.maydell@linaro.org
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e09..8625152a735 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2443,7 +2443,9 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
     if (vms->platform_bus_dev) {
-        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+        MachineClass *mc = MACHINE_GET_CLASS(vms);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
             platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
                                      SYS_BUS_DEVICE(dev));
         }
@@ -2527,7 +2529,9 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev) ||
        (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
-- 
2.20.1


