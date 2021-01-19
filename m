Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF12FB5F4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:04:17 +0100 (CET)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pk8-0002it-Lu
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1pi4-0001q7-9d
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1phx-0003ps-OW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611057720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=boq/B4I1/FUwLdcCs5lZFCiPzWJHV12KFw+upQrMjNw=;
 b=bMt0XpOC+hBkYqKlXh0tbrHkwQsfSvDK3vRmuB8yr5XjldWzLLGzUiv8L4FcK9zq4nzTbC
 uXlom/cnmgL6VdiqQ+gMnmKZ5jQNrfxTJl6TFz/ehRxJXm8Cw5ljQsaOycqGNLYN7yp1d7
 iHnaXfZfigROWtZ6Jw45Lf3FMXNg/cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-AOPanmaCNpWKidIvRbwlZA-1; Tue, 19 Jan 2021 07:01:58 -0500
X-MC-Unique: AOPanmaCNpWKidIvRbwlZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85385107ACE3;
 Tue, 19 Jan 2021 12:01:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7BE27C48;
 Tue, 19 Jan 2021 12:01:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5446113865F; Tue, 19 Jan 2021 13:01:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/usb: Convert to qdev_realize()
Date: Tue, 19 Jan 2021 13:01:51 +0100
Message-Id: <20210119120151.53757-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sai.pavan.boddu@xilinx.com, peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Device code shouldn't mess with QOM property "realized" since we have
proper interfaces (merge commit 6675a653).  Commit 8ddab8dd3d
"usb/hcd-xhci: Split pci wrapper for xhci base model" and commit
f00ff136ee "usb: hcd-xhci-sysbus: Attach xhci to sysbus device"
reintroduced two instances.  Clean them up.  Note that s->xhci is
a (bus-less) TYPE_XHCI device.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/usb/hcd-xhci-pci.c    | 4 +---
 hw/usb/hcd-xhci-sysbus.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index bba628d3d2..9421734d0f 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,9 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
-    object_property_set_bool(OBJECT(&s->xhci), "realized", true, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
     if (strcmp(object_get_typename(OBJECT(dev)), TYPE_NEC_XHCI) == 0) {
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index 29185d2261..42e2574c82 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -33,12 +33,9 @@ void xhci_sysbus_reset(DeviceState *dev)
 static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
-    Error *err = NULL;
 
     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
-    object_property_set_bool(OBJECT(&s->xhci), "realized", true, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
     s->irq = g_new0(qemu_irq, s->xhci.numintrs);
-- 
2.26.2


