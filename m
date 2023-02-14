Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A2696264
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:25:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNz-0007D1-C9; Tue, 14 Feb 2023 06:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNw-0007CF-35
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNu-0002KO-8w
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWKpZ7uLqXvqaTovFpddTnxaV9wDzF1AeqMpsK1PCDU=;
 b=aya6NjEzKxbjSHCyYk4enM87WCKR3BqYYuTE22dbIpAp8Gtb4R2lm2IVrYEayCjj1rmPZw
 VjjVI3KIfVpVylv2JJEWIYYaKIwjFAnkN7yTNU8S1dyKjv7uuV8zJCkOGDinWv3t/OwGwW
 H4erOQ7bKO8/N8ubQ8EsUOSwcDmTFYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-4qd8yYDJPiCTeA-btST8wQ-1; Tue, 14 Feb 2023 06:22:02 -0500
X-MC-Unique: 4qd8yYDJPiCTeA-btST8wQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62EAA971080;
 Tue, 14 Feb 2023 11:22:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBB544010E85;
 Tue, 14 Feb 2023 11:22:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/22] Do not include "qemu/error-report.h" in headers that do
 not need it
Date: Tue, 14 Feb 2023 12:21:34 +0100
Message-Id: <20230214112148.646077-9-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Include it in the .c files instead that use the error reporting
functions.

Message-Id: <20230210111931.1115489-1-thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/allwinner-a10.h   | 1 -
 include/qemu/vhost-user-server.h | 1 -
 include/ui/console.h             | 1 -
 hw/display/vhost-user-gpu.c      | 1 +
 hw/display/virtio-gpu-udmabuf.c  | 1 +
 hw/display/virtio-gpu-virgl.c    | 1 +
 hw/misc/applesmc.c               | 1 +
 ui/console.c                     | 1 +
 ui/dbus-clipboard.c              | 1 +
 ui/dbus-console.c                | 1 +
 ui/dbus-listener.c               | 1 +
 ui/dbus.c                        | 1 +
 ui/egl-headless.c                | 1 +
 ui/gtk.c                         | 1 +
 ui/spice-app.c                   | 1 +
 ui/spice-display.c               | 1 +
 ui/udmabuf.c                     | 1 +
 ui/vdagent.c                     | 1 +
 util/vhost-user-server.c         | 1 +
 19 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index e0f2f7ab19..79e0c80568 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,7 +1,6 @@
 #ifndef HW_ARM_ALLWINNER_A10_H
 #define HW_ARM_ALLWINNER_A10_H
 
-#include "qemu/error-report.h"
 #include "hw/char/serial.h"
 #include "hw/arm/boot.h"
 #include "hw/pci/pci_device.h"
diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index cd43193b80..25c72433ca 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -15,7 +15,6 @@
 #include "io/channel-socket.h"
 #include "io/channel-file.h"
 #include "io/net-listener.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "standard-headers/linux/virtio_blk.h"
 
diff --git a/include/ui/console.h b/include/ui/console.h
index 8e6cf782a1..1cb53acc33 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -4,7 +4,6 @@
 #include "ui/qemu-pixman.h"
 #include "qom/object.h"
 #include "qemu/notify.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-types-ui.h"
 
 #ifdef CONFIG_OPENGL
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 4380a5e672..71dfd956b8 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-gpu.h"
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 847fa4c0cc..69e2cf0bd6 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/units.h"
 #include "qemu/iov.h"
 #include "ui/console.h"
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..1c47603d40 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/iov.h"
 #include "trace.h"
 #include "hw/virtio/virtio.h"
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 5f9c742e50..72300d0cbc 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -34,6 +34,7 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "ui/console.h"
+#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
diff --git a/ui/console.c b/ui/console.c
index ab43561fe1..98b701f5a3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qemu/coroutine.h"
+#include "qemu/error-report.h"
 #include "qemu/fifo8.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/ui/dbus-clipboard.c b/ui/dbus-clipboard.c
index 5843d26cd2..df9a754a8d 100644
--- a/ui/dbus-clipboard.c
+++ b/ui/dbus-clipboard.c
@@ -23,6 +23,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/dbus.h"
+#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/sysemu.h"
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 898a4ac8a5..0bfaa2298d 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "ui/input.h"
 #include "ui/kbd-state.h"
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index f9fc8eda51..57d4e401db 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "dbus.h"
 #include <gio/gunixfdlist.h>
diff --git a/ui/dbus.c b/ui/dbus.c
index 32d88dc94a..f2dcba03d0 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -23,6 +23,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #include "qemu/dbus.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 7a30fd9777..ae07e91302 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
 #include "ui/console.h"
diff --git a/ui/gtk.c b/ui/gtk.c
index 7f752d8b7d..fd82e9b1ca 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
 #include "ui/console.h"
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 7e71e18da9..ad7f0551ad 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -29,6 +29,7 @@
 #include "ui/console.h"
 #include "ui/spice-display.h"
 #include "qemu/config-file.h"
+#include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0616a6982f..16802f99cb 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -17,6 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "ui/qemu-spice.h"
+#include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "qemu/lockable.h"
 #include "qemu/main-loop.h"
diff --git a/ui/udmabuf.c b/ui/udmabuf.c
index cbf4357bb1..6a0a11a85d 100644
--- a/ui/udmabuf.c
+++ b/ui/udmabuf.c
@@ -7,6 +7,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "ui/console.h"
+#include "qemu/error-report.h"
 
 #include <sys/ioctl.h>
 
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 1f51a78da1..8a651492f0 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -2,6 +2,7 @@
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "qemu/buffer.h"
+#include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 145eb17c08..40f36ea214 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -8,6 +8,7 @@
  * later.  See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/vhost-user-server.h"
 #include "block/aio-wait.h"
-- 
2.31.1


