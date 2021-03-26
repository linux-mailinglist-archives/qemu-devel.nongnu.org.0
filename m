Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3234A4F4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:53:40 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPj9u-0008Nn-IJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPj8V-0007jS-Su
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPj8S-0000Qb-Cf
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616752326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WyJLWvGqWF31glOFxZIy/oZITo8XJPpmQwlUhuaJIeA=;
 b=gN4uhtPKrfJAKygLZhWBt3/2dKcwscLS9LVWRA85FdTIMSAO2Mj5+1cko2TXcC22Z224OE
 iUHx2ZG5RSrfyG2Wu60EQFEhCwKpF36QaaJCwps1JVMs6bMt5trKdIY+4Ovc1tESJ6b2So
 vnCB8/SaY2ybrmVJkdhFnj+uSjVFmio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-aCsFbISoOlWQBvczD8aHdA-1; Fri, 26 Mar 2021 05:52:02 -0400
X-MC-Unique: aCsFbISoOlWQBvczD8aHdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2339B107ACCA;
 Fri, 26 Mar 2021 09:52:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B8E7891D0;
 Fri, 26 Mar 2021 09:51:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH for-6.0] hw/usb/hcd-ehci: Fix crash when showing help of EHCI
 devices
Date: Fri, 26 Mar 2021 10:51:55 +0100
Message-Id: <20210326095155.1994604-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/usb/hcd-ehci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index f71af0ad2d..6caa7ac6c2 100644
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
2.27.0


