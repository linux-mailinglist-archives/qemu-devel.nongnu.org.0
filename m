Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0354CDD67
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:47:30 +0100 (CET)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDth-0005qd-3z
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjG-0002tM-TX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjF-0004LK-4R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIL+duOzt5kWNDE7efyUTNNJqwDyX04aTQ5LIbCC96w=;
 b=P0XxsLKy6xyNdtES90irWWHmkfu4tMg1vRiSmyl/+o5ykQ9yi7MFKBwAH9hDbsPD8lRVFr
 BfyD32WgrMQCN2e4FQ8qohlttPLysw6Cd2EQWEeSozaQOYrwnzdjAgIMWARMTzvFL1g1Kr
 gfyeIci6PW8DTcAlwICDQkldj3hkpdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-SiGX8CXSPIWHWyFXvlK9vg-1; Fri, 04 Mar 2022 14:36:37 -0500
X-MC-Unique: SiGX8CXSPIWHWyFXvlK9vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A4D2801DDC;
 Fri,  4 Mar 2022 19:36:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2000D5DF21;
 Fri,  4 Mar 2022 19:36:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] qemu-nbd: add --tls-hostname option for TLS
 certificate validation
Date: Fri,  4 Mar 2022 19:36:02 +0000
Message-Id: <20220304193610.3293146-5-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

When using the --list option, qemu-nbd acts as an NBD client rather
than a server. As such when using TLS, it has a need to validate
the server certificate. This adds a --tls-hostname option which can
be used to override the default hostname used for certificate
validation.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/tools/qemu-nbd.rst | 13 +++++++++++++
 qemu-nbd.c              | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 6031f96893..2b8c90c354 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -169,6 +169,19 @@ driver options if ``--image-opts`` is specified.
   option; or provide the credentials needed for connecting as a client
   in list mode.
 
+.. option:: --tls-hostname=hostname
+
+  When validating an x509 certificate received over a TLS connection,
+  the hostname that the NBD client used to connect will be checked
+  against information in the server provided certificate. Sometimes
+  it might be required to override the hostname used to perform this
+  check. For example, if the NBD client is using a tunnel from localhost
+  to connect to the remote server, the `--tls-hostname` option should
+  be used to set the officially expected hostname of the remote NBD
+  server. This can also be used if accessing NBD over a UNIX socket
+  where there is no inherent hostname available. This is only permitted
+  when acting as a NBD client with the `--list` option.
+
 .. option:: --fork
 
   Fork off the server process and exit the parent once the server is running.
diff --git a/qemu-nbd.c b/qemu-nbd.c
index c6c20df68a..18d281aba3 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -69,6 +69,7 @@
 #define QEMU_NBD_OPT_TLSAUTHZ      264
 #define QEMU_NBD_OPT_PID_FILE      265
 #define QEMU_NBD_OPT_SELINUX_LABEL 266
+#define QEMU_NBD_OPT_TLSHOSTNAME   267
 
 #define MBR_SIZE 512
 
@@ -542,6 +543,7 @@ int main(int argc, char **argv)
         { "export-name", required_argument, NULL, 'x' },
         { "description", required_argument, NULL, 'D' },
         { "tls-creds", required_argument, NULL, QEMU_NBD_OPT_TLSCREDS },
+        { "tls-hostname", required_argument, NULL, QEMU_NBD_OPT_TLSHOSTNAME },
         { "tls-authz", required_argument, NULL, QEMU_NBD_OPT_TLSAUTHZ },
         { "image-opts", no_argument, NULL, QEMU_NBD_OPT_IMAGE_OPTS },
         { "trace", required_argument, NULL, 'T' },
@@ -568,6 +570,7 @@ int main(int argc, char **argv)
     strList *bitmaps = NULL;
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
+    const char *tlshostname = NULL;
     bool imageOpts = false;
     bool writethrough = false; /* Client will flush as needed. */
     bool fork_process = false;
@@ -747,6 +750,9 @@ int main(int argc, char **argv)
         case QEMU_NBD_OPT_TLSCREDS:
             tlscredsid = optarg;
             break;
+        case QEMU_NBD_OPT_TLSHOSTNAME:
+            tlshostname = optarg;
+            break;
         case QEMU_NBD_OPT_IMAGE_OPTS:
             imageOpts = true;
             break;
@@ -835,6 +841,10 @@ int main(int argc, char **argv)
             error_report("TLS authorization is incompatible with export list");
             exit(EXIT_FAILURE);
         }
+        if (tlshostname && !list) {
+            error_report("TLS hostname is only supported with export list");
+            exit(EXIT_FAILURE);
+        }
         tlscreds = nbd_get_tls_creds(tlscredsid, list, &local_err);
         if (local_err) {
             error_reportf_err(local_err, "Failed to get TLS creds: ");
@@ -845,6 +855,10 @@ int main(int argc, char **argv)
             error_report("--tls-authz is not permitted without --tls-creds");
             exit(EXIT_FAILURE);
         }
+        if (tlshostname) {
+            error_report("--tls-hostname is not permitted without --tls-creds");
+            exit(EXIT_FAILURE);
+        }
     }
 
     if (selinux_label) {
@@ -861,7 +875,8 @@ int main(int argc, char **argv)
 
     if (list) {
         saddr = nbd_build_socket_address(sockpath, bindto, port);
-        return qemu_nbd_client_list(saddr, tlscreds, bindto);
+        return qemu_nbd_client_list(saddr, tlscreds,
+                                    tlshostname ? tlshostname : bindto);
     }
 
 #if !HAVE_NBD_DEVICE
-- 
2.34.1


