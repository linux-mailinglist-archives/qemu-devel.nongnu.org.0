Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13393CD56D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:03:58 +0200 (CEST)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SwA-0001YJ-1D
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Stf-0007zE-7I
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Stb-0001Wa-Qv
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626699679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WK63RNpo02KgBTtMsQueSKiYO26oN3CVVUHakcbxRF0=;
 b=Co6Sxx8h6ZrXpRLTI+ONEGS0S4r9eKiotJ3rJ8lNLqKd+mecYunVNXe43IucHfc6nI4EdC
 eQcRlqVxQEXd/GLkG+KiV2gYjv7w3B7LiyhKB3WNZQwSdENwb7FWDyhdulmBv2rKuTS+fk
 z6UCzo5sD1RlCGFSKiv7l2NzHt6HihA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-9EISebk9OSuO1VFvn649FQ-1; Mon, 19 Jul 2021 09:01:17 -0400
X-MC-Unique: 9EISebk9OSuO1VFvn649FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3EAF802C8F;
 Mon, 19 Jul 2021 13:01:16 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98FB760877;
 Mon, 19 Jul 2021 13:01:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] util: fix abstract socket path copy
Date: Mon, 19 Jul 2021 17:01:12 +0400
Message-Id: <20210719130112.932069-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zxq_yx_007@163.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, armbru@redhat.com
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


