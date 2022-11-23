Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACB63622C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqze-0004EC-NX; Wed, 23 Nov 2022 09:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzc-0004E3-BJ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqza-0002wL-T9
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQV/zHGvN3N1ZOIE+jtNkRxRtG8xKdqfBfSyMRE78Io=;
 b=VeDWHHO7rpU9Uk6zM3nPiN2HSzjsVm5IeirE8nFY66aKnUcJ4eG8ttjt3b+NylaidmW+5r
 G72GUQiV82d63eVoRSRoBvYTYMMqgDU5R+8w41zlovBdcBBwVIA1+7g3tUfJOlehrDQts9
 dIc+lyreOPgNXZTgkMIwAkKxlFjYjzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-HDzp9KkZNtiYII-M1n0h2w-1; Wed, 23 Nov 2022 09:44:48 -0500
X-MC-Unique: HDzp9KkZNtiYII-M1n0h2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 797CB1C27266;
 Wed, 23 Nov 2022 14:44:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DFCB1415114;
 Wed, 23 Nov 2022 14:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08819180061B; Wed, 23 Nov 2022 15:44:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/7] hw/usb/hcd-xhci: Reset the XHCIState with
 device_cold_reset()
Date: Wed, 23 Nov 2022 15:44:34 +0100
Message-Id: <20221123144436.2141069-6-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

From: Peter Maydell <peter.maydell@linaro.org>

Currently the hcd-xhci-pci and hcd-xhci-sysbus devices, which are
mostly wrappers around the TYPE_XHCI device, which is a direct
subclass of TYPE_DEVICE.  Since TYPE_DEVICE devices are not on any
qbus and do not get automatically reset, the wrapper devices both
reset the TYPE_XHCI device in their own reset functions.  However,
they do this using device_legacy_reset(), which will reset the device
itself but not any bus it has.

Switch to device_cold_reset(), which avoids using a deprecated
function and also propagates reset along any child buses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221014145423.2102706-1-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1fb..643d4643e4d6 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -85,7 +85,7 @@ static void xhci_pci_reset(DeviceState *dev)
 {
     XHCIPciState *s = XHCI_PCI(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static int xhci_pci_vmstate_post_load(void *opaque, int version_id)
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960e..faf57b47975d 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -29,7 +29,7 @@ void xhci_sysbus_reset(DeviceState *dev)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
-- 
2.38.1


