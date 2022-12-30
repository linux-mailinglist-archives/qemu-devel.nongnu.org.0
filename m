Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B0F659975
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGeY-0003kG-HS; Fri, 30 Dec 2022 09:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dengpc12@chinatelecom.cn>)
 id 1pBBpJ-0000QQ-7i
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:21 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dengpc12@chinatelecom.cn>) id 1pBBpF-0000zL-Gh
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:20 -0500
HMM_SOURCE_IP: 172.18.0.188:50172.2056949848
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.221.141.170 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id A38F52800AE;
 Fri, 30 Dec 2022 17:28:14 +0800 (CST)
X-189-SAVE-TO-SEND: +dengpc12@chinatelecom.cn
Received: from  ([171.221.141.170])
 by app0023 with ESMTP id 926be932422e424e8237a8728e802016 for
 qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:28:16 CST
X-Transaction-ID: 926be932422e424e8237a8728e802016
X-Real-From: dengpc12@chinatelecom.cn
X-Receive-IP: 171.221.141.170
X-MEDUSA-Status: 0
From: dengpc12@chinatelecom.cn
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, huangy81@chinatelecom.cn,
 liuym16@chinatelecom.cn, kraxel@redhat.com,
 "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
Subject: [PATCH RFC 3/4] vdagent: add live migration support
Date: Fri, 30 Dec 2022 17:27:57 +0800
Message-Id: <20221230092758.281805-4-dengpc12@chinatelecom.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
References: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=dengpc12@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Dec 2022 09:46:09 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>

To support live migration, we made the following 2 modifications:
1. save the caps field of VDAgentChardev.
2. register vdagent to qemu-clipboard after
   vm device state being reloaded during live migration.

Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
---
 ui/trace-events |  1 +
 ui/vdagent.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/ui/trace-events b/ui/trace-events
index 5e50b60da5..ccacd867d1 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -144,6 +144,7 @@ vdagent_cb_grab_discard(const char *name, int cur, int recv) "selection %s, cur:
 vdagent_cb_grab_type(const char *name) "type %s"
 vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
 vdagent_recv_caps(uint32_t caps) "received caps %u"
+vdagent_migration_caps(uint32_t caps) "migrated caps %u"
 
 # dbus.c
 dbus_registered_listener(const char *bus_name) "peer %s"
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 38061d5b38..1193abe348 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -6,6 +6,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
 #include "migration/blocker.h"
+#include "migration/vmstate.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
@@ -906,6 +907,31 @@ static void vdagent_chr_parse(QemuOpts *opts, ChardevBackend *backend,
 
 /* ------------------------------------------------------------------ */
 
+static int vdagent_post_load(void *opaque, int version_id)
+{
+    VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(opaque);
+
+    trace_vdagent_migration_caps(vd->caps);
+
+    if (vd->caps) {
+        vdagent_register_to_qemu_clipboard(vd);
+        qemu_input_handler_activate(vd->mouse_hs);
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_vdagent = {
+    .name = "vdagent",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = vdagent_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(caps, VDAgentChardev),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static void vdagent_chr_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -922,6 +948,8 @@ static void vdagent_chr_init(Object *obj)
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(obj);
 
     buffer_init(&vd->outbuf, "vdagent-outbuf");
+
+    vmstate_register(NULL, 0, &vmstate_vdagent, vd);
     error_setg(&vd->migration_blocker,
                "The vdagent chardev doesn't yet support migration");
 }
-- 
2.27.0


