Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722E6B76EE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgei-0006F1-If; Mon, 13 Mar 2023 07:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgee-0005pY-Bn
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgec-0004fB-Sd
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sdYbjwoDK6asuv5xfaPJTDIzsW8PShUVAXy/wh1O5Y=;
 b=RjXPnCxSztpVu4af1ClCVRZclbtTfHk+dAdWbxBpW2rOxiwjVVl8fWVVYY9GPFxZqNzKQ+
 8pv6R+Tg6AxuxCs5hFsf/91p/p5wQxd3F+3I5EIgeCvz9VX5AUeNiQHmPse8B1aa/XftF5
 rcjHKVGSOa7uHmYJUaZpuT0PtmcLYEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-YjyP4I3yObW_QUav01jDAg-1; Mon, 13 Mar 2023 07:47:47 -0400
X-MC-Unique: YjyP4I3yObW_QUav01jDAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB5FF100BB39;
 Mon, 13 Mar 2023 11:47:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CADA5C158C2;
 Mon, 13 Mar 2023 11:47:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 12/25] slirp: open-code qemu_socket_(un)select()
Date: Mon, 13 Mar 2023 15:46:35 +0400
Message-Id: <20230313114648.426607-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

We are about to make the QEMU socket API use file-descriptor space only,
but libslirp gives us SOCKET as fd, still.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
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


