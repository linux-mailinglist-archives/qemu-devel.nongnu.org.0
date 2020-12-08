Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3C2D2A3B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:04:58 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbjl-0006ll-AT
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcv-0001Yg-Sd
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcs-000554-KM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1C2QM1Xu65wcBQ76oYf5uh/7oLC1B5FQ0LON5pl4M74=;
 b=IpGJXKMDn37wJyTqeMA2sbMCNDGLUqID6xmKj9uqMLFu/rolpkF12d8TwMeV19edGzdmFO
 nsyY3d7ow+DRn0boIc2YP3w45pHzljoJ6JErmoeCBpNC7M4/tmnmr/GLGT1ejBkkIoPQMr
 7OzX9oue9V3REYpXFl1gtwdbCp5b6bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-euV43QtjPHawvTPFwMocmg-1; Tue, 08 Dec 2020 06:57:45 -0500
X-MC-Unique: euV43QtjPHawvTPFwMocmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84FFA107ACE4
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C3385D9DE;
 Tue,  8 Dec 2020 11:57:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5BA9A9D9C; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] vnc: add alpha cursor support
Date: Tue,  8 Dec 2020 12:57:34 +0100
Message-Id: <20201208115737.18581-7-kraxel@redhat.com>
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

There is a new vnc extension for cursors with an alpha channel.  Use
it if supported by the vnc client, prefer it over the "rich cursor"
extension which supports only a bitmask for transparency.

This is a visible improvement especially on modern desktops which
actually use the alpha channel when defining cursors.

https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#cursor-with-alpha-pseudo-encoding

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.h |  2 ++
 ui/vnc.c | 21 ++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.h b/ui/vnc.h
index 6f5006da3593..c8d3ad9ec496 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -448,6 +448,7 @@ enum VncFeatures {
     VNC_FEATURE_TIGHT,
     VNC_FEATURE_ZLIB,
     VNC_FEATURE_RICH_CURSOR,
+    VNC_FEATURE_ALPHA_CURSOR,
     VNC_FEATURE_TIGHT_PNG,
     VNC_FEATURE_ZRLE,
     VNC_FEATURE_ZYWRLE,
@@ -461,6 +462,7 @@ enum VncFeatures {
 #define VNC_FEATURE_TIGHT_MASK               (1 << VNC_FEATURE_TIGHT)
 #define VNC_FEATURE_ZLIB_MASK                (1 << VNC_FEATURE_ZLIB)
 #define VNC_FEATURE_RICH_CURSOR_MASK         (1 << VNC_FEATURE_RICH_CURSOR)
+#define VNC_FEATURE_ALPHA_CURSOR_MASK        (1 << VNC_FEATURE_ALPHA_CURSOR)
 #define VNC_FEATURE_TIGHT_PNG_MASK           (1 << VNC_FEATURE_TIGHT_PNG)
 #define VNC_FEATURE_ZRLE_MASK                (1 << VNC_FEATURE_ZRLE)
 #define VNC_FEATURE_ZYWRLE_MASK              (1 << VNC_FEATURE_ZYWRLE)
diff --git a/ui/vnc.c b/ui/vnc.c
index 8c2771c1ce3b..247e80d8f5c8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -937,6 +937,18 @@ static int vnc_cursor_define(VncState *vs)
     QEMUCursor *c = vs->vd->cursor;
     int isize;
 
+    if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
+        vnc_lock_output(vs);
+        vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
+        vnc_write_u8(vs,  0);  /*  padding     */
+        vnc_write_u16(vs, 1);  /*  # of rects  */
+        vnc_framebuffer_update(vs, c->hot_x, c->hot_y, c->width, c->height,
+                               VNC_ENCODING_ALPHA_CURSOR);
+        vnc_write_s32(vs, VNC_ENCODING_RAW);
+        vnc_write(vs, c->data, c->width * c->height * 4);
+        vnc_unlock_output(vs);
+        return 0;
+    }
     if (vnc_has_feature(vs, VNC_FEATURE_RICH_CURSOR)) {
         vnc_lock_output(vs);
         vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
@@ -2102,9 +2114,9 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
         case VNC_ENCODING_RICH_CURSOR:
             vs->features |= VNC_FEATURE_RICH_CURSOR_MASK;
-            if (vs->vd->cursor) {
-                vnc_cursor_define(vs);
-            }
+            break;
+        case VNC_ENCODING_ALPHA_CURSOR:
+            vs->features |= VNC_FEATURE_ALPHA_CURSOR_MASK;
             break;
         case VNC_ENCODING_EXT_KEY_EVENT:
             send_ext_key_event_ack(vs);
@@ -2134,6 +2146,9 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
     vnc_desktop_resize(vs);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
     vnc_led_state_change(vs);
+    if (vs->vd->cursor) {
+        vnc_cursor_define(vs);
+    }
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.27.0


