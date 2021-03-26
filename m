Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979B34A47C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:34:57 +0100 (CET)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiro-0007JE-Jp
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPiic-0006xM-G1
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPiiT-0001j9-Rn
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616750714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HL1rbxsg+AtDTgMwz3J+UIt5bc1wMgSI0K+GayKioPA=;
 b=X3ZDG+YZAbUsDLryWFFfn8VZkUaSAU9k6KG6eevIx4eKvgt9Ry44zaPxjPW5bEwcKu/2Ca
 oG2xqZHa+Qs2/RvjbhFZfp2gb4GiyVVLKqeN2an5tpxdHAUtE63GLeBaoIQA8Qmn1rcEL5
 CHm5YEG3qRbOeezY8XO1F9GMvS91gZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-KUYCQnAON2GTdW1G0pNZ9A-1; Fri, 26 Mar 2021 05:25:11 -0400
X-MC-Unique: KUYCQnAON2GTdW1G0pNZ9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B59CB10621A1
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 09:25:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EE710429F0;
 Fri, 26 Mar 2021 09:25:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC16B1800389; Fri, 26 Mar 2021 10:24:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] ui/vdagent: add mouse support
Date: Fri, 26 Mar 2021 10:24:44 +0100
Message-Id: <20210326092448.367016-4-kraxel@redhat.com>
In-Reply-To: <20210326092448.367016-1-kraxel@redhat.com>
References: <20210326092448.367016-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 chardev/char.c |   3 +
 ui/vdagent.c   | 150 +++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/char.json |   4 +-
 3 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/chardev/char.c b/chardev/char.c
index 140d6d9d369a..aa15e6cbdd27 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -930,6 +930,9 @@ QemuOptsList qemu_chardev_opts = {
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
index 98d1a2ee3415..e914a33bae20 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -1,15 +1,25 @@
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
@@ -18,6 +28,14 @@ struct VDAgentChardev {
     uint32_t msgsize;
     uint8_t *xbuf;
     uint32_t xoff, xsize;
+
+    /* mouse */
+    DeviceState mouse_dev;
+    uint32_t mouse_x;
+    uint32_t mouse_y;
+    uint32_t mouse_btn;
+    uint32_t mouse_display;
+    QemuInputHandlerState *mouse_hs;
 };
 typedef struct VDAgentChardev VDAgentChardev;
 
@@ -122,13 +140,113 @@ static void vdagent_send_caps(VDAgentChardev *vd)
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
+static bool have_mouse(VDAgentChardev *vd)
+{
+    return vd->mouse &&
+        (vd->caps & (1 << VD_AGENT_CAP_MOUSE_STATE));
+}
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
+    mouse->x          = vd->mouse_x;
+    mouse->y          = vd->mouse_y;
+    mouse->buttons    = vd->mouse_btn;
+    mouse->display_id = vd->mouse_display;
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
+        vd->mouse_display = qemu_console_get_index(src);
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
 
@@ -137,6 +255,19 @@ static void vdagent_chr_open(Chardev *chr,
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
 
@@ -160,6 +291,9 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (caps->request) {
         vdagent_send_caps(vd);
     }
+    if (have_mouse(vd) && vd->mouse_hs) {
+        qemu_input_handler_activate(vd->mouse_hs);
+    }
 }
 
 static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
@@ -282,18 +416,34 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
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


