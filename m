Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E555457A2EA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:26:00 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp6m-0004gD-1k
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3O-0007lo-1p
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3M-0001ix-LF
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATsz0dGVqoZQl4jXAXxTKAK7WOjwaEqkNxAMMc8R5lI=;
 b=cuGULBDVLcK99TcbJ9tiBuIJT4wVrBVZO5er3xQJEKei8MOd7uVrXr2rIckTNJZcWnakOC
 XTomiSOqiWCqEbV+dTFS74rXjErsICiMnhbfIbhN571yn4GUTvEl5ZEhHKuVWIBiImO7io
 2jJnht1fez+TXWXEIP18eiRhFqYBWdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-bVDjiFY_MmKkieDzgyDrhA-1; Tue, 19 Jul 2022 11:22:24 -0400
X-MC-Unique: bVDjiFY_MmKkieDzgyDrhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80E0885A5B9;
 Tue, 19 Jul 2022 15:22:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39958C1D3AD;
 Tue, 19 Jul 2022 15:22:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8B88180060F; Tue, 19 Jul 2022 17:22:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Soul Chen <soulchen8650@gmail.com>
Subject: [PULL 3/6] usb/hcd-xhci: check slotid in xhci_wakeup_endpoint()
Date: Tue, 19 Jul 2022 17:22:15 +0200
Message-Id: <20220719152218.825707-4-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
References: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mauro Matteo Cascella <mcascell@redhat.com>

This prevents an OOB read (followed by an assertion failure in
xhci_kick_ep) when slotid > xhci->numslots.

Reported-by: Soul Chen <soulchen8650@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Message-Id: <20220705174734.2348829-1-mcascell@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 0cd0a5e54027..296cc6c8e694 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3269,7 +3269,8 @@ static void xhci_wakeup_endpoint(USBBus *bus, USBEndpoint *ep,
 
     DPRINTF("%s\n", __func__);
     slotid = ep->dev->addr;
-    if (slotid == 0 || !xhci->slots[slotid-1].enabled) {
+    if (slotid == 0 || slotid > xhci->numslots ||
+        !xhci->slots[slotid - 1].enabled) {
         DPRINTF("%s: oops, no slot for dev %d\n", __func__, ep->dev->addr);
         return;
     }
-- 
2.36.1


