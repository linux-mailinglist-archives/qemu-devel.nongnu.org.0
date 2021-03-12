Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF2338945
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:53:12 +0100 (CET)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeTn-0000IR-Uw
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKeRM-0006Ww-A1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKeRJ-0004bX-NS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615542636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nQl1t6eUwUrsIVn3S1xYDRTuOjKfyPG5Kx6Cram04iQ=;
 b=YJx0dvOywzjVbZpVjYZGMdQyb7Tyx4Ra8qrNCngn8kIDwP1rT4tiKLPRDaJ1cLpig/lVc5
 EEBhOucKfPUE9KVWPLO+fs7fi5Bhgb2P9xTLeW6Sk7JnCXUj421cWIH3edy81+3KEbANx0
 i2/4ZQTsV6D5JqKObiBDXzlO+7kEZ5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-XlRD8G7KMSyyifPelSjeNQ-1; Fri, 12 Mar 2021 04:50:32 -0500
X-MC-Unique: XlRD8G7KMSyyifPelSjeNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5BE1862C7F
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:49:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AA85DAA5;
 Fri, 12 Mar 2021 09:49:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19B7318000B4; Fri, 12 Mar 2021 10:49:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb/storage: clear csw on reset
Date: Fri, 12 Mar 2021 10:49:54 +0100
Message-Id: <20210312094954.796799-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stale data in csw (specifically residue) can confuse the state machine
and allows the guest trigger an assert().  So clear csw on reset to
avoid this happening in case the guest resets the device in the middle
of a request.

Buglink: https://bugs.launchpad.net/qemu/+bug/1523811
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-storage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index a5f76fc00120..fd4ea818115c 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -352,6 +352,7 @@ static void usb_msd_handle_reset(USBDevice *dev)
         usb_msd_packet_complete(s);
     }
 
+    memset(&s->csw, 0, sizeof(s->csw));
     s->mode = USB_MSDM_CBW;
 }
 
-- 
2.29.2


