Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D65E9FC1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:30:01 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclNA-0003Nz-Su
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpt-0005bX-EZ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpr-0003oO-QT
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHygAolE6RYOc4/xbnRCU9F7GebT834or/LJsscBmN0=;
 b=fXWyDskW04Y4OCpRhPXkncIjumxZL2TOIKIat6JH6iLirHlRUUVLVhZ7y3t92S+7CpQ1AE
 BBJiuTyUVW+EWOXpaNlLT2ErgnpUeHSCl7M5ty11W6LF4OmfkmCcR7TJAJ+4UveBtUdKVR
 DJkrpxC004nNNng2PafT/Nsj9BeUYVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Q0Cd-KKIMiiHNrQehSrvug-1; Mon, 26 Sep 2022 05:55:29 -0400
X-MC-Unique: Q0Cd-KKIMiiHNrQehSrvug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20BA1019C8A;
 Mon, 26 Sep 2022 09:55:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5B41121314;
 Mon, 26 Sep 2022 09:55:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 000CE18030BF; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
Subject: [PULL 18/25] usbnet: Accept mandatory
 USB_CDC_SET_ETHERNET_PACKET_FILTER request
Date: Mon, 26 Sep 2022 11:55:02 +0200
Message-Id: <20220926095509.3759409-19-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


