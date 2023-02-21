Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BC69E0C9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5E-0006R1-3y; Tue, 21 Feb 2023 07:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4y-0005j0-Lm
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4v-000818-U3
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfM6VBwPpGdm0L7blj2XxeHMZNs0mtTHXUe08a1eeC4=;
 b=A99WeOU25Mq58UoL35YwftmM4uuYIac1A4IWwfwOwGt+EBL6oidzrY2AV9L4mbJ22/1YFi
 I5QMiEgFtle8wC7mE3hnZPg6n0JDFBwM8frj6Roo5qK1+69BXSKR+9ItyS34TvGmgoHRG6
 GnBKMIs0Dsb3KHdHa1fYd8KEW9Kt+kQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-O68qsoJFP1S5f9kY4rQuqg-1; Tue, 21 Feb 2023 07:49:02 -0500
X-MC-Unique: O68qsoJFP1S5f9kY4rQuqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB581818E6A;
 Tue, 21 Feb 2023 12:49:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB8F2026D38;
 Tue, 21 Feb 2023 12:49:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 13/16] slirp: open-code qemu_socket_(un)select()
Date: Tue, 21 Feb 2023 16:47:58 +0400
Message-Id: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are about to make the QEMU socket API use file-descriptor space only,
but libslirp gives us SOCKET as fd, still.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 net/slirp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index a7c35778a6..c33b3e02e7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 #ifdef WIN32
     AioContext *ctxt = qemu_get_aio_context();
 
-    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
                        FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
 #ifdef WIN32
-    qemu_socket_unselect(fd, NULL);
+    if (WSAEventSelect(fd, NULL, 0) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
-- 
2.39.2


