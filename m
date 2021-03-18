Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03923401ED
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:24:02 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMosr-0007m6-MO
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMomB-0000ax-Ie
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom4-0004Va-29
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adz32sSmTvlhHmoaOSqnlxKaXR/X5XLKar9v33STnJ4=;
 b=AWy9OK1pJ6Zr4XUQDq32voNR/uMOoJQMlEMmUSjB5QlQn306DUXRJMFemDjD8+DlZ1YL+0
 9Cn/KVE5EBH7YsJUkWm/43izH9fopjiaScMfbWekpm4S+gdmaHjCZnij5nYFBNu00NII+l
 NoqQu6ksJirR0K5/fKp1v/YGlnDGq/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-6cnfSqEFN6mv9T6Mn2ZZ-w-1; Thu, 18 Mar 2021 05:16:56 -0400
X-MC-Unique: 6cnfSqEFN6mv9T6Mn2ZZ-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2BDC100946C
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:16:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B755C1D1;
 Thu, 18 Mar 2021 09:16:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D4683180060A; Thu, 18 Mar 2021 10:16:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] ui/vdagent: add mouse support
Date: Thu, 18 Mar 2021 10:16:43 +0100
Message-Id: <20210318091647.3233178-4-kraxel@redhat.com>
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

This patch adds support for mouse messages to the vdagent
implementation.  This can be enabled/disabled using the new
'mouse' parameter for the vdagent chardev.  Default is on.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/char.c |   3 ++
 ui/vdagent.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json |   4 +-
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/chardev/char.c b/chardev/char.c
index 97cafd68494a..fd4d86d0dd3f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -927,6 +927,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "logappend",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "mouse",
+            .type = QEMU_OPT_BOOL,
 #ifdef CONFIG_LINUX
         },{
             .name = "tight",
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 146ddb8e31b4..61c12b02b573 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -1,21 +1,38 @@
 #include "qemu/osdep.h"
 #include "include/qemu-common.h"
 #include "chardev/char.h"
+#include "hw/qdev-core.h"
+#include "qemu/option.h"
+#include "ui/console.h"
+#include "ui/input.h"
 #include "trace.h"
 
 #include "qapi/qapi-types-char.h"
+#include "qapi/qapi-types-ui.h"
 
 #include "spice/vd_agent.h"
 
+#define VDAGENT_MOUSE_DEFAULT true
+
 struct VDAgentChardev {
     Chardev parent;
 
+    /* config */
+    bool mouse;
+
     /* guest vdagent */
     uint32_t caps;
     VDIChunkHeader chunk;
     uint32_t chunksize;
     uint8_t *msgbuf;
     uint32_t msgsize;
+
+    /* mouse */
+    DeviceState mouse_dev;
+    uint32_t mouse_x;
+    uint32_t mouse_y;
+    uint32_t mouse_btn;
+    QemuInputHandlerState *mouse_hs;
 };
 typedef struct VDAgentChardev VDAgentChardev;
 
@@ -120,13 +137,105 @@ static void vdagent_send_caps(VDAgentChardev *vd)
     g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
                                                sizeof(VDAgentAnnounceCapabilities) +
                                                sizeof(uint32_t));
+    VDAgentAnnounceCapabilities *caps = (void *)msg->data;
 
     msg->type = VD_AGENT_ANNOUNCE_CAPABILITIES;
     msg->size = sizeof(VDAgentAnnounceCapabilities) + sizeof(uint32_t);
+    if (vd->mouse) {
+        caps->caps[0] |= (1 << VD_AGENT_CAP_MOUSE_STATE);
+    }
 
     vdagent_send_msg(vd, msg);
 }
 
+/* ------------------------------------------------------------------ */
+/* mouse events                                                       */
+
+static void vdagent_send_mouse(VDAgentChardev *vd)
+{
+    g_autofree VDAgentMessage *msg = g_malloc0(sizeof(VDAgentMessage) +
+                                               sizeof(VDAgentMouseState));
+    VDAgentMouseState *mouse = (void *)msg->data;
+
+    msg->type = VD_AGENT_MOUSE_STATE;
+    msg->size = sizeof(VDAgentMouseState);
+
+    mouse->x       = vd->mouse_x;
+    mouse->y       = vd->mouse_y;
+    mouse->buttons = vd->mouse_btn;
+
+    vdagent_send_msg(vd, msg);
+}
+
+static void vdagent_pointer_event(DeviceState *dev, QemuConsole *src,
+                                  InputEvent *evt)
+{
+    static const int bmap[INPUT_BUTTON__MAX] = {
+        [INPUT_BUTTON_LEFT]        = VD_AGENT_LBUTTON_MASK,
+        [INPUT_BUTTON_RIGHT]       = VD_AGENT_RBUTTON_MASK,
+        [INPUT_BUTTON_MIDDLE]      = VD_AGENT_MBUTTON_MASK,
+        [INPUT_BUTTON_WHEEL_UP]    = VD_AGENT_UBUTTON_MASK,
+        [INPUT_BUTTON_WHEEL_DOWN]  = VD_AGENT_DBUTTON_MASK,
+#if 0
+        [INPUT_BUTTON_SIDE]        = VD_AGENT_SBUTTON_MASK,
+        [INPUT_BUTTON_EXTRA]       = VD_AGENT_EBUTTON_MASK,
+#endif
+    };
+
+    VDAgentChardev *vd = container_of(dev, struct VDAgentChardev, mouse_dev);
+    InputMoveEvent *move;
+    InputBtnEvent *btn;
+    uint32_t xres, yres;
+
+    switch (evt->type) {
+    case INPUT_EVENT_KIND_ABS:
+        move = evt->u.abs.data;
+        xres = qemu_console_get_width(src, 1024);
+        yres = qemu_console_get_height(src, 768);
+        if (move->axis == INPUT_AXIS_X) {
+            vd->mouse_x = qemu_input_scale_axis(move->value,
+                                                INPUT_EVENT_ABS_MIN,
+                                                INPUT_EVENT_ABS_MAX,
+                                                0, xres);
+        } else if (move->axis == INPUT_AXIS_Y) {
+            vd->mouse_y = qemu_input_scale_axis(move->value,
+                                                INPUT_EVENT_ABS_MIN,
+                                                INPUT_EVENT_ABS_MAX,
+                                                0, yres);
+        }
+        break;
+
+    case INPUT_EVENT_KIND_BTN:
+        btn = evt->u.btn.data;
+        if (btn->down) {
+            vd->mouse_btn |= bmap[btn->button];
+        } else {
+            vd->mouse_btn &= ~bmap[btn->button];
+        }
+        break;
+
+    default:
+        /* keep gcc happy */
+        break;
+    }
+}
+
+static void vdagent_pointer_sync(DeviceState *dev)
+{
+    VDAgentChardev *vd = container_of(dev, struct VDAgentChardev, mouse_dev);
+
+    if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE)) {
+        vdagent_send_mouse(vd);
+    }
+}
+
+static QemuInputHandler vdagent_mouse_handler = {
+    .name  = "vdagent mouse",
+    .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
+    .event = vdagent_pointer_event,
+    .sync  = vdagent_pointer_sync,
+};
+
 /* ------------------------------------------------------------------ */
 /* chardev backend                                                    */
 
@@ -135,6 +244,19 @@ static void vdagent_chr_open(Chardev *chr,
                              bool *be_opened,
                              Error **errp)
 {
+    VDAgentChardev *vd = VDAGENT_CHARDEV(chr);
+    ChardevVDAgent *cfg = backend->u.vdagent.data;
+
+    vd->mouse = VDAGENT_MOUSE_DEFAULT;
+    if (cfg->has_mouse) {
+        vd->mouse = cfg->mouse;
+    }
+
+    if (vd->mouse) {
+        vd->mouse_hs = qemu_input_handler_register(&vd->mouse_dev,
+                                                   &vdagent_mouse_handler);
+    }
+
     *be_opened = true;
 }
 
@@ -158,6 +280,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (caps->request) {
         vdagent_send_caps(vd);
     }
+    if (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE) && vd->mouse_hs) {
+        qemu_input_handler_activate(vd->mouse_hs);
+    }
 }
 
 static void vdagent_chr_recv(VDAgentChardev *vd)
@@ -247,18 +372,34 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
         /* reset state */
         vdagent_reset_bufs(vd);
         vd->caps = 0;
+        if (vd->mouse_hs) {
+            qemu_input_handler_deactivate(vd->mouse_hs);
+        }
         return;
     }
 
     trace_vdagent_open();
 }
 
+static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                              Error **errp)
+{
+    ChardevVDAgent *cfg;
+
+    backend->type = CHARDEV_BACKEND_KIND_VDAGENT;
+    cfg = backend->u.vdagent.data = g_new0(ChardevVDAgent, 1);
+    qemu_chr_parse_common(opts, qapi_ChardevVDAgent_base(cfg));
+    cfg->has_mouse = true;
+    cfg->mouse = qemu_opt_get_bool(opts, "mouse", VDAGENT_MOUSE_DEFAULT);
+}
+
 /* ------------------------------------------------------------------ */
 
 static void vdagent_chr_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
+    cc->parse            = vdagent_chr_parse;
     cc->open             = vdagent_chr_open;
     cc->chr_write        = vdagent_chr_write;
     cc->chr_set_fe_open  = vdagent_chr_set_fe_open;
diff --git a/qapi/char.json b/qapi/char.json
index 6e565ce42753..586ef2137368 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -395,10 +395,12 @@
 #
 # Configuration info for vdagent.
 #
+# @mouse: enable/disable mouse, default is enabled.
+#
 # Since: 6.0
 ##
 { 'struct': 'ChardevVDAgent',
-  'data': { },
+  'data': { '*mouse'    : 'bool' },
   'base': 'ChardevCommon' }
 
 ##
-- 
2.30.2


