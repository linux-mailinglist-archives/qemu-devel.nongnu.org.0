Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349731F9B7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:18:16 +0100 (CET)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5ff-00063E-UB
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bg-00048R-1K
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bd-0006OV-IY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SZCXEhw4xveBj3Dl+GriVOJ2nW/bx+vH62KneQF4F4=;
 b=Q8G+0IxzCrz0cjxH+MqgPFuIkhGnrexML0H4F9YuXbO2tDvBiTASu3MRzVcnQ1Hlp3bvYf
 7NeGMonUwS/oKDTIVXPfpvW+G7CWCnROPCh2ilWPDuKw5/9XDVynPth9hftusK6hCxofp4
 hFkMmIpUpsLdymI/XQXXYHZDM34ZhSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-2RoKyucQPgu4dMH8Wj62CA-1; Fri, 19 Feb 2021 08:13:58 -0500
X-MC-Unique: 2RoKyucQPgu4dMH8Wj62CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4196D506
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:13:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE335C1BB;
 Fri, 19 Feb 2021 13:13:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E28D1800396; Fri, 19 Feb 2021 14:13:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] ui/vdagent: core infrastructure
Date: Fri, 19 Feb 2021 14:13:44 +0100
Message-Id: <20210219131349.3993192-3-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-1-kraxel@redhat.com>
References: <20210219131349.3993192-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
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
  -chardev vdagent,id=vdagent \
  -device virtserialport,chardev=vdagent,name=com.redhat.spice.0

This patch adds just the protocol basics: initial handshake and
capability negotiation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c    | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json  |  13 +++
 ui/meson.build  |   1 +
 ui/trace-events |   7 ++
 4 files changed, 261 insertions(+)
 create mode 100644 ui/vdagent.c

diff --git a/ui/vdagent.c b/ui/vdagent.c
new file mode 100644
index 000000000000..9ef4ed3f4dd8
--- /dev/null
+++ b/ui/vdagent.c
@@ -0,0 +1,240 @@
+#include "qemu/osdep.h"
+#include "include/qemu-common.h"
+#include "chardev/char.h"
+#include "trace.h"
+
+#include "qapi/qapi-types-char.h"
+
+#include "spice/vd_agent.h"
+
+#define MSGSIZE_MAX (sizeof(VDIChunkHeader) + \
+                     sizeof(VDAgentMessage) + \
+                     VD_AGENT_MAX_DATA_SIZE)
+
+struct VDAgentChardev {
+    Chardev parent;
+
+    /* guest vdagent */
+    uint32_t caps;
+    uint8_t msgbuf[MSGSIZE_MAX];
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
+    VDIChunkHeader chunk;
+
+    trace_vdagent_send(GET_NAME(msg_name, msg->type));
+
+    chunk.port = VDP_CLIENT_PORT;
+    chunk.size = msgsize;
+    vdagent_send_buf(vd, &chunk, sizeof(chunk));
+
+    msg->protocol = VD_AGENT_PROTOCOL;
+    vdagent_send_buf(vd, msgbuf, msgsize);
+    g_free(msg);
+}
+
+static void vdagent_send_caps(VDAgentChardev *vd)
+{
+    VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                    sizeof(VDAgentAnnounceCapabilities) +
+                                    sizeof(uint32_t));
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
+static uint32_t vdagent_chr_recv(VDAgentChardev *vd)
+{
+    VDIChunkHeader *chunk = (void *)vd->msgbuf;
+    VDAgentMessage *msg = (void *)vd->msgbuf + sizeof(VDIChunkHeader);
+
+    if (sizeof(VDIChunkHeader) + chunk->size > vd->msgsize) {
+        return 0;
+    }
+
+    trace_vdagent_recv(GET_NAME(msg_name, msg->type));
+
+    switch (msg->type) {
+    case VD_AGENT_ANNOUNCE_CAPABILITIES:
+        vdagent_chr_recv_caps(vd, msg);
+        break;
+    default:
+        break;
+    }
+
+    return sizeof(VDIChunkHeader) + chunk->size;
+}
+
+static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
+{
+    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
+    uint32_t copy, move;
+
+    copy = MSGSIZE_MAX - vd->msgsize;
+    if (copy > len) {
+        copy = len;
+    }
+
+    memcpy(vd->msgbuf + vd->msgsize, buf, copy);
+    vd->msgsize += copy;
+
+    while (vd->msgsize > sizeof(VDIChunkHeader)) {
+        move = vdagent_chr_recv(vd);
+        if (move == 0) {
+            break;
+        }
+
+        memmove(vd->msgbuf, vd->msgbuf + move, vd->msgsize - move);
+        vd->msgsize -= move;
+    }
+
+    return copy;
+}
+
+static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
+{
+    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
+
+    if (!fe_open) {
+        trace_vdagent_close();
+        /* reset state */
+        vd->msgsize = 0;
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
index 58338ed62d43..62e161aea343 100644
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
index fbb9a512042a..08447ac15c5e 100644
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
index 0ffcdb4408a6..1a5bd3861da5 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -108,3 +108,10 @@ xkeymap_extension(const char *name) "extension '%s'"
 xkeymap_vendor(const char *name) "vendor '%s'"
 xkeymap_keycodes(const char *name) "keycodes '%s'"
 xkeymap_keymap(const char *name) "keymap '%s'"
+
+# vdagent.c
+vdagent_open(void) ""
+vdagent_close(void) ""
+vdagent_send(const char *name) "msg %s"
+vdagent_recv(const char *name) "msg %s"
+vdagent_peer_cap(const char *name) "cap %s"
-- 
2.29.2


