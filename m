Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF87221FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 11:33:06 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw0GH-0007jA-N2
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 05:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jw0Em-0006V1-Jt
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:31:33 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40999
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jw0Ek-0002O7-9z
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594891889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=xpw21qTBJLA79feXZS9EUbIVuYnMfN2TKpTwC+BcZ+U=;
 b=g7d+VTUCKcvOq95fRCpRGx9gVccQCf8LSK3XoTggNglhkLeF1XwbsZsjVtzFvy5751N/dg
 SZHeby0+Fv55X2p359wWTRylXFVE4m32e9p8JtCrRQcOxuz657q3FWYPRL+SlVt24l/R9p
 yMB4s3P/tG5NnRaxW/PINpI81vEOaPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-I_7V7rucOty1_6RrLULUlQ-1; Thu, 16 Jul 2020 05:31:27 -0400
X-MC-Unique: I_7V7rucOty1_6RrLULUlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A161C1009441
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 09:31:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9F978482;
 Thu, 16 Jul 2020 09:31:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B96A89D57; Thu, 16 Jul 2020 11:31:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] usb: fix storage regression
Date: Thu, 16 Jul 2020 11:31:19 +0200
Message-Id: <20200716093119.10740-3-kraxel@redhat.com>
In-Reply-To: <20200716093119.10740-1-kraxel@redhat.com>
References: <20200716093119.10740-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 01:59:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the contition to figure whenever we need to wait for more data or
not.  Simply check the mode, if we are not in DATAIN state any more we
are done already and don't need to go ASYNC.

Fixes: 7ad3d51ebb8a ("usb: add short-packet handling to usb-storage driver")
Reported-by: Sai Pavan Boddu <saipava@xilinx.com>
Tested-by: Paul Zimmerman <pauldzim@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200713062712.1476-1-kraxel@redhat.com
---
 hw/usb/dev-storage.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 2ed6a8df2413..405a4ccfe700 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -546,8 +546,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                     }
                 }
             }
-            if (p->actual_length < p->iov.size && (p->short_not_ok ||
-                    s->scsi_len >= p->ep->max_packet_size)) {
+            if (p->actual_length < p->iov.size && s->mode == USB_MSDM_DATAIN) {
                 DPRINTF("Deferring packet %p [wait data-in]\n", p);
                 s->packet = p;
                 p->status = USB_RET_ASYNC;
-- 
2.18.4


