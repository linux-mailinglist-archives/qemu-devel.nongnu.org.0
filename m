Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD086E8072
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:33:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBbh-0003lu-Sx; Wed, 19 Apr 2023 13:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBbd-0003jJ-Om
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBba-00021S-La
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681925309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxF1pTMYrXy3osQY76QFRJXTyPl1McCp6rJWUy+E5CI=;
 b=JK1jF2MTEqsXETV0RuMaRdToS+xjYQlCY9FXUZxfgIaBEHuqoTTmj/kzqdttVyRT2n7y2n
 3iKZv3pZBbdAj8pozcII497bbSMlRtX2j2GN2lr2ZDcz5S1Gwup2ptfvnVPoYKQ8dxyrSi
 XYa87nZiFqHWDx7gi/+QPRajO7b9Qzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-_tjGd7aHPKSYhHr_wbflLA-1; Wed, 19 Apr 2023 13:28:24 -0400
X-MC-Unique: _tjGd7aHPKSYhHr_wbflLA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19BA985A5A3;
 Wed, 19 Apr 2023 17:28:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81D2D483EC4;
 Wed, 19 Apr 2023 17:28:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 01/16] hw/qdev: introduce qdev_is_realized() helper
Date: Wed, 19 Apr 2023 13:28:02 -0400
Message-Id: <20230419172817.272758-2-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add a helper function to check whether the device is realized without
requiring the Big QEMU Lock. The next patch adds a second caller. The
goal is to avoid spreading DeviceState field accesses throughout the
code.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 17 ++++++++++++++---
 hw/scsi/scsi-bus.c     |  3 +--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..4d734cf35e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qemu/atomic.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -164,9 +165,6 @@ struct NamedClockList {
 
 /**
  * DeviceState:
- * @realized: Indicates whether the device has been fully constructed.
- *            When accessed outside big qemu lock, must be accessed with
- *            qatomic_load_acquire()
  * @reset: ResettableState for the device; handled by Resettable interface.
  *
  * This structure should not be accessed directly.  We declare it here
@@ -332,6 +330,19 @@ DeviceState *qdev_new(const char *name);
  */
 DeviceState *qdev_try_new(const char *name);
 
+/**
+ * qdev_is_realized:
+ * @dev: The device to check.
+ *
+ * May be called outside big qemu lock.
+ *
+ * Returns: %true% if the device has been fully constructed, %false% otherwise.
+ */
+static inline bool qdev_is_realized(DeviceState *dev)
+{
+    return qatomic_load_acquire(&dev->realized);
+}
+
 /**
  * qdev_realize: Realize @dev.
  * @dev: device to realize
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c97176110c..07275fb631 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -60,8 +60,7 @@ static SCSIDevice *do_scsi_device_find(SCSIBus *bus,
      * the user access the device.
      */
 
-    if (retval && !include_unrealized &&
-        !qatomic_load_acquire(&retval->qdev.realized)) {
+    if (retval && !include_unrealized && !qdev_is_realized(&retval->qdev)) {
         retval = NULL;
     }
 
-- 
2.39.2


