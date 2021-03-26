Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0734A7A6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:57:27 +0100 (CET)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPm1m-0005Dd-9n
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlvW-00066h-L7
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPlvF-0004Am-LF
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616763040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0KQjon6DYSw7rzNJPTaUajbh8VbHC3day+fWXsDf3Y=;
 b=i3SLNDBo6fJCsvnkEgrqIAeQD3pr0bA77+d9LYtWW7dXzYCVu4RBKMIVHrmsaibeuO9O5v
 lCAnPsbMjHcyeLS1tZ/MunP/tegOlSeLMoYBg0sMmzqFPIA09I91YABooiMPXqCZzkBe1c
 hdweD1OoJle3AQ6GcYJplWBwyMshxP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-ajj2HsDhMxuq3XkjRKxXsw-1; Fri, 26 Mar 2021 08:50:36 -0400
X-MC-Unique: ajj2HsDhMxuq3XkjRKxXsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD4F80006E;
 Fri, 26 Mar 2021 12:50:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD3719727;
 Fri, 26 Mar 2021 12:50:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 273691800396; Fri, 26 Mar 2021 13:49:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] hw/usb/hcd-ehci: Fix crash when showing help of EHCI
 devices
Date: Fri, 26 Mar 2021 13:49:32 +0100
Message-Id: <20210326124932.481942-10-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

QEMU crashes with certain targets when trying to show the help
output of EHCI devices:

$ ./qemu-system-aarch64 -device ich9-usb-ehci1,help
qemu-system-aarch64: ../../devel/qemu/softmmu/physmem.c:1154: phys_section_add:
 Assertion `map->sections_nb < TARGET_PAGE_SIZE' failed.
Aborted (core dumped)

This happens because the device is doing things at "instance_init" time
that should be done at "realize" time instead. So move the related code
to the realize() function instead. (NB: This now also matches the
memory_region_del_subregion() calls which are done in usb_ehci_unrealize(),
and not during finalize()).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210326095155.1994604-1-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index f71af0ad2d8f..6caa7ac6c28f 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2514,6 +2514,11 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp)
         return;
     }
 
+    memory_region_add_subregion(&s->mem, s->capsbase, &s->mem_caps);
+    memory_region_add_subregion(&s->mem, s->opregbase, &s->mem_opreg);
+    memory_region_add_subregion(&s->mem, s->opregbase + s->portscbase,
+                                &s->mem_ports);
+
     usb_bus_new(&s->bus, sizeof(s->bus), s->companion_enable ?
                 &ehci_bus_ops_companion : &ehci_bus_ops_standalone, dev);
     for (i = 0; i < s->portnr; i++) {
@@ -2581,11 +2586,6 @@ void usb_ehci_init(EHCIState *s, DeviceState *dev)
                           "operational", s->portscbase);
     memory_region_init_io(&s->mem_ports, OBJECT(dev), &ehci_mmio_port_ops, s,
                           "ports", 4 * s->portnr);
-
-    memory_region_add_subregion(&s->mem, s->capsbase, &s->mem_caps);
-    memory_region_add_subregion(&s->mem, s->opregbase, &s->mem_opreg);
-    memory_region_add_subregion(&s->mem, s->opregbase + s->portscbase,
-                                &s->mem_ports);
 }
 
 void usb_ehci_finalize(EHCIState *s)
-- 
2.30.2


