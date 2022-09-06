Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE705AF3A3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 20:35:09 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVdPg-00084p-In
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 14:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMH-0003Ej-N5
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:37 -0400
Received: from blyat.fensystems.co.uk
 ([2a05:d018:a4d:6403:2dda:8093:274f:d185]:55672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMG-0004sX-6l
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:37 -0400
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5486:8700:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id C80104425E;
 Tue,  6 Sep 2022 18:31:32 +0000 (UTC)
From: Michael Brown <mcb30@ipxe.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Michael Brown <mcb30@ipxe.org>
Subject: [PATCH 1/4] usbnet: Add missing usb_wakeup() call in usbnet_receive()
Date: Tue,  6 Sep 2022 19:30:50 +0100
Message-Id: <20220906183053.3625472-2-mcb30@ipxe.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906183053.3625472-1-mcb30@ipxe.org>
References: <20220906183053.3625472-1-mcb30@ipxe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a05:d018:a4d:6403:2dda:8093:274f:d185;
 envelope-from=mcb30@ipxe.org; helo=blyat.fensystems.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

usbnet_receive() does not currently wake up the USB endpoint, leading
to a dead RX datapath when used with a host controller such as xHCI
that relies on being woken up.

Fix by adding a call to usb_wakeup() at the end of usbnet_receive().

Signed-off-by: Michael Brown <mcb30@ipxe.org>
---
 hw/usb/dev-network.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 6c49c16015..61bf598870 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -647,6 +647,7 @@ struct USBNetState {
     uint8_t in_buf[2048];
 
     USBEndpoint *intr;
+    USBEndpoint *bulk_in;
 
     char usbstring_mac[13];
     NICState *nic;
@@ -1317,6 +1318,7 @@ static ssize_t usbnet_receive(NetClientState *nc, const uint8_t *buf, size_t siz
     memcpy(in_buf, buf, size);
     s->in_len = total_size;
     s->in_ptr = 0;
+    usb_wakeup(s->bulk_in, 0);
     return size;
 }
 
@@ -1359,6 +1361,7 @@ static void usb_net_realize(USBDevice *dev, Error **errp)
     s->filter = 0;
     s->vendorid = 0x1234;
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
+    s->bulk_in = usb_ep_get(dev, USB_TOKEN_IN, 2);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_usbnet_info, &s->conf,
-- 
2.35.1


