Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAA331447
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:11:23 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJPe-0002X7-DT
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAn-0003gB-9U
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAk-0008Gt-RT
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pN/jGMxLsOBcWUJpXUI7YE/gp07yl+wpd2gxHprRbOw=;
 b=IdnS0+YWXNf3GdBk79RNoIK2FeGxgjF7l1MCbJGqPvOg5TWdEWgfeG8vnADjFaLeu2i50c
 RTX4Ko/kO23V25ZLrWAXNT7N8azTIJBnwqQbnUaIMlLCvk//FiIRf9tbT6v69seRLilJXM
 6GuKGB58O2Hbi5c/mJllSkhKfr33fYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-rQgUACAVOPWik0PGOZw7RA-1; Mon, 08 Mar 2021 11:55:55 -0500
X-MC-Unique: rQgUACAVOPWik0PGOZw7RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9710108BD0B;
 Mon,  8 Mar 2021 16:55:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D502A5D9DC;
 Mon,  8 Mar 2021 16:55:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] qapi/qom: Add ObjectOptions for secret*,
 deprecate 'loaded'
Date: Mon,  8 Mar 2021 17:54:19 +0100
Message-Id: <20210308165440.386489-10-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the secret* objects.

The 'loaded' property doesn't seem to make sense as an external
interface: It is automatically set to true in ucc->complete, and
explicitly setting it to true earlier just means that additional options
will be silently ignored.

In other words, the 'loaded' property is useless. Mark it as deprecated
in the schema from the start.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/crypto.json           | 61 ++++++++++++++++++++++++++++++++++++++
 qapi/qom.json              |  5 ++++
 docs/system/deprecated.rst | 11 +++++++
 3 files changed, 77 insertions(+)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 2aebe6fa20..0fef3de66d 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -381,3 +381,64 @@
   'discriminator': 'format',
   'data': {
           'luks': 'QCryptoBlockAmendOptionsLUKS' } }
+
+##
+# @SecretCommonProperties:
+#
+# Properties for objects of classes derived from secret-common.
+#
+# @loaded: if true, the secret is loaded immediately when applying this option
+#          and will probably fail when processing the next option. Don't use;
+#          only provided for compatibility. (default: false)
+#
+# @format: the data format that the secret is provided in (default: raw)
+#
+# @keyid: the name of another secret that should be used to decrypt the
+#         provided data. If not present, the data is assumed to be unencrypted.
+#
+# @iv: the random initialization vector used for encryption of this particular
+#      secret. Should be a base64 encrypted string of the 16-byte IV. Mandatory
+#      if @keyid is given. Ignored if @keyid is absent.
+#
+# Features:
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
+#              and false is already the default.
+#
+# Since: 2.6
+##
+{ 'struct': 'SecretCommonProperties',
+  'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
+            '*format': 'QCryptoSecretFormat',
+            '*keyid': 'str',
+            '*iv': 'str' } }
+
+##
+# @SecretProperties:
+#
+# Properties for secret objects.
+#
+# Either @data or @file must be provided, but not both.
+#
+# @data: the associated with the secret from
+#
+# @file: the filename to load the data associated with the secret from
+#
+# Since: 2.6
+##
+{ 'struct': 'SecretProperties',
+  'base': 'SecretCommonProperties',
+  'data': { '*data': 'str',
+            '*file': 'str' } }
+
+##
+# @SecretKeyringProperties:
+#
+# Properties for secret_keyring objects.
+#
+# @serial: serial number that identifies a key to get from the kernel
+#
+# Since: 5.1
+##
+{ 'struct': 'SecretKeyringProperties',
+  'base': 'SecretCommonProperties',
+  'data': { 'serial': 'int32' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index 0721a636f9..e4bbddd986 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -7,6 +7,7 @@
 { 'include': 'authz.json' }
 { 'include': 'block-core.json' }
 { 'include': 'common.json' }
+{ 'include': 'crypto.json' }
 
 ##
 # = QEMU Object Model (QOM)
@@ -451,6 +452,8 @@
     'rng-builtin',
     'rng-egd',
     'rng-random',
+    'secret',
+    'secret_keyring',
     'throttle-group'
   ] }
 
@@ -487,6 +490,8 @@
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
+      'secret':                     'SecretProperties',
+      'secret_keyring':             'SecretKeyringProperties',
       'throttle-group':             'ThrottleGroupProperties'
   } }
 
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 3dac79f600..f4e8226963 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -162,6 +162,17 @@ other options have been processed.  This will either have no effect (if
 ``opened`` was the last option) or cause errors.  The property is therefore
 useless and should not be specified.
 
+``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The only effect of specifying ``loaded=on`` in the command line or QMP
+``object-add`` is that the secret is loaded immediately, possibly before all
+other options have been processed.  This will either have no effect (if
+``loaded`` was the last option) or cause options to be effectively ignored as
+if they were not given.  The property is therefore useless and should not be
+specified.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-- 
2.29.2


