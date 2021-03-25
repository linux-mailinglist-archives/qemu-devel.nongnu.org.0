Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92593495C8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:39:40 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS5D-0002tT-Qo
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzI-0005Eu-4d
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz6-000562-CK
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g20so1414174wmk.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsbZ3WwBIAsRBGcGHbyvNlewlN2P0E/qqzYZ7ye59xs=;
 b=Z0PnyL0OgB70hT+woVqg8D4e8BzLbvaOplIzx5NzFRWKMNMXNkyi1rGkdwoVRoDhah
 7knOo1YMezs1xVpXEogcqE9SKrrrznUtYpxV7hKXiMrpAHz4FgQepNvaiq3vImXE/ZD9
 g+LVxaRZpTza4yvxWL4oGem8y9Hc84FcYiC9Ouw6zBRTupTEXaeh3OqvCthYccj/IHC0
 0dRThM/QyxnAc9O3pnYodMJ45XGq0Ga2dk6RXMeLVcyy9knlUFmAfnXHWgvRLVI8LKiF
 OuZsBXnDLkpnUj7YdQx5Ajer4lCH52KiOYpkr32Pb+KbhY8qupdY4YFUyJKeDeJmeRn/
 yvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsbZ3WwBIAsRBGcGHbyvNlewlN2P0E/qqzYZ7ye59xs=;
 b=I8eksytWaoxKbeeW/kZy1Jltvccma/xTgMFYx6yUqyuihDcIKsYaPCl+V8Temdx8Bk
 g1OkwLhrgB5hvG3eHYZrpfDz1JxDvv3qfod4q8UkxLz+We7i3GGhm3880MaDGBVaaEn5
 xrRq6qAEqMF2W2+5C/729ChdGrUqv3p8crsddAjvLCtlIulUKjAsEunomu39GGYHgbrz
 AeTDNpGSn7dU8uWeqyFO5EGoSik8CgIhI5ZeeLCrkUvOdRqaVvIzR+NvYoOf7AhU9sLY
 UYI6QdGxHBHTJYwV4I8J4Hgx9MMyPDzJMFD9pNKjg9yzN0V200UGRBb1a21XyOcXKFhm
 ORAQ==
X-Gm-Message-State: AOAM532f3s/yjBvD7k32lTZe6pKhFHUXjjbDZeXT/5gJ1pmO9F4JM2uI
 PFDMXt1pkBl9ngcCLXu34PZoLw==
X-Google-Smtp-Source: ABdhPJwA48dQzzisxZILpRcNNbQeOeid4OX0ZHBB4D/zkUU7W+xfx3Fstnbb7/Z1Jnvmt4PfzNo9Bg==
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr8489521wmc.83.1616686395042; 
 Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/4] machine: Provide a function to check the dynamic
 sysbus whitelist
Date: Thu, 25 Mar 2021 15:33:08 +0000
Message-Id: <20210325153310.9131-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a new function dynamic_sysbus_dev_allowed() which checks
the per-machine whitelist of dynamic sysbus devices and returns
a boolean result indicating whether the device is whitelisted.
We can use this in the implementation of validate_sysbus_device(),
but we will also need it so that machine hotplug callbacks can
validate devices rather than assuming that any sysbus device
might be hotpluggable into the platform bus.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 24 ++++++++++++++++++++++++
 hw/core/machine.c   | 21 ++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 27106abc11d..609112a4e1a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,30 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
+ * @mc: Machine class
+ * @dev: device to check
+ *
+ * Returns: true if @dev is a sysbus device on the machine's whitelist
+ * of dynamically pluggable sysbus devices; otherwise false.
+ *
+ * This function checks whether @dev is a valid dynamic sysbus device,
+ * by first confirming that it is a sysbus device and then checking it
+ * against the whitelist of permitted dynamic sysbus devices which has
+ * been set up by the machine using machine_class_allow_dynamic_sysbus_dev().
+ *
+ * It is valid to call this with something that is not a subclass of
+ * TYPE_SYS_BUS_DEVICE; the function will return false in this case.
+ * This allows hotplug callback functions to be written as:
+ *     if (device_is_dynamic_sysbus(mc, dev)) {
+ *         handle dynamic sysbus case;
+ *     } else if (some other kind of hotplug) {
+ *         handle that;
+ *     }
+ */
+bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev);
+
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
  * returns migratable MemoryRegion provided by backend.
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9935c6ddd56..8d97094736a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -529,20 +529,31 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
+bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool allowed = false;
     strList *wl;
+    Object *obj = OBJECT(dev);
+
+    if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
+        return false;
+    }
 
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(OBJECT(sbdev), wl->value);
+        allowed |= !!object_dynamic_cast(obj, wl->value);
     }
 
-    if (!allowed) {
+    return allowed;
+}
+
+static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
+{
+    MachineState *machine = opaque;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
         error_report("Option '-device %s' cannot be handled by this machine",
                      object_class_get_name(object_get_class(OBJECT(sbdev))));
         exit(1);
-- 
2.20.1


