Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BE68A144
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0V6-00071z-Gx; Fri, 03 Feb 2023 13:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V4-00070e-DR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V0-00089k-U8
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id q5so5440121wrv.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWOXT8kEVLd1z9ooQiF6EcLH2zq0UxcZKoFli6u89Ts=;
 b=gPkZFkbjBPKkz+Lji5ycmEN0K85IEZZIw2q6gtgnPP63BgwKuk/tCW51t36CDwFan0
 9XIRHgs7IcwxKJE6Hh5WSOlR3O+FmAiAxwHQ5z2eVUEjoL/5HGaQwGb5UGfdd0gy1LLS
 3T57/PRV6YsGTcUJxXG4LOkVsYakxjXsnjXtNBUVG/nXgzyhrldM9fTJXbJZNMQ9Xhnz
 3AsgbteWSP7p2lwiFi5f/mKleV0uSkfL95cP9KABfYn1JFAYh00Kz2jNDFkcVGOYdA3F
 rlYrTm2GhUzlSjGDwdOsMlc/9K5xJ7cBYt+LifPSsYGYyRXrYeOwjSkhkyb7+0FSqYgl
 VHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWOXT8kEVLd1z9ooQiF6EcLH2zq0UxcZKoFli6u89Ts=;
 b=RQX26DI744HzLRyAjy38IHkMO+qpP3uQLGsOzweP24puuh9wfMqwTWggLAWvM0NQT3
 WI/OUf9QW2R38K/iDD94R9BbTsSEtw9sM8m6an1PGIykx81EPYgKCbArA+4+Ooewm8Ra
 EDt250sDA7WCE53ltNdFLwOlCon2UQpkVyh6Ip9+DU52TrQ1OM6QxQOAm7IuXbTwj9Vh
 1D0Gimx3AkL1x1HMG+GXsXjfl+i1B2uxbCM0O75gTBU+HWoSbnBqHXUVkibgiYeEDfWJ
 a+OtSWNrjoJOZj3y3tZYtn1uZSzwGd3OY+UFj+w9147v7DAXFu224IexEyRIhKna1IiP
 BKHA==
X-Gm-Message-State: AO0yUKWcoJXnkLSgte0R/HSRnpbWCPd72kRTyBz3Vh1uhP3SZTJeeJn8
 vQRdwMHtBEYrXhew8uuOXXWwG/cACcYaHZMb
X-Google-Smtp-Source: AK7set9uBXOdSiQ4EnMV+cinqHLCntkPisfJnyrpxkBQFAZgVGmjm0bVUnofjMxVnX3IvihV9ektiw==
X-Received: by 2002:adf:c713:0:b0:2bf:e05f:53ac with SMTP id
 k19-20020adfc713000000b002bfe05f53acmr10227055wrg.45.1675447760909; 
 Fri, 03 Feb 2023 10:09:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b002bc7f64efa3sm2501936wrt.29.2023.02.03.10.09.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/19] NOTFORMERGE scripts/coccinelle: Add qom-qdev-prop.cocci
Date: Fri,  3 Feb 2023 19:08:56 +0100
Message-Id: <20230203180914.49112-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Script I used to generate the following patches. This is
not an automatic conversion as object_property_set_[u]int()
does not specify the type size. Each integer property must
then be converted manually. Therefore this script doesn't
seem relevant to be committed in the repository.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/coccinelle/qom-qdev-prop.cocci | 259 +++++++++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 scripts/coccinelle/qom-qdev-prop.cocci

diff --git a/scripts/coccinelle/qom-qdev-prop.cocci b/scripts/coccinelle/qom-qdev-prop.cocci
new file mode 100644
index 0000000000..21e6ed2b33
--- /dev/null
+++ b/scripts/coccinelle/qom-qdev-prop.cocci
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: Linaro Limited 2023
+//
+// Convert QOM set_property() API to QDev set_prop() API equivalent
+//
+// Only bool / string / link properties are automatically converted.
+// Integer properties must be converted manually, since the QOM
+// object_property_set_[u]int() helpers don't specify the type size.
+
+
+//
+// bool
+//
+
+// bool OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(dev, prop, val);
+
+// bool dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// bool DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// bool DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_bool(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+
+//
+// str
+//
+
+// str OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(dev, prop, val);
+
+// str dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// str DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// str DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_str(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+
+// int OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(dev, prop, val);
+
+// int dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// int DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// int DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_int(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+//
+// link
+//
+
+// link OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(dev, prop, val);
+
+// link dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// link DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// link DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_link(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
-- 
2.38.1


