Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BBB52D605
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:28:27 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrh8c-0004ts-S8
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh6x-000399-SW
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:26:43 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:45556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nrh6w-0005ob-1d
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:26:43 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 13EBA2E1235
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 17:19:23 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 b6l8nKjJHT-JMJa5ImQ; Thu, 19 May 2022 17:19:23 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1652969963; bh=OBW+DOcvNFsp9zy53T0iKmoM3mgMnqocER2nZ23A/GU=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=vdB1JQd80065g632lGWlptFNxMhwEo6jrhiQ+fecMkj3mjSaF0iU/8leuPpeMjeKZ
 qKJ8qOXiZjgoPmNM3MG/V8NqWAhllomD8XTwUdgiWlZLbwhVYwCeE98H7LxdANcfQs
 6LWFGymyi1qoek0exn9fcSjSRz5KX8P0fO/lz35s=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (unknown [2a02:6b8:b081:8819::1:2b])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 QnX7l4U12g-JMMm9ieY; Thu, 19 May 2022 17:19:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 2/4] virtio: forward errors into qdev_report_runtime_error()
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
Date: Thu, 19 May 2022 17:19:22 +0300
Message-ID: <165296996264.196133.14408996533965098582.stgit@buzz>
In-Reply-To: <165296995578.196133.16183155555450040914.stgit@buzz>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Repalce virtio_error() with macro which forms structured Error and
reports it as device runtime-error in addition to present actions.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/virtio.c         |    9 +++------
 include/hw/virtio/virtio.h |   10 +++++++++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..638d779bf2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3642,13 +3642,10 @@ void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name)
     vdev->bus_name = g_strdup(bus_name);
 }
 
-void G_GNUC_PRINTF(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
+void virtio_fatal_error(VirtIODevice *vdev, Error *err)
 {
-    va_list ap;
-
-    va_start(ap, fmt);
-    error_vreport(fmt, ap);
-    va_end(ap);
+    qdev_report_runtime_error(&vdev->parent_obj, err);
+    error_report_err(err);
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         vdev->status = vdev->status | VIRTIO_CONFIG_S_NEEDS_RESET;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..a165e35b0b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -16,6 +16,7 @@
 
 #include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "qapi/error.h"
 #include "net/net.h"
 #include "migration/vmstate.h"
 #include "qemu/event_notifier.h"
@@ -172,7 +173,14 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
 
 void virtio_cleanup(VirtIODevice *vdev);
 
-void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+#define virtio_error(vdev, fmt, ...) {              \
+    Error *_err = NULL;                             \
+    error_setg(&_err, (fmt), ## __VA_ARGS__);       \
+    virtio_fatal_error(vdev, _err);                 \
+} while (0)
+
+/* Reports and frees error, breaks device */
+void virtio_fatal_error(VirtIODevice *vdev, Error *err);
 
 /* Set the child bus name. */
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);


