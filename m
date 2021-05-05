Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86F3734E3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:14:46 +0200 (CEST)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leAo1-0002JX-I4
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAj0-0004yx-HZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAiy-0001oS-2L
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620194971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IloglYeMQuhagYaxisju2rLj7ZPUENYdDHAC47DQ7AI=;
 b=jKhMHbSUjWZajy0OXK+BR3nlQW7frRqaqyVsuXsq3m4WcBmOjTjcyeCHKQZLttW1SfQXny
 ij22qAfRK3osjWykZhaG2YtlY2bftoSB3iAaXoFo8jKWkeMZdGqx77AlVUj3FLrATMH1Fh
 zJG7/nVu94FrggRD2voX+8OaDl+p+A0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-eEHFqDdvN2u47okxLZynWg-1; Wed, 05 May 2021 02:09:28 -0400
X-MC-Unique: eEHFqDdvN2u47okxLZynWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20D338042BC
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 06:09:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13EF25D6D1;
 Wed,  5 May 2021 06:09:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A50771800794; Wed,  5 May 2021 08:09:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/9] ui/vdagent: core infrastructure
Date: Wed,  5 May 2021 08:08:56 +0200
Message-Id: <20210505060901.828658-5-kraxel@redhat.com>
In-Reply-To: <20210505060901.828658-1-kraxel@redhat.com>
References: <20210505060901.828658-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

The vdagent protocol allows the guest agent (spice-vdagent) and the
spice client exchange messages to implement features which require
guest cooperation, for example clipboard support.

This is a qemu implementation of the spice client side.  This allows
the spice guest agent talk to qemu directly when not using the spice
protocol.

usage: qemu \
  -chardev qemu-vdagent,id=vdagent \
  -device virtserialport,chardev=vdagent,name=com.redhat.spice.0

This patch adds just the protocol basics: initial handshake and
capability negotiation.  The following patches will add actual
functionality and also add fields to the initially empty
ChardevVDAgent qapi struct.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 ui/vdagent.c    | 323 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json  |  17 ++-
 ui/meson.build  |   1 +
 ui/trace-events |   8 ++
 4 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 ui/vdagent.c

diff --git a/ui/vdagent.c b/ui/vdagent.c
new file mode 100644
index 000000000000..e757a3c9c710
--- /dev/null
+++ b/ui/vdagent.c
@@ -0,0 +1,323 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
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
+    uint8_t *xbuf;
+    uint32_t xoff, xsize;
+};
+typedef struct VDAgentChardev VDAgentChardev;
+
+#define TYPE_CHARDEV_QEMU_VDAGENT "chardev-qemu-vdagent"
+
+DECLARE_INSTANCE_CHECKER(VDAgentChardev, QEMU_VDAGENT_CHARDEV,
+                         TYPE_CHARDEV_QEMU_VDAGENT);
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
+#if defined(HOST_WORDS_BIGENDIAN)
+    /*
+     * TODO: vdagent protocol is defined to be LE,
+     * so we have to byteswap everything on BE hosts.
+     */
+    error_setg(errp, "vdagent is not supported on bigendian hosts");
+    return;
+#endif
+
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
+static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
+{
+    trace_vdagent_recv_msg(GET_NAME(msg_name, msg->type), msg->size);
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
+static void vdagent_reset_xbuf(VDAgentChardev *vd)
+{
+    g_clear_pointer(&vd->xbuf, g_free);
+    vd->xoff = 0;
+    vd->xsize = 0;
+}
+
+static void vdagent_chr_recv_chunk(VDAgentChardev *vd)
+{
+    VDAgentMessage *msg = (void *)vd->msgbuf;
+
+    if (!vd->xsize) {
+        if (vd->msgsize < sizeof(*msg)) {
+            error_report("%s: message too small: %d < %zd", __func__,
+                         vd->msgsize, sizeof(*msg));
+            return;
+        }
+        if (vd->msgsize == msg->size + sizeof(*msg)) {
+            vdagent_chr_recv_msg(vd, msg);
+            return;
+        }
+    }
+
+    if (!vd->xsize) {
+        vd->xsize = msg->size + sizeof(*msg);
+        vd->xbuf = g_malloc0(vd->xsize);
+    }
+
+    if (vd->xoff + vd->msgsize > vd->xsize) {
+        error_report("%s: Oops: %d+%d > %d", __func__,
+                     vd->xoff, vd->msgsize, vd->xsize);
+        vdagent_reset_xbuf(vd);
+        return;
+    }
+
+    memcpy(vd->xbuf + vd->xoff, vd->msgbuf, vd->msgsize);
+    vd->xoff += vd->msgsize;
+    if (vd->xoff < vd->xsize) {
+        return;
+    }
+
+    msg = (void *)vd->xbuf;
+    vdagent_chr_recv_msg(vd, msg);
+    vdagent_reset_xbuf(vd);
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
+    VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
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
+            vdagent_chr_recv_chunk(vd);
+            vdagent_reset_bufs(vd);
+        }
+    }
+
+    return ret;
+}
+
+static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
+{
+    VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
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
+    .name = TYPE_CHARDEV_QEMU_VDAGENT,
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
index 6413970fa73b..990801e642bb 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -390,12 +390,25 @@
   'data': { '*size': 'int' },
   'base': 'ChardevCommon' }
 
+##
+# @ChardevQemuVDAgent:
+#
+# Configuration info for qemu vdagent implementation.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'ChardevQemuVDAgent',
+  'data': { },
+  'base': 'ChardevCommon',
+  'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
+
 ##
 # @ChardevBackend:
 #
 # Configuration info for the new chardev backend.
 #
-# Since: 1.4 (testdev since 2.2, wctablet since 2.9)
+# Since: 1.4 (testdev since 2.2, wctablet since 2.9, vdagent since 6.1)
 ##
 { 'union': 'ChardevBackend',
   'data': { 'file': 'ChardevFile',
@@ -417,6 +430,8 @@
                           'if': 'defined(CONFIG_SPICE)' },
             'spiceport': { 'type': 'ChardevSpicePort',
                            'if': 'defined(CONFIG_SPICE)' },
+            'qemu-vdagent': { 'type': 'ChardevQemuVDAgent',
+                              'if': 'defined(CONFIG_SPICE_PROTOCOL)' },
             'vc': 'ChardevVC',
             'ringbuf': 'ChardevRingbuf',
             # next one is just for compatibility
diff --git a/ui/meson.build b/ui/meson.build
index fc4fb75c2869..bad49fb6de60 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,6 +14,7 @@ softmmu_ss.add(files(
   'qemu-pixman.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
+softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
 
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
diff --git a/ui/trace-events b/ui/trace-events
index 5d1da6f23668..c34cffb0452b 100644
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
+vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
+vdagent_peer_cap(const char *name) "cap %s"
-- 
2.31.1


