Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15B52D62C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:34:48 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhEl-0001uj-Ed
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrhAK-00083c-LK
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:30:12 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrhAH-00068O-88
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:30:11 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7FBA62E1BA9
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 17:19:17 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XmWlW6l1Nc-JGJO4Do3; Thu, 19 May 2022 17:19:17 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1652969957; bh=+lnBFJkxE6O97fmB06bbtmCTeGfVAV2hJLeXs9zD96Y=;
 h=Cc:Date:To:From:Subject:Message-ID;
 b=sI3R0qxXC+xI3kxCTHIpm2xEKJeqncc0ycelHuySugonMIn6psP0Nw6xlBk44nwJW
 R0bi3FSWLrUoctk4ZaH+FZNxOvrHFMhVEiVmYUIF2wph5rGvokgXlcPZLHDh28YHdn
 K7YdqfkZDL10EbOWeWcj+e/5QKMR0eE2S3Fl7XNo=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (unknown [2a02:6b8:b081:8819::1:2b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 GuRTDs5rqz-JGNO74EJ; Thu, 19 May 2022 17:19:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
Date: Thu, 19 May 2022 17:19:16 +0300
Message-ID: <165296995578.196133.16183155555450040914.stgit@buzz>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This event represents device runtime errors to give time and
reason why device is broken.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/core/qdev.c         |    7 +++++++
 include/hw/qdev-core.h |    1 +
 qapi/qdev.json         |   26 ++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..e95ceb071b 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -347,6 +347,13 @@ void qdev_unrealize(DeviceState *dev)
     object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
 }
 
+void qdev_report_runtime_error(DeviceState *dev, const Error *err)
+{
+    qapi_event_send_device_runtime_error(!!dev->id, dev->id,
+                                         dev->canonical_path,
+                                         error_get_pretty(err));
+}
+
 static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
 {
     DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..9ced2e0f09 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -396,6 +396,7 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  * the life of the simulation and should not be unrealized and freed.
  */
 void qdev_unrealize(DeviceState *dev);
+void qdev_report_runtime_error(DeviceState *dev, const Error *err);
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 26cd10106b..89ef32eef7 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -159,3 +159,29 @@
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_RUNTIME_ERROR:
+#
+# Emitted when a device fails in runtime.
+#
+# @device: the device's ID if it has one
+#
+# @path: the device's QOM path
+#
+# @reason: human readable description
+#
+# Since: 7.1
+#
+# Example:
+#
+# <- { "event": "DEVICE_RUNTIME_ERROR"
+#      "data": { "device": "virtio-net-pci-0",
+#                "path": "/machine/peripheral/virtio-net-pci-0",
+#                "reason": "virtio-net header incorrect" },
+#      },
+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
+#
+##
+{ 'event': 'DEVICE_RUNTIME_ERROR',
+        'data': { '*device': 'str', 'path': 'str', 'reason': 'str' } }


