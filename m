Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EF3734E2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:14:23 +0200 (CEST)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leAne-0001pg-P3
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAjA-00052u-Lw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAj6-0001sL-3V
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620194979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cawWSxeAhP3XqhR8EO5ORNuEmzfLTfvUdRcZ2WkWxZE=;
 b=hg+UouBJqsd/ZoKKARYLhA//0iSsKI45avq1uAegfBCnoJp5ng6gD07WQWAOM5OvjuEbxr
 5Og52zSM9UWqP+WcI4tj/8XB50AobiY6WUmEVGEevZMaqJYXYHAkXsaEtbff//ndmmhKn9
 lWCoqADOFhG0nI8/QvKb0vZPK+NRcfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-ysf4v3WyNt2PQVo2P6smBA-1; Wed, 05 May 2021 02:09:37 -0400
X-MC-Unique: ysf4v3WyNt2PQVo2P6smBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D22F107ACE4
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 06:09:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7176062C;
 Wed,  5 May 2021 06:09:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DC92718007A2; Wed,  5 May 2021 08:09:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/9] ui/vnc: clipboard support
Date: Wed,  5 May 2021 08:08:59 +0200
Message-Id: <20210505060901.828658-8-kraxel@redhat.com>
In-Reply-To: <20210505060901.828658-1-kraxel@redhat.com>
References: <20210505060901.828658-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for cut+paste to the qemu vnc server, which
allows the vnc client exchange clipbaord data with qemu and other peers
like the qemu vdagent implementation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.h           |  24 ++++
 ui/vnc-clipboard.c | 323 +++++++++++++++++++++++++++++++++++++++++++++
 ui/vnc.c           |  20 ++-
 ui/meson.build     |   1 +
 4 files changed, 362 insertions(+), 6 deletions(-)
 create mode 100644 ui/vnc-clipboard.c

diff --git a/ui/vnc.h b/ui/vnc.h
index d4f3e1555809..a7149831f906 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -29,6 +29,7 @@
 
 #include "qemu/queue.h"
 #include "qemu/thread.h"
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "audio/audio.h"
 #include "qemu/bitmap.h"
@@ -348,6 +349,10 @@ struct VncState
 
     Notifier mouse_mode_notifier;
 
+    QemuClipboardPeer cbpeer;
+    QemuClipboardInfo *cbinfo;
+    uint32_t cbpending;
+
     QTAILQ_ENTRY(VncState) next;
 };
 
@@ -417,6 +422,7 @@ enum {
 #define VNC_ENCODING_XVP                  0XFFFFFECB /* -309 */
 #define VNC_ENCODING_ALPHA_CURSOR         0XFFFFFEC6 /* -314 */
 #define VNC_ENCODING_WMVi                 0x574D5669
+#define VNC_ENCODING_CLIPBOARD_EXT        0xc0a1e5ce
 
 /*****************************************************************************
  *
@@ -458,6 +464,7 @@ enum VncFeatures {
     VNC_FEATURE_ZYWRLE,
     VNC_FEATURE_LED_STATE,
     VNC_FEATURE_XVP,
+    VNC_FEATURE_CLIPBOARD_EXT,
 };
 
 #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
@@ -474,6 +481,7 @@ enum VncFeatures {
 #define VNC_FEATURE_ZYWRLE_MASK              (1 << VNC_FEATURE_ZYWRLE)
 #define VNC_FEATURE_LED_STATE_MASK           (1 << VNC_FEATURE_LED_STATE)
 #define VNC_FEATURE_XVP_MASK                 (1 << VNC_FEATURE_XVP)
+#define VNC_FEATURE_CLIPBOARD_EXT_MASK       (1 <<  VNC_FEATURE_CLIPBOARD_EXT)
 
 
 /* Client -> Server message IDs */
@@ -535,6 +543,17 @@ enum VncFeatures {
 #define VNC_XVP_ACTION_REBOOT 3
 #define VNC_XVP_ACTION_RESET 4
 
+/* extended clipboard flags  */
+#define VNC_CLIPBOARD_TEXT     (1 << 0)
+#define VNC_CLIPBOARD_RTF      (1 << 1)
+#define VNC_CLIPBOARD_HTML     (1 << 2)
+#define VNC_CLIPBOARD_DIB      (1 << 3)
+#define VNC_CLIPBOARD_FILES    (1 << 4)
+#define VNC_CLIPBOARD_CAPS     (1 << 24)
+#define VNC_CLIPBOARD_REQUEST  (1 << 25)
+#define VNC_CLIPBOARD_PEEK     (1 << 26)
+#define VNC_CLIPBOARD_NOTIFY   (1 << 27)
+#define VNC_CLIPBOARD_PROVIDE  (1 << 28)
 
 /*****************************************************************************
  *
@@ -618,4 +637,9 @@ int vnc_zrle_send_framebuffer_update(VncState *vs, int x, int y, int w, int h);
 int vnc_zywrle_send_framebuffer_update(VncState *vs, int x, int y, int w, int h);
 void vnc_zrle_clear(VncState *vs);
 
+/* vnc-clipboard.c */
+void vnc_server_cut_text_caps(VncState *vs);
+void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text);
+void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags, uint8_t *data);
+
 #endif /* QEMU_VNC_H */
diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
new file mode 100644
index 000000000000..9f077965d056
--- /dev/null
+++ b/ui/vnc-clipboard.c
@@ -0,0 +1,323 @@
+/*
+ * QEMU VNC display driver -- clipboard support
+ *
+ * Copyright (C) 2021 Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "vnc.h"
+#include "vnc-jobs.h"
+
+static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+{
+    z_stream stream = {
+        .next_in  = in,
+        .avail_in = in_len,
+        .zalloc   = Z_NULL,
+        .zfree    = Z_NULL,
+    };
+    uint32_t out_len = 8;
+    uint8_t *out = g_malloc(out_len);
+    int ret;
+
+    stream.next_out = out + stream.total_out;
+    stream.avail_out = out_len - stream.total_out;
+
+    ret = inflateInit(&stream);
+    if (ret != Z_OK) {
+        goto err;
+    }
+
+    while (stream.avail_in) {
+        ret = inflate(&stream, Z_FINISH);
+        switch (ret) {
+        case Z_OK:
+        case Z_STREAM_END:
+            break;
+        case Z_BUF_ERROR:
+            out_len <<= 1;
+            if (out_len > (1 << 20)) {
+                goto err_end;
+            }
+            out = g_realloc(out, out_len);
+            stream.next_out = out + stream.total_out;
+            stream.avail_out = out_len - stream.total_out;
+            break;
+        default:
+            goto err_end;
+        }
+    }
+
+    *size = stream.total_out;
+    inflateEnd(&stream);
+
+    return out;
+
+err_end:
+    inflateEnd(&stream);
+err:
+    g_free(out);
+    return NULL;
+}
+
+static uint8_t *deflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+{
+    z_stream stream = {
+        .next_in  = in,
+        .avail_in = in_len,
+        .zalloc   = Z_NULL,
+        .zfree    = Z_NULL,
+    };
+    uint32_t out_len = 8;
+    uint8_t *out = g_malloc(out_len);
+    int ret;
+
+    stream.next_out = out + stream.total_out;
+    stream.avail_out = out_len - stream.total_out;
+
+    ret = deflateInit(&stream, Z_DEFAULT_COMPRESSION);
+    if (ret != Z_OK) {
+        goto err;
+    }
+
+    while (ret != Z_STREAM_END) {
+        ret = deflate(&stream, Z_FINISH);
+        switch (ret) {
+        case Z_OK:
+        case Z_STREAM_END:
+            break;
+        case Z_BUF_ERROR:
+            out_len <<= 1;
+            if (out_len > (1 << 20)) {
+                goto err_end;
+            }
+            out = g_realloc(out, out_len);
+            stream.next_out = out + stream.total_out;
+            stream.avail_out = out_len - stream.total_out;
+            break;
+        default:
+            goto err_end;
+        }
+    }
+
+    *size = stream.total_out;
+    deflateEnd(&stream);
+
+    return out;
+
+err_end:
+    deflateEnd(&stream);
+err:
+    g_free(out);
+    return NULL;
+}
+
+static void vnc_clipboard_send(VncState *vs, uint32_t count, uint32_t *dwords)
+{
+    int i;
+
+    vnc_lock_output(vs);
+    vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);
+    vnc_write_u8(vs, 0);
+    vnc_write_u8(vs, 0);
+    vnc_write_u8(vs, 0);
+    vnc_write_s32(vs, -(count * sizeof(uint32_t)));  /* -(message length) */
+    for (i = 0; i < count; i++) {
+        vnc_write_u32(vs, dwords[i]);
+    }
+    vnc_unlock_output(vs);
+    vnc_flush(vs);
+}
+
+static void vnc_clipboard_provide(VncState *vs,
+                                  QemuClipboardInfo *info,
+                                  QemuClipboardType type)
+{
+    uint32_t flags = 0;
+    g_autofree uint8_t *buf = NULL;
+    g_autofree void *zbuf = NULL;
+    uint32_t zsize;
+
+    switch (type) {
+    case QEMU_CLIPBOARD_TYPE_TEXT:
+        flags |= VNC_CLIPBOARD_TEXT;
+        break;
+    default:
+        return;
+    }
+    flags |= VNC_CLIPBOARD_PROVIDE;
+
+    buf = g_malloc(info->types[type].size + 4);
+    buf[0] = (info->types[type].size >> 24) & 0xff;
+    buf[1] = (info->types[type].size >> 16) & 0xff;
+    buf[2] = (info->types[type].size >>  8) & 0xff;
+    buf[3] = (info->types[type].size >>  0) & 0xff;
+    memcpy(buf + 4, info->types[type].data, info->types[type].size);
+    zbuf = deflate_buffer(buf, info->types[type].size + 4, &zsize);
+    if (!zbuf) {
+        return;
+    }
+
+    vnc_lock_output(vs);
+    vnc_write_u8(vs, VNC_MSG_SERVER_CUT_TEXT);
+    vnc_write_u8(vs, 0);
+    vnc_write_u8(vs, 0);
+    vnc_write_u8(vs, 0);
+    vnc_write_s32(vs, -(sizeof(uint32_t) + zsize));  /* -(message length) */
+    vnc_write_u32(vs, flags);
+    vnc_write(vs, zbuf, zsize);
+    vnc_unlock_output(vs);
+    vnc_flush(vs);
+}
+
+static void vnc_clipboard_notify(Notifier *notifier, void *data)
+{
+    VncState *vs = container_of(notifier, VncState, cbpeer.update);
+    QemuClipboardInfo *info = data;
+    QemuClipboardType type;
+    bool self_update = info->owner == &vs->cbpeer;
+    uint32_t flags = 0;
+
+    if (info != vs->cbinfo) {
+        qemu_clipboard_info_unref(vs->cbinfo);
+        vs->cbinfo = qemu_clipboard_info_ref(info);
+        vs->cbpending = 0;
+        if (!self_update) {
+            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
+                flags |= VNC_CLIPBOARD_TEXT;
+            }
+            flags |= VNC_CLIPBOARD_NOTIFY;
+            vnc_clipboard_send(vs, 1, &flags);
+        }
+        return;
+    }
+
+    if (self_update) {
+        return;
+    }
+
+    for (type = 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
+        if (vs->cbpending & (1 << type)) {
+            vs->cbpending &= ~(1 << type);
+            vnc_clipboard_provide(vs, info, type);
+        }
+    }
+}
+
+static void vnc_clipboard_request(QemuClipboardInfo *info,
+                                  QemuClipboardType type)
+{
+    VncState *vs = container_of(info->owner, VncState, cbpeer);
+    uint32_t flags = 0;
+
+    if (type == QEMU_CLIPBOARD_TYPE_TEXT) {
+        flags |= VNC_CLIPBOARD_TEXT;
+    }
+    if (!flags) {
+        return;
+    }
+    flags |= VNC_CLIPBOARD_REQUEST;
+
+    vnc_clipboard_send(vs, 1, &flags);
+}
+
+void vnc_client_cut_text_ext(VncState *vs, int32_t len, uint32_t flags, uint8_t *data)
+{
+    if (flags & VNC_CLIPBOARD_CAPS) {
+        /* need store caps somewhere ? */
+        return;
+    }
+
+    if (flags & VNC_CLIPBOARD_NOTIFY) {
+        QemuClipboardInfo *info =
+            qemu_clipboard_info_new(&vs->cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
+        if (flags & VNC_CLIPBOARD_TEXT) {
+            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+        }
+        qemu_clipboard_update(info);
+        qemu_clipboard_info_unref(info);
+        return;
+    }
+
+    if (flags & VNC_CLIPBOARD_PROVIDE &&
+        vs->cbinfo &&
+        vs->cbinfo->owner == &vs->cbpeer) {
+        uint32_t size = 0;
+        g_autofree uint8_t *buf = inflate_buffer(data, len - 4, &size);
+        if ((flags & VNC_CLIPBOARD_TEXT) &&
+            buf && size >= 4) {
+            uint32_t tsize = read_u32(buf, 0);
+            uint8_t *tbuf = buf + 4;
+            if (tsize < size) {
+                qemu_clipboard_set_data(&vs->cbpeer, vs->cbinfo,
+                                        QEMU_CLIPBOARD_TYPE_TEXT,
+                                        tsize, tbuf, true);
+            }
+        }
+    }
+
+    if (flags & VNC_CLIPBOARD_REQUEST &&
+        vs->cbinfo &&
+        vs->cbinfo->owner != &vs->cbpeer) {
+        if ((flags & VNC_CLIPBOARD_TEXT) &&
+            vs->cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
+            if (vs->cbinfo->types[QEMU_CLIPBOARD_TYPE_TEXT].data) {
+                vnc_clipboard_provide(vs, vs->cbinfo, QEMU_CLIPBOARD_TYPE_TEXT);
+            } else {
+                vs->cbpending |= (1 << QEMU_CLIPBOARD_TYPE_TEXT);
+                qemu_clipboard_request(vs->cbinfo, QEMU_CLIPBOARD_TYPE_TEXT);
+            }
+        }
+    }
+}
+
+void vnc_client_cut_text(VncState *vs, size_t len, uint8_t *text)
+{
+    QemuClipboardInfo *info =
+        qemu_clipboard_info_new(&vs->cbpeer, QEMU_CLIPBOARD_SELECTION_CLIPBOARD);
+
+    qemu_clipboard_set_data(&vs->cbpeer, info, QEMU_CLIPBOARD_TYPE_TEXT,
+                            len, text, true);
+    qemu_clipboard_info_unref(info);
+}
+
+void vnc_server_cut_text_caps(VncState *vs)
+{
+    uint32_t caps[2];
+
+    if (!vnc_has_feature(vs, VNC_FEATURE_CLIPBOARD_EXT)) {
+        return;
+    }
+
+    caps[0] = (VNC_CLIPBOARD_PROVIDE |
+               VNC_CLIPBOARD_NOTIFY  |
+               VNC_CLIPBOARD_REQUEST |
+               VNC_CLIPBOARD_CAPS    |
+               VNC_CLIPBOARD_TEXT);
+    caps[1] = 0;
+    vnc_clipboard_send(vs, 2, caps);
+
+    vs->cbpeer.name = "vnc";
+    vs->cbpeer.update.notify = vnc_clipboard_notify;
+    vs->cbpeer.request = vnc_clipboard_request;
+    qemu_clipboard_peer_register(&vs->cbpeer);
+}
diff --git a/ui/vnc.c b/ui/vnc.c
index 456db47d713d..1d7f7f326c52 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "vnc.h"
 #include "vnc-jobs.h"
 #include "trace.h"
@@ -1352,6 +1353,9 @@ void vnc_disconnect_finish(VncState *vs)
         /* last client gone */
         vnc_update_server_surface(vs->vd);
     }
+    if (vs->cbpeer.update.notify) {
+        qemu_clipboard_peer_unregister(&vs->cbpeer);
+    }
 
     vnc_unlock_output(vs);
 
@@ -1777,10 +1781,6 @@ uint32_t read_u32(uint8_t *data, size_t offset)
             (data[offset + 2] << 8) | data[offset + 3]);
 }
 
-static void client_cut_text(VncState *vs, size_t len, uint8_t *text)
-{
-}
-
 static void check_pointer_type_change(Notifier *notifier, void *data)
 {
     VncState *vs = container_of(notifier, VncState, mouse_mode_notifier);
@@ -2222,6 +2222,10 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
                 send_xvp_message(vs, VNC_XVP_CODE_INIT);
             }
             break;
+        case VNC_ENCODING_CLIPBOARD_EXT:
+            vs->features |= VNC_FEATURE_CLIPBOARD_EXT_MASK;
+            vnc_server_cut_text_caps(vs);
+            break;
         case VNC_ENCODING_COMPRESSLEVEL0 ... VNC_ENCODING_COMPRESSLEVEL0 + 9:
             vs->tight->compression = (enc & 0x0F);
             break;
@@ -2438,7 +2442,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
             return 8;
         }
         if (len == 8) {
-            uint32_t dlen = read_u32(data, 4);
+            uint32_t dlen = abs(read_s32(data, 4));
             if (dlen > (1 << 20)) {
                 error_report("vnc: client_cut_text msg payload has %u bytes"
                              " which exceeds our limit of 1MB.", dlen);
@@ -2450,7 +2454,11 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
             }
         }
 
-        client_cut_text(vs, read_u32(data, 4), data + 8);
+        if (read_s32(data, 4) < 0) {
+            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)), read_u32(data, 8), data + 12);
+            break;
+        }
+        vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
         break;
     case VNC_MSG_CLIENT_XVP:
         if (!(vs->features & VNC_FEATURE_XVP)) {
diff --git a/ui/meson.build b/ui/meson.build
index bad49fb6de60..f37ef882e0e3 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -30,6 +30,7 @@ vnc_ss.add(files(
   'vnc-auth-vencrypt.c',
   'vnc-ws.c',
   'vnc-jobs.c',
+  'vnc-clipboard.c',
 ))
 vnc_ss.add(zlib, png, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
-- 
2.31.1


