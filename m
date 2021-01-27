Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C00305924
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:05:56 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ie3-0007Wi-2r
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZp-0004x1-DQ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZe-000633-NX
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611745281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqChRlwoyCKZcMZdZTh9s5zJER3HdtpESp5WGeug//g=;
 b=OL6uc9yv0KviMNlqQ13n2ImbjaI0MUE2bq3BvdZuCFS26Wc4VFcds9loA3lhbpgi3Dm/F8
 xdiDDvsvt7Djtki1S8SPSBgp8BxNE24nGXgCSmvf0mXCNP7XxX7cRL4AdIcoVR3XIVoqy5
 ADSce8ZLY4En45noXDKz01al482iZRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-b6l-9pW2NfKMZesSVZH4CQ-1; Wed, 27 Jan 2021 06:01:19 -0500
X-MC-Unique: b6l-9pW2NfKMZesSVZH4CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D97D107ACE6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:01:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F239E5D9D5;
 Wed, 27 Jan 2021 11:01:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 12996180039B; Wed, 27 Jan 2021 12:01:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] Revert "vnc: move initialization to
 framebuffer_update_request"
Date: Wed, 27 Jan 2021 12:01:10 +0100
Message-Id: <20210127110113.2111855-2-kraxel@redhat.com>
In-Reply-To: <20210127110113.2111855-1-kraxel@redhat.com>
References: <20210127110113.2111855-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 9e1632ad07ca49de99da4bb231e9e2f22f2d8df5.

Older gtk-vnc versions can't deal with non-incremental update
requests sending pseudo-encodings, so trying to send full server
state (including desktop size, cursor etc. which is done using
pseudo-encodings) doesn't fly.  Return to old behavior to send
those only for new connects and when changes happen.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20210125104041.495274-2-kraxel@redhat.com>
---
 ui/vnc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 66f7c1b9361e..2622f82a5a9f 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -687,6 +687,10 @@ static void vnc_desktop_resize(VncState *vs)
                             !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {
         return;
     }
+    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
+        vs->client_height == pixman_image_get_height(vs->vd->server)) {
+        return;
+    }
 
     assert(pixman_image_get_width(vs->vd->server) < 65536 &&
            pixman_image_get_width(vs->vd->server) >= 0);
@@ -2042,10 +2046,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
-        vnc_colordepth(vs);
-        vnc_desktop_resize(vs);
-        vnc_led_state_change(vs);
-        vnc_cursor_define(vs);
     }
 }
 
@@ -2189,7 +2189,10 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
         }
     }
+    vnc_desktop_resize(vs);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
+    vnc_led_state_change(vs);
+    vnc_cursor_define(vs);
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.29.2


