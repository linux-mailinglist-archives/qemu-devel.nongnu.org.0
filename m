Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA33B0550
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:56:07 +0200 (CEST)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfwk-00043d-AP
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqS-0002Wj-Sy
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqP-00005r-8x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNR7OSKPvAYdZ4eI0t2VIsh0jMrYUPKjJStHwBoBnB0=;
 b=Zrr0+Z1n6P6eymoKhbDiN8AaSt/C6drVi+xd90D2TX3BwhFu78x4EoTn4ZyJc9nMGLEXuO
 B1dNQjDYLgpPYQvVZ/guPdkG/RTIlUYMQJQ/KUp+njvXTARa3EF/WFXYt9GdRBY1mRvM8t
 qvE3ueAD08u86jm4paMS9HxeiDYfZOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-iHbvZJykNZmp-MkL7i-nOw-1; Tue, 22 Jun 2021 08:49:28 -0400
X-MC-Unique: iHbvZJykNZmp-MkL7i-nOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85FE2100C618;
 Tue, 22 Jun 2021 12:49:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0A21000320;
 Tue, 22 Jun 2021 12:49:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89C311800913; Tue, 22 Jun 2021 14:49:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] usb: build usb-host as module
Date: Tue, 22 Jun 2021 14:49:14 +0200
Message-Id: <20210622124915.261060-5-kraxel@redhat.com>
In-Reply-To: <20210622124915.261060-1-kraxel@redhat.com>
References: <20210622124915.261060-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop one more shared library dependency (libusb) from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 1 +
 hw/usb/meson.build   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 2b7f87872ce3..c0f314462aaf 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1777,6 +1777,7 @@ static TypeInfo usb_host_dev_info = {
     .class_init    = usb_host_class_initfn,
     .instance_init = usb_host_instance_init,
 };
+module_obj(TYPE_USB_HOST_DEVICE);
 
 static void usb_host_register_types(void)
 {
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 3d8f2ae99302..0a6029ec9797 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -72,8 +72,12 @@ if config_host.has_key('CONFIG_USB_REDIR')
 endif
 
 # usb pass-through
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_USB_LIBUSB', libusb],
-               if_true: files('host-libusb.c'))
+if config_host.has_key('CONFIG_USB_LIBUSB')
+  usbhost_ss = ss.source_set()
+  usbhost_ss.add(when: ['CONFIG_USB', libusb],
+                 if_true: files('host-libusb.c'))
+  hw_usb_modules += {'host': usbhost_ss}
+endif
 
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
 
-- 
2.31.1


