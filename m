Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B922F31E9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:44:04 +0100 (CET)
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJxr-0003ei-5g
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvS-0002O9-MS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvR-0004Sp-3A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610458892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjkxtZHzed+I3lv7WlWTlSHPlWZGfm1m8qpmOsPFg1o=;
 b=eXqg3jOE5eYL3E4JmhiFP6rpn6jdZ6Ca1x/dqqhMRXiHS7k7obb6tFH7mo9p/2JkTPRXMN
 Xb4Kem+EGly5dLmhSdUM6b9/o5CvnbWCtGDtizMddpoiw6WO8PzSso5HO6MuSzSv7Ozt8n
 h1/4mSMbdUUht07fgjtC/UsfMVzTrQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-6nf6WuBvOlqdJL3-Oi8ERA-1; Tue, 12 Jan 2021 08:41:30 -0500
X-MC-Unique: 6nf6WuBvOlqdJL3-Oi8ERA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C261C800479
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:41:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 929D75DA2E;
 Tue, 12 Jan 2021 13:41:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C275C18000A7; Tue, 12 Jan 2021 14:41:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] vnc: move check into vnc_cursor_define
Date: Tue, 12 Jan 2021 14:41:18 +0100
Message-Id: <20210112134120.2031837-2-kraxel@redhat.com>
In-Reply-To: <20210112134120.2031837-1-kraxel@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 7452ac7df2ce..84c4972b895b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -792,9 +792,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
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
@@ -928,6 +926,10 @@ static int vnc_cursor_define(VncState *vs)
     QEMUCursor *c = vs->vd->cursor;
     int isize;
 
+    if (!vs->vd->cursor) {
+        return -1;
+    }
+
     if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
         vnc_lock_output(vs);
         vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
@@ -2137,9 +2139,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
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


