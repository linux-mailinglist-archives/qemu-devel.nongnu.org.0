Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5C33776D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:27:38 +0100 (CET)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNDs-0002k4-Ns
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcX-0005V2-4G
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcL-00030b-Hq
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RpWQJW7Raj3ee0g+gU1/2sbHgannHwTlAuQ8SlNoUU=;
 b=VEQqGWLWMhm36er5MKmdjPmF+xiGbaralx0vslt7qtaVMgLrI61o9q1T8UQE/cZbtQsPr8
 5AaA8LWHwT+S1oIAHYVcyueP4i+c6sBEcxMNkTNaMHZHMD9U+UMLMTGllmZhBeQH4eZTy2
 UYfLvC69SY08MA4ABt4UN8EoI1afqDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-HptMlQY9Mfmvw-AzRMSoJQ-1; Thu, 11 Mar 2021 09:48:47 -0500
X-MC-Unique: HptMlQY9Mfmvw-AzRMSoJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D8680BCA6;
 Thu, 11 Mar 2021 14:48:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD1075D9F2;
 Thu, 11 Mar 2021 14:48:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/38] qapi/qom: Add ObjectOptions for secret*,
 deprecate 'loaded'
Date: Thu, 11 Mar 2021 15:47:52 +0100
Message-Id: <20210311144811.313451-20-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This adds a QAPI schema for the properties of the secret* objects.

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
index fa56083a0b..a9ab10c124 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -7,6 +7,7 @@
 { 'include': 'authz.json' }
 { 'include': 'block-core.json' }
 { 'include': 'common.json' }
+{ 'include': 'crypto.json' }
 
 ##
 # = QEMU Object Model (QOM)
@@ -453,6 +454,8 @@
     'rng-builtin',
     'rng-egd',
     'rng-random',
+    'secret',
+    'secret_keyring',
     'throttle-group'
   ] }
 
@@ -489,6 +492,8 @@
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
+      'secret':                     'SecretProperties',
+      'secret_keyring':             'SecretKeyringProperties',
       'throttle-group':             'ThrottleGroupProperties'
   } }
 
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 3ce4fe7581..3e9e3a26f6 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -175,6 +175,17 @@ other options have been processed.  This will either have no effect (if
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


