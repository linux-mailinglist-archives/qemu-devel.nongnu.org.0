Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B7476C04
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:34:15 +0100 (CET)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmDO-00051T-Kd
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:34:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mxmCB-0004M8-6e
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mxmC8-0006ja-5K
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639643575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKVHo8oE7OCR+3xdiMchy62ObS6M5b0CerbHlMoBJ2E=;
 b=Jm73iTd1NnKxUKtWLmlc+hVT/e7sJobcxh+h3xxV9uG0M7cw53n8xhiajdV3LF7caSTZ/A
 /d8dTKVUvlDSyUouWbnV2PCdTLAOcZ6fhMbWrMl49pEG5v5BVpNu1Sxnn8N6834oReJfTD
 AZdeFj/LLr+mClLJTw5OzElYEsNdWxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-iYzyyGVzOD6ig5AQEAjQ2w-1; Thu, 16 Dec 2021 03:32:53 -0500
X-MC-Unique: iYzyyGVzOD6ig5AQEAjQ2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15F11100C612
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:32:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59D579A26;
 Thu, 16 Dec 2021 08:32:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: fix gtk clipboard clear assertion
Date: Thu, 16 Dec 2021 12:32:33 +0400
Message-Id: <20211216083233.1166504-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When closing the QEMU Gtk display window, it can occasionaly warn:
qemu-system-x86_64: Gtk: gtk_clipboard_set_with_data: assertion 'targets != NULL' failed

#3  0x00007ffff4f02f22 in gtk_clipboard_set_with_data (clipboard=<optimized out>, targets=<optimized out>, n_targets=<optimized out>, get_func=<optimized out>, clear_func=<optimized out>, user_data=<optimized out>) at /usr/src/debug/gtk3-3.24.30-4.fc35.x86_64/gtk/gtkclipboard.c:672
#4  0x00007ffff552cd75 in gd_clipboard_update_info (gd=0x5555579a9e00, info=0x555557ba4b50) at ../ui/gtk-clipboard.c:98
#5  0x00007ffff552ce00 in gd_clipboard_notify (notifier=0x5555579aaba8, data=0x7fffffffd720) at ../ui/gtk-clipboard.c:128
#6  0x000055555603e0ff in notifier_list_notify (list=0x555556657470 <clipboard_notifiers>, data=0x7fffffffd720) at ../util/notify.c:39
#7  0x000055555594e8e0 in qemu_clipboard_update (info=0x555557ba4b50) at ../ui/clipboard.c:54
#8  0x000055555594e840 in qemu_clipboard_peer_release (peer=0x55555684a5b0, selection=QEMU_CLIPBOARD_SELECTION_PRIMARY) at ../ui/clipboard.c:40
#9  0x000055555594e786 in qemu_clipboard_peer_unregister (peer=0x55555684a5b0) at ../ui/clipboard.c:19
#10 0x000055555595f044 in vdagent_disconnect (vd=0x55555684a400) at ../ui/vdagent.c:852
#11 0x000055555595f262 in vdagent_chr_fini (obj=0x55555684a400) at ../ui/vdagent.c:908

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk-clipboard.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 35b7a2c22838..0ed630cf9b68 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -84,7 +84,7 @@ static void gd_clipboard_notify(Notifier *notifier, void *data)
     if (info != qemu_clipboard_info(s)) {
         gd->cbpending[s] = 0;
         if (!self_update) {
-            GtkTargetList *list;
+            g_autoptr(GtkTargetList) list = NULL;
             GtkTargetEntry *targets;
             gint n_targets;
 
@@ -95,15 +95,16 @@ static void gd_clipboard_notify(Notifier *notifier, void *data)
             targets = gtk_target_table_new_from_list(list, &n_targets);
 
             gtk_clipboard_clear(gd->gtkcb[s]);
-            gd->cbowner[s] = true;
-            gtk_clipboard_set_with_data(gd->gtkcb[s],
-                                        targets, n_targets,
-                                        gd_clipboard_get_data,
-                                        gd_clipboard_clear,
-                                        gd);
-
-            gtk_target_table_free(targets, n_targets);
-            gtk_target_list_unref(list);
+            if (targets) {
+                gd->cbowner[s] = true;
+                gtk_clipboard_set_with_data(gd->gtkcb[s],
+                                            targets, n_targets,
+                                            gd_clipboard_get_data,
+                                            gd_clipboard_clear,
+                                            gd);
+
+                gtk_target_table_free(targets, n_targets);
+            }
         }
         return;
     }
-- 
2.34.1.8.g35151cf07204


