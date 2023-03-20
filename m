Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77B6C1081
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 12:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDTJ-0000eF-Cc; Mon, 20 Mar 2023 07:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peDTG-0000ck-4a
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peDTE-000314-Rp
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679310872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5ric0u+KBFd+a5PgFmmEkkfokYS8eoybV5l22EaY8w=;
 b=IW6IixrdLue+1V5tX/iJiGqbGCHCsAYiqyuFs1L93bnA2SaEoWCCb5YosoNsGlzjht4AR2
 49MZKRBhmC+g+wc6rYMmWXJ5q2lg9FGDvaS32M1tD7i8QoO6+FSuX2FaJpqC919TgN1Us8
 WdaJyaAYh/PUvGrTjWfY3Bww3ijPAUo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-nAJX0hWXPEmaAAaLRfUNZg-1; Mon, 20 Mar 2023 07:14:29 -0400
X-MC-Unique: nAJX0hWXPEmaAAaLRfUNZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA17529A9CA3;
 Mon, 20 Mar 2023 11:14:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 003932166B29;
 Mon, 20 Mar 2023 11:14:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, berrange@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] ui/dbus: fix passing SOCKET to GSocket API & leak
Date: Mon, 20 Mar 2023 15:14:12 +0400
Message-Id: <20230320111412.1516419-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230320111412.1516419-1-marcandre.lureau@redhat.com>
References: <20230320111412.1516419-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

-display dbus is not currently available to win32 users, so it's not
considered a regression.

Note also the close() leak fix in case of error.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index 0513de9918..5389ac493f 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -304,9 +304,17 @@ dbus_display_add_client(int csock, Error **errp)
         g_cancellable_cancel(dbus_display->add_client_cancellable);
     }
 
+#ifdef WIN32
+    csock = qemu_close_to_socket(csock);
+#endif
     socket = g_socket_new_from_fd(csock, &err);
     if (!socket) {
         error_setg(errp, "Failed to setup D-Bus socket: %s", err->message);
+#ifdef WIN32
+        closesocket(csock);
+#else
+        close(csock);
+#endif
         return false;
     }
 
-- 
2.39.2


