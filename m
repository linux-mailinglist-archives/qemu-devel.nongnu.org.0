Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7A253245
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 16:54:02 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAwoL-0008Ug-IC
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 10:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAwnD-0006cs-3T
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:52:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAwnB-0008KO-2t
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598453567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9130wMPdkUNf8DYOJXaIxhe8PFcuZwIUBzhp+qLksQ=;
 b=idleSIvNfHuXqRKpeAu/MrrEvkKkS3n7K+YDJh9KxlJwXrKzgK8lLMej3aWSL3r7R7pS/U
 auWIKZgvoHbBMXukFqT23Q75Z4eaEbBAdfO8XCaIqHHLNdLWGASO70jrOjxHnD2BeDEUVs
 5VsPw+Tj3UgpEHeLDgUILe5M1Oi05W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-gsWpMXinMaCH5mmiAagWMA-1; Wed, 26 Aug 2020 10:52:45 -0400
X-MC-Unique: gsWpMXinMaCH5mmiAagWMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED5CE81F027;
 Wed, 26 Aug 2020 14:52:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A20316111F;
 Wed, 26 Aug 2020 14:52:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB1AD204AD; Wed, 26 Aug 2020 16:52:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] hw: ehci: check return value of 'usb_packet_map'
Date: Wed, 26 Aug 2020 16:52:24 +0200
Message-Id: <20200826145239.6077-4-kraxel@redhat.com>
In-Reply-To: <20200826145239.6077-1-kraxel@redhat.com>
References: <20200826145239.6077-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

If 'usb_packet_map' fails, we should stop to process the usb
request.

Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20200812161727.29412-1-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 58cceacbf83a..4da446d2de6b 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1373,7 +1373,10 @@ static int ehci_execute(EHCIPacket *p, const char *action)
         spd = (p->pid == USB_TOKEN_IN && NLPTR_TBIT(p->qtd.altnext) == 0);
         usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
                          (p->qtd.token & QTD_TOKEN_IOC) != 0);
-        usb_packet_map(&p->packet, &p->sgl);
+        if (usb_packet_map(&p->packet, &p->sgl)) {
+            qemu_sglist_destroy(&p->sgl);
+            return -1;
+        }
         p->async = EHCI_ASYNC_INITIALIZED;
     }
 
@@ -1453,7 +1456,10 @@ static int ehci_process_itd(EHCIState *ehci,
             if (ep && ep->type == USB_ENDPOINT_XFER_ISOC) {
                 usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
                                  (itd->transact[i] & ITD_XACT_IOC) != 0);
-                usb_packet_map(&ehci->ipacket, &ehci->isgl);
+                if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
+                    qemu_sglist_destroy(&ehci->isgl);
+                    return -1;
+                }
                 usb_handle_packet(dev, &ehci->ipacket);
                 usb_packet_unmap(&ehci->ipacket, &ehci->isgl);
             } else {
-- 
2.27.0


