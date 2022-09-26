Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E995EA016
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:34:08 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclR9-0005vp-Vs
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpl-0005AR-Aa
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpj-0003mF-JW
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HDfviZSfHd3D4yIqWD1Q45/1mV83e9iQ7imYYzYACY=;
 b=Bgz9nJ3ycpeJNYxkLuDbP23v03gVDqFA5L739kBVXH+C6YVVQr8+tPl2CUMKIAQm3q/8Ta
 hUqv7F9qUPipDrwguPmNB17mU5rJAYU+E9PQPszGZBmq03fZD2IwByI5khJ0FkcpcouliY
 Uk8mpqTS9DtAuPvheCRGf07JUPNdu9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-zQH11h1UPD6TI4H3E9QFDg-1; Mon, 26 Sep 2022 05:55:23 -0400
X-MC-Unique: zQH11h1UPD6TI4H3E9QFDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F07D101A52A;
 Mon, 26 Sep 2022 09:55:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0C32084837;
 Mon, 26 Sep 2022 09:55:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A90D518030B7; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
 Qiang Liu <cyruscyliu@gmail.com>
Subject: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root hubs
Date: Mon, 26 Sep 2022 11:54:57 +0200
Message-Id: <20220926095509.3759409-14-kraxel@redhat.com>
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

From: Qiang Liu <cyruscyliu@gmail.com>

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
Message-Id: <20220830033022.1164961-1-cyruscyliu@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 72bdde92617c..28d703481515 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1436,7 +1436,7 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
 
     if (ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PRS)) {
         trace_usb_ohci_port_reset(portnum);
-        usb_device_reset(port->port.dev);
+        usb_port_reset(&port->port);
         port->ctrl &= ~OHCI_PORT_PRS;
         /* ??? Should this also set OHCI_PORT_PESC.  */
         port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
-- 
2.37.3


