Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77485EBDD4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:55:35 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6NK-0007wr-SN
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oY-0005cf-L2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oX-0000Kq-5c
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwMBwWhUCObCQODSt2PE3geZjaDC55CP59MmTESi1FE=;
 b=F7I7ortHsi9AV+jex3TfTI3BqtSQa2SVx6iHUFZXXl4q73SCdoG42j/ZqcUi1fTI04ASob
 9tnlxz5ANf2uV+NdGcZpRzttX2XewWrR0ZsBtz5P9oMgIqbw5mXI2Zt0ArJcXCpxHX5Q8b
 cCrrgQIuLUSZgbKjzwSiuVkULNNSG8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-4WZjYfBGMwGF8uEaKDpRgg-1; Tue, 27 Sep 2022 04:19:32 -0400
X-MC-Unique: 4WZjYfBGMwGF8uEaKDpRgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFDEA811E81;
 Tue, 27 Sep 2022 08:19:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B4D318EB3;
 Tue, 27 Sep 2022 08:19:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA7EF18009AA; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Brown <mcb30@ipxe.org>
Subject: [PULL 19/24] usbnet: Report link-up via interrupt endpoint in CDC-ECM
 mode
Date: Tue, 27 Sep 2022 10:19:07 +0200
Message-Id: <20220927081912.180983-20-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


