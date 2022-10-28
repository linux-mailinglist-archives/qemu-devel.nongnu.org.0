Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175516109EA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:54:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIGX-00080N-I6; Fri, 28 Oct 2022 01:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIG0-0007ax-NX
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFy-0007va-7H
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWqSBxbhjx40oaBbDGNfS2bTapGUD0J2hryzNS9KBds=;
 b=gqs7oGLlIuAkZfPzuhu2ZNjnCEDzNlsNKhC7lKrZwjQPc3s+ZbrP3xgpk+E5Tku/DnaO2B
 LjtvMjic8HLcT+t5PcCSFEh+2zHIJwEugUjim4sAGeLwAjaq7vsy/tDFLqW2ncMJ2hYS+l
 WiS4/N///vZzpxU36bnP6Wi1dJrNSvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-7xJ1D44TNOiv1gYq28yUgg-1; Fri, 28 Oct 2022 01:50:03 -0400
X-MC-Unique: 7xJ1D44TNOiv1gYq28yUgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F91229ABA36;
 Fri, 28 Oct 2022 05:50:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DF7C15BA8;
 Fri, 28 Oct 2022 05:49:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 24/26] qemu-sockets: update socket_uri() and socket_parse() to
 be consistent
Date: Fri, 28 Oct 2022 13:48:33 +0800
Message-Id: <20221028054835.29674-25-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Laurent Vivier <lvivier@redhat.com>

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9f6f655..a9926af 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
             goto fail;
         }
+    } else if (strstart(str, "tcp:", NULL)) {
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
+        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
+            goto fail;
+        }
     } else {
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         if (inet_parse(&addr->u.inet, str, errp)) {
-- 
2.7.4


