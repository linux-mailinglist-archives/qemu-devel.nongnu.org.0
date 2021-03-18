Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ACF3401CC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:19:39 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMooc-0002Kj-BP
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMomB-0000aY-8i
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom6-0004XH-9X
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/2XDauPyoJ4jBMH8iOImOGFnZR5XASKDvgEqnvYupw=;
 b=A7rWZOFJkfd5e6bSK1+wVpz+kc8QVOwZlNznQPK/OcoluiIm+i1LPUi02iMwMqJ8AmkW93
 Oj3Vby2xL2XzIxgK3qYddGkpb1/11Dgre3/UAl1EA2JWGtzI5f2zZkiozqvgZHXN759dG1
 /4+onhVQtPcE1IpwVt4KDsrQ6tyr9XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-8yXdMLNgPMSQLnTNQLaTvQ-1; Thu, 18 Mar 2021 05:16:57 -0400
X-MC-Unique: 8yXdMLNgPMSQLnTNQLaTvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FD3A81744F
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:16:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 545E310013C1;
 Thu, 18 Mar 2021 09:16:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E7CE2180062B; Thu, 18 Mar 2021 10:16:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] ui/vdagent: add clipboard support
Date: Thu, 18 Mar 2021 10:16:44 +0100
Message-Id: <20210318091647.3233178-5-kraxel@redhat.com>
In-Reply-To: <20210318091647.3233178-1-kraxel@redhat.com>
References: <20210318091647.3233178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for clipboard messages to the qemu vdagent
implementation, which allows the guest exchange clipboard data with
qemu.  Clipboard support can be enabled/disabled using the new
'clipboard' parameter for the vdagent chardev.  Default is off.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/char.c  |   3 +
 ui/vdagent.c    | 259 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json  |   4 +-
 ui/trace-events |   2 +
 4 files changed, 267 insertions(+), 1 deletion(-)

diff --git a/chardev/char.c b/chardev/char.c
index fd4d86d0dd3f..353f3eb298d9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -930,6 +930,9 @@ QemuOptsList qemu_chardev_opts = {
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
index 61c12b02b573..89485973c512 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -3,6 +3,7 @@
 #include "chardev/char.h"
 #include "hw/qdev-core.h"
 #include "qemu/option.h"
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "trace.h"
@@ -13,12 +14,14 @@
 #include "spice/vd_agent.h"
 
 #define VDAGENT_MOUSE_DEFAULT true
+#define VDAGENT_CLIPBOARD_DEFAULT false
 
 struct VDAgentChardev {
     Chardev parent;
 
     /* config */
     bool mouse;
+    bool clipboard;
 
     /* guest vdagent */
     uint32_t caps;
@@ -33,6 +36,11 @@ struct VDAgentChardev {
     uint32_t mouse_y;
     uint32_t mouse_btn;
     QemuInputHandlerState *mouse_hs;
+
+    /* clipboard */
+    QemuClipboardPeer cbpeer;
+    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
+    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
 };
 typedef struct VDAgentChardev VDAgentChardev;
 
@@ -88,6 +96,24 @@ static const char *msg_name[] = {
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
 
@@ -144,6 +170,10 @@ static void vdagent_send_caps(VDAgentChardev *vd)
     if (vd->mouse) {
         caps->caps[0] |= (1 << VD_AGENT_CAP_MOUSE_STATE);
     }
+    if (vd->clipboard) {
+        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND);
+        caps->caps[0] |= (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION);
+    }
 
     vdagent_send_msg(vd, msg);
 }
@@ -236,6 +266,209 @@ static QemuInputHandler vdagent_mouse_handler = {
     .sync  = vdagent_pointer_sync,
 };
 
+/* ------------------------------------------------------------------ */
+/* clipboard                                                          */
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
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(uint32_t) * (QEMU_CLIPBOARD_TYPE__COUNT + 1));
+    uint8_t *s = msg->data;
+    uint32_t *data = (uint32_t *)(msg->data + 4);
+    uint32_t q, v, type;
+
+    for (q = 0, v = 0; q < QEMU_CLIPBOARD_TYPE__COUNT; q++) {
+        type = type_qemu_to_vdagent(q);
+        if (type != VD_AGENT_CLIPBOARD_NONE && info->types[q].available) {
+            data[v++] = type;
+        }
+    }
+
+    *s = info->selection;
+    msg->type = VD_AGENT_CLIPBOARD_GRAB;
+    msg->size = sizeof(uint32_t) * (v + 1);
+
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
+    uint32_t *t = (uint32_t *)(msg->data + 4);
+    uint8_t *d = msg->data + 8;
+
+    *s = info->selection;
+    *t = type_qemu_to_vdagent(type);
+    memcpy(d, info->types[type].data, info->types[type].size);
+
+    msg->type = VD_AGENT_CLIPBOARD;
+    msg->size = sizeof(uint32_t) * 2 + info->types[type].size;
+
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
+        qemu_clipboard_info_put(vd->cbinfo[s]);
+        vd->cbinfo[s] = qemu_clipboard_info_get(info);
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
+    uint32_t *data = (uint32_t *)(msg->data + 4);
+
+    if (type == VD_AGENT_CLIPBOARD_NONE) {
+        return;
+    }
+
+    *s = info->selection;
+    *data = type;
+    msg->type = VD_AGENT_CLIPBOARD_REQUEST;
+    msg->size = sizeof(uint32_t) * 2;
+
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
+    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION)) {
+        if (size < 4) {
+            return;
+        }
+        s = *(uint8_t *)data;
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
+        qemu_clipboard_info_put(info);
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
+            qemu_clipboard_info_put(info);
+        }
+        break;
+    }
+}
+
 /* ------------------------------------------------------------------ */
 /* chardev backend                                                    */
 
@@ -252,6 +485,11 @@ static void vdagent_chr_open(Chardev *chr,
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
@@ -283,6 +521,15 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE) && vd->mouse_hs) {
         qemu_input_handler_activate(vd->mouse_hs);
     }
+    if (vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_BY_DEMAND) &&
+        vd->caps & (1 << VD_AGENT_CAP_CLIPBOARD_SELECTION) &&
+        vd->clipboard &&
+        vd->cbpeer.update.notify == NULL) {
+        vd->cbpeer.name = "vdagent";
+        vd->cbpeer.update.notify = vdagent_clipboard_notify;
+        vd->cbpeer.request = vdagent_clipboard_request;
+        qemu_clipboard_peer_register(&vd->cbpeer);
+    }
 }
 
 static void vdagent_chr_recv(VDAgentChardev *vd)
@@ -307,6 +554,12 @@ static void vdagent_chr_recv(VDAgentChardev *vd)
     case VD_AGENT_ANNOUNCE_CAPABILITIES:
         vdagent_chr_recv_caps(vd, msg);
         break;
+    case VD_AGENT_CLIPBOARD:
+    case VD_AGENT_CLIPBOARD_GRAB:
+    case VD_AGENT_CLIPBOARD_REQUEST:
+    case VD_AGENT_CLIPBOARD_RELEASE:
+        vdagent_chr_recv_clipboard(vd, msg);
+        break;
     default:
         break;
     }
@@ -375,6 +628,10 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
         if (vd->mouse_hs) {
             qemu_input_handler_deactivate(vd->mouse_hs);
         }
+        if (vd->cbpeer.update.notify) {
+            qemu_clipboard_peer_unregister(&vd->cbpeer);
+            memset(&vd->cbpeer, 0, sizeof(vd->cbpeer));
+        }
         return;
     }
 
@@ -391,6 +648,8 @@ static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,
     qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));
     cfg->has_mouse = true;
     cfg->mouse = qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAULT);
+    cfg->has_clipboard = true;
+    cfg->clipboard = qemu_opt_get_bool(opts, "clipboard", VDAGENT_CLIPBOARD_DEFAULT);
 }
 
 /* ------------------------------------------------------------------ */
diff --git a/qapi/char.json b/qapi/char.json
index 586ef2137368..86b8e202b0ba 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -396,11 +396,13 @@
 # Configuration info for vdagent.
 #
 # @mouse: enable/disable mouse, default is enabled.
+# @clipboard: enable/disable clipboard, default is disabled.
 #
 # Since: 6.0
 ##
 { 'struct': 'ChardevVDAgent',
-  'data': { '*mouse'    : 'bool' },
+  'data': { '*mouse'    : 'bool',
+            '*clipboard': 'bool' },
   'base': 'ChardevCommon' }
 
 ##
diff --git a/ui/trace-events b/ui/trace-events
index c286065f1a94..bcb5954a549a 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -132,3 +132,5 @@ vdagent_send(const char *name) "msg %s"
 vdagent_recv_chunk(uint32_t size) "size %d"
 vdagent_recv_msg(const char *name) "msg %s"
 vdagent_peer_cap(const char *name) "cap %s"
+vdagent_cb_grab_selection(const char *name) "selection %s"
+vdagent_cb_grab_type(const char *name) "type %s"
-- 
2.30.2


