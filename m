Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A221113B314
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 20:39:59 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irS2g-0008Su-40
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 14:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1irRy6-0002qM-LR
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1irRy2-0007MU-P7
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54282
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1irRy2-0007M7-M2
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 14:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579030510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEid+kqmtREdcGXsS/B0DLkuAdFUGXFLmGn8yhd1QZs=;
 b=b5soKyJDrtSYuBqwq8NB4QeFgPXW8gWtmR2HX9TUmnrutBfG6Bdn9inqac7qb8GRyLOSie
 YDi5KzHb5y/ojP9WB8qoccRif3uPHF0CWMyW9Yi6yVCdXb99uulCbJXPzSRI6Sac+9XBQL
 pdNUSm5h0cfNeHav214usTXn7Lt8NUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-x-rPJ7SXMvCRCy-ffzuXhA-1; Tue, 14 Jan 2020 14:34:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D14B8DF660;
 Tue, 14 Jan 2020 19:34:00 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 026B17C83A;
 Tue, 14 Jan 2020 19:33:57 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] qcrypto: add generic infrastructure for crypto options
 amendment
Date: Tue, 14 Jan 2020 21:33:38 +0200
Message-Id: <20200114193350.10830-2-mlevitsk@redhat.com>
In-Reply-To: <20200114193350.10830-1-mlevitsk@redhat.com>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: x-rPJ7SXMvCRCy-ffzuXhA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used first to implement luks keyslot management.

block_crypto_amend_opts_init will be used to convert
qemu-img cmdline to QCryptoBlockAmendOptions

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/crypto.c         | 17 +++++++++++++++++
 block/crypto.h         |  3 +++
 crypto/block.c         | 31 +++++++++++++++++++++++++++++++
 crypto/blockpriv.h     |  8 ++++++++
 include/crypto/block.h | 22 ++++++++++++++++++++++
 qapi/crypto.json       | 16 ++++++++++++++++
 6 files changed, 97 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index 24823835c1..ecf96a7a9b 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -184,6 +184,23 @@ block_crypto_create_opts_init(QDict *opts, Error **err=
p)
     return ret;
 }
=20
+QCryptoBlockAmendOptions *
+block_crypto_amend_opts_init(QDict *opts, Error **errp)
+{
+    Visitor *v;
+    QCryptoBlockAmendOptions *ret;
+
+    v =3D qobject_input_visitor_new_flat_confused(opts, errp);
+    if (!v) {
+        return NULL;
+    }
+
+    visit_type_QCryptoBlockAmendOptions(v, NULL, &ret, errp);
+
+    visit_free(v);
+    return ret;
+}
+
=20
 static int block_crypto_open_generic(QCryptoBlockFormat format,
                                      QemuOptsList *opts_spec,
diff --git a/block/crypto.h b/block/crypto.h
index b935695e79..06e044c9be 100644
--- a/block/crypto.h
+++ b/block/crypto.h
@@ -91,6 +91,9 @@
 QCryptoBlockCreateOptions *
 block_crypto_create_opts_init(QDict *opts, Error **errp);
=20
+QCryptoBlockAmendOptions *
+block_crypto_amend_opts_init(QDict *opts, Error **errp);
+
 QCryptoBlockOpenOptions *
 block_crypto_open_opts_init(QDict *opts, Error **errp);
=20
diff --git a/crypto/block.c b/crypto/block.c
index 325752871c..0ce67db641 100644
--- a/crypto/block.c
+++ b/crypto/block.c
@@ -115,6 +115,37 @@ QCryptoBlock *qcrypto_block_create(QCryptoBlockCreateO=
ptions *options,
 }
=20
=20
+int qcrypto_block_amend_options(QCryptoBlock *block,
+                                QCryptoBlockReadFunc readfunc,
+                                QCryptoBlockWriteFunc writefunc,
+                                void *opaque,
+                                QCryptoBlockAmendOptions *options,
+                                bool force,
+                                Error **errp)
+{
+    if (options->format !=3D block->format) {
+        error_setg(errp,
+                   "Cannot amend encryption format");
+        return -1;
+    }
+
+    if (!block->driver->amend) {
+        error_setg(errp,
+                   "Crypto format %s doesn't support format options amendm=
ent",
+                   QCryptoBlockFormat_str(block->format));
+        return -1;
+    }
+
+    return block->driver->amend(block,
+                                readfunc,
+                                writefunc,
+                                opaque,
+                                options,
+                                force,
+                                errp);
+}
+
+
 QCryptoBlockInfo *qcrypto_block_get_info(QCryptoBlock *block,
                                          Error **errp)
 {
diff --git a/crypto/blockpriv.h b/crypto/blockpriv.h
index 71c59cb542..3c7ccea504 100644
--- a/crypto/blockpriv.h
+++ b/crypto/blockpriv.h
@@ -62,6 +62,14 @@ struct QCryptoBlockDriver {
                   void *opaque,
                   Error **errp);
=20
+    int (*amend)(QCryptoBlock *block,
+                 QCryptoBlockReadFunc readfunc,
+                 QCryptoBlockWriteFunc writefunc,
+                 void *opaque,
+                 QCryptoBlockAmendOptions *options,
+                 bool force,
+                 Error **errp);
+
     int (*get_info)(QCryptoBlock *block,
                     QCryptoBlockInfo *info,
                     Error **errp);
diff --git a/include/crypto/block.h b/include/crypto/block.h
index d49d2c2da9..e4553cf33d 100644
--- a/include/crypto/block.h
+++ b/include/crypto/block.h
@@ -144,6 +144,28 @@ QCryptoBlock *qcrypto_block_create(QCryptoBlockCreateO=
ptions *options,
                                    void *opaque,
                                    Error **errp);
=20
+/**
+ * qcrypto_block_amend_options:
+ * @block: the block encryption object
+ *
+ * @readfunc: callback for reading data from the volume header
+ * @writefunc: callback for writing data to the volume header
+ * @opaque: data to pass to @readfunc and @writefunc
+ * @options: the new/amended encryption options
+ * @force: hint for the driver to allow unsafe operation
+ * @errp: error pointer
+ *
+ * Changes the crypto options of the encryption format
+ *
+ */
+int qcrypto_block_amend_options(QCryptoBlock *block,
+                                QCryptoBlockReadFunc readfunc,
+                                QCryptoBlockWriteFunc writefunc,
+                                void *opaque,
+                                QCryptoBlockAmendOptions *options,
+                                bool force,
+                                Error **errp);
+
=20
 /**
  * qcrypto_block_get_info:
diff --git a/qapi/crypto.json b/qapi/crypto.json
index b2a4cff683..9faebd03d4 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -309,3 +309,19 @@
   'base': 'QCryptoBlockInfoBase',
   'discriminator': 'format',
   'data': { 'luks': 'QCryptoBlockInfoLUKS' } }
+
+
+
+##
+# @QCryptoBlockAmendOptions:
+#
+# The options that are available for all encryption formats
+# when initializing a new volume
+#
+# Since: 5.0
+##
+{ 'union': 'QCryptoBlockAmendOptions',
+  'base': 'QCryptoBlockOptionsBase',
+  'discriminator': 'format',
+  'data': {
+            } }
--=20
2.17.2


