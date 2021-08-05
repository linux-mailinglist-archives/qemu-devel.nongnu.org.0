Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532EB3E1642
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:01:04 +0200 (CEST)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdvj-00012Z-8z
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdtC-0006fU-To
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdtA-0000ds-Rg
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxVivlhdggH8hSzuvkWSXHFxbgrHJy6pB7yNHHuxKRs=;
 b=XBE8hgnKwgBiM0wG0+FY6+6Pli/Z/0dc/lKHQgI4bZHw0fzuF6Aq0yANSsvmnqv2jaZNL6
 q/3wGHyi5HfAIiy+pKzoxuCXl0J62V1qzSs7bt7hS6WSx4c5pcFv9FZJXrg3XYpuug8RdH
 8G1EvJ4My4IbFW2GEJR9p7NdS0R7uYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-sRyZLl5bOK23fk48IHXMMQ-1; Thu, 05 Aug 2021 09:58:22 -0400
X-MC-Unique: sRyZLl5bOK23fk48IHXMMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA14190D344
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:58:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9780D4A66;
 Thu,  5 Aug 2021 13:58:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/18] ui/clipboard: add helper to retrieve current
 clipboard
Date: Thu,  5 Aug 2021 17:57:02 +0400
Message-Id: <20210805135715.857938-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
2.32.0.264.g75ae10bc75


