Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC094D0DBF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:56:59 +0100 (CET)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP5u-0001P5-9O
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtz-00008T-27
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtv-0006MR-RV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/X0DmPZAouVQvXP2F86F2O8Ug4bgYDlPQkgDM0SMj0=;
 b=fjs29kogVFXO90+hIVCACmllcLWk+7RCEt4nV39s01ZJI8+jZBbjv6FaZTm2YdosBqMqqC
 xKmwOa/+h/YVBIW4ZhGHW+gQTx3ZafpTy7iKXFs5B3+T7RXJCh7rq5DgF6RRk0Xk/UyWaz
 OzYE0Yaf/niLqiZIZouqYMtl6a5KRiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-7pVWD5URODyFz6YTPHgrxA-1; Mon, 07 Mar 2022 20:44:31 -0500
X-MC-Unique: 7pVWD5URODyFz6YTPHgrxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0AC1006AA5;
 Tue,  8 Mar 2022 01:44:30 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F9545C84;
 Tue,  8 Mar 2022 01:44:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] block/nbd: don't restrict TLS usage to IP sockets
Date: Mon,  7 Mar 2022 19:44:09 -0600
Message-Id: <20220308014419.3056549-6-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

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

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-6-berrange@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c    | 8 ++------
 blockdev-nbd.c | 6 ------
 qemu-nbd.c     | 8 +++-----
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 0a9b6cde5bd3..34b9429de387 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1839,13 +1839,9 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
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
index bdfa7ed3a5a9..9840d25a8298 100644
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
index 18d281aba3d1..713e7557a9eb 100644
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
2.35.1


