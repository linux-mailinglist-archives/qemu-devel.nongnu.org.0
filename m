Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45E6C2D7F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXuR-0000Mn-3U; Tue, 21 Mar 2023 05:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuP-0000Ma-C2
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuN-0001kl-Vl
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SH7Vs8Use5jl2HTgj99PFzcN6I1iuntoClZw/u4DcFo=;
 b=OUBPXtDr3Fd6eVZh+zdYNJcHp85c9oOUcfW9XH5/9KWZmIlN1KfiCQu0xnNxCq9jpjgiz2
 cohd/qEuLhTrOskvWPMiOVSElqWx07+WAWllSkI/f3M4wgbTJeT73hhHzr4n/4bYrflp19
 Lr+GWTOPf8p03t7SvDirozLDB/ttQiU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-RFrM48bsO0yy4NYy0pBcCw-1; Tue, 21 Mar 2023 05:03:51 -0400
X-MC-Unique: RFrM48bsO0yy4NYy0pBcCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86F1F3810B0D;
 Tue, 21 Mar 2023 09:03:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0273492C13;
 Tue, 21 Mar 2023 09:03:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 3/7] ui/dbus: fix passing SOCKET to GSocket API & leak
Date: Tue, 21 Mar 2023 13:03:30 +0400
Message-Id: <20230321090334.1841607-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230320133643.1618437-4-marcandre.lureau@redhat.com>
---
 ui/dbus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index 0513de9918..b9e9698503 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -304,11 +304,20 @@ dbus_display_add_client(int csock, Error **errp)
         g_cancellable_cancel(dbus_display->add_client_cancellable);
     }
 
+#ifdef WIN32
+    socket = g_socket_new_from_fd(_get_osfhandle(csock), &err);
+#else
     socket = g_socket_new_from_fd(csock, &err);
+#endif
     if (!socket) {
         error_setg(errp, "Failed to setup D-Bus socket: %s", err->message);
+        close(csock);
         return false;
     }
+#ifdef WIN32
+    /* socket owns the SOCKET handle now, so release our osf handle */
+    qemu_close_socket_osfhandle(csock);
+#endif
 
     conn = g_socket_connection_factory_create_connection(socket);
 
-- 
2.39.2


