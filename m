Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136A3E0327
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:29:28 +0200 (CEST)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHtf-0005SD-3r
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHs8-0002jZ-CX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHs6-0003IX-14
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01Lrm7Hu40fKJBGSWca3/XVRk5CdtRF6jd4pCnVGVxs=;
 b=Hv/lut8LhVIC31hF4b1K3HBw1zPna7bO4cOv90WnydlGCfpnJswa5dio6f7zMR0IecApXb
 Ed97xLezJfzXxQf4E4kybXb/leh0uwc2OSbKGlNW2QWy9KDgNh+xaYX29yIup+BFfTGf29
 gDbXP4sBhMMictd0l5GzgZnWPiKuot0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-ci4YAcR5NSKGBut6CEdc2g-1; Wed, 04 Aug 2021 10:27:47 -0400
X-MC-Unique: ci4YAcR5NSKGBut6CEdc2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FB8A193F56F;
 Wed,  4 Aug 2021 14:27:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0120A66FFF;
 Wed,  4 Aug 2021 14:27:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46EF11800986; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] floppy: move isa_fdc_get_drive_type to separate source
 file.
Date: Wed,  4 Aug 2021 16:27:31 +0200
Message-Id: <20210804142737.3366441-2-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_fdc_get_drive_type() is needed by pc machine types
when setting up the cmos.

Move to separate source file so we can keep it in core qemu
when building floppy as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-internal.h | 16 ++++++++++++++++
 hw/block/fdc-isa.c      | 22 ----------------------
 hw/block/fdc-module.c   | 39 +++++++++++++++++++++++++++++++++++++++
 hw/block/meson.build    |  1 +
 4 files changed, 56 insertions(+), 22 deletions(-)
 create mode 100644 hw/block/fdc-module.c

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
index 036392e9fc10..a74cd5e4b9f2 100644
--- a/hw/block/fdc-internal.h
+++ b/hw/block/fdc-internal.h
@@ -29,6 +29,7 @@
 #include "exec/ioport.h"
 #include "hw/block/block.h"
 #include "hw/block/fdc.h"
+#include "hw/isa/isa.h"
 #include "qapi/qapi-types-block.h"
 
 typedef struct FDCtrl FDCtrl;
@@ -143,6 +144,21 @@ struct FDCtrl {
     PortioList portio_list;
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlISABus, ISA_FDC)
+
+struct FDCtrlISABus {
+    /*< private >*/
+    ISADevice parent_obj;
+    /*< public >*/
+
+    uint32_t iobase;
+    uint32_t irq;
+    uint32_t dma;
+    struct FDCtrl state;
+    int32_t bootindexA;
+    int32_t bootindexB;
+};
+
 extern const FDFormat fd_formats[];
 extern const VMStateDescription vmstate_fdc;
 
diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 3bf64e06657b..dd7e1669f862 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -49,21 +49,6 @@
 #include "qom/object.h"
 #include "fdc-internal.h"
 
-OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlISABus, ISA_FDC)
-
-struct FDCtrlISABus {
-    /*< private >*/
-    ISADevice parent_obj;
-    /*< public >*/
-
-    uint32_t iobase;
-    uint32_t irq;
-    uint32_t dma;
-    struct FDCtrl state;
-    int32_t bootindexA;
-    int32_t bootindexB;
-};
-
 static void fdctrl_external_reset_isa(DeviceState *d)
 {
     FDCtrlISABus *isa = ISA_FDC(d);
@@ -117,13 +102,6 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
     }
 }
 
-FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
-{
-    FDCtrlISABus *isa = ISA_FDC(fdc);
-
-    return isa->state.drives[i].drive;
-}
-
 static void isa_fdc_get_drive_max_chs(FloppyDriveType type, uint8_t *maxc,
                                       uint8_t *maxh, uint8_t *maxs)
 {
diff --git a/hw/block/fdc-module.c b/hw/block/fdc-module.c
new file mode 100644
index 000000000000..93953bf0aa57
--- /dev/null
+++ b/hw/block/fdc-module.c
@@ -0,0 +1,39 @@
+/*
+ * QEMU Floppy disk emulator (Intel 82078)
+ *
+ * Some small helper functions which must be built into core qemu when
+ * building floppy as module.
+ *
+ * Copyright (c) 2003, 2007 Jocelyn Mayer
+ * Copyright (c) 2008 Hervé Poussineau
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/isa/isa.h"
+#include "hw/block/fdc.h"
+#include "fdc-internal.h"
+
+FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
+{
+    FDCtrlISABus *isa = ISA_FDC(fdc);
+
+    return isa->state.drives[i].drive;
+}
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 2389326112ae..8460042fe320 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -4,6 +4,7 @@ softmmu_ss.add(files(
   'hd-geometry.c'
 ))
 softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
+softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc-module.c'))
 softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
 softmmu_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
 softmmu_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
-- 
2.31.1


