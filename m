Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F0F2D2A4A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:07:48 +0100 (CET)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbmV-0001wN-5y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcs-0001Tb-KD
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcq-00053J-Jj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqLCWZ1hH6EEOkWtPWWKS2elKGGSNaTpcMn8cf0h7t4=;
 b=dxxAE02Rj8qrOVKJEMWsa5HGIqUjVSoC5z+yDR3BQ+7s55PRUeCosw0gtPtnuqLSlQ3nUq
 mOiPK0SfICM/dL65AOzkMynjGeroHR/zTFQRqlVFgP0OiUsmKn6L4FrBEV3GmQeqtZiobu
 HDpqqbtmGDkmMDiGmRFdFUB4FKx2nsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-kJ2RvKLrNimURMtaBQta0A-1; Tue, 08 Dec 2020 06:57:45 -0500
X-MC-Unique: kJ2RvKLrNimURMtaBQta0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDEE800D53
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 651CB5D9E4;
 Tue,  8 Dec 2020 11:57:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7808A9D9F; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] vnc: move check into vnc_cursor_define
Date: Tue,  8 Dec 2020 12:57:37 +0100
Message-Id: <20201208115737.18581-10-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-1-kraxel@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the check whenever a cursor exists into the vnc_cursor_define()
function so callers don't have to do it.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 094ba6cd14cb..1f7dc545db7c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -833,9 +833,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
     QTAILQ_FOREACH(vs, &vd->clients, next) {
         vnc_colordepth(vs);
         vnc_desktop_resize(vs, false);
-        if (vs->vd->cursor) {
-            vnc_cursor_define(vs);
-        }
+        vnc_cursor_define(vs);
         memset(vs->dirty, 0x00, sizeof(vs->dirty));
         vnc_set_area_dirty(vs->dirty, vd, 0, 0,
                            vnc_width(vd),
@@ -969,6 +967,10 @@ static int vnc_cursor_define(VncState *vs)
     QEMUCursor *c = vs->vd->cursor;
     int isize;
 
+    if (!vs->vd->cursor) {
+        return -1;
+    }
+
     if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
         vnc_lock_output(vs);
         vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
@@ -2181,9 +2183,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
     vnc_desktop_resize(vs, true);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
     vnc_led_state_change(vs);
-    if (vs->vd->cursor) {
-        vnc_cursor_define(vs);
-    }
+    vnc_cursor_define(vs);
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.27.0


