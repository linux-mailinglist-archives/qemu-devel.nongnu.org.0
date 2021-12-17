Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F2478E76
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:52:36 +0100 (CET)
Received: from localhost ([::1]:52788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEb5-0000ER-Pn
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEOE-0006MB-JC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEOD-0007AY-3D
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ik1aOcvACZNdTpGkn7ShOwvsQ23obbqSt5eucpHy45k=;
 b=Hn2pVV/qIHekG/KQSbNzorgADEVKrCSEvf2psGvc7FSS1UVPPIa/A2nAU55gSgqG+WQWfP
 y7G6CqlfxZtA7nu5J8HJPchIvkY5e7bTwxCFdIor5fPYcGr8Vw9aIp1wHgk2bbuPHSvHbm
 XqvqZ9ACAMfHegDsplpeAMymcIgOvVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-t6LlE17uPiyEfgeDNZqOrA-1; Fri, 17 Dec 2021 09:39:08 -0500
X-MC-Unique: t6LlE17uPiyEfgeDNZqOrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1181B85EE68;
 Fri, 17 Dec 2021 14:39:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B27405E487;
 Fri, 17 Dec 2021 14:38:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] ui/clipboard: add qemu_clipboard_check_serial()
Date: Fri, 17 Dec 2021 18:37:25 +0400
Message-Id: <20211217143756.1831099-6-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
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


