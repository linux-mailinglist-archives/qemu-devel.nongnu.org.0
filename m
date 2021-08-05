Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63C3E1523
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:55:49 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcua-0005Jk-El
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBcsk-00037C-Ne
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBcsj-0003mq-5M
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKh8TTwmBc10mvb7az/NZqnTmPQDHByAnQPq5GnrTLg=;
 b=fCU86vob2W1Y1OBtLspsO4tMg7mA4HYaV5URchHsnK/JrXJ8L2BfcK/+dh6eImwZiWkYia
 1bQ99LxzririUOtEquyaEoMm90mvM3Cglyxbx9Rg6CleEyALlOjE9JfoNbhEoVKVJa/rXO
 Cd1rxV+UulCxb4LbwUIINkzsfmM7h18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-zpTC6HwDMk6K6DWbEF0xCw-1; Thu, 05 Aug 2021 08:53:48 -0400
X-MC-Unique: zpTC6HwDMk6K6DWbEF0xCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9271801B3D;
 Thu,  5 Aug 2021 12:53:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A2BE1036D2E;
 Thu,  5 Aug 2021 12:53:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] util: fix abstract socket path copy
Date: Thu,  5 Aug 2021 16:53:24 +0400
Message-Id: <20210805125331.826741-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
support" neglected to update socket_sockaddr_to_address_unix() and
copied the whole sun_path without taking "salen" into account.

Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix()
for abstract sockets" handled the abstract UNIX path, by stripping the
leading \0 character and fixing address details, but didn't use salen
either.

Not taking "salen" into account may result in incorrect "path" being
returned in monitors commands, as we read past the address which is not
necessarily \0-terminated.

Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: xiaoqiang zhao <zxq_yx_007@163.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/qemu-sockets.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 080a240b74..f2f3676d1f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     SocketAddress *addr;
     struct sockaddr_un *su = (struct sockaddr_un *)sa;
 
+    assert(salen >= sizeof(su->sun_family) + 1 &&
+           salen <= sizeof(struct sockaddr_un));
+
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;
 #ifdef CONFIG_LINUX
     if (!su->sun_path[0]) {
         /* Linux abstract socket */
         addr->u.q_unix.path = g_strndup(su->sun_path + 1,
-                                        sizeof(su->sun_path) - 1);
+                                        salen - sizeof(su->sun_family) - 1);
         addr->u.q_unix.has_abstract = true;
         addr->u.q_unix.abstract = true;
         addr->u.q_unix.has_tight = true;
-- 
2.32.0.264.g75ae10bc75


