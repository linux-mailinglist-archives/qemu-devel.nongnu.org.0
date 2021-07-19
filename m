Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631563CCE8F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:34:26 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5NnF-0005Dc-ET
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NiT-0002t2-Rw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NiS-0002oq-Bk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8+fiOj5htAxTq0Qfeidh0eq3B9OKyUc5EkQ6s2psyQ=;
 b=BV0mgrePhjn7vqAgk58qkUI7X3DhFm6ZvN0FVYhoP3v8Gc7eSEUFOvkiTNz3Yzq9RLhN60
 +YDOXZb6v41HQ6dcYLbgMNajTAKuoot4VY1H4pkzuXWD5zLiT5gDNhH/pD12wlec50vRAr
 W6dOlHgB4FQOcj2BOHrs73p89oe5D1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-p1-6LxExMZKJuoOoB-vXIQ-1; Mon, 19 Jul 2021 03:29:25 -0400
X-MC-Unique: p1-6LxExMZKJuoOoB-vXIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B4D1835AC2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:29:24 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80A925C22A;
 Mon, 19 Jul 2021 07:29:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] ui/gtk-clipboard: emit release clipboard events
Date: Mon, 19 Jul 2021 11:26:54 +0400
Message-Id: <20210719072654.845901-13-marcandre.lureau@redhat.com>
In-Reply-To: <20210719072654.845901-1-marcandre.lureau@redhat.com>
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk-clipboard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 4e4b3c52bb..16b2e2063e 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -144,7 +144,7 @@ static void gd_owner_change(GtkClipboard *clipboard,
 {
     GtkDisplayState *gd = data;
     QemuClipboardSelection s = gd_find_selection(gd, clipboard);
-    QemuClipboardInfo *info;
+    g_autoptr(QemuClipboardInfo) info = NULL;
 
     if (gd->cbowner[s]) {
         /* ignore notifications about our own grabs */
@@ -158,13 +158,13 @@ static void gd_owner_change(GtkClipboard *clipboard,
         if (gtk_clipboard_wait_is_text_available(clipboard)) {
             info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
         }
-
-        qemu_clipboard_update(info);
-        qemu_clipboard_info_unref(info);
         break;
     default:
+        info = qemu_clipboard_info_new(NULL, s);
+        gd->cbowner[s] = false;
         break;
     }
+    qemu_clipboard_update(info);
 }
 
 void gd_clipboard_init(GtkDisplayState *gd)
-- 
2.32.0.93.g670b81a890


