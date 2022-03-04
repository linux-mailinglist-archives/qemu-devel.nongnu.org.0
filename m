Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA744CDD63
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:42:23 +0100 (CET)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDok-0000Q2-Ec
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjE-0002rj-PV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjB-0004JR-NJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MO9a4aZGHXzkmRH9duP8qY4x6mSZho0PFRek2KjNQjU=;
 b=azlUeKGLLOZi5fzieKLTduIWFW1FO4clGft5gMQB7Ivt38LRMSFKsDJhyIVORJ42C/bx3w
 v5vq1HBKPRfNMMEVCOcrVgvfcD78pjhoIk3lGmo/clDYbTIOM0gKH6SeLzk0+AuRghOBmn
 QFYpqMIgw2k2Z0agfniV8+L0NHsWfFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-xLG1_yOBMKK9y3CtHJszcg-1; Fri, 04 Mar 2022 14:36:34 -0500
X-MC-Unique: xLG1_yOBMKK9y3CtHJszcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B651251DF;
 Fri,  4 Mar 2022 19:36:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9E865DF21;
 Fri,  4 Mar 2022 19:36:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] block/nbd: support override of hostname for TLS
 certificate validation
Date: Fri,  4 Mar 2022 19:36:01 +0000
Message-Id: <20220304193610.3293146-4-berrange@redhat.com>
In-Reply-To: <20220304193610.3293146-1-berrange@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When connecting to an NBD server with TLS and x509 credentials,
the client must validate the hostname it uses for the connection,
against that published in the server's certificate. If the client
is tunnelling its connection over some other channel, however, the
hostname it uses may not match the info reported in the server's
certificate. In such a case, the user needs to explicitly set an
override for the hostname to use for certificate validation.

This is achieved by adding a 'tls-hostname' property to the NBD
block driver.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/nbd.c          | 18 +++++++++++++++---
 qapi/block-core.json |  3 +++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index dd43929207..113aa5d3af 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -90,9 +90,10 @@ typedef struct BDRVNBDState {
     uint32_t reconnect_delay;
     uint32_t open_timeout;
     SocketAddress *saddr;
-    char *export, *tlscredsid;
+    char *export;
+    char *tlscredsid;
     QCryptoTLSCreds *tlscreds;
-    const char *tlshostname;
+    char *tlshostname;
     char *x_dirty_bitmap;
     bool alloc_depth;
 
@@ -121,6 +122,8 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->export = NULL;
     g_free(s->tlscredsid);
     s->tlscredsid = NULL;
+    g_free(s->tlshostname);
+    s->tlshostname = NULL;
     g_free(s->x_dirty_bitmap);
     s->x_dirty_bitmap = NULL;
 }
@@ -1764,6 +1767,11 @@ static QemuOptsList nbd_runtime_opts = {
             .type = QEMU_OPT_STRING,
             .help = "ID of the TLS credentials to use",
         },
+        {
+            .name = "tls-hostname",
+            .type = QEMU_OPT_STRING,
+            .help = "Override hostname for validating TLS x509 certificate",
+        },
         {
             .name = "x-dirty-bitmap",
             .type = QEMU_OPT_STRING,
@@ -1835,7 +1843,10 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
             error_setg(errp, "TLS only supported over IP sockets");
             goto error;
         }
-        s->tlshostname = s->saddr->u.inet.host;
+        s->tlshostname = g_strdup(qemu_opt_get(opts, "tls-hostname"));
+        if (!s->tlshostname) {
+            s->tlshostname = g_strdup(s->saddr->u.inet.host);
+        }
     }
 
     s->x_dirty_bitmap = g_strdup(qemu_opt_get(opts, "x-dirty-bitmap"));
@@ -2037,6 +2048,7 @@ static const char *const nbd_strong_runtime_opts[] = {
     "port",
     "export",
     "tls-creds",
+    "tls-hostname",
     "server.",
 
     NULL
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..1c730c6f2a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4078,6 +4078,8 @@
 #
 # @tls-creds: TLS credentials ID
 #
+# @tls-hostname: TLS hostname override for certificate validation (Since 7.0)
+#
 # @x-dirty-bitmap: A metadata context name such as "qemu:dirty-bitmap:NAME"
 #                  or "qemu:allocation-depth" to query in place of the
 #                  traditional "base:allocation" block status (see
@@ -4108,6 +4110,7 @@
   'data': { 'server': 'SocketAddress',
             '*export': 'str',
             '*tls-creds': 'str',
+            '*tls-hostname': 'str',
             '*x-dirty-bitmap': { 'type': 'str', 'features': [ 'unstable' ] },
             '*reconnect-delay': 'uint32',
             '*open-timeout': 'uint32' } }
-- 
2.34.1


