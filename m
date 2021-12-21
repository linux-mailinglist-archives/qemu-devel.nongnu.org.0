Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3A47BA7F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:12:19 +0100 (CET)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZJq-0002wF-0n
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ8u-0002wx-9L
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ8s-0001mt-LN
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ik1aOcvACZNdTpGkn7ShOwvsQ23obbqSt5eucpHy45k=;
 b=TRP4pJ0jGieLggW0k75x/FMftFY9whqkWsWDaclNSTjqa9rsZcuk9FQNlg9rYeQ9yiAaIe
 u6R2AoelaNk6Lo4a3WMPvfKbSxo6e3DcSDSvdS40Hp+aOZKRiNFlNwj28BiHyMXHONWSXy
 EUGHhcaTvRvDHH7OqOQkofWjztyJY1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-1bFv8cxCNumrEa6giY2gpw-1; Tue, 21 Dec 2021 02:00:53 -0500
X-MC-Unique: 1bFv8cxCNumrEa6giY2gpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5D8185302C;
 Tue, 21 Dec 2021 07:00:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08BC37EA37;
 Tue, 21 Dec 2021 07:00:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/36] ui/clipboard: add qemu_clipboard_check_serial()
Date: Tue, 21 Dec 2021 10:58:24 +0400
Message-Id: <20211221065855.142578-6-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h | 10 ++++++++++
 ui/clipboard.c         | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index e590b453c8b7..2c6488c1eec8 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -172,6 +172,16 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
  */
 QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection);
 
+/**
+ * qemu_clipboard_check_serial
+ *
+ * @info: clipboard info.
+ * @client: whether to check from the client context and priority.
+ *
+ * Return TRUE if the @info has a higher serial than the current clipboard.
+ */
+bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client);
+
 /**
  * qemu_clipboard_info_new
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index 743b39edf424..ffbd80e5c60e 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -41,6 +41,21 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
     }
 }
 
+bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client)
+{
+    if (!info->has_serial ||
+        !cbinfo[info->selection] ||
+        !cbinfo[info->selection]->has_serial) {
+        return true;
+    }
+
+    if (client) {
+        return cbinfo[info->selection]->serial >= info->serial;
+    } else {
+        return cbinfo[info->selection]->serial > info->serial;
+    }
+}
+
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
     QemuClipboardNotify notify = {
-- 
2.34.1.8.g35151cf07204


