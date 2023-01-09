Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617E662199
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQT-0003vE-3w; Mon, 09 Jan 2023 04:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQL-0003uL-ER
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQJ-0005RX-J4
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id l26so5778077wme.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thih3YlnrvTRPUHmxOTOW7cdH3C9pCnefCYP23Vc8Uc=;
 b=RMEr4rgOWLh7fYPLKzNnTIOx9LwcKhfpBIel65eStKXZeXz7TIOhVLwCHNkel0WYOS
 lOGrUznS/LY8QTrGhCuootpuC+JlwK20nm8DQHdgxLgYXuqNfam2D+tFTRAeZWRou44L
 YXA8iVdcQHv/pJi0ic77c1TX7wOz5Vkd3wf3p7gInjDSHzkQ0BI156FOIGRY5vHdvhak
 94iRLUh8ebbpNCdvbMv9ygFuDmPgoNnGbKXq64Hfz7NJ4OMhDHWvsFow22t9gMrRBZAd
 AjuJFnkHD72/5vIJyn4owFfHHw0lU5K0QxAjQ/xoddoCsOqENaIxzaDDq4R44D/h7AgX
 GMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thih3YlnrvTRPUHmxOTOW7cdH3C9pCnefCYP23Vc8Uc=;
 b=03ex+ss1CxunxWFi7dNPRsOsvzSmUVnPjisGt09ToDyflvwrVeOSpH0NVOXEjGmfMx
 MVq5ONYFtlWxv7n5doZfq7K5sW/0L8682/37ygMAnOiBN6J8eR+r12xExV5XyiPjzUVo
 qxQdMZQXPNVXzcefz2Y1crTTjo4dAZri/dFIO+dVOCfLfdiQKue3ZEvjIk0rbGWt31qu
 /h7GBYeC3Yvn4AJxQd1uM0BzFLbpoX4rE1npgmypFGK0wOtiN4aVe/cSfyPhfnUe4nyr
 wIqMTicztlFvQGgPZk4jn3bGHfD2mopNWhLAe1smSAb9iac9dwXuQTY56mMkCFSaJN6L
 urhg==
X-Gm-Message-State: AFqh2kpxnM6/qUM9X+Lu6HZN9CoaeiN0iVmIFTk+5uo1SPHZkFApMt1/
 Dd991Fr8juafB6i0peUI1nnYRFCjNmIuZt3J
X-Google-Smtp-Source: AMrXdXu0Utqf6KoKnArVxL+VfYXdLwlKs62tV9HyDIOVlRnQajUleFlJBHSAsb4pWS7pRa1E5P3BvA==
X-Received: by 2002:a05:600c:48a1:b0:3d1:f270:a81e with SMTP id
 j33-20020a05600c48a100b003d1f270a81emr45866631wmp.17.1673256389785; 
 Mon, 09 Jan 2023 01:26:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm15573644wms.4.2023.01.09.01.26.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] qdev: Add qdev_create_simple() helper
Date: Mon,  9 Jan 2023 10:26:10 +0100
Message-Id: <20230109092617.80224-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a helper to easily create a qdev with no (or default) property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c         |  9 +++++++++
 include/hw/qdev-core.h | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..4afed2a24c 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -174,6 +174,15 @@ DeviceState *qdev_try_new(const char *name)
     return DEVICE(object_new(name));
 }
 
+DeviceState *qdev_create_simple(const char *name, Error **errp)
+{
+    DeviceState *dev = qdev_new(name);
+
+    qdev_realize_and_unref(dev, NULL, errp);
+
+    return dev;
+}
+
 static QTAILQ_HEAD(, DeviceListener) device_listeners
     = QTAILQ_HEAD_INITIALIZER(device_listeners);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..ca6b2b8458 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -397,6 +397,17 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  * the life of the simulation and should not be unrealized and freed.
  */
 void qdev_unrealize(DeviceState *dev);
+
+/**
+ * Create and realize a device on the heap.
+ * @name: device type to create (we assert() that this type exists)
+ * @errp: pointer to error object
+ *
+ * Create the device state structure, initialize it, and drop the
+ * reference to it (the device is realized).
+ */
+DeviceState *qdev_create_simple(const char *name, Error **errp);
+
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
-- 
2.38.1


