Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF35EBDA2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:42:40 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6Ap-0001sh-6l
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oV-0005WL-MO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oT-0000K3-R7
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsE9VkekNKZPttOpoOonLuBUJbPWi32PC/I2Jy8KiYE=;
 b=f4ZB57qKvcru2Gy3iqbnlVOue94mIBGyRl+EdSs/OHiqmLFD9CdO2FyHyH2VRhHXo5t4L3
 4mc350rZOem7SA02s1Edqi+EECN5Gic1pwnJBkxA+3F3t3vV+gpqcoFlqqFL3aarz6Mr6w
 pnur0rkDv8w2iTsS3TxbbEuGILLnPok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-dOc8XnuPMmmYDtQSkAE68w-1; Tue, 27 Sep 2022 04:19:29 -0400
X-MC-Unique: dOc8XnuPMmmYDtQSkAE68w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD877811E87;
 Tue, 27 Sep 2022 08:19:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3954029A7C;
 Tue, 27 Sep 2022 08:19:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C42BC180099F; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
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
Subject: [PULL 16/24] usbnet: Add missing usb_wakeup() call in usbnet_receive()
Date: Tue, 27 Sep 2022 10:19:04 +0200
Message-Id: <20220927081912.180983-17-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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


