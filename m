Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE74DDB72
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:20:01 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDSS-0000Sv-Cs
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:20:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5v-00061x-Pc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5t-000851-3W
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647611800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MzvIXUJxWVCA7yJGbPBHTqLRj5aTTpJZZ60DT+fCw0=;
 b=AHmt7GPy8uSWsCk6YVQZfoKfhLwlCcIqLmBz/z4WJRByUunvYkEtqVr7K4yAtsdj63649E
 U7IsyImIKgGeRqsEPs86+TgNAqNQz6stpyJjoO5YmByIaHWr/2fPcqID4CVA2nOdMb8Rcn
 VshOGsO1+plAHUY0RFYslDu6KTq8Eqo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-tpJOjEz9NhqsIE3888ALdQ-1; Fri, 18 Mar 2022 09:56:38 -0400
X-MC-Unique: tpJOjEz9NhqsIE3888ALdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE5E296A61D;
 Fri, 18 Mar 2022 13:56:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B67A401E87;
 Fri, 18 Mar 2022 13:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24C49180039C; Fri, 18 Mar 2022 14:56:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] ui: avoid unnecessary memory operations in
 vnc_refresh_server_surface()
Date: Fri, 18 Mar 2022 14:56:30 +0100
Message-Id: <20220318135634.2851040-3-kraxel@redhat.com>
In-Reply-To: <20220318135634.2851040-1-kraxel@redhat.com>
References: <20220318135634.2851040-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Lu Gao <lu.gao@verisilicon.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>

Check the dirty bits in advance to avoid unnecessary memory operations.
In the case that guest surface has different format than the server,
but it does not have dirty bits which means no refresh is actually needed,
the memory operations is not necessary.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <4C23C17B8E87E74E906A25A3254A03F4FA22100C@SHASXM06.verisilicon.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedcc8..310a873c2184 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3098,6 +3098,9 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
     VncState *vs;
     int has_dirty = 0;
     pixman_image_t *tmpbuf = NULL;
+    unsigned long offset;
+    int x;
+    uint8_t *guest_ptr, *server_ptr;
 
     struct timeval tv = { 0, 0 };
 
@@ -3106,6 +3109,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
         has_dirty = vnc_update_stats(vd, &tv);
     }
 
+    offset = find_next_bit((unsigned long *) &vd->guest.dirty,
+                           height * VNC_DIRTY_BPL(&vd->guest), 0);
+    if (offset == height * VNC_DIRTY_BPL(&vd->guest)) {
+        /* no dirty bits in guest surface */
+        return has_dirty;
+    }
+
     /*
      * Walk through the guest dirty map.
      * Check and copy modified bits from guest to server surface.
@@ -3130,15 +3140,6 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
     line_bytes = MIN(server_stride, guest_ll);
 
     for (;;) {
-        int x;
-        uint8_t *guest_ptr, *server_ptr;
-        unsigned long offset = find_next_bit((unsigned long *) &vd->guest.dirty,
-                                             height * VNC_DIRTY_BPL(&vd->guest),
-                                             y * VNC_DIRTY_BPL(&vd->guest));
-        if (offset == height * VNC_DIRTY_BPL(&vd->guest)) {
-            /* no more dirty bits */
-            break;
-        }
         y = offset / VNC_DIRTY_BPL(&vd->guest);
         x = offset % VNC_DIRTY_BPL(&vd->guest);
 
@@ -3177,6 +3178,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
         }
 
         y++;
+        offset = find_next_bit((unsigned long *) &vd->guest.dirty,
+                               height * VNC_DIRTY_BPL(&vd->guest),
+                               y * VNC_DIRTY_BPL(&vd->guest));
+        if (offset == height * VNC_DIRTY_BPL(&vd->guest)) {
+            /* no more dirty bits */
+            break;
+        }
     }
     qemu_pixman_image_unref(tmpbuf);
     return has_dirty;
-- 
2.35.1


