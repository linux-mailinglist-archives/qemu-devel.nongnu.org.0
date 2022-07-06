Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54987567EF7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 08:54:28 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8yvb-0005LR-Aw
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 02:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8ynq-0007r8-F9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8ynn-0003bV-8K
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657089982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTxWCiS3yUOIDr06hmXb4cLWyKsg716BEZFUTYoL5tM=;
 b=R0qtWzyxKfn8FA9//sVAPwp0s2ioCfN9oXdlUZ4ckurBY42Img/z3KVkFmxC8JJX/SPikS
 wcjzt4roeGtSAl4qsI7RHjYcz1miEA9kTk6AzZ7NKijiXPyiDE/u7s5K/kE/jJY+Ir1Qt/
 o+CB69/5z/PxXAAVK6hashT7PO6hTb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-HebcUraoNPWJWW3LgYXF6g-1; Wed, 06 Jul 2022 02:46:20 -0400
X-MC-Unique: HebcUraoNPWJWW3LgYXF6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AEAD886086
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 06:46:15 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2644414152E1;
 Wed,  6 Jul 2022 06:46:14 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 12/13] qemu-sockets: update socket_uri() to be consistent
 with socket_parse()
Date: Wed,  6 Jul 2022 08:46:07 +0200
Message-Id: <20220706064607.1397659-1-lvivier@redhat.com>
In-Reply-To: <20220706062847.1396719-1-lvivier@redhat.com>
References: <20220706062847.1396719-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove 'tcp:' prefix for inet type (because inet can be 'tcp' or 'udp'
and socket_parse() doesn't recognize it), the format is 'host:port'.

Use 'vsock:' prefix for vsock type rather than 'tcp:' because it makes
a vsock address look like an inet address with CID misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 870a36eb0e93..4cd76b3ae3af 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1102,7 +1102,7 @@ char *socket_uri(SocketAddress *addr)
 {
     switch (addr->type) {
     case SOCKET_ADDRESS_TYPE_INET:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("%s:%s",
                                addr->u.inet.host,
                                addr->u.inet.port);
     case SOCKET_ADDRESS_TYPE_UNIX:
@@ -1111,7 +1111,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
-- 
2.36.1


