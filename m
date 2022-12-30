Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DA659977
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGeT-0003jH-Ud; Fri, 30 Dec 2022 09:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dengpc12@chinatelecom.cn>)
 id 1pBBpJ-0000QV-7u
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:21 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dengpc12@chinatelecom.cn>) id 1pBBpF-0000zN-MS
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:20 -0500
HMM_SOURCE_IP: 172.18.0.188:50172.2056949848
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.221.141.170 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 9B5B22800B0;
 Fri, 30 Dec 2022 17:28:12 +0800 (CST)
X-189-SAVE-TO-SEND: +dengpc12@chinatelecom.cn
Received: from  ([171.221.141.170])
 by app0023 with ESMTP id 779ea4cbe6714e9fb7371c7126b077fa for
 qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:28:14 CST
X-Transaction-ID: 779ea4cbe6714e9fb7371c7126b077fa
X-Real-From: dengpc12@chinatelecom.cn
X-Receive-IP: 171.221.141.170
X-MEDUSA-Status: 0
From: dengpc12@chinatelecom.cn
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, huangy81@chinatelecom.cn,
 liuym16@chinatelecom.cn, kraxel@redhat.com,
 "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
Subject: [PATCH RFC 2/4] vdagent: refactor vdagent_chr_recv_caps function
Date: Fri, 30 Dec 2022 17:27:56 +0800
Message-Id: <20221230092758.281805-3-dengpc12@chinatelecom.cn>
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
X-Mailman-Approved-At: Fri, 30 Dec 2022 09:46:08 -0500
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

Abstract vdagent registry logic into
vdagent_register_to_qemu_clipboard.

Note that trace log of vdagent_recv_caps also be added.

Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
---
 ui/trace-events |  1 +
 ui/vdagent.c    | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/ui/trace-events b/ui/trace-events
index 977577fbba..5e50b60da5 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -143,6 +143,7 @@ vdagent_cb_grab_selection(const char *name) "selection %s"
 vdagent_cb_grab_discard(const char *name, int cur, int recv) "selection %s, cur:%d recv:%d"
 vdagent_cb_grab_type(const char *name) "type %s"
 vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
+vdagent_recv_caps(uint32_t caps) "received caps %u"
 
 # dbus.c
 dbus_registered_listener(const char *bus_name) "peer %s"
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 645383b4ec..38061d5b38 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -696,6 +696,16 @@ static void vdagent_chr_open(Chardev *chr,
     *be_opened = true;
 }
 
+static void vdagent_register_to_qemu_clipboard(VDAgentChardev *vd)
+{
+    if (have_clipboard(vd) && vd->cbpeer.notifier.notify == NULL) {
+        vd->cbpeer.name = "vdagent";
+        vd->cbpeer.notifier.notify = vdagent_clipboard_notify;
+        vd->cbpeer.request = vdagent_clipboard_request;
+        qemu_clipboard_peer_register(&vd->cbpeer);
+    }
+}
+
 static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
 {
     VDAgentAnnounceCapabilities *caps = (void *)msg->data;
@@ -720,14 +730,10 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
         qemu_input_handler_activate(vd->mouse_hs);
     }
 
-    memset(vd->last_serial, 0, sizeof(vd->last_serial));
+    trace_vdagent_recv_caps(vd->caps);
 
-    if (have_clipboard(vd) && vd->cbpeer.notifier.notify == NULL) {
-        vd->cbpeer.name = "vdagent";
-        vd->cbpeer.notifier.notify = vdagent_clipboard_notify;
-        vd->cbpeer.request = vdagent_clipboard_request;
-        qemu_clipboard_peer_register(&vd->cbpeer);
-    }
+    memset(vd->last_serial, 0, sizeof(vd->last_serial));
+    vdagent_register_to_qemu_clipboard(vd);
 }
 
 static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg)
-- 
2.27.0


