Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B03E164C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:03:38 +0200 (CEST)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdyD-0006rb-4F
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdtN-0007Gn-VH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdtM-0000mB-HI
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KW1urW5a0nq+nx8fRKcQ+RjmdwVONRbmelArIaLdLE=;
 b=BM/DdUUgoP5PlW012WLk5VpvX8OVj+5xdGcrqb86vOJYZOdkTSWBbQxZisdPFDTNFfdL6h
 leMfkWpNrqXrcLq3pm6qARpSGfl3Ks7BB3Yj/2RYdImEBy3/rCNosWSAD1n6Drsuk603Q7
 W8RXxIouf9LL+UekcY7cURbfKPj0kbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-tAsN4qJyMBGaOlEZhSuBdQ-1; Thu, 05 Aug 2021 09:58:34 -0400
X-MC-Unique: tAsN4qJyMBGaOlEZhSuBdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7DEB87D547
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:58:33 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B85C1B480;
 Thu,  5 Aug 2021 13:58:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/18] ui/clipboard: add qemu_clipboard_peer_owns() helper
Date: Thu,  5 Aug 2021 17:57:03 +0400
Message-Id: <20210805135715.857938-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 include/ui/clipboard.h | 11 +++++++++++
 ui/clipboard.c         |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index e9fcb15c66..25e0b470c8 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -109,6 +109,17 @@ void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
  */
 void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
 
+/**
+ * qemu_clipboard_peer_owns
+ *
+ * @peer: peer information.
+ * @selection: clipboard selection.
+ *
+ * Return TRUE if the peer owns the clipboard.
+ */
+bool qemu_clipboard_peer_owns(QemuClipboardPeer *peer,
+                              QemuClipboardSelection selection);
+
 /**
  * qemu_clipboard_info
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index 56c14509fe..490c3220f4 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -16,6 +16,14 @@ void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
     notifier_remove(&peer->update);
 }
 
+bool qemu_clipboard_peer_owns(QemuClipboardPeer *peer,
+                              QemuClipboardSelection selection)
+{
+    QemuClipboardInfo *info = qemu_clipboard_info(selection);
+
+    return info && info->owner == peer;
+}
+
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
     g_autoptr(QemuClipboardInfo) old = NULL;
-- 
2.32.0.264.g75ae10bc75


