Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61495B5876
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:31:12 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgid-0003Et-BM
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcv-00072b-Mh
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcp-0007FT-25
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H1dlVsO6rIooekJM324mF3TSdjJTMlQUL56IAhHClM=;
 b=L9IkoD8Qf29792XQ5yF+IGtEb9PCL/+NeQhgC9I5R+KOBhGROziCEekQ1Dug7GGgx8ODhE
 FdzpkJ0A7W6Lt/YWTYnKO2d0P1fZhOrnt3XAIaVj5XQSWMgca9heDVUkN17TcP0IhOBNHc
 w1gsWZ90Kv3+MA4jj47UEPqDivAVlQ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-xmQYMFJ8MFWp6d1Ne7bCEA-1; Mon, 12 Sep 2022 06:25:06 -0400
X-MC-Unique: xmQYMFJ8MFWp6d1Ne7bCEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF91C3C02B71
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF3C92027063;
 Mon, 12 Sep 2022 10:25:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/5] ui: add some vdagent related traces
Date: Mon, 12 Sep 2022 14:24:51 +0400
Message-Id: <20220912102455.111765-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220912102455.111765-1-marcandre.lureau@redhat.com>
References: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 ui/clipboard.c  | 11 +++++++++--
 ui/vdagent.c    |  3 +++
 ui/trace-events |  5 +++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 9079ef829b..cd5382fcb0 100644
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
index a899eed195..f3bd56e3e7 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -533,6 +533,7 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
         info->has_serial = true;
         info->serial = *(uint32_t *)data;
         if (info->serial < vd->last_serial[s]) {
+            trace_vdagent_cb_grab_discard(GET_NAME(sel_name, s), vd->last_serial[s], info->serial);
             /* discard lower-ordering guest grab */
             return;
         }
@@ -853,6 +854,8 @@ static void vdagent_chr_accept_input(Chardev *chr)
 
 static void vdagent_disconnect(VDAgentChardev *vd)
 {
+    trace_vdagent_disconnect();
+
     buffer_reset(&vd->outbuf);
     vdagent_reset_bufs(vd);
     vd->caps = 0;
diff --git a/ui/trace-events b/ui/trace-events
index a922f00e10..977577fbba 100644
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


