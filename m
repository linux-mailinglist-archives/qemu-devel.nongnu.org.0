Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8213CCE80
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:30:29 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5NjQ-0002fT-8p
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Nh9-0000C5-2Y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Nh7-0001kR-K8
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcCxN767Av8hnZZxCKt8rX/rq3GEin1zUeoiL3cH15Q=;
 b=Of5t4A2u/aoMUrumQcWoDzxKl5grtJOWkQekGZaaMN0DEsEmyiP4FTPeOyNM1QDhJ0dFDd
 1rVSqpTOBapk6+fJDvVr2TXONUZy8nyyyTf4VJgo3PriDFjqC40ey26Vbi7EtxRlAcqRIL
 DIhemFPhGLKnyannczOJlJah75b95oU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-qoO5LzGnMaqCTK0LdsCPvw-1; Mon, 19 Jul 2021 03:28:00 -0400
X-MC-Unique: qoO5LzGnMaqCTK0LdsCPvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A559A100C61C
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:27:59 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB504752AB;
 Mon, 19 Jul 2021 07:27:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] ui/clipboard: add helper to retrieve current clipboard
Date: Mon, 19 Jul 2021 11:26:47 +0400
Message-Id: <20210719072654.845901-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210719072654.845901-1-marcandre.lureau@redhat.com>
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
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
 include/ui/clipboard.h |  9 +++++++++
 ui/clipboard.c         | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index eb789a285a..e9fcb15c66 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -109,6 +109,15 @@ void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
  */
 void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
 
+/**
+ * qemu_clipboard_info
+ *
+ * @selection: clipboard selection.
+ *
+ * Return the current clipboard data & owner informations.
+ */
+QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection);
+
 /**
  * qemu_clipboard_info_new
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index 3525b30178..56c14509fe 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -4,6 +4,8 @@
 static NotifierList clipboard_notifiers =
     NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);
 
+static QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
+
 void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
 {
     notifier_list_add(&clipboard_notifiers, &peer->update);
@@ -16,7 +18,20 @@ void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
+    g_autoptr(QemuClipboardInfo) old = NULL;
+    assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
+
     notifier_list_notify(&clipboard_notifiers, info);
+
+    old = cbinfo[info->selection];
+    cbinfo[info->selection] = qemu_clipboard_info_ref(info);
+}
+
+QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection)
+{
+    assert(selection < QEMU_CLIPBOARD_SELECTION__COUNT);
+
+    return cbinfo[selection];
 }
 
 QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
-- 
2.32.0.93.g670b81a890


