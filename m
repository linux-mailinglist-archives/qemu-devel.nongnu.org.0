Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E312300A4E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:53:52 +0100 (CET)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30d5-00008m-HK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YU-0003S1-R5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YP-0004gD-N3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5CFxKFH2AAXiXkkyHqdAOwWoxp40benhMXniIxfVcg=;
 b=QjeC12jYm3EJBJUb/PSikflT7I7IhU076xjqgiVLZcq74N9fVecjMG9HKmRn459eb+4awB
 B5B1b1FLU3ERUv8SIRYcZLl2ixJ9TGUy1pjZzslbJTHA+10hoAGOTqhHsWtsVgUT36BJKq
 6SnYnnkoIrLs97nWDnWlwgujKxWJo+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-LxnboqvlMVCyeKb5S0y5UA-1; Fri, 22 Jan 2021 12:48:57 -0500
X-MC-Unique: LxnboqvlMVCyeKb5S0y5UA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAD34802B48;
 Fri, 22 Jan 2021 17:48:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2F65DA30;
 Fri, 22 Jan 2021 17:48:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21289180038A; Fri, 22 Jan 2021 18:48:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] hw/usb: Convert to qdev_realize()
Date: Fri, 22 Jan 2021 18:48:44 +0100
Message-Id: <20210122174849.3936119-4-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
References: <20210122174849.3936119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Device code shouldn't mess with QOM property "realized" since we have
proper interfaces (merge commit 6675a653).  Commit 8ddab8dd3d
"usb/hcd-xhci: Split pci wrapper for xhci base model" and commit
f00ff136ee "usb: hcd-xhci-sysbus: Attach xhci to sysbus device"
reintroduced two instances.  Clean them up.  Note that s->xhci is
a (bus-less) TYPE_XHCI device.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210119120151.53757-1-armbru@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci-pci.c    | 4 +---
 hw/usb/hcd-xhci-sysbus.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index bba628d3d230..9421734d0fe2 100644
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
index 29185d2261fb..42e2574c8298 100644
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
2.29.2


