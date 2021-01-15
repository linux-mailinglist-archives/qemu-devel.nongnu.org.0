Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DF2F76BD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:33:59 +0100 (CET)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MQY-0004vh-Pw
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHa-0003A4-8k
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHY-0007w9-MF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFehVGefFU0nz09U9T1DXqix/akxYDtGmT4nMAfVuVg=;
 b=Kh7tcumhZIR/BlyI8VdrDMpv9TMZgtMg7sNvZcM6x8ZRbre6O1jynpVv/ay1xx7GLeqyZy
 d42MekxPa8Gh1n3AtB7EQJbaRXrpSOElHan25P2gfVGt1ASQta9rQvMomh2RmLDoPgCpNH
 Ae43VHmlUAnWr6d73kHZIAkUlsGKql4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-i09v4G3RMTybzFfGjff6mQ-1; Fri, 15 Jan 2021 05:24:37 -0500
X-MC-Unique: i09v4G3RMTybzFfGjff6mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6CC180A092
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:24:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFEC5C1A3;
 Fri, 15 Jan 2021 10:24:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF6F4180063F; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] vnc: move check into vnc_cursor_define
Date: Fri, 15 Jan 2021 11:24:22 +0100
Message-Id: <20210115102424.1360437-10-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the check whenever a cursor exists into the vnc_cursor_define()
function so callers don't have to do it.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210112134120.2031837-2-kraxel@redhat.com
---
 ui/vnc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index d4854d351bac..0f01481cac57 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -793,9 +793,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
     QTAILQ_FOREACH(vs, &vd->clients, next) {
         vnc_colordepth(vs);
         vnc_desktop_resize(vs);
-        if (vs->vd->cursor) {
-            vnc_cursor_define(vs);
-        }
+        vnc_cursor_define(vs);
         memset(vs->dirty, 0x00, sizeof(vs->dirty));
         vnc_set_area_dirty(vs->dirty, vd, 0, 0,
                            vnc_width(vd),
@@ -929,6 +927,10 @@ static int vnc_cursor_define(VncState *vs)
     QEMUCursor *c = vs->vd->cursor;
     int isize;
 
+    if (!vs->vd->cursor) {
+        return -1;
+    }
+
     if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
         vnc_lock_output(vs);
         vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
@@ -2155,9 +2157,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
     vnc_desktop_resize(vs);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
     vnc_led_state_change(vs);
-    if (vs->vd->cursor) {
-        vnc_cursor_define(vs);
-    }
+    vnc_cursor_define(vs);
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.29.2


