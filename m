Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6EF98BC0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 08:55:33 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0h0O-0000rh-2O
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 02:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0gxk-0007If-GL
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0gxj-0004cr-AF
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36990)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0gxj-0004aC-3v
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:52:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A67698980F2;
 Thu, 22 Aug 2019 06:52:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 346EF5C205;
 Thu, 22 Aug 2019 06:52:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87D8993E3; Thu, 22 Aug 2019 08:52:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 08:52:40 +0200
Message-Id: <20190822065242.12496-4-kraxel@redhat.com>
In-Reply-To: <20190822065242.12496-1-kraxel@redhat.com>
References: <20190822065242.12496-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 22 Aug 2019 06:52:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/5] xhci: Add No Op Command
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
Cc: Hikaru Nishida <hikarupsp@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hikaru Nishida <hikarupsp@gmail.com>

This commit adds No Op Command (23) to xHC for verifying the operation
of the Command Ring mechanisms.
No Op Command is defined in XHCI spec (4.6.2) and just reports Command
Completion Event with Completion Code == Success.
Before this commit, No Op Command is not implemented so xHC reports
Command Completion Event with Completion Code == TRB Error. This commit
fixes this behaviour to report Completion Code correctly.

Signed-off-by: Hikaru Nishida <hikarupsp@gmail.com>
Message-id: 20190720060427.50457-1-hikarupsp@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index f698224c8a06..f5782649482b 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2543,6 +2543,9 @@ static void xhci_process_commands(XHCIState *xhci)
         case CR_GET_PORT_BANDWIDTH:
             event.ccode = xhci_get_port_bandwidth(xhci, trb.parameter);
             break;
+        case CR_NOOP:
+            event.ccode = CC_SUCCESS;
+            break;
         case CR_VENDOR_NEC_FIRMWARE_REVISION:
             if (xhci->nec_quirks) {
                 event.type = 48; /* NEC reply */
-- 
2.18.1


