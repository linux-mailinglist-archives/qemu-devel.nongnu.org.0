Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697D5E9F4F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:23:27 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclGo-0006Fs-4y
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockps-0005Y4-B5
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpq-0003nj-IC
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsE9VkekNKZPttOpoOonLuBUJbPWi32PC/I2Jy8KiYE=;
 b=jGtxQ36rUYzME+RwsI3lgKyWdT70YbT56PdFDOLgbHgwS6t46NKsLq/DrBy5vRS4Lb29dl
 QSTf4Mb3QAYDX/7cI/sN5o+I9rc0fvk5vu1/aI0N7+CxjBGK93zhapT5wx+nU6R8XMqA7W
 igfEs58+T5RImFu4HSz1jyunz+IT1u8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-U6Y-w-yaO1uLaFSIeJ-Lxw-1; Mon, 26 Sep 2022 05:55:27 -0400
X-MC-Unique: U6Y-w-yaO1uLaFSIeJ-Lxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D65629AB44C;
 Mon, 26 Sep 2022 09:55:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5A42084836;
 Mon, 26 Sep 2022 09:55:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E18DC18030BD; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
Subject: [PULL 17/25] usbnet: Add missing usb_wakeup() call in usbnet_receive()
Date: Mon, 26 Sep 2022 11:55:01 +0200
Message-Id: <20220926095509.3759409-18-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

usbnet_receive() does not currently wake up the USB endpoint, leading
to a dead RX datapath when used with a host controller such as xHCI
that relies on being woken up.

Fix by adding a call to usb_wakeup() at the end of usbnet_receive().

Signed-off-by: Michael Brown <mcb30@ipxe.org>
Message-Id: <20220906183053.3625472-2-mcb30@ipxe.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-network.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 6c49c16015e0..61bf598870cb 100644
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
2.37.3


