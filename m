Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A403598BE1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 08:59:08 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0h3r-0004c1-Ld
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 02:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0gxk-0007Ig-U5
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0gxj-0004dr-Nt
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35990)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0gxj-0004bx-Eo
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A676830832C8
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 06:52:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67B6D60126;
 Thu, 22 Aug 2019 06:52:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97DD4935A; Thu, 22 Aug 2019 08:52:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 08:52:42 +0200
Message-Id: <20190822065242.12496-6-kraxel@redhat.com>
In-Reply-To: <20190822065242.12496-1-kraxel@redhat.com>
References: <20190822065242.12496-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 22 Aug 2019 06:52:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 5/5] ehci: fix queue->dev null ptr dereference
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case we don't have a device for an active queue, just skip
processing the queue (same we do for inactive queues) and log
a guest bug.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20190821085319.13711-1-kraxel@redhat.com
---
 hw/usb/hcd-ehci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 9ca7b87a8001..56ab2f457f4c 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1838,6 +1838,9 @@ static int ehci_state_fetchqtd(EHCIQueue *q)
             ehci_set_state(q->ehci, q->async, EST_EXECUTING);
             break;
         }
+    } else if (q->dev == NULL) {
+        ehci_trace_guest_bug(q->ehci, "no device attached to queue");
+        ehci_set_state(q->ehci, q->async, EST_HORIZONTALQH);
     } else {
         p = ehci_alloc_packet(q);
         p->qtdaddr = q->qtdaddr;
-- 
2.18.1


