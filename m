Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DE2F31EA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:44:31 +0100 (CET)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJyI-0004hT-31
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvS-0002NU-8V
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvP-0004RJ-JO
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610458889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPLAXC6aaQJUHIPBk5HHgn4lxB/4Nt8pLP7B3Gjgy8c=;
 b=L/WFIte8u8RR13sc/yscxgXVBagdhbAGaPMEOEkT+LQj32q7fjjXwLYbmQ/LMKJ7NQnD5k
 RuCreRcZq9jeAREHvzqHnUsGOJWuwtDnluzXXPhivWAHPZ4wYknKI3TmVeZcRgrouGf4Ut
 uAKApQ30kNNUIXxqymtxcSrSG+xqKJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-kwOvCKjKMFeSpjQGP9G-xA-1; Tue, 12 Jan 2021 08:41:27 -0500
X-MC-Unique: kwOvCKjKMFeSpjQGP9G-xA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C94F8144FD
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:41:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 934485DA30;
 Tue, 12 Jan 2021 13:41:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CD92C1800604; Tue, 12 Jan 2021 14:41:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] vnc: move initialization to framebuffer_update_request
Date: Tue, 12 Jan 2021 14:41:19 +0100
Message-Id: <20210112134120.2031837-3-kraxel@redhat.com>
In-Reply-To: <20210112134120.2031837-1-kraxel@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

qemu sends various state info like current cursor shape to newly connected
clients in response to a set_encoding message.  This is not correct according
to the rfb spec.  Send that information in response to a full (incremental=0)
framebuffer update request instead.  Also send the resize information
unconditionally, not only in case of an actual server-side change.

This makes the qemu vnc server conform to the spec and allows clients to
request the complete vnc server state without reconnect.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 84c4972b895b..8df63b349b38 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -660,10 +660,6 @@ static void vnc_desktop_resize(VncState *vs)
     if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
         return;
     }
-    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
-        vs->client_height == pixman_image_get_height(vs->vd->server)) {
-        return;
-    }
 
     assert(pixman_image_get_width(vs->vd->server) < 65536 &&
            pixman_image_get_width(vs->vd->server) >= 0);
@@ -2013,6 +2009,10 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
+        vnc_colordepth(vs);
+        vnc_desktop_resize(vs);
+        vnc_led_state_change(vs);
+        vnc_cursor_define(vs);
     }
 }
 
@@ -2136,10 +2136,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
         }
     }
-    vnc_desktop_resize(vs);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
-    vnc_led_state_change(vs);
-    vnc_cursor_define(vs);
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.29.2


