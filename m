Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BB2F76AE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:28:46 +0100 (CET)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MLV-0008AB-UR
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHZ-000378-E1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHW-0007v0-2k
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4S//0RAq1sheEAwGBfdtDxCxLG2WR48+gZADyuhQT8=;
 b=CWr3hKhqnxtCZ5scBT3WximhFqiwOtZ4f3dBByodnmHaLqgePUpBnmkVe0OacueVbOGLli
 J4bjyktd4J0o9l9UFPy5DEmHOaViEsiUPq0bGv5McrtOeon1KV9YBO0hyvq/X3LsG6efW1
 tu3wIxBk+0tNcxi7Xcw7BA/EFGNVm2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-g9vRB7juPciezaU19aVXyw-1; Fri, 15 Jan 2021 05:24:35 -0500
X-MC-Unique: g9vRB7juPciezaU19aVXyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E75215726
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:24:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C61C56F922;
 Fri, 15 Jan 2021 10:24:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0256C1800D45; Fri, 15 Jan 2021 11:24:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] vnc: add support for extended desktop resize
Date: Fri, 15 Jan 2021 11:24:24 +0100
Message-Id: <20210115102424.1360437-12-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

The extended desktop resize encoding adds support for (a) clients
sending resize requests to the server, and (b) multihead support.

This patch implements (a).  All resize requests are rejected by qemu.
Qemu can't resize the framebuffer on its own, this is in the hands of
the guest, so all qemu can do is forward the request to the guest.
Should the guest actually resize the framebuffer we can notify the vnc
client later with a separate message.

This requires support in the display device.  Works with virtio-gpu.

https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddesktopsize-pseudo-encoding

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210112134120.2031837-4-kraxel@redhat.com
---
 ui/vnc.h |  2 ++
 ui/vnc.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/ui/vnc.h b/ui/vnc.h
index 5feeef9df08c..116463d5f099 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -444,6 +444,7 @@ enum {
 
 enum VncFeatures {
     VNC_FEATURE_RESIZE,
+    VNC_FEATURE_RESIZE_EXT,
     VNC_FEATURE_HEXTILE,
     VNC_FEATURE_POINTER_TYPE_CHANGE,
     VNC_FEATURE_WMVI,
@@ -459,6 +460,7 @@ enum VncFeatures {
 };
 
 #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
+#define VNC_FEATURE_RESIZE_EXT_MASK          (1 << VNC_FEATURE_RESIZE_EXT)
 #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
 #define VNC_FEATURE_POINTER_TYPE_CHANGE_MASK (1 << VNC_FEATURE_POINTER_TYPE_CHANGE)
 #define VNC_FEATURE_WMVI_MASK                (1 << VNC_FEATURE_WMVI)
diff --git a/ui/vnc.c b/ui/vnc.c
index b4e98cf647f5..d429bfee5a65 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -655,10 +655,35 @@ void vnc_framebuffer_update(VncState *vs, int x, int y, int w, int h,
     vnc_write_s32(vs, encoding);
 }
 
+static void vnc_desktop_resize_ext(VncState *vs, int reject_reason)
+{
+    vnc_lock_output(vs);
+    vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
+    vnc_write_u8(vs, 0);
+    vnc_write_u16(vs, 1); /* number of rects */
+    vnc_framebuffer_update(vs,
+                           reject_reason ? 1 : 0,
+                           reject_reason,
+                           vs->client_width, vs->client_height,
+                           VNC_ENCODING_DESKTOP_RESIZE_EXT);
+    vnc_write_u8(vs, 1);  /* number of screens */
+    vnc_write_u8(vs, 0);  /* padding */
+    vnc_write_u8(vs, 0);  /* padding */
+    vnc_write_u8(vs, 0);  /* padding */
+    vnc_write_u32(vs, 0); /* screen id */
+    vnc_write_u16(vs, 0); /* screen x-pos */
+    vnc_write_u16(vs, 0); /* screen y-pos */
+    vnc_write_u16(vs, vs->client_width);
+    vnc_write_u16(vs, vs->client_height);
+    vnc_write_u32(vs, 0); /* screen flags */
+    vnc_unlock_output(vs);
+    vnc_flush(vs);
+}
 
 static void vnc_desktop_resize(VncState *vs)
 {
-    if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
+    if (vs->ioc == NULL || (!vnc_has_feature(vs, VNC_FEATURE_RESIZE) &&
+                            !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {
         return;
     }
 
@@ -668,6 +693,12 @@ static void vnc_desktop_resize(VncState *vs)
            pixman_image_get_height(vs->vd->server) >= 0);
     vs->client_width = pixman_image_get_width(vs->vd->server);
     vs->client_height = pixman_image_get_height(vs->vd->server);
+
+    if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
+        vnc_desktop_resize_ext(vs, 0);
+        return;
+    }
+
     vnc_lock_output(vs);
     vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
     vnc_write_u8(vs, 0);
@@ -2114,6 +2145,9 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
         case VNC_ENCODING_DESKTOPRESIZE:
             vs->features |= VNC_FEATURE_RESIZE_MASK;
             break;
+        case VNC_ENCODING_DESKTOP_RESIZE_EXT:
+            vs->features |= VNC_FEATURE_RESIZE_EXT_MASK;
+            break;
         case VNC_ENCODING_POINTER_TYPE_CHANGE:
             vs->features |= VNC_FEATURE_POINTER_TYPE_CHANGE_MASK;
             break;
@@ -2474,6 +2508,34 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
             break;
         }
         break;
+    case VNC_MSG_CLIENT_SET_DESKTOP_SIZE:
+    {
+        size_t size;
+        uint8_t screens;
+
+        if (len < 8) {
+            return 8;
+        }
+
+        screens = read_u8(data, 6);
+        size    = 8 + screens * 16;
+        if (len < size) {
+            return size;
+        }
+
+        if (dpy_ui_info_supported(vs->vd->dcl.con)) {
+            QemuUIInfo info;
+            memset(&info, 0, sizeof(info));
+            info.width = read_u16(data, 2);
+            info.height = read_u16(data, 4);
+            dpy_set_ui_info(vs->vd->dcl.con, &info);
+            vnc_desktop_resize_ext(vs, 4 /* Request forwarded */);
+        } else {
+            vnc_desktop_resize_ext(vs, 3 /* Invalid screen layout */);
+        }
+
+        break;
+    }
     default:
         VNC_DEBUG("Msg: %d\n", data[0]);
         vnc_client_error(vs);
-- 
2.29.2


