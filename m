Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9EF3495BF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:36:58 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS2b-0007gv-4I
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzD-0005Ek-6D
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz6-00056g-Dc
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso1441703wmi.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HC5HU11GOp9X3zRRsVLrOYWQjmWw07GcRvQz1EkLmlE=;
 b=L6Kocalab/lTaEXyfOhkUIbDq7ZckJv+rXc3IphCRcbgCs0wCxoGbiYE/QKk881O06
 K8YLNfpEOeeIwDwwp0fdQAST4elG8XuZmWui+Bl7CK5AWaS1xN1XCDrWyiPOuWuk2ZzD
 6P28QWVAj4SsB9S7dS3As2J5FWzeBI+K8WIDA5HHXStHNtOUmEP6X7BXiGvUAaabHlbV
 lPHSlMGPL1YMPvyzmBqUgX6Kc6HcABTz6/Pbv4XX24fOZmUKWdOCB1D0Rmg6/qSbQzPn
 9JefqZR+5O2vRrDJkZ5doYKQSX+AWL2m7Gp2CCos2yJXDfoYlZ6356CFrR6qKxoRFtcQ
 fDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HC5HU11GOp9X3zRRsVLrOYWQjmWw07GcRvQz1EkLmlE=;
 b=m/WjCpnZ9ifdJO5MyYeKFuczyuFLRE2F25xS696iOjlduNISS2ug00UVtZkp09DbYo
 hOuq+4Nn0vylc2JrZi6Jwh4L4uI7OrE09/zzgAIDBfta9OeLRHEcGURWNTQk6DEiRFt0
 PY5KWkXZkYbfjSL1Xf0vlfWjbaq/13zQ12+8ahM9qM/veCbA3X7VklxRACK+kmqb7knk
 esCq5eAr905Um5BXw72RVORXqB3iEbGbbu9009IpFQLqWXh38SQu0A/iEnkRkw91XB2L
 haYagVx5NOMPn7qTDyY0pal2JEwA++NUlBzjOoabP6ykEnaX8qKlrx+uT2dlVKxviGub
 RNlA==
X-Gm-Message-State: AOAM532gvnHPr+gkJIyXsxPQHp4IXg4fc8NFyxzDppHzBiezw5b4bHr8
 Hy+9Aqsgox+bVl1DA8TQdUIDMXVZqO+GsskK
X-Google-Smtp-Source: ABdhPJwm3YMPzieH5u03v9xRDMyLzPsjqpdOWwOgwM7V6q80agrst0ABYHpLhNFZOsUQPG3YBWOkzQ==
X-Received: by 2002:a05:600c:b57:: with SMTP id
 k23mr8386586wmr.145.1616686396022; 
 Thu, 25 Mar 2021 08:33:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 3/4] hw/arm/virt: Only try to add valid dynamic sysbus
 devices to platform bus
Date: Thu, 25 Mar 2021 15:33:09 +0000
Message-Id: <20210325153310.9131-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virt machine device plug callback currently calls
platform_bus_link_device() for any sysbus device.  This is overly
broad, because platform_bus_link_device() will unconditionally grab
the IRQs and MMIOs of the device it is passed, whether it was
intended for the platform bus or not.  Restrict hotpluggability of
sysbus devices to only those devices on the dynamic sysbus whitelist.

We were mostly getting away with this because the board creates the
platform bus as the last device it creates, and so the hotplug
callback did not do anything for all the sysbus devices created by
the board itself.  However if the user plugged in a device which
itself uses a sysbus device internally we would have mishandled this
and probably asserted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


