Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA13377B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:29:43 +0100 (CET)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNFu-0006xQ-1j
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcY-0005Y7-Hx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcQ-00035G-D7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPHhst3xazbbNgbN8OuiZSQlE6yYzcPrvRcIxlG5ARI=;
 b=APGx1uGziC3mcEj2VNhHj79QdCwiUrvXywA1TXXu7p8uRPF1W0hnv5Q3TSt8CvSBUNaK3z
 Im1fz3rtntVTDZzjVP+AD0C80Bzn4bAII0leRd1uFLEbKQFHktuCf1ZjykyXIZZFTJJ7AI
 UEb39ukqHU1pxZpkTmUbMFF+wwHbr2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Zd9EwUTtNauQmRRKgD_zww-1; Thu, 11 Mar 2021 09:48:48 -0500
X-MC-Unique: Zd9EwUTtNauQmRRKgD_zww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 641F318460E0;
 Thu, 11 Mar 2021 14:48:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559FD5D9F2;
 Thu, 11 Mar 2021 14:48:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/38] qapi/qom: Add ObjectOptions for tls-*, deprecate 'loaded'
Date: Thu, 11 Mar 2021 15:47:53 +0100
Message-Id: <20210311144811.313451-21-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the tls-* objects.

The 'loaded' property doesn't seem to make sense as an external
interface: It is automatically set to true in ucc->complete, and
explicitly setting it to true earlier just means that additional options
will be silently ignored.

In other words, the 'loaded' property is useless. Mark it as deprecated
in the schema from the start.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/crypto.json | 98 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/qom.json    | 12 +++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 0fef3de66d..7116ae9a46 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -442,3 +442,101 @@
 { 'struct': 'SecretKeyringProperties',
   'base': 'SecretCommonProperties',
   'data': { 'serial': 'int32' } }
+
+##
+# @TlsCredsProperties:
+#
+# Properties for objects of classes derived from tls-creds.
+#
+# @verify-peer: if true the peer credentials will be verified once the
+#               handshake is completed.  This is a no-op for anonymous
+#               credentials. (default: true)
+#
+# @dir: the path of the directory that contains the credential files
+#
+# @endpoint: whether the QEMU network backend that uses the credentials will be
+#            acting as a client or as a server (default: client)
+#
+# @priority: a gnutls priority string as described at
+#            https://gnutls.org/manual/html_node/Priority-Strings.html
+#
+# Since: 2.5
+##
+{ 'struct': 'TlsCredsProperties',
+  'data': { '*verify-peer': 'bool',
+            '*dir': 'str',
+            '*endpoint': 'QCryptoTLSCredsEndpoint',
+            '*priority': 'str' } }
+
+##
+# @TlsCredsAnonProperties:
+#
+# Properties for tls-creds-anon objects.
+#
+# @loaded: if true, the credentials are loaded immediately when applying this
+#          option and will ignore options that are processed later. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# Features:
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 2.5
+##
+{ 'struct': 'TlsCredsAnonProperties',
+  'base': 'TlsCredsProperties',
+  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] } } }
+
+##
+# @TlsCredsPskProperties:
+#
+# Properties for tls-creds-psk objects.
+#
+# @loaded: if true, the credentials are loaded immediately when applying this
+#          option and will ignore options that are processed later. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# @username: the username which will be sent to the server.  For clients only.
+#            If absent, "qemu" is sent and the property will read back as an
+#            empty string.
+#
+# Features:
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 3.0
+##
+{ 'struct': 'TlsCredsPskProperties',
+  'base': 'TlsCredsProperties',
+  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
+            '*username': 'str' } }
+
+##
+# @TlsCredsX509Properties:
+#
+# Properties for tls-creds-x509 objects.
+#
+# @loaded: if true, the credentials are loaded immediately when applying this
+#          option and will ignore options that are processed later. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# @sanity-check: if true, perform some sanity checks before using the
+#                credentials (default: true)
+#
+# @passwordid: For the server-key.pem and client-key.pem files which contain
+#              sensitive private keys, it is possible to use an encrypted
+#              version by providing the @passwordid parameter.  This provides
+#              the ID of a previously created secret object containing the
+#              password for decryption.
+#
+# Features:
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 2.5
+##
+{ 'struct': 'TlsCredsX509Properties',
+  'base': 'TlsCredsProperties',
+  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
+            '*sanity-check': 'bool',
+            '*passwordid': 'str' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index a9ab10c124..5f397d197a 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -456,7 +456,11 @@
     'rng-random',
     'secret',
     'secret_keyring',
-    'throttle-group'
+    'throttle-group',
+    'tls-creds-anon',
+    'tls-creds-psk',
+    'tls-creds-x509',
+    'tls-cipher-suites'
   ] }
 
 ##
@@ -494,7 +498,11 @@
       'rng-random':                 'RngRandomProperties',
       'secret':                     'SecretProperties',
       'secret_keyring':             'SecretKeyringProperties',
-      'throttle-group':             'ThrottleGroupProperties'
+      'throttle-group':             'ThrottleGroupProperties',
+      'tls-creds-anon':             'TlsCredsAnonProperties',
+      'tls-creds-psk':              'TlsCredsPskProperties',
+      'tls-creds-x509':             'TlsCredsX509Properties',
+      'tls-cipher-suites':          'TlsCredsProperties'
   } }
 
 ##
-- 
2.29.2


