Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4D2F76A2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:26:46 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MJZ-0004ip-JD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHV-0002ws-Kv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHS-0007sS-51
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBCT3LB6DyJYH8ndCFyzahlXCB0IUum4nKYjrdpVNfE=;
 b=Hpr2ZoXsIaamDBN16kMD0PB4yEkePzWkptGqsHve3FV+12FC7xk9jAD8kNVwDc8hxn1rkO
 irhsZheYYPhr11GJELkRiXy+jj+dQmo7xz4jozciqLfiZOzNs4T5IXwwrO7NUDDhRcKbbA
 anBZg/fkGDjz8dx7VNG+tZR3F1YnqcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-y3MxJq-oNAO9wUrrLseQ_Q-1; Fri, 15 Jan 2021 05:24:31 -0500
X-MC-Unique: y3MxJq-oNAO9wUrrLseQ_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AD7C806668
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:24:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C26C719C45;
 Fri, 15 Jan 2021 10:24:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E9DB41800D40; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] vnc: move initialization to framebuffer_update_request
Date: Fri, 15 Jan 2021 11:24:23 +0100
Message-Id: <20210115102424.1360437-11-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210112134120.2031837-3-kraxel@redhat.com
---
 ui/vnc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 0f01481cac57..b4e98cf647f5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -661,10 +661,6 @@ static void vnc_desktop_resize(VncState *vs)
     if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
         return;
     }
-    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
-        vs->client_height == pixman_image_get_height(vs->vd->server)) {
-        return;
-    }
 
     assert(pixman_image_get_width(vs->vd->server) < 65536 &&
            pixman_image_get_width(vs->vd->server) >= 0);
@@ -2014,6 +2010,10 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
+        vnc_colordepth(vs);
+        vnc_desktop_resize(vs);
+        vnc_led_state_change(vs);
+        vnc_cursor_define(vs);
     }
 }
 
@@ -2154,10 +2154,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
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


