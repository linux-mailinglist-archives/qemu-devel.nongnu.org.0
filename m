Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460A5A5A0B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 05:33:30 +0200 (CEST)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSs0G-0000ps-Sf
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 23:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSrxZ-0007iE-Ky
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:30:41 -0400
Received: from [125.120.144.215] (port=38764 helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSrxX-0002kS-J7
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:30:41 -0400
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 8bd0f48a;
 Tue, 30 Aug 2022 03:30:30 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hcd-ohci: Fix inconsistency when resetting ohci root hubs
Date: Tue, 30 Aug 2022 11:30:22 +0800
Message-Id: <20220830033022.1164961-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.144.215 (failed)
Received-SPF: softfail client-ip=125.120.144.215;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 60
X-Spam_score: 6.0
X-Spam_bar: ++++++
X-Spam_report: (6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=1.239,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found an assertion failure in usb_cancel_packet() and posted my analysis in
https://gitlab.com/qemu-project/qemu/-/issues/1180. I think this issue is
because the inconsistency when resetting ohci root hubs.

There are two ways to reset ohci root hubs: 1) through HcRhPortStatus, 2)
through HcControl. However, when the packet's status is USB_PACKET_ASYNC,
resetting through HcRhPortStatus will complete the packet and thus resetting
through HcControl will fail. That is because IMO resetting through
HcRhPortStatus should first detach the port and then invoked usb_device_reset()
just like through HcControl. Therefore, I change usb_device_reset() to
usb_port_reset() where usb_detach() and usb_device_reset() are invoked
consequently.

Fixes: d28f4e2d8631 ("usb: kill USB_MSG_RESET")
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1180
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb86..72df917834 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1426,7 +1426,7 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
 
     if (ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PRS)) {
         trace_usb_ohci_port_reset(portnum);
-        usb_device_reset(port->port.dev);
+        usb_port_reset(&port->port);
         port->ctrl &= ~OHCI_PORT_PRS;
         /* ??? Should this also set OHCI_PORT_PESC.  */
         port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
-- 
2.25.1


