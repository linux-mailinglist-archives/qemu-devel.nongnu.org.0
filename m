Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878C5675FC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:50:21 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mgl-0003kz-S8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o8med-000332-Cz
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o8mea-00051E-TO
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657043283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SSes/FhWI5qBh7kJUMkZm4Cbowh1bM/8HBDqcohlVJ8=;
 b=QslHNloAXRgAai1QSCoxTCwd2IM8K6lBPTB31bkQ/xqINABT1bWb9xJbwiCGYa22O3WoYu
 X7jm3ZJITW5BRIOZ2Wzt5NGIb3pYQ/aoYkqWZ4FO41wuHXUO6EzOkVsJE+WoN1wooKt+CK
 RhxskHaZB7IuxLsZM33iaYVRaqJXPGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-P282z4gUP6mlKeDRVxSQKA-1; Tue, 05 Jul 2022 13:48:00 -0400
X-MC-Unique: P282z4gUP6mlKeDRVxSQKA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A15B802D1C;
 Tue,  5 Jul 2022 17:48:00 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.193.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA75140336E;
 Tue,  5 Jul 2022 17:47:58 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com,
	soulchen8650@gmail.com,
	kraxel@redhat.com
Subject: [PATCH] usb/hcd-xhci: check slotid in xhci_wakeup_endpoint()
Date: Tue,  5 Jul 2022 19:47:34 +0200
Message-Id: <20220705174734.2348829-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This prevents an OOB read (followed by an assertion failure in
xhci_kick_ep) when slotid > xhci->numslots.

Reported-by: Soul Chen <soulchen8650@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/usb/hcd-xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 0cd0a5e540..cecf8a0d96 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3269,7 +3269,8 @@ static void xhci_wakeup_endpoint(USBBus *bus, USBEndpoint *ep,
 
     DPRINTF("%s\n", __func__);
     slotid = ep->dev->addr;
-    if (slotid == 0 || !xhci->slots[slotid-1].enabled) {
+    if (slotid == 0 || slotid > xhci->numslots ||
+        !xhci->slots[slotid-1].enabled) {
         DPRINTF("%s: oops, no slot for dev %d\n", __func__, ep->dev->addr);
         return;
     }
-- 
2.35.3


