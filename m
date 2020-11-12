Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A526C2B02CC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:39:43 +0100 (CET)
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdA0t-0001KK-VC
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kd9zL-0000uR-K6
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kd9zI-0000IA-Bb
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605177470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CVadlA0/w23/FM4eUH5ECdFIk657KhUGjHTqxsD4nWY=;
 b=e1wd7b50jCdzGwHsJ0LDDYTV49ybli9L7I3H25cgCvAm41lrZCus/bzEytmvuQ/jA66GHB
 MPUgCMaVZ0NwNiipX01fPf/GaP4djMpGP4JFVKRAGZ9hXPGFaw2eBh37Vay6cyaqq6xrWj
 9RfuOK39UPauShikKSZU1AYiQ/YHMpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-z8OF2oaqPl-xIa10EFNHaQ-1; Thu, 12 Nov 2020 05:37:48 -0500
X-MC-Unique: z8OF2oaqPl-xIa10EFNHaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8485F9F4
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:37:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-183.ams2.redhat.com
 [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 071AC5B4DC;
 Thu, 12 Nov 2020 10:37:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 01A7A16E31; Thu, 12 Nov 2020 11:37:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] xhci: fix nec-usb-xhci properties
Date: Thu, 12 Nov 2020 11:37:41 +0100
Message-Id: <20201112103741.2335-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Storing properties directly in XHCIPciState.xhci doesn't work,
the object_initialize_child() call in xhci_instance_init() will
overwrite them.

This changes the defaults for some properties, which in turn breaks
live migration and possibly other things as well.

So add XHCINecState, store properties there, copy them over on
instance init.

Fixes: 8ddab8dd3d81 ("usb/hcd-xhci: Split pci wrapper for xhci base model")
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci-nec.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index 5707b2cabd16..13a125afe2f7 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -27,18 +27,37 @@
 
 #include "hcd-xhci-pci.h"
 
+typedef struct XHCINecState {
+    /*< private >*/
+    XHCIPciState parent_obj;
+    /*< public >*/
+    uint32_t flags;
+    uint32_t intrs;
+    uint32_t slots;
+} XHCINecState;
+
 static Property nec_xhci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
     DEFINE_PROP_ON_OFF_AUTO("msix", XHCIPciState, msix, ON_OFF_AUTO_AUTO),
-    DEFINE_PROP_BIT("superspeed-ports-first", XHCIPciState,
-                    xhci.flags, XHCI_FLAG_SS_FIRST, true),
-    DEFINE_PROP_BIT("force-pcie-endcap", XHCIPciState, xhci.flags,
+    DEFINE_PROP_BIT("superspeed-ports-first", XHCINecState, flags,
+                    XHCI_FLAG_SS_FIRST, true),
+    DEFINE_PROP_BIT("force-pcie-endcap", XHCINecState, flags,
                     XHCI_FLAG_FORCE_PCIE_ENDCAP, false),
-    DEFINE_PROP_UINT32("intrs", XHCIPciState, xhci.numintrs, XHCI_MAXINTRS),
-    DEFINE_PROP_UINT32("slots", XHCIPciState, xhci.numslots, XHCI_MAXSLOTS),
+    DEFINE_PROP_UINT32("intrs", XHCINecState, intrs, XHCI_MAXINTRS),
+    DEFINE_PROP_UINT32("slots", XHCINecState, slots, XHCI_MAXSLOTS),
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void nec_xhci_instance_init(Object *obj)
+{
+    XHCIPciState *pci = XHCI_PCI(obj);
+    XHCINecState *nec = container_of(pci, XHCINecState, parent_obj);
+
+    pci->xhci.flags    = nec->flags;
+    pci->xhci.numintrs = nec->intrs;
+    pci->xhci.numslots = nec->slots;
+}
+
 static void nec_xhci_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -53,6 +72,8 @@ static void nec_xhci_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nec_xhci_info = {
     .name          = TYPE_NEC_XHCI,
     .parent        = TYPE_XHCI_PCI,
+    .instance_size = sizeof(XHCINecState),
+    .instance_init = nec_xhci_instance_init,
     .class_init    = nec_xhci_class_init,
 };
 
-- 
2.27.0


