Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C50258768
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 07:28:45 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCyqa-0002xO-Cj
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 01:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCypQ-0001v1-ME
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 01:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCypP-0003cp-4z
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 01:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598938049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BL8Aqvo9SQcWthpE9Q6Sm6pUFQZGumuRkdIhDFe+1t0=;
 b=gOuh2gZ6u5NUZJEZhI5SL6jS6LHmQcX5H5WZ3lNXINbBhY9RgMz510V0/LdC7xSKJDvzG8
 lxoLh8psyyI6feu2W8Uo0cqFUyX2i9ssnEeZ1Risx0EJUItKkYas9icKGZoQ2G/VS00yWm
 9AwY7k37ZjLvQ3krLsr63bwPJgrtD70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-scOTXo5RN2mw6ICuqP87kQ-1; Tue, 01 Sep 2020 01:27:27 -0400
X-MC-Unique: scOTXo5RN2mw6ICuqP87kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16C8F873085
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 05:27:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2597EB89;
 Tue,  1 Sep 2020 05:27:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30018364E; Tue,  1 Sep 2020 07:27:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: call usb_packet_cleanup on usb_packet_map failure
Date: Tue,  1 Sep 2020 07:27:23 +0200
Message-Id: <20200901052723.15492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 01:27:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 2 ++
 hw/usb/hcd-xhci.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 2b995443fbfd..67847a9cf5f1 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1373,6 +1373,7 @@ static int ehci_execute(EHCIPacket *p, const char *action)
         usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
                          (p->qtd.token & QTD_TOKEN_IOC) != 0);
         if (usb_packet_map(&p->packet, &p->sgl)) {
+            usb_packet_cleanup(&p->packet);
             qemu_sglist_destroy(&p->sgl);
             return -1;
         }
@@ -1456,6 +1457,7 @@ static int ehci_process_itd(EHCIState *ehci,
                 usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
                                  (itd->transact[i] & ITD_XACT_IOC) != 0);
                 if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
+                    usb_packet_cleanup(&ehci->ipacket);
                     qemu_sglist_destroy(&ehci->isgl);
                     return -1;
                 }
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 46a2186d912a..9b156048920d 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -1616,6 +1616,7 @@ static int xhci_setup_packet(XHCITransfer *xfer)
     usb_packet_setup(&xfer->packet, dir, ep, xfer->streamid,
                      xfer->trbs[0].addr, false, xfer->int_req);
     if (usb_packet_map(&xfer->packet, &xfer->sgl)) {
+        usb_packet_cleanup(&xfer->packet);
         qemu_sglist_destroy(&xfer->sgl);
         return -1;
     }
-- 
2.27.0


