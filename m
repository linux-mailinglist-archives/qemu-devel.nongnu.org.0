Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F05E9FA8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:29:07 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclMI-0002eJ-3T
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockps-0005ZH-Oa
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpr-0003o2-2d
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwMBwWhUCObCQODSt2PE3geZjaDC55CP59MmTESi1FE=;
 b=JujMGLRo8FK0kNoAkPTPz11Ji5QsfoukmQGuXlpFZZS7x58qZvWcXdDZm0EGafrf39/VEv
 MvqRKBo3r19MCi5G2xy2GJ21F4PcUb1JwIkM5vhl9PPdmMmAf6VFsl3gINlySShefp8CnN
 RXOIK641OHOa6wE/VQezjELWwCD41y8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-kMv2CygHNneyVGTGJoIP8Q-1; Mon, 26 Sep 2022 05:55:31 -0400
X-MC-Unique: kMv2CygHNneyVGTGJoIP8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94FAD3810780;
 Mon, 26 Sep 2022 09:55:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2FFC15BA4;
 Mon, 26 Sep 2022 09:55:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19D54180A401; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Brown <mcb30@ipxe.org>
Subject: [PULL 20/25] usbnet: Report link-up via interrupt endpoint in CDC-ECM
 mode
Date: Mon, 26 Sep 2022 11:55:04 +0200
Message-Id: <20220926095509.3759409-21-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Brown <mcb30@ipxe.org>

Signed-off-by: Michael Brown <mcb30@ipxe.org>
Message-Id: <20220906183053.3625472-5-mcb30@ipxe.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-network.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 9d83974ec9f0..ac1adca54355 100644
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
2.37.3


