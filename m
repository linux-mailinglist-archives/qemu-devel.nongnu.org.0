Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286842C842D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:33:48 +0100 (CET)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiNH-0007Dd-4u
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGt-0001J6-8z
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiGn-0002dB-Ly
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvzoWZOxAQsjCEksm427blL4ikH47UMUkpJOWkf00NE=;
 b=dsU7Z3Ru9M+qWoxXOB6C5kdczXqumn22yyEs2Goduw9LvpAOIzQOPtKWQjZP00m0I9rkNA
 K6Ue6LV/e42abj+xUDqKmQTsIvmf/CN5jsWvftLyRFtcYhqVSC+soQUh4Nhh5MUp+C+8IN
 nfr31oAsIHK3yr4QRkYM0e73GY3lNEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-j6kuga1SNxKLZ42npV8OOw-1; Mon, 30 Nov 2020 07:27:00 -0500
X-MC-Unique: j6kuga1SNxKLZ42npV8OOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EBBB8030B9;
 Mon, 30 Nov 2020 12:26:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E64F27C26;
 Mon, 30 Nov 2020 12:26:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] qapi/qom: Add ObjectOptions for tls-*,
 deprecate 'loaded'
Date: Mon, 30 Nov 2020 13:25:29 +0100
Message-Id: <20201130122538.27674-10-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
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
---
 qapi/crypto.json | 98 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/qom.json    | 12 +++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 4cb6bb00ed..a32dfa320a 100644
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
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
+# Since: 6.0
+##
+{ 'struct': 'TlsCredsX509Properties',
+  'base': 'TlsCredsProperties',
+  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
+            '*sanity-check': 'bool',
+            '*passwordid': 'str' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index 05ec67b0d1..31e381b3bb 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -440,7 +440,11 @@
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
@@ -476,7 +480,11 @@
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
2.28.0


