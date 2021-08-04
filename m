Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D551C3E0337
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:31:54 +0200 (CEST)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHw1-0001bT-O1
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsA-0002kY-9Y
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHs6-0003KU-S9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8fn+CHbP6vdoLeFpXBzR9+y5YgSiK+WUd/xfJkUkpA=;
 b=CBurjGYPDsBzaU7oTTmrpyMSYlRXz/9ww90qXfv3iQ1gsn9LsCRy1NRiRcuVYFNpMPXFCM
 SQDpaOpejC2ZihrlD6VesDWc9Z/dkfXygaeuntnDZXRigYzzYmSFNOkuTJJTadYXRX+bEm
 3FzTJzvexAM/rVsgqavheJuf63HAKzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Yuxt_W_bNo2k_r7rEv2LyA-1; Wed, 04 Aug 2021 10:27:49 -0400
X-MC-Unique: Yuxt_W_bNo2k_r7rEv2LyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 232ED1026209;
 Wed,  4 Aug 2021 14:27:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4ECA60BF4;
 Wed,  4 Aug 2021 14:27:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55A821800987; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] floppy: move isa_fdc_init_drives + fdctrl_init_drives
Date: Wed,  4 Aug 2021 16:27:32 +0200
Message-Id: <20210804142737.3366441-3-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_fdc_init_drives() is called by pc machine setup,
and it depends on fdctrl_init_drives().

Move both functions to separate source file so we can
keep them in core qemu when building floppy as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-isa.c    |  5 -----
 hw/block/fdc-module.c | 24 ++++++++++++++++++++++++
 hw/block/fdc.c        | 17 -----------------
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index dd7e1669f862..36c246efa822 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -57,11 +57,6 @@ static void fdctrl_external_reset_isa(DeviceState *d)
     fdctrl_reset(s, 0);
 }
 
-void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
-{
-    fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
-}
-
 static const MemoryRegionPortio fdc_portio_list[] = {
     { 1, 5, 1, .read = fdctrl_read, .write = fdctrl_write },
     { 7, 1, 1, .read = fdctrl_read, .write = fdctrl_write },
diff --git a/hw/block/fdc-module.c b/hw/block/fdc-module.c
index 93953bf0aa57..8309e99361bc 100644
--- a/hw/block/fdc-module.c
+++ b/hw/block/fdc-module.c
@@ -29,8 +29,32 @@
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
+#include "qapi/error.h"
+#include "sysemu/blockdev.h"
 #include "fdc-internal.h"
 
+void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
+{
+    DeviceState *dev;
+    int i;
+
+    for (i = 0; i < MAX_FD; i++) {
+        if (fds[i]) {
+            dev = qdev_new("floppy");
+            qdev_prop_set_uint32(dev, "unit", i);
+            qdev_prop_set_enum(dev, "drive-type", FLOPPY_DRIVE_TYPE_AUTO);
+            qdev_prop_set_drive_err(dev, "drive", blk_by_legacy_dinfo(fds[i]),
+                                    &error_fatal);
+            qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
+        }
+    }
+}
+
+void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
+{
+    fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
+}
+
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
 {
     FDCtrlISABus *isa = ISA_FDC(fdc);
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 9014cd30b3ab..ba42537e8d26 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2297,23 +2297,6 @@ static void fdctrl_result_timer(void *opaque)
 
 /* Init functions */
 
-void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
-{
-    DeviceState *dev;
-    int i;
-
-    for (i = 0; i < MAX_FD; i++) {
-        if (fds[i]) {
-            dev = qdev_new("floppy");
-            qdev_prop_set_uint32(dev, "unit", i);
-            qdev_prop_set_enum(dev, "drive-type", FLOPPY_DRIVE_TYPE_AUTO);
-            qdev_prop_set_drive_err(dev, "drive", blk_by_legacy_dinfo(fds[i]),
-                                    &error_fatal);
-            qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
-        }
-    }
-}
-
 void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
 {
     int i, j;
-- 
2.31.1


