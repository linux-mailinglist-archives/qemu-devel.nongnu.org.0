Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD251A15
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 19:55:27 +0200 (CEST)
Received: from localhost ([::1]:53534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfTBe-0003mT-Cf
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 13:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49049)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfSwv-0001UE-CQ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfSwt-0005Jh-UJ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62827)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfSwp-0004zz-QS; Mon, 24 Jun 2019 13:40:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 160BC81F1B;
 Mon, 24 Jun 2019 17:40:00 +0000 (UTC)
Received: from localhost (ovpn-204-152.brq.redhat.com [10.40.204.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D6B5C22F;
 Mon, 24 Jun 2019 17:39:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 24 Jun 2019 19:39:29 +0200
Message-Id: <20190624173935.25747-10-mreitz@redhat.com>
In-Reply-To: <20190624173935.25747-1-mreitz@redhat.com>
References: <20190624173935.25747-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 17:40:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 09/14] qapi: Formalize qcow2 encryption
 probing
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, you can give no encryption format for a qcow2 file while
still passing a key-secret.  That does not conform to the schema, so
this patch changes the schema to allow it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 32 +++++++++++++++++++++++++++++---
 block/qcow2.c        |  3 +++
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c..9df3fc8bd7 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -47,6 +47,9 @@
 ##
 # @ImageInfoSpecificQCow2Encryption:
 #
+# @format will never be "auto", as this pseudo-format just tells the
+# qcow2 driver to read the actual format from the image header.
+#
 # Since: 2.10
 ##
 { 'union': 'ImageInfoSpecificQCow2Encryption',
@@ -3081,10 +3084,30 @@
 # @BlockdevQcow2EncryptionFormat:
 # @aes: AES-CBC with plain64 initialization vectors
 #
+# @auto:            Determine the encryption format from the image
+#                   header.  This only allows the use of the
+#                   key-secret option.  (Since: 4.1)
+#
 # Since: 2.10
 ##
 { 'enum': 'BlockdevQcow2EncryptionFormat',
-  'data': [ 'aes', 'luks' ] }
+  'data': [ 'aes', 'luks', 'auto' ] }
+
+##
+# @BlockdevQcow2EncryptionSecret:
+#
+# Allows specifying a key-secret without specifying the exact
+# encryption format, which is determined automatically from the image
+# header.
+#
+# @key-secret:      The ID of a QCryptoSecret object providing the
+#                   decryption key.  Mandatory except when probing
+#                   image for metadata only.
+#
+# Since: 4.1
+##
+{ 'struct': 'BlockdevQcow2EncryptionSecret',
+  'data': { '*key-secret': 'str' } }
=20
 ##
 # @BlockdevQcow2Encryption:
@@ -3092,10 +3115,13 @@
 # Since: 2.10
 ##
 { 'union': 'BlockdevQcow2Encryption',
-  'base': { 'format': 'BlockdevQcow2EncryptionFormat' },
+  'base': {
+      '*format': { 'type': 'BlockdevQcow2EncryptionFormat', 'default': '=
auto' }
+  },
   'discriminator': 'format',
   'data': { 'aes': 'QCryptoBlockOptionsQCow',
-            'luks': 'QCryptoBlockOptionsLUKS'} }
+            'luks': 'QCryptoBlockOptionsLUKS',
+            'auto': 'BlockdevQcow2EncryptionSecret' } }
=20
 ##
 # @BlockdevOptionsQcow2:
diff --git a/block/qcow2.c b/block/qcow2.c
index 9396d490d5..95de19d906 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -930,6 +930,9 @@ static int qcow2_update_options_prepare(BlockDriverSt=
ate *bs,
=20
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt =3D qdict_get_try_str(encryptopts, "format");
+    if (!g_strcmp0(encryptfmt, "auto")) {
+        encryptfmt =3D NULL;
+    }
=20
     opts =3D qemu_opts_create(&qcow2_runtime_opts, NULL, 0, &error_abort=
);
     qemu_opts_absorb_qdict(opts, options, &local_err);
--=20
2.21.0


