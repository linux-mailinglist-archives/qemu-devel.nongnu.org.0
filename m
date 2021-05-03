Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AD3712E2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:18:12 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUiP-0000bd-LE
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUfR-0007AY-RL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUfJ-0005s6-SH
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620033296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+kn36yzDj2aAGJU7413F9zeXmChHR7E1UMXemfongQ=;
 b=hQsQAG9qvDIy2hrXqLczGE7vaU96iN3mrTjyKKb2c3H91zxMGewekKZ9cT22U6CU8b4QFP
 4idnNVZ8c8UOoOcKKonFm1d7T8bn4gGK+GODAH5mDlCLQgO9+I2XFWm5d27F/7vhwBraO9
 TBLvsT7fcEHFYjj28G1KOQZS0ndwqRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-cMpoU8uCN1iiREEkB0c6zw-1; Mon, 03 May 2021 05:14:55 -0400
X-MC-Unique: cMpoU8uCN1iiREEkB0c6zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 669CC801AC9;
 Mon,  3 May 2021 09:14:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A58F5D736;
 Mon,  3 May 2021 09:14:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8FE52180063D; Mon,  3 May 2021 11:14:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
Date: Mon,  3 May 2021 11:14:43 +0200
Message-Id: <20210503091446.2137206-3-kraxel@redhat.com>
In-Reply-To: <20210503091446.2137206-1-kraxel@redhat.com>
References: <20210503091446.2137206-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 17f06f34179a..db1a89a7cc92 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
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


