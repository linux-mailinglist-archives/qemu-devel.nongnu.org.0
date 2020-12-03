Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F002CD456
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:12:19 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmX4-0008DT-Sb
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTF-00039x-7W
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT8-0006dA-Jj
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfDnnqZhMg8ve3HQG0wHiEoFXbDMSDaubQU0AousCJA=;
 b=Fq4oQXa4Vbqcmqhd1sNsOfpvEK7B9MnujKDYg1+4r41sOxm0gwl2uPNYeVAIv5wI9lgl5R
 /Z/eacoJseTWIt+oNT2qTETSg/VHhqqbN5KWvKWZWb0OqIzAqUv6VL/MIFnczgtULiTSXv
 h+P08JEgLnR3PFD42UiBvb7X6H+yuA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-J_n4vCdwNe2Z71Q2ZzTtfA-1; Thu, 03 Dec 2020 06:08:12 -0500
X-MC-Unique: J_n4vCdwNe2Z71Q2ZzTtfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CA521005E70
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9D7E18A2F;
 Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4BD329D9F; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] vnc: force initial resize message
Date: Thu,  3 Dec 2020 12:08:03 +0100
Message-Id: <20201203110806.13556-8-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The vnc server should send desktop resize notifications unconditionally
on a new client connect, for feature negotiation reasons.  Add a bool
flag to vnc_desktop_resize() to force sending the message even in case
there is no size change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 247e80d8f5c8..bdaf384f71a4 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -664,13 +664,14 @@ void vnc_framebuffer_update(VncState *vs, int x, int y, int w, int h,
 }
 
 
-static void vnc_desktop_resize(VncState *vs)
+static void vnc_desktop_resize(VncState *vs, bool force)
 {
     if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
         return;
     }
     if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
-        vs->client_height == pixman_image_get_height(vs->vd->server)) {
+        vs->client_height == pixman_image_get_height(vs->vd->server) &&
+        !force) {
         return;
     }
 
@@ -800,7 +801,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
 
     QTAILQ_FOREACH(vs, &vd->clients, next) {
         vnc_colordepth(vs);
-        vnc_desktop_resize(vs);
+        vnc_desktop_resize(vs, false);
         if (vs->vd->cursor) {
             vnc_cursor_define(vs);
         }
@@ -2143,7 +2144,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
         }
     }
-    vnc_desktop_resize(vs);
+    vnc_desktop_resize(vs, true);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
     vnc_led_state_change(vs);
     if (vs->vd->cursor) {
-- 
2.27.0


