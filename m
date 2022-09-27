Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00115EBD57
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:32:59 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od61S-00071E-FQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oN-0005Ek-7x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oK-0000IF-Ja
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lkEzdjW1YeSTjXm2o8kRYkVOAn224fd2T365fiA4EU=;
 b=ELajVITjVnGvb3l8uwGBUtdKbCy2mt0IZV3lV7xG5geCDHinO6rpUdGXdFagTOUd6rKSdN
 wiKFes677hy9BAwUghty47KcmtHTmM2rJrGvj65tHqO+gozYjHOReB1jaCOB99GDpyh6+P
 3qfC8z27COeDMSWgcIV9LVOboNCGGUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-41Pe0pNuORq8sC8Xjmcisw-1; Tue, 27 Sep 2022 04:19:20 -0400
X-MC-Unique: 41Pe0pNuORq8sC8Xjmcisw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88F75101E14E;
 Tue, 27 Sep 2022 08:19:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D782087440;
 Tue, 27 Sep 2022 08:19:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2CE261800929; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 05/24] ui: add some vdagent related traces
Date: Tue, 27 Sep 2022 10:18:53 +0200
Message-Id: <20220927081912.180983-6-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This helps debugging clipboard serial sync issues.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220912102455.111765-2-marcandre.lureau@redhat.com>

[ kraxel: code style fix ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/clipboard.c  | 11 +++++++++--
 ui/vdagent.c    |  4 ++++
 ui/trace-events |  5 +++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 9079ef829b51..cd5382fcb0c1 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "ui/clipboard.h"
+#include "trace.h"
 
 static NotifierList clipboard_notifiers =
     NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);
@@ -43,17 +44,23 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
 
 bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client)
 {
+    bool ok;
+
     if (!info->has_serial ||
         !cbinfo[info->selection] ||
         !cbinfo[info->selection]->has_serial) {
+        trace_clipboard_check_serial(-1, -1, true);
         return true;
     }
 
     if (client) {
-        return cbinfo[info->selection]->serial >= info->serial;
+        ok = cbinfo[info->selection]->serial >= info->serial;
     } else {
-        return cbinfo[info->selection]->serial > info->serial;
+        ok = cbinfo[info->selection]->serial > info->serial;
     }
+
+    trace_clipboard_check_serial(cbinfo[info->selection]->serial, info->serial, ok);
+    return ok;
 }
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
diff --git a/ui/vdagent.c b/ui/vdagent.c
index a899eed195d3..58ce7507fddc 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -533,6 +533,8 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
         info->has_serial = true;
         info->serial = *(uint32_t *)data;
         if (info->serial < vd->last_serial[s]) {
+            trace_vdagent_cb_grab_discard(GET_NAME(sel_name, s),
+                                          vd->last_serial[s], info->serial);
             /* discard lower-ordering guest grab */
             return;
         }
@@ -853,6 +855,8 @@ static void vdagent_chr_accept_input(Chardev *chr)
 
 static void vdagent_disconnect(VDAgentChardev *vd)
 {
+    trace_vdagent_disconnect();
+
     buffer_reset(&vd->outbuf);
     vdagent_reset_bufs(vd);
     vd->caps = 0;
diff --git a/ui/trace-events b/ui/trace-events
index a922f00e10b4..977577fbba58 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -127,15 +127,20 @@ xkeymap_vendor(const char *name) "vendor '%s'"
 xkeymap_keycodes(const char *name) "keycodes '%s'"
 xkeymap_keymap(const char *name) "keymap '%s'"
 
+# clipboard.c
+clipboard_check_serial(int cur, int recv, bool ok) "cur:%d recv:%d %d"
+
 # vdagent.c
 vdagent_open(void) ""
 vdagent_close(void) ""
+vdagent_disconnect(void) ""
 vdagent_send(const char *name) "msg %s"
 vdagent_send_empty_clipboard(void) ""
 vdagent_recv_chunk(uint32_t size) "size %d"
 vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
 vdagent_cb_grab_selection(const char *name) "selection %s"
+vdagent_cb_grab_discard(const char *name, int cur, int recv) "selection %s, cur:%d recv:%d"
 vdagent_cb_grab_type(const char *name) "type %s"
 vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
 
-- 
2.37.3


