Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C53553E2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:30:50 +0200 (CEST)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkr3-0007vt-4v
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AJ-EV
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn2-0005ky-5C
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v11so13998727wro.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=17XfflfUlGVHU6RbDSkYhvFuXhDahwD01JFccu5xxNc=;
 b=jnHJ2O3/JTwxGFz3/r/sMeOWs0iNNc3hh4icSpHG9ptLu+uKxFnvblSOUA2flCniqm
 et2RxxZsUYOghsC2WkpWfd0Adr7nYhq8gRgJE7DlVy7VOthKT+qrXGPqasfaFaf08YHP
 gZm2lQlYSxWiCV+V7fs70XpfgGpEp20eMyCnDisU9upyVNVLJnpVRTtAVPzTOS17OWPc
 WofEywGxqd6YQ1AcENXxOm+kCqs7zNzkG6lcxMhdRH2mb9o9psCn2UtSveLIk+ZjDlrL
 fvE4Ssj8flrKMU/yNgL8/W/rwkUdbu4DufO1Nx1mYdfxQLKaopENaPGTxSD3TN4VVI3U
 OGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=17XfflfUlGVHU6RbDSkYhvFuXhDahwD01JFccu5xxNc=;
 b=TGyp1W0BED8w11gTgg5KoTu6ooGzc3q4/Q5Grte1m7HkdEBixQJS9ibxQ79l158ajv
 yGJ2YpRQhjULim+deuqxbusv4o8giN88Po3/2YDcZz3sPQ6cUKwCP68M0uUNZw2GvFyJ
 F3xgJIreA2z6nN1wQiiXRYq3LcONqekoU9bmkKf5z27jKO01OH+g8b0G2Im7QIjG3bwP
 R2jXutdfc0Bs9mTkgrxNa4fexC6itwXsLsQ7UNl+q3rHXDXeezYgMDi2Pw2UVuQBVVHO
 joi9xJFktNVjtg7DiKqI+uDqe0j/IinEaU4RimuLe4AdUMlWCWq368Mm5mlRGlhkgFe7
 qANg==
X-Gm-Message-State: AOAM533lpSTwQ3m5E59RCnRxpfB9W2IzelFpBTE+ecq1oyacAo3IjEZY
 BfsTAGZNb28bKaAAzckb7c7k0z8XcG0EFaeJ
X-Google-Smtp-Source: ABdhPJxav+tah0SN9ysHgiLHURtgA6INquKfMj56BwqZfKi2FwKJKhkH7fR4TlyaJWJ2+eHJZmfBpQ==
X-Received: by 2002:adf:e482:: with SMTP id i2mr34531523wrm.392.1617711998761; 
 Tue, 06 Apr 2021 05:26:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] machine: Provide a function to check the dynamic sysbus
 allowlist
Date: Tue,  6 Apr 2021 13:26:31 +0100
Message-Id: <20210406122635.28268-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Provide a new function dynamic_sysbus_dev_allowed() which checks the
per-machine list of permitted dynamic sysbus devices and returns a
boolean result indicating whether the device is allowed.  We can use
this in the implementation of validate_sysbus_device(), but we will
also need it so that machine hotplug callbacks can validate devices
rather than assuming that any sysbus device might be hotpluggable
into the platform bus.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210325153310.9131-3-peter.maydell@linaro.org
---
 include/hw/boards.h | 24 ++++++++++++++++++++++++
 hw/core/machine.c   | 21 ++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6fc5cefcec5..ad6c8fd5376 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -52,6 +52,30 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
+ * @mc: Machine class
+ * @dev: device to check
+ *
+ * Returns: true if @dev is a sysbus device on the machine's list
+ * of dynamically pluggable sysbus devices; otherwise false.
+ *
+ * This function checks whether @dev is a valid dynamic sysbus device,
+ * by first confirming that it is a sysbus device and then checking it
+ * against the list of permitted dynamic sysbus devices which has been
+ * set up by the machine using machine_class_allow_dynamic_sysbus_dev().
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


