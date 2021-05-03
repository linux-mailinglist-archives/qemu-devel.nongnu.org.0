Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C572D371605
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:34:19 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYiI-0008WA-Tv
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdc-0005F1-Et
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYda-0000bF-Ht
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620048566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bsFK+IWf7EJpUXwApvAORdouNb5iE03uH8O2HimJ4M=;
 b=KoWJClprPHvW67on/+I3m/Da7vPsoN7EEcfC3ZVuLyjNtoK8p8hJF7GU7NZz6e73uWMa59
 m41kzxo5QqUtft89U0v9yUBrnpUr1ewI18xbcGq44EbcIuKmP12PM/y6qKqYYDVnc8v5VZ
 wrR03RknNQ2f4ztdKnID9QIMpGdmK/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-sOc2Vn3DPj-mmxiGCaJYbA-1; Mon, 03 May 2021 09:29:24 -0400
X-MC-Unique: sOc2Vn3DPj-mmxiGCaJYbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F15319253C3;
 Mon,  3 May 2021 13:29:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B941001901;
 Mon,  3 May 2021 13:29:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A8B361CEC736; Mon,  3 May 2021 15:29:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
Date: Mon,  3 May 2021 15:29:12 +0200
Message-Id: <20210503132915.2335822-3-kraxel@redhat.com>
In-Reply-To: <20210503132915.2335822-1-kraxel@redhat.com>
References: <20210503132915.2335822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mcascell@redhat.com, remy.noel@blade-group.com, philmd@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead.

Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 17f06f34179a..6a75b0dc4ab2 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
                 .endpoint = ep,
                 .length = p->iov.size
             };
-            uint8_t buf[p->iov.size];
+            g_autofree uint8_t *buf = g_malloc(p->iov.size);
             /* No id, we look at the ep when receiving a status back */
             usb_packet_copy(p, buf, p->iov.size);
             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
         usbredirparser_send_bulk_packet(dev->parser, p->id,
                                         &bulk_packet, NULL, 0);
     } else {
-        uint8_t buf[size];
+        g_autofree uint8_t *buf = g_malloc(size);
         usb_packet_copy(p, buf, size);
         usbredir_log_data(dev, "bulk data out:", buf, size);
         usbredirparser_send_bulk_packet(dev->parser, p->id,
@@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRedirDevice *dev,
                                                USBPacket *p, uint8_t ep)
 {
     struct usb_redir_interrupt_packet_header interrupt_packet;
-    uint8_t buf[p->iov.size];
+    g_autofree uint8_t *buf = g_malloc(p->iov.size);
 
     DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
             p->iov.size, p->id);
-- 
2.30.2


