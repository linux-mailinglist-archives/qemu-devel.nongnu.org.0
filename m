Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014E371609
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:36:14 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYk9-0001Uc-Oz
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdi-0005OG-7b
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdf-0000dt-6T
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620048570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4IuX5mGBxhSoUNBaK2iWkP/sAnynBLyfTGs307GZHs=;
 b=KiOQJ7zHFh8bOuNVodO9qVlt4ERx3HJNiHeZ0+LOGzHXToRHRDpz3h+EAHyDXGRGIvcyEc
 L3bFipdnhBsOj35RjfjkOryWd5qqF2aOiFqKLWNruXbWhcyIDcfFKXKddV93GrdVMe0ilH
 IDNUeybDXJdP0C+5yp5ijR9s/jxlVog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-fzzJx5HsMX6sMFZKHrDENw-1; Mon, 03 May 2021 09:29:27 -0400
X-MC-Unique: fzzJx5HsMX6sMFZKHrDENw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13ECA802E9F;
 Mon,  3 May 2021 13:29:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B96191001901;
 Mon,  3 May 2021 13:29:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE4231CEC738; Mon,  3 May 2021 15:29:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] usb/xhci: sanity check packet size
Date: Mon,  3 May 2021 15:29:14 +0200
Message-Id: <20210503132915.2335822-5-kraxel@redhat.com>
In-Reply-To: <20210503132915.2335822-1-kraxel@redhat.com>
References: <20210503132915.2335822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Make sure the usb packet size is within the
bounds of the endpoint configuration.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 46212b1e695a..7acfb8137bc9 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -1568,6 +1568,11 @@ static int xhci_setup_packet(XHCITransfer *xfer)
         qemu_sglist_destroy(&xfer->sgl);
         return -1;
     }
+    if (xfer->packet.iov.size > ep->max_packet_size) {
+        usb_packet_unmap(&xfer->packet, &xfer->sgl);
+        qemu_sglist_destroy(&xfer->sgl);
+        return -1;
+    }
     DPRINTF("xhci: setup packet pid 0x%x addr %d ep %d\n",
             xfer->packet.pid, ep->dev->addr, ep->nr);
     return 0;
-- 
2.30.2


