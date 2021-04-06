Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9E355402
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:35:02 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkv7-000392-C6
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AH-Ff
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn3-0005lj-Mt
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so4091577wmk.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iLpMQ2sx6x1196p+Yg3ivT09Sa5g4ilXuJd8jzez+Ck=;
 b=fQDmVnDJjT+2awk47QDNUIVN5cigihQVaRRHGzhwNnv9K9LidqhUqxZGwBbv48NOUr
 0xliaiJUqCSKo2EzuqnKy52Y123UwQYyf+87WS5IY++5kDkmAm3s/VLD9sW9XCSj/R6N
 enmSP6snfUE0xmy1ajHKijjaiE0vqRVE9iYkMsYEsftHUm+oThhJ1QAKx4vO1CBQ2HQN
 PtqYzIgJVMvVYQ4Bz7CM/JidzsbsixrBAvEEyp+VBH1k/LDD3vvuPyMMBaXqb+tNOwxA
 VFKdhMRnvEeVg1S4jG6ZKLuWN6yBA1t9g1/BSvbeJ2oYoGeiCbnjkVY7KRzhgW2zp4Wj
 l2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLpMQ2sx6x1196p+Yg3ivT09Sa5g4ilXuJd8jzez+Ck=;
 b=R9TPU3TZVM65Ix8RGD4ECIrLq98CsS4rYbtHe9COtuhWQsGm6T/kBDWGmP1RNimHgy
 R0Ul+Yt4gyKqca60t6NPjSQrvN8hsusW7oWist0gdK+X/i9Cgq5/pKZJIjFkB2D+tmeF
 yAmu6njSCVUENsmo6UI+yaGdinHZhSN0z1VCctwKWPOHxX4Ro/5EU9wBRFy5JnDcwTPw
 Is/HCPkBl8jPeqbXdd+/O3sxaVM0Vle+JifB0VBmkHG0lNUA1eH0+19t1WCq2UqRKP4C
 SNWa3rE0iZ10Z86q+jJyPbb2UAcUm0LDPPYc9D+Y2peW4TA1rNOUMxH7XYdx8Nmd0sYn
 31Mw==
X-Gm-Message-State: AOAM533RFriQgYyIe0Scg+tDBx57+zAGorxLhPQIZ0wWxPk789lQf9u2
 NbpBCu9VOUQ7XqUOuPlir9hlm669Hj9nkIqZ
X-Google-Smtp-Source: ABdhPJy5ucTalumWt1bth5+g6Z+VGnalodXdtAxfzv2Zm/NxQiIhZMRLepRqzdkT/oJrw7uPTwGarw==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr3930581wmh.78.1617712000060; 
 Tue, 06 Apr 2021 05:26:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/ppc/e500plat: Only try to add valid dynamic sysbus
 devices to platform bus
Date: Tue,  6 Apr 2021 13:26:33 +0100
Message-Id: <20210406122635.28268-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

The e500plat machine device plug callback currently calls
platform_bus_link_device() for any sysbus device.  This is overly
broad, because platform_bus_link_device() will unconditionally grab
the IRQs and MMIOs of the device it is passed, whether it was
intended for the platform bus or not.  Restrict hotpluggability of
sysbus devices to only those devices on the dynamic sysbus allowlist.

We were mostly getting away with this because the board creates the
platform bus as the last device it creates, and so the hotplug
callback did not do anything for all the sysbus devices created by
the board itself.  However if the user plugged in a device which
itself uses a sysbus device internally we would have mishandled this
and probably asserted. An example of this is:
 qemu-system-ppc64 -M ppce500 -device macio-oldworld

This isn't a sensible command because the macio-oldworld device
is really specific to the 'g3beige' machine, but we now fail
with a reasonable error message rather than asserting:
qemu-system-ppc64: Device heathrow is not supported by this machine yet.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-id: 20210325153310.9131-5-peter.maydell@linaro.org
---
 hw/ppc/e500plat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48f..fc911bbb7bd 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -48,7 +48,9 @@ static void e500plat_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     PPCE500MachineState *pms = PPCE500_MACHINE(hotplug_dev);
 
     if (pms->pbus_dev) {
-        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+        MachineClass *mc = MACHINE_GET_CLASS(pms);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
             platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
         }
     }
@@ -58,7 +60,9 @@ static
 HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
                                                     DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-- 
2.20.1


