Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA75AF3C2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 20:38:10 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVdSc-0002lk-32
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 14:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMN-0003S5-Lo
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:43 -0400
Received: from blyat.fensystems.co.uk ([54.246.183.96]:56052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdML-0004t9-4O
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:43 -0400
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5486:8700:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 4DA09442B8;
 Tue,  6 Sep 2022 18:31:38 +0000 (UTC)
From: Michael Brown <mcb30@ipxe.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Michael Brown <mcb30@ipxe.org>
Subject: [PATCH 4/4] usbnet: Report link-up via interrupt endpoint in CDC-ECM
 mode
Date: Tue,  6 Sep 2022 19:30:53 +0100
Message-Id: <20220906183053.3625472-5-mcb30@ipxe.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906183053.3625472-1-mcb30@ipxe.org>
References: <20220906183053.3625472-1-mcb30@ipxe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=54.246.183.96; envelope-from=mcb30@ipxe.org;
 helo=blyat.fensystems.co.uk
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

Signed-off-by: Michael Brown <mcb30@ipxe.org>
---
 hw/usb/dev-network.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 9d83974ec9..ac1adca543 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -91,6 +91,8 @@ enum usbstring_idx {
 #define USB_CDC_SET_ETHERNET_PACKET_FILTER	0x43
 #define USB_CDC_GET_ETHERNET_STATISTIC		0x44
 
+#define USB_CDC_NETWORK_CONNECTION	0x00
+
 #define LOG2_STATUS_INTERVAL_MSEC	5    /* 1 << 5 == 32 msec */
 #define STATUS_BYTECOUNT		16   /* 8 byte header + data */
 
@@ -640,6 +642,8 @@ struct USBNetState {
     uint16_t filter;
     uint32_t vendorid;
 
+    uint16_t connection;
+
     unsigned int out_ptr;
     uint8_t out_buf[2048];
 
@@ -1140,18 +1144,28 @@ static void usb_net_handle_control(USBDevice *dev, USBPacket *p,
 
 static void usb_net_handle_statusin(USBNetState *s, USBPacket *p)
 {
-    le32 buf[2];
+    le32 rbuf[2];
+    uint16_t ebuf[4];
 
     if (p->iov.size < 8) {
         p->status = USB_RET_STALL;
         return;
     }
 
-    buf[0] = cpu_to_le32(1);
-    buf[1] = cpu_to_le32(0);
-    usb_packet_copy(p, buf, 8);
-    if (!s->rndis_resp.tqh_first) {
-        p->status = USB_RET_NAK;
+    if (is_rndis(s)) {
+        rbuf[0] = cpu_to_le32(1);
+        rbuf[1] = cpu_to_le32(0);
+        usb_packet_copy(p, rbuf, 8);
+        if (!s->rndis_resp.tqh_first) {
+            p->status = USB_RET_NAK;
+        }
+    } else {
+        ebuf[0] =
+            cpu_to_be16(ClassInterfaceRequest | USB_CDC_NETWORK_CONNECTION);
+        ebuf[1] = cpu_to_le16(s->connection);
+        ebuf[2] = cpu_to_le16(1);
+        ebuf[3] = cpu_to_le16(0);
+        usb_packet_copy(p, ebuf, 8);
     }
 
 #ifdef TRAFFIC_DEBUG
@@ -1366,6 +1380,7 @@ static void usb_net_realize(USBDevice *dev, Error **errp)
     s->media_state = 0;	/* NDIS_MEDIA_STATE_CONNECTED */;
     s->filter = 0;
     s->vendorid = 0x1234;
+    s->connection = 1;	/* Connected */
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
     s->bulk_in = usb_ep_get(dev, USB_TOKEN_IN, 2);
 
-- 
2.35.1


