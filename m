Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E106B767B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgc1-0004nA-Mi; Mon, 13 Mar 2023 07:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgbb-0003Jn-5a
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgbX-0003a1-SC
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VtD5+mhq5qkIqCEjk+4JaeG/DzPz0DCTzI3RPR/hu68=;
 b=LPXjwOy/G6lDCZqjUtgPxx799CthBmcgltS5gYxcRku5QJz6yTUiiwIc84FISxQh+a/zNF
 LdI+8h32UudTp8s9ClxMe5wFKxLvrsnIZZXPozE3lCYtErDkBLozK5Vb974TpgIwkQ0xwI
 SZD/yZqdGYCUuiOjgIiYgxy+qD/BgIc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-TAb_ITvkNGqPO40jFO0AOg-1; Mon, 13 Mar 2023 07:44:30 -0400
X-MC-Unique: TAb_ITvkNGqPO40jFO0AOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA0C1C04325;
 Mon, 13 Mar 2023 11:44:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F081410F1C;
 Mon, 13 Mar 2023 11:44:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 11/25] slirp: unregister the win32 SOCKET
Date: Mon, 13 Mar 2023 15:43:21 +0400
Message-Id: <20230313114335.424093-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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

Presumably, this is what should happen when the SOCKET is to be removed.
(it probably worked until now because closesocket() does it implicitly,
but we never now how the slirp library could use the SOCKET later)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-13-marcandre.lureau@redhat.com>
---
 net/slirp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 0730a935ba..a7c35778a6 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -259,7 +259,9 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
-    /* no qemu_fd_unregister */
+#ifdef WIN32
+    qemu_socket_unselect(fd, NULL);
+#endif
 }
 
 static void net_slirp_notify(void *opaque)
-- 
2.39.2


