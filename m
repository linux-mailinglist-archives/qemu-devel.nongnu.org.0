Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D197C694E43
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcpZ-0003ee-Qr; Mon, 13 Feb 2023 12:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pRcpX-0003eV-34
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pRcpU-0007Ms-Mr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676310087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BvY4zgEB8OftJv+2jHv8qui2lBTfZZcHg6u/DZaQs0g=;
 b=RPp8EXoJ6n7477w5ya4Oe99FzcFjKJZShIU7YnZLIGCzN++TsB7a0foPIYZXuapXZ69Dpr
 IUq0mCKoLIhW94b8vOSZsl2T/gQne+ZP/b0/pQGpIMVoDaD1otC2B2S+o9slYlbgs7XwtE
 E5fHEiRnXRyMwQVOF/Kh5DPakPzGbj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-nugUuWHdM_SljrPmR1VGog-1; Mon, 13 Feb 2023 12:41:22 -0500
X-MC-Unique: nugUuWHdM_SljrPmR1VGog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433DF86C169
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 17:41:21 +0000 (UTC)
Received: from f37-work.redhat.com (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 917BE492B03;
 Mon, 13 Feb 2023 17:41:20 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com,
	kraxel@redhat.com
Subject: [PATCH] usb/dev-wacom: fix OOB write in usb_mouse_poll()
Date: Mon, 13 Feb 2023 18:41:13 +0100
Message-Id: <20230213174113.591632-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The guest can control the size of buf; an OOB write occurs when buf is 1 or 2
bytes long. Only fill in the buffer as long as there is enough space, throw
away any data which doesn't fit.

Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/usb/dev-wacom.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 7177c17f03..ca9e6aa82f 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -252,14 +252,20 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t *buf, int len)
     if (s->buttons_state & MOUSE_EVENT_MBUTTON)
         b |= 0x04;
 
-    buf[0] = b;
-    buf[1] = dx;
-    buf[2] = dy;
-    l = 3;
-    if (len >= 4) {
-        buf[3] = dz;
-        l = 4;
+    l = 0;
+    if (len > l) {
+        buf[l++] = b;
     }
+    if (len > l) {
+        buf[l++] = dx;
+    }
+    if (len > l) {
+        buf[l++] = dy;
+    }
+    if (len > l) {
+        buf[l++] = dz;
+    }
+
     return l;
 }
 
-- 
2.39.1


