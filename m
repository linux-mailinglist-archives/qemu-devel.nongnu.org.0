Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5738C769
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:02:36 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4nT-00058s-Dj
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4f1-0007Qy-VV
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4ez-0007zG-0u
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/GobeqPWMnoSn9jVN4AltsxbfmBRCBosjxe6Js/HvA=;
 b=bKTRqyO6XJmrviIWoo1aDj4gUVpPWocluLpX6yaIPeqjUbZk0iAMnGi1pbjfZgXDHg70/X
 fZjfRYc7/s4RdYvzEdvH38HAuomRdURLWSDTbBOJSwcXdcOr5vqVYrUQ9dU7doY+mTrm8D
 Ph7M8nDdBhqx79Jxoi1lKqi9xCp08wU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-sWdxyxKfPyugqf_NmAjVCA-1; Fri, 21 May 2021 08:53:46 -0400
X-MC-Unique: sWdxyxKfPyugqf_NmAjVCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67EB8049D6
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 12:53:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 346685D9D5;
 Fri, 21 May 2021 12:53:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B421C180087F; Fri, 21 May 2021 14:51:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] ui/vdagent: add clipboard support
Date: Fri, 21 May 2021 14:51:16 +0200
Message-Id: <20210521125119.3173309-9-kraxel@redhat.com>
In-Reply-To: <20210521125119.3173309-1-kraxel@redhat.com>
References: <20210521125119.3173309-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for clipboard messages to the qemu vdagent
implementation, which allows the guest exchange clipboard data with
qemu.  Clipboard support can be enabled/disabled using the new
'clipboard' parameter for the vdagent chardev.  Default is off.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210519053940.1888907-1-kraxel@redhat.com
Message-Id: <20210519053940.1888907-7-kraxel@redhat.com>
---
 chardev/char.c  |   3 +
 ui/vdagent.c    | 293 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json  |   4 +-
 ui/trace-events |   2 +
 4 files changed, 301 insertions(+), 1 deletion(-)

diff --git a/chardev/char.c b/chardev/char.c
index 52c567e8ff00..d959eec5229c 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -934,6 +934,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "mouse",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "clipboard",
+            .type = QEMU_OPT_BOOL,
 #ifdef CONFIG_LINUX
         },{
             .name = "tight",
diff --git a/ui/vdagent.c b/ui/vdagent.c
index cf81ab6beb68..a253a8fe63a6 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -6,6 +6,7 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "trace.h"
@@ -17,12 +18,14 @@
 
 #define VDAGENT_BUFFER_LIMIT (1 * MiB)
 #define VDAGENT_MOUSE_DEFAULT true
+#define VDAGENT_CLIPBOARD_DEFAULT false
 
 struct VDAgentChardev {
     Chardev parent;
 
     /* config */
     bool mouse;
+    bool clipboard;
 
     /* guest vdagent */
     uint32_t caps;
@@ -41,6 +44,11 @@ struct VDAgentChardev {
     uint32_t mouse_btn;
     uint32_t mouse_display;
     QemuInputHandlerState *mouse_hs;
+
+    /* clipboard */
+    QemuClipboardPeer cbpeer;
+    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
+    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
 };
 typedef struct VDAgentChardev VDAgentChardev;
 
@@ -96,6 +104,24 @@ static const char *msg_name[] = {
 #endif
 };
 
+static const char *sel_name[] = {
+    [VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD] = "clipboard",
+    [VD_AGENT_CLIPBOARD_SELECTION_PRIMARY]   = "primary",
+    [VD_AGENT_CLIPBOARD_SELECTION_SECONDARY] = "secondary",
+};
+
+static const char *type_name[] = {
+    [VD_AGENT_CLIPBOARD_NONE]       = "none",
+    [VD_AGENT_CLIPBOARD_UTF8_TEXT]  = "text",
+    [VD_AGENT_CLIPBOARD_IMAGE_PNG]  = "png",
+    [VD_AGENT_CLIPBOARD_IMAGE_BMP]  = "bmp",
+    [VD_AGENT_CLIPBOARD_IMAGE_TIFF] = "tiff",
+    [VD_AGENT_CLIPBOARD_IMAGE_JPG]  = "jpg",
+#if 0
+    [VD_AGENT_CLIPBOARD_FILE_LIST]  = "files",
+#endif
+};
+
 #define GET_NAME(_m, _v) \
     (((_v) < ARRAY_SIZE(_m) && (_m[_v])) ? (_m[_v]) : "???")
 
@@ -161,6 +187,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)
     if (vd->mouse) {
         caps->caps[0] |= (1 << VD_AGENT_CAP_MOUSE_STATE);
     }
+    if (vd->clipboard) {
+        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND);
+        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
+    }
 
     vdagent_send_msg(vd, msg);
 }
@@ -261,6 +291,244 @@ static QemuInputHandler vdagent_mouse_handler = {
     .sync  = vdagent_pointer_sync,
 };
 
+/* ------------------------------------------------------------------ */
+/* clipboard                                                          */
+
+static bool have_clipboard(VDAgentChardev *vd)
+{
+    return vd->clipboard &&
+        (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND));
+}
+
+static bool have_selection(VDAgentChardev *vd)
+{
+    return vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
+}
+
+static uint32_t type_qemu_to_vdagent(enum QemuClipboardType type)
+{
+    switch (type) {
+    case QEMU_CLIPBOARD_TYPE_TEXT:
+        return VD_AGENT_CLIPBOARD_UTF8_TEXT;
+    default:
+        return VD_AGENT_CLIPBOARD_NONE;
+    }
+}
+
+static void vdagent_send_clipboard_grab(VDAgentChardev *vd,
+                                        QemuClipboardInfo *info)
+{
+    g_autofree VDAgentMessage *msg =
+        g_malloc0(sizeof(VDAgentMessage) +
+                  sizeof(uint32_t) * (QEMU_CLIPBOARD_TYPE__COUNT + 1));
+    uint8_t *s = msg->data;
+    uint32_t *data = (uint32_t *)msg->data;
+    uint32_t q, type;
+
+    if (have_selection(vd)) {
+        *s = info->selection;
+        data++;
+        msg->size += sizeof(uint32_t);
+    } else if (info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
+        return;
+    }
+
+    for (q = 0; q < QEMU_CLIPBOARD_TYPE__COUNT; q++) {
+        type = type_qemu_to_vdagent(q);
+        if (type != VD_AGENT_CLIPBOARD_NONE && info->types[q].available) {
+            *data = type;
+            data++;
+            msg->size += sizeof(uint32_t);
+        }
+    }
+
+    msg->type = VD_AGENT_CLIPBOARD_GRAB;
+    vdagent_send_msg(vd, msg);
+}
+
+static void vdagent_send_clipboard_data(VDAgentChardev *vd,
+                                        QemuClipboardInfo *info,
+                                        QemuClipboardType type)
+{
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(uint32_t) * 2 +
+                                               info->types[type].size);
+
+    uint8_t *s = msg->data;
+    uint32_t *data = (uint32_t *)msg->data;
+
+    if (have_selection(vd)) {
+        *s = info->selection;
+        data++;
+        msg->size += sizeof(uint32_t);
+    } else if (info->selection != QEMU_CLIPBOARD_SELECTION_CLIPBOARD) {
+        return;
+    }
+
+    *data = type_qemu_to_vdagent(type);
+    data++;
+    msg->size += sizeof(uint32_t);
+
+    memcpy(data, info->types[type].data, info->types[type].size);
+    msg->size += info->types[type].size;
+
+    msg->type = VD_AGENT_CLIPBOARD;
+    vdagent_send_msg(vd, msg);
+}
+
+static void vdagent_clipboard_notify(Notifier *notifier, void *data)
+{
+    VDAgentChardev *vd = container_of(notifier, VDAgentChardev, cbpeer.update);
+    QemuClipboardInfo *info = data;
+    QemuClipboardSelection s = info->selection;
+    QemuClipboardType type;
+    bool self_update = info->owner == &vd->cbpeer;
+
+    if (info != vd->cbinfo[s]) {
+        qemu_clipboard_info_unref(vd->cbinfo[s]);
+        vd->cbinfo[s] = qemu_clipboard_info_ref(info);
+        vd->cbpending[s] = 0;
+        if (!self_update) {
+            vdagent_send_clipboard_grab(vd, info);
+        }
+        return;
+    }
+
+    if (self_update) {
+        return;
+    }
+
+    for (type = 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
+        if (vd->cbpending[s] & (1 << type)) {
+            vd->cbpending[s] &= ~(1 << type);
+            vdagent_send_clipboard_data(vd, info, type);
+        }
+    }
+}
+
+static void vdagent_clipboard_request(QemuClipboardInfo *info,
+                                      QemuClipboardType qtype)
+{
+    VDAgentChardev *vd = container_of(info->owner, VDAgentChardev, cbpeer);
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(uint32_t) * 2);
+    uint32_t type = type_qemu_to_vdagent(qtype);
+    uint8_t *s = msg->data;
+    uint32_t *data = (uint32_t *)msg->data;
+
+    if (type == VD_AGENT_CLIPBOARD_NONE) {
+        return;
+    }
+
+    if (have_selection(vd)) {
+        *s = info->selection;
+        data++;
+        msg->size += sizeof(uint32_t);
+    }
+
+    *data = type;
+    msg->size += sizeof(uint32_t);
+
+    msg->type = VD_AGENT_CLIPBOARD_REQUEST;
+    vdagent_send_msg(vd, msg);
+}
+
+static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
+{
+    uint8_t s = VD_AGENT_CLIPBOARD_SELECTION_CLIPBOARD;
+    uint32_t size = msg->size;
+    void *data = msg->data;
+    QemuClipboardInfo *info;
+    QemuClipboardType type;
+
+    if (have_selection(vd)) {
+        if (size < 4) {
+            return;
+        }
+        s = *(uint8_t *)data;
+        if (s >= QEMU_CLIPBOARD_SELECTION__COUNT) {
+            return;
+        }
+        data += 4;
+        size -= 4;
+    }
+
+    switch (msg->type) {
+    case VD_AGENT_CLIPBOARD_GRAB:
+        trace_vdagent_cb_grab_selection(GET_NAME(sel_name, s));
+        info = qemu_clipboard_info_new(&vd->cbpeer, s);
+        if (size > sizeof(uint32_t) * 10) {
+            /*
+             * spice has 6 types as of 2021. Limiting to 10 entries
+             * so we we have some wiggle room.
+             */
+            return;
+        }
+        while (size >= sizeof(uint32_t)) {
+            trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
+            switch (*(uint32_t *)data) {
+            case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+                info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+                break;
+            default:
+                break;
+            }
+            data += sizeof(uint32_t);
+            size -= sizeof(uint32_t);
+        }
+        qemu_clipboard_update(info);
+        qemu_clipboard_info_unref(info);
+        break;
+    case VD_AGENT_CLIPBOARD_REQUEST:
+        if (size < sizeof(uint32_t)) {
+            return;
+        }
+        switch (*(uint32_t *)data) {
+        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+            type = QEMU_CLIPBOARD_TYPE_TEXT;
+            break;
+        default:
+            return;
+        }
+        if (vd->cbinfo[s] &&
+            vd->cbinfo[s]->types[type].available &&
+            vd->cbinfo[s]->owner != &vd->cbpeer) {
+            if (vd->cbinfo[s]->types[type].data) {
+                vdagent_send_clipboard_data(vd, vd->cbinfo[s], type);
+            } else {
+                vd->cbpending[s] |= (1 << type);
+                qemu_clipboard_request(vd->cbinfo[s], type);
+            }
+        }
+        break;
+    case VD_AGENT_CLIPBOARD: /* data */
+        if (size < sizeof(uint32_t)) {
+            return;
+        }
+        switch (*(uint32_t *)data) {
+        case VD_AGENT_CLIPBOARD_UTF8_TEXT:
+            type = QEMU_CLIPBOARD_TYPE_TEXT;
+            break;
+        default:
+            return;
+        }
+        data += 4;
+        size -= 4;
+        qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type,
+                                size, data, true);
+        break;
+    case VD_AGENT_CLIPBOARD_RELEASE: /* data */
+        if (vd->cbinfo[s] &&
+            vd->cbinfo[s]->owner == &vd->cbpeer) {
+            /* set empty clipboard info */
+            info = qemu_clipboard_info_new(NULL, s);
+            qemu_clipboard_update(info);
+            qemu_clipboard_info_unref(info);
+        }
+        break;
+    }
+}
+
 /* ------------------------------------------------------------------ */
 /* chardev backend                                                    */
 
@@ -286,6 +554,11 @@ static void vdagent_chr_open(Chardev *chr,
         vd->mouse = cfg->mouse;
     }
 
+    vd->clipboard = VDAGENT_CLIPBOARD_DEFAULT;
+    if (cfg->has_clipboard) {
+        vd->clipboard = cfg->clipboard;
+    }
+
     if (vd->mouse) {
         vd->mouse_hs = qemu_input_handler_register(&vd->mouse_dev,
                                                    &vdagent_mouse_handler);
@@ -317,6 +590,12 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (have_mouse(vd) && vd->mouse_hs) {
         qemu_input_handler_activate(vd->mouse_hs);
     }
+    if (have_clipboard(vd) && vd->cbpeer.update.notify == NULL) {
+        vd->cbpeer.name = "vdagent";
+        vd->cbpeer.update.notify = vdagent_clipboard_notify;
+        vd->cbpeer.request = vdagent_clipboard_request;
+        qemu_clipboard_peer_register(&vd->cbpeer);
+    }
 }
 
 static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
@@ -327,6 +606,14 @@ static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
     case VD_AGENT_ANNOUNCE_CAPABILITIES:
         vdagent_chr_recv_caps(vd, msg);
         break;
+    case VD_AGENT_CLIPBOARD:
+    case VD_AGENT_CLIPBOARD_GRAB:
+    case VD_AGENT_CLIPBOARD_REQUEST:
+    case VD_AGENT_CLIPBOARD_RELEASE:
+        if (have_clipboard(vd)) {
+            vdagent_chr_recv_clipboard(vd, msg);
+        }
+        break;
     default:
         break;
     }
@@ -448,6 +735,10 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
         if (vd->mouse_hs) {
             qemu_input_handler_deactivate(vd->mouse_hs);
         }
+        if (vd->cbpeer.update.notify) {
+            qemu_clipboard_peer_unregister(&vd->cbpeer);
+            memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
+        }
         return;
     }
 
@@ -464,6 +755,8 @@ static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,
     qemu_chr_parse_common(opts, qapi_ChardevQemuVDAgent_base(cfg));
     cfg->has_mouse = true;
     cfg->mouse = qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAULT);
+    cfg->has_clipboard = true;
+    cfg->clipboard = qemu_opt_get_bool(opts, "clipboard", VDAGENT_CLIPBOARD_DEFAULT);
 }
 
 /* ------------------------------------------------------------------ */
diff --git a/qapi/char.json b/qapi/char.json
index 5711e8c60aeb..adf2685f6889 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -396,12 +396,14 @@
 # Configuration info for qemu vdagent implementation.
 #
 # @mouse: enable/disable mouse, default is enabled.
+# @clipboard: enable/disable clipboard, default is disabled.
 #
 # Since: 6.1
 #
 ##
 { 'struct': 'ChardevQemuVDAgent',
-  'data': { '*mouse': 'bool' },
+  'data': { '*mouse': 'bool',
+            '*clipboard': 'bool' },
   'base': 'ChardevCommon',
   'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
 
diff --git a/ui/trace-events b/ui/trace-events
index c34cffb0452b..c86542e2b69b 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -132,3 +132,5 @@ vdagent_send(const char *name) "msg %s"
 vdagent_recv_chunk(uint32_t size) "size %d"
 vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
+vdagent_cb_grab_selection(const char *name) "selection %s"
+vdagent_cb_grab_type(const char *name) "type %s"
-- 
2.31.1


