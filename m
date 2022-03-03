Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9794CC294
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:23:18 +0100 (CET)
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoEX-0001KA-3A
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:23:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwS-00081c-CI
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwQ-0007AF-2l
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646323473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AcskesZLfXg8BmQrE0LWTZzP/RlFj45RCozA79w/UjQ=;
 b=RTb+fh7ybSBQP1uFLm2gfmpLRhJXFboSkXbGYHgSiEDQaw6+voUenEw1Ab90m7U5uZV7WE
 INfyzvthv8X3lmPktBtkSQJv5/t8+x4GXZoMRTL+jNoR2//4bNaTjuWN8MgC4QgOqUQVRq
 jqk8Y0tb0MBeckP4Hr64ZFkdNeRAWg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-xcBb5490MaukV8-Vb8SVKQ-1; Thu, 03 Mar 2022 11:04:29 -0500
X-MC-Unique: xcBb5490MaukV8-Vb8SVKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480441854E21;
 Thu,  3 Mar 2022 16:04:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40792106D5D8;
 Thu,  3 Mar 2022 16:04:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] block/nbd: don't restrict TLS usage to IP sockets
Date: Thu,  3 Mar 2022 16:03:23 +0000
Message-Id: <20220303160330.2979753-6-berrange@redhat.com>
In-Reply-To: <20220303160330.2979753-1-berrange@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TLS usage for NBD was restricted to IP sockets because validating
x509 certificates requires knowledge of the hostname that the client
is connecting to.

TLS does not have to use x509 certificates though, as PSK (pre-shared
keys) provide an alternative credential option. These have no
requirement for a hostname and can thus be trivially used for UNIX
sockets.

Furthermore, with the ability to overide the default hostname for
TLS validation in the previous patch, it is now also valid to want
to use x509 certificates with FD passing and UNIX sockets.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/nbd.c    | 8 ++------
 blockdev-nbd.c | 6 ------
 qemu-nbd.c     | 8 +++-----
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 113aa5d3af..3ede47dec9 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1838,13 +1838,9 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
             goto error;
         }
 
-        /* TODO SOCKET_ADDRESS_KIND_FD where fd has AF_INET or AF_INET6 */
-        if (s->saddr->type != SOCKET_ADDRESS_TYPE_INET) {
-            error_setg(errp, "TLS only supported over IP sockets");
-            goto error;
-        }
         s->tlshostname = g_strdup(qemu_opt_get(opts, "tls-hostname"));
-        if (!s->tlshostname) {
+        if (!s->tlshostname &&
+            s->saddr->type == SOCKET_ADDRESS_TYPE_INET) {
             s->tlshostname = g_strdup(s->saddr->u.inet.host);
         }
     }
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index bdfa7ed3a5..9840d25a82 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -148,12 +148,6 @@ void nbd_server_start(SocketAddress *addr, const char *tls_creds,
         if (!nbd_server->tlscreds) {
             goto error;
         }
-
-        /* TODO SOCKET_ADDRESS_TYPE_FD where fd has AF_INET or AF_INET6 */
-        if (addr->type != SOCKET_ADDRESS_TYPE_INET) {
-            error_setg(errp, "TLS is only supported with IPv4/IPv6");
-            goto error;
-        }
     }
 
     nbd_server->tlsauthz = g_strdup(tls_authz);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index be8043fb00..f4c5b247de 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -808,7 +808,9 @@ int main(int argc, char **argv)
 
     socket_activation = check_socket_activation();
     if (socket_activation == 0) {
-        setup_address_and_port(&bindto, &port);
+        if (!sockpath) {
+            setup_address_and_port(&bindto, &port);
+        }
     } else {
         /* Using socket activation - check user didn't use -p etc. */
         const char *err_msg = socket_activation_validate_opts(device, sockpath,
@@ -829,10 +831,6 @@ int main(int argc, char **argv)
     }
 
     if (tlscredsid) {
-        if (sockpath) {
-            error_report("TLS is only supported with IPv4/IPv6");
-            exit(EXIT_FAILURE);
-        }
         if (device) {
             error_report("TLS is not supported with a host device");
             exit(EXIT_FAILURE);
-- 
2.34.1


