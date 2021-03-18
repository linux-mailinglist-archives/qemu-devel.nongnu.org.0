Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DF3401CB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:19:38 +0100 (CET)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoob-0002JG-AG
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom5-0000YP-Mi
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom3-0004VP-77
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKRdzJFUlX97FqVxlzesiwoLL1DpY+N7qCeqTpzpFxg=;
 b=SixAgCfHsIt13zJBi1l61BsLyZto6sylfPD9s4D4+KyNVcHAlxZZiDCnq4GFHuFQycKcN5
 3o3jWFnBN7iTVkbl86N3t061lo153kXXwHiO1TmIpWbWGbuJm2DqvvYsxwLlAQdQXUti+H
 0LQ2g9V+QqgF9jmVDMLzzR3KPn1ENI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-5H8vpNvLO56nMBoQwExNPw-1; Thu, 18 Mar 2021 05:16:56 -0400
X-MC-Unique: 5H8vpNvLO56nMBoQwExNPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6AC9593B6
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:16:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A495C8BE;
 Thu, 18 Mar 2021 09:16:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4B6818003BE; Thu, 18 Mar 2021 10:16:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] ui/vdagent: core infrastructure
Date: Thu, 18 Mar 2021 10:16:42 +0100
Message-Id: <20210318091647.3233178-3-kraxel@redhat.com>
In-Reply-To: <20210318091647.3233178-1-kraxel@redhat.com>
References: <20210318091647.3233178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vdagent protocol allows the guest agent (spice-vdagent) and the
spice client exchange messages to implement features which require
guest cooperation, for example clipboard support.

This is a qemu implementation of the spice client side.  This allows
the spice guest agent talk to qemu directly when not using the spice
protocol.

usage: qemu \
  -chardev vdagent,id=vdagent \
  -device virtserialport,chardev=vdagent,name=com.redhat.spice.0

This patch adds just the protocol basics: initial handshake and
capability negotiation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c    | 279 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json  |  13 +++
 ui/meson.build  |   1 +
 ui/trace-events |   8 ++
 4 files changed, 301 insertions(+)
 create mode 100644 ui/vdagent.c

diff --git a/ui/vdagent.c b/ui/vdagent.c
new file mode 100644
index 000000000000..146ddb8e31b4
--- /dev/null
+++ b/ui/vdagent.c
@@ -0,0 +1,279 @@
+#include "qemu/osdep.h"
+#include "include/qemu-common.h"
+#include "chardev/char.h"
+#include "trace.h"
+
+#include "qapi/qapi-types-char.h"
+
+#include "spice/vd_agent.h"
+
+struct VDAgentChardev {
+    Chardev parent;
+
+    /* guest vdagent */
+    uint32_t caps;
+    VDIChunkHeader chunk;
+    uint32_t chunksize;
+    uint8_t *msgbuf;
+    uint32_t msgsize;
+};
+typedef struct VDAgentChardev VDAgentChardev;
+
+#define TYPE_CHARDEV_VDAGENT "chardev-vdagent"
+
+DECLARE_INSTANCE_CHECKER(VDAgentChardev, VDAGENT_CHARDEV,
+                         TYPE_CHARDEV_VDAGENT);
+
+/* ------------------------------------------------------------------ */
+/* names, for debug logging                                           */
+
+static const char *cap_name[] = {
+    [VD_AGENT_CAP_MOUSE_STATE]                    = "mouse-state",
+    [VD_AGENT_CAP_MONITORS_CONFIG]                = "monitors-config",
+    [VD_AGENT_CAP_REPLY]                          = "reply",
+    [VD_AGENT_CAP_CLIPBOARD]                      = "clipboard",
+    [VD_AGENT_CAP_DISPLAY_CONFIG]                 = "display-config",
+    [VD_AGENT_CAP_CLIPBOARD_BY_DEMAND]            = "clipboard-by-demand",
+    [VD_AGENT_CAP_CLIPBOARD_SELECTION]            = "clipboard-selection",
+    [VD_AGENT_CAP_SPARSE_MONITORS_CONFIG]         = "sparse-monitors-config",
+    [VD_AGENT_CAP_GUEST_LINEEND_LF]               = "guest-lineend-lf",
+    [VD_AGENT_CAP_GUEST_LINEEND_CRLF]             = "guest-lineend-crlf",
+    [VD_AGENT_CAP_MAX_CLIPBOARD]                  = "max-clipboard",
+    [VD_AGENT_CAP_AUDIO_VOLUME_SYNC]              = "audio-volume-sync",
+    [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]       = "monitors-config-position",
+    [VD_AGENT_CAP_FILE_XFER_DISABLED]             = "file-xfer-disabled",
+    [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]      = "file-xfer-detailed-errors",
+#if 0
+    [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]           = "graphics-device-info",
+    [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] = "clipboard-no-release-on-regrab",
+    [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]          = "clipboard-grab-serial",
+#endif
+};
+
+static const char *msg_name[] = {
+    [VD_AGENT_MOUSE_STATE]           = "mouse-state",
+    [VD_AGENT_MONITORS_CONFIG]       = "monitors-config",
+    [VD_AGENT_REPLY]                 = "reply",
+    [VD_AGENT_CLIPBOARD]             = "clipboard",
+    [VD_AGENT_DISPLAY_CONFIG]        = "display-config",
+    [VD_AGENT_ANNOUNCE_CAPABILITIES] = "announce-capabilities",
+    [VD_AGENT_CLIPBOARD_GRAB]        = "clipboard-grab",
+    [VD_AGENT_CLIPBOARD_REQUEST]     = "clipboard-request",
+    [VD_AGENT_CLIPBOARD_RELEASE]     = "clipboard-release",
+    [VD_AGENT_FILE_XFER_START]       = "file-xfer-start",
+    [VD_AGENT_FILE_XFER_STATUS]      = "file-xfer-status",
+    [VD_AGENT_FILE_XFER_DATA]        = "file-xfer-data",
+    [VD_AGENT_CLIENT_DISCONNECTED]   = "client-disconnected",
+    [VD_AGENT_MAX_CLIPBOARD]         = "max-clipboard",
+    [VD_AGENT_AUDIO_VOLUME_SYNC]     = "audio-volume-sync",
+#if 0
+    [VD_AGENT_GRAPHICS_DEVICE_INFO]  = "graphics-device-info",
+#endif
+};
+
+#define GET_NAME(_m, _v) \
+    (((_v) < ARRAY_SIZE(_m) && (_m[_v])) ? (_m[_v]) : "???")
+
+/* ------------------------------------------------------------------ */
+/* send messages                                                      */
+
+static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t msgsize)
+{
+    uint8_t *msgbuf = ptr;
+    uint32_t len, pos = 0;
+
+    while (pos < msgsize) {
+        len = qemu_chr_be_can_write(CHARDEV(vd));
+        if (len > msgsize - pos) {
+            len = msgsize - pos;
+        }
+        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
+        pos += len;
+    }
+}
+
+static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)
+{
+    uint8_t *msgbuf = (void *)msg;
+    uint32_t msgsize = sizeof(VDAgentMessage) + msg->size;
+    uint32_t msgoff = 0;
+    VDIChunkHeader chunk;
+
+    trace_vdagent_send(GET_NAME(msg_name, msg->type));
+
+    msg->protocol = VD_AGENT_PROTOCOL;
+
+    while (msgoff < msgsize) {
+        chunk.port = VDP_CLIENT_PORT;
+        chunk.size = msgsize - msgoff;
+        if (chunk.size > 1024) {
+            chunk.size = 1024;
+        }
+        vdagent_send_buf(vd, &chunk, sizeof(chunk));
+        vdagent_send_buf(vd, msgbuf + msgoff, chunk.size);
+        msgoff += chunk.size;
+    }
+}
+
+static void vdagent_send_caps(VDAgentChardev *vd)
+{
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(VDAgentAnnounceCapabilities) +
+                                               sizeof(uint32_t));
+
+    msg->type = VD_AGENT_ANNOUNCE_CAPABILITIES;
+    msg->size = sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32_t);
+
+    vdagent_send_msg(vd, msg);
+}
+
+/* ------------------------------------------------------------------ */
+/* chardev backend                                                    */
+
+static void vdagent_chr_open(Chardev *chr,
+                             ChardevBackend *backend,
+                             bool *be_opened,
+                             Error **errp)
+{
+    *be_opened = true;
+}
+
+static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
+{
+    VDAgentAnnounceCapabilities *caps = (void *)msg->data;
+    int i;
+
+    if (msg->size < (sizeof(VDAgentAnnounceCapabilities) +
+                     sizeof(uint32_t))) {
+        return;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(cap_name); i++) {
+        if (caps->caps[0] & (1 << i)) {
+            trace_vdagent_peer_cap(GET_NAME(cap_name, i));
+        }
+    }
+
+    vd->caps = caps->caps[0];
+    if (caps->request) {
+        vdagent_send_caps(vd);
+    }
+}
+
+static void vdagent_chr_recv(VDAgentChardev *vd)
+{
+    VDAgentMessage *msg = (void *)vd->msgbuf;
+
+    if (vd->msgsize < sizeof(*msg)) {
+        fprintf(stderr, "%s: message too small: %d < %zd\n", __func__,
+                vd->msgsize, sizeof(*msg));
+        return;
+    }
+    if (vd->msgsize != msg->size + sizeof(*msg)) {
+        /* FIXME: handle parse messages splitted into multiple chunks */
+        fprintf(stderr, "%s: size mismatch: chunk %d, msg %d (+%zd)\n",
+                __func__, vd->msgsize, msg->size, sizeof(*msg));
+        return;
+    }
+
+    trace_vdagent_recv_msg(GET_NAME(msg_name, msg->type));
+
+    switch (msg->type) {
+    case VD_AGENT_ANNOUNCE_CAPABILITIES:
+        vdagent_chr_recv_caps(vd, msg);
+        break;
+    default:
+        break;
+    }
+}
+
+static void vdagent_reset_bufs(VDAgentChardev *vd)
+{
+    memset(&vd->chunk, 0, sizeof(vd->chunk));
+    vd->chunksize = 0;
+    g_free(vd->msgbuf);
+    vd->msgbuf = NULL;
+    vd->msgsize = 0;
+}
+
+static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
+{
+    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
+    uint32_t copy, ret = len;
+
+    while (len) {
+        if (vd->chunksize < sizeof(vd->chunk)) {
+            copy = sizeof(vd->chunk) - vd->chunksize;
+            if (copy > len) {
+                copy = len;
+            }
+            memcpy((void *)(&vd->chunk) + vd->chunksize, buf, copy);
+            vd->chunksize += copy;
+            buf += copy;
+            len -= copy;
+            if (vd->chunksize < sizeof(vd->chunk)) {
+                break;
+            }
+
+            assert(vd->msgbuf == NULL);
+            vd->msgbuf = g_malloc0(vd->chunk.size);
+        }
+
+        copy = vd->chunk.size - vd->msgsize;
+        if (copy > len) {
+            copy = len;
+        }
+        memcpy(vd->msgbuf + vd->msgsize, buf, copy);
+        vd->msgsize += copy;
+        buf += copy;
+        len -= copy;
+
+        if (vd->msgsize == vd->chunk.size) {
+            trace_vdagent_recv_chunk(vd->chunk.size);
+            vdagent_chr_recv(vd);
+            vdagent_reset_bufs(vd);
+        }
+    }
+
+    return ret;
+}
+
+static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
+{
+    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
+
+    if (!fe_open) {
+        trace_vdagent_close();
+        /* reset state */
+        vdagent_reset_bufs(vd);
+        vd->caps = 0;
+        return;
+    }
+
+    trace_vdagent_open();
+}
+
+/* ------------------------------------------------------------------ */
+
+static void vdagent_chr_class_init(ObjectClass *oc, void *data)
+{
+    ChardevClass *cc = CHARDEV_CLASS(oc);
+
+    cc->open             = vdagent_chr_open;
+    cc->chr_write        = vdagent_chr_write;
+    cc->chr_set_fe_open  = vdagent_chr_set_fe_open;
+}
+
+static const TypeInfo vdagent_chr_type_info = {
+    .name = TYPE_CHARDEV_VDAGENT,
+    .parent = TYPE_CHARDEV,
+    .instance_size = sizeof(VDAgentChardev),
+    .class_init = vdagent_chr_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&vdagent_chr_type_info);
+}
+
+type_init(register_types);
diff --git a/qapi/char.json b/qapi/char.json
index 6413970fa73b..6e565ce42753 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -390,6 +390,17 @@
   'data': { '*size': 'int' },
   'base': 'ChardevCommon' }
 
+##
+# @ChardevVDAgent:
+#
+# Configuration info for vdagent.
+#
+# Since: 6.0
+##
+{ 'struct': 'ChardevVDAgent',
+  'data': { },
+  'base': 'ChardevCommon' }
+
 ##
 # @ChardevBackend:
 #
@@ -417,6 +428,8 @@
                           'if': 'defined(CONFIG_SPICE)' },
             'spiceport': { 'type': 'ChardevSpicePort',
                            'if': 'defined(CONFIG_SPICE)' },
+            'vdagent': { 'type': 'ChardevVDAgent',
+                         'if': 'defined(CONFIG_SPICE)' },
             'vc': 'ChardevVC',
             'ringbuf': 'ChardevRingbuf',
             # next one is just for compatibility
diff --git a/ui/meson.build b/ui/meson.build
index fc4fb75c2869..3d382b3b9019 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,6 +14,7 @@ softmmu_ss.add(files(
   'qemu-pixman.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
+softmmu_ss.add(when: spice_headers, if_true: files('vdagent.c'))
 
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
diff --git a/ui/trace-events b/ui/trace-events
index 5d1da6f23668..c286065f1a94 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -124,3 +124,11 @@ xkeymap_extension(const char *name) "extension '%s'"
 xkeymap_vendor(const char *name) "vendor '%s'"
 xkeymap_keycodes(const char *name) "keycodes '%s'"
 xkeymap_keymap(const char *name) "keymap '%s'"
+
+# vdagent.c
+vdagent_open(void) ""
+vdagent_close(void) ""
+vdagent_send(const char *name) "msg %s"
+vdagent_recv_chunk(uint32_t size) "size %d"
+vdagent_recv_msg(const char *name) "msg %s"
+vdagent_peer_cap(const char *name) "cap %s"
-- 
2.30.2


