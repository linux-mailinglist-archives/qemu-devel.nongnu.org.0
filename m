Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4BD5EBDBB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:48:08 +0200 (CEST)
Received: from localhost ([::1]:48396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6G6-00080v-Sa
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5p8-0006Kv-Mx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5p7-0000Ze-Ag
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHygAolE6RYOc4/xbnRCU9F7GebT834or/LJsscBmN0=;
 b=FxdtbkarLRNKXuHnRJxk3FNWw8TdFC30SVuDQTdIHLpyKSfD/g9mSydQ3gUMdp9X4SRQf9
 gooh9azeb/p1Bi9ER8rz8SMzr7qHM01eaDAmEZXD1dF0fCeCF3fINkEAkovGPVdEBSC5//
 +6CfCrY6IkfUCPmou5nAS2Ja/03ienw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-j3sHi4HkMFq-RZaklqgowQ-1; Tue, 27 Sep 2022 04:20:08 -0400
X-MC-Unique: j3sHi4HkMFq-RZaklqgowQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B478D1E68194;
 Tue, 27 Sep 2022 08:20:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6BB4111E414;
 Tue, 27 Sep 2022 08:19:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D0CB818009A4; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
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
Subject: [PULL 17/24] usbnet: Accept mandatory
 USB_CDC_SET_ETHERNET_PACKET_FILTER request
Date: Tue, 27 Sep 2022 10:19:05 +0200
Message-Id: <20220927081912.180983-18-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

The USB_CDC_SET_ETHERNET_PACKET_FILTER request is mandatory for
CDC-ECM devices.  Accept this request, ignoring the actual filter
value (to match the existing behaviour for RNDIS).

Signed-off-by: Michael Brown <mcb30@ipxe.org>
Message-Id: <20220906183053.3625472-3-mcb30@ipxe.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-network.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 61bf598870cb..155df935cd68 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1122,6 +1122,12 @@ static void usb_net_handle_control(USBDevice *dev, USBPacket *p,
 #endif
         break;
 
+    case ClassInterfaceOutRequest | USB_CDC_SET_ETHERNET_PACKET_FILTER:
+        if (is_rndis(s)) {
+            goto fail;
+        }
+        break;
+
     default:
     fail:
         fprintf(stderr, "usbnet: failed control transaction: "
-- 
2.37.3


