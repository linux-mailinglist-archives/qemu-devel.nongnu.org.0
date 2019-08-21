Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2DC9756A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:54:35 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0MO3-0003rT-0M
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0MMv-0002NX-0v
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0MMt-0002ag-Un
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:53:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0MMt-0002aK-QG
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:53:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F26DA10F23E1
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 08:53:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52D495D9E1;
 Wed, 21 Aug 2019 08:53:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D4D916E1A; Wed, 21 Aug 2019 10:53:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 10:53:19 +0200
Message-Id: <20190821085319.13711-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 21 Aug 2019 08:53:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] ehci: fix queue->dev null ptr dereference
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
---
 hw/usb/hcd-ehci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 62dab0592fa2..5f089f30054b 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1834,6 +1834,9 @@ static int ehci_state_fetchqtd(EHCIQueue *q)
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


