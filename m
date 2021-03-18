Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B03401DB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:21:38 +0100 (CET)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoqX-0004UA-2f
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom5-0000Ya-NX
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMom3-0004VO-RL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/3F6Eu421m1jbB/t3b1ThUs8g+1gTxz96B4RTjH9P8=;
 b=WZyVKVDEeSqF86SU3beaN1sWvXza1yRPyLlreUlt9feoMPK8VyzpBzonUzfMgAV+HZl9Hv
 R8IUdydKX/KbQxDW2jpyQivoHRmlIlndL4B+3FFdzMtfCBYUha1CcUfc37XexUE7Na34L8
 3I4lRSKIsMVgS+mOp5Z8QvH0opK1aWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-FaDfvTLSOG-EgJ93U463jw-1; Thu, 18 Mar 2021 05:16:56 -0400
X-MC-Unique: FaDfvTLSOG-EgJ93U463jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C63AF8D1B61
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:16:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F645E1A4;
 Thu, 18 Mar 2021 09:16:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B254418003B0; Thu, 18 Mar 2021 10:16:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] ui: add clipboard infrastructure
Date: Thu, 18 Mar 2021 10:16:41 +0100
Message-Id: <20210318091647.3233178-2-kraxel@redhat.com>
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

Add some infrastructure to manage the clipboard in qemu.

TODO: Add API docs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h | 68 +++++++++++++++++++++++++++++++
 ui/clipboard.c         | 92 ++++++++++++++++++++++++++++++++++++++++++
 ui/meson.build         |  1 +
 3 files changed, 161 insertions(+)
 create mode 100644 include/ui/clipboard.h
 create mode 100644 ui/clipboard.c

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
new file mode 100644
index 000000000000..00ff559425ee
--- /dev/null
+++ b/include/ui/clipboard.h
@@ -0,0 +1,68 @@
+#ifndef QEMU_CLIPBOARD_H
+#define QEMU_CLIPBOARD_H
+
+#include "qemu/notify.h"
+
+typedef enum QemuClipboardType QemuClipboardType;
+typedef enum QemuClipboardSelection QemuClipboardSelection;
+typedef struct QemuClipboardPeer QemuClipboardPeer;
+typedef struct QemuClipboardInfo QemuClipboardInfo;
+
+enum QemuClipboardType {
+    QEMU_CLIPBOARD_TYPE_TEXT,  /* text/plain; charset=utf-8 */
+    QEMU_CLIPBOARD_TYPE__COUNT,
+};
+
+/* same as VD_AGENT_CLIPBOARD_SELECTION_* */
+enum QemuClipboardSelection {
+    QEMU_CLIPBOARD_SELECTION_CLIPBOARD,
+    QEMU_CLIPBOARD_SELECTION_PRIMARY,
+    QEMU_CLIPBOARD_SELECTION_SECONDARY,
+    QEMU_CLIPBOARD_SELECTION__COUNT,
+};
+
+struct QemuClipboardPeer {
+    const char *name;
+    Notifier update;
+    void (*request)(QemuClipboardInfo *info,
+                    QemuClipboardType type);
+};
+
+struct QemuClipboardInfo {
+    uint32_t refcount;
+    QemuClipboardPeer *owner;
+    QemuClipboardSelection selection;
+    struct {
+        bool available;
+        bool requested;
+        size_t size;
+        void *data;
+    } types[QEMU_CLIPBOARD_TYPE__COUNT];
+};
+
+struct QemuClipboardData {
+    uint32_t refcount;
+    QemuClipboardInfo *info;
+    QemuClipboardType type;
+};
+
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
+
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
+                                           QemuClipboardSelection selection);
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);
+void qemu_clipboard_info_put(QemuClipboardInfo *info);
+
+void qemu_clipboard_update(QemuClipboardInfo *info);
+void qemu_clipboard_request(QemuClipboardInfo *info,
+                            QemuClipboardType type);
+
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,
+                             QemuClipboardInfo *info,
+                             QemuClipboardType type,
+                             uint32_t size,
+                             void *data,
+                             bool update);
+
+#endif /* QEMU_CLIPBOARD_H */
diff --git a/ui/clipboard.c b/ui/clipboard.c
new file mode 100644
index 000000000000..556531c578a1
--- /dev/null
+++ b/ui/clipboard.c
@@ -0,0 +1,92 @@
+#include "qemu/osdep.h"
+#include "ui/clipboard.h"
+
+static NotifierList clipboard_notifiers =
+    NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);
+
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
+{
+    notifier_list_add(&clipboard_notifiers, &peer->update);
+}
+
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
+{
+    notifier_remove(&peer->update);
+}
+
+void qemu_clipboard_update(QemuClipboardInfo *info)
+{
+    notifier_list_notify(&clipboard_notifiers, info);
+}
+
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
+                                           QemuClipboardSelection selection)
+{
+    QemuClipboardInfo *info = g_new0(QemuClipboardInfo, 1);
+
+    info->owner = owner;
+    info->selection = selection;
+    info->refcount = 1;
+
+    return info;
+}
+
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info)
+{
+    info->refcount++;
+    return info;
+}
+
+void qemu_clipboard_info_put(QemuClipboardInfo *info)
+{
+    uint32_t type;
+
+    if (!info) {
+        return;
+    }
+
+    info->refcount--;
+    if (info->refcount > 0) {
+        return;
+    }
+
+    for (type = 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
+        g_free(info->types[type].data);
+    }
+    g_free(info);
+}
+
+void qemu_clipboard_request(QemuClipboardInfo *info,
+                            QemuClipboardType type)
+{
+    if (info->types[type].data ||
+        info->types[type].requested ||
+        !info->types[type].available ||
+        !info->owner)
+        return;
+
+    info->types[type].requested = true;
+    info->owner->request(info, type);
+}
+
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,
+                             QemuClipboardInfo *info,
+                             QemuClipboardType type,
+                             uint32_t size,
+                             void *data,
+                             bool update)
+{
+    if (!info ||
+        info->owner != peer) {
+        return;
+    }
+
+    g_free(info->types[type].data);
+    info->types[type].data = g_memdup(data, size);
+    info->types[type].size = size;
+    info->types[type].available = true;
+
+    if (update) {
+        qemu_clipboard_update(info);
+    }
+}
diff --git a/ui/meson.build b/ui/meson.build
index e8d3ff41b905..fc4fb75c2869 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(pixman)
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the include path
 
 softmmu_ss.add(files(
+  'clipboard.c',
   'console.c',
   'cursor.c',
   'input-keymap.c',
-- 
2.30.2


