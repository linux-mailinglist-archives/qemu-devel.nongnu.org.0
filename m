Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4A1CCB62
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 15:44:38 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXmFx-0000Th-Og
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 09:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jXmCG-0002tl-LW
 for qemu-devel@nongnu.org; Sun, 10 May 2020 09:40:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55332
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jXmCF-0003rX-OF
 for qemu-devel@nongnu.org; Sun, 10 May 2020 09:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589118046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpazMuVROugAfiNOsUJbwnSpAcYuQKZdTLNVBWetAF8=;
 b=gMrvpRsHlB9XGfHy2kmeNvN93CkT6UVgNe7QX0FD28wHyEzy49xJ4nNke4OI2SFCxQh0lx
 27wqPj1L7ARbCk9DeZBiPEEhbv5qD+rpqGBBsEkzo9k54nwzBsOdllh2qEqYVAszLe2nFH
 Q2PyShYUB1Cr0h/U1Po9wSxgFDu7Vww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-zL9zsffWMYKMhV4NyYJAkQ-1; Sun, 10 May 2020 09:40:44 -0400
X-MC-Unique: zL9zsffWMYKMhV4NyYJAkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4DC5835B42;
 Sun, 10 May 2020 13:40:43 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E3FF2E187;
 Sun, 10 May 2020 13:40:41 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/14] qcrypto/core: add generic infrastructure for crypto
 options amendment
Date: Sun, 10 May 2020 16:40:24 +0300
Message-Id: <20200510134037.18487-2-mlevitsk@redhat.com>
In-Reply-To: <20200510134037.18487-1-mlevitsk@redhat.com>
References: <20200510134037.18487-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 08:00:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used first to implement luks keyslot management.

block_crypto_amend_opts_init will be used to convert
qemu-img cmdline to QCryptoBlockAmendOptions

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/crypto.c         | 17 +++++++++++++++++
 block/crypto.h         |  3 +++
 crypto/block.c         | 29 +++++++++++++++++++++++++++++
 crypto/blockpriv.h     |  8 ++++++++
 include/crypto/block.h | 22 ++++++++++++++++++++++
 qapi/crypto.json       | 16 ++++++++++++++++
 6 files changed, 95 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index 6b21d6bf6c..9d95329d7f 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -202,6 +202,23 @@ block_crypto_create_opts_init(QDict *opts, Error **errp)
     return ret;
 }
 
+QCryptoBlockAmendOptions *
+block_crypto_amend_opts_init(QDict *opts, Error **errp)
+{
+    Visitor *v;
+    QCryptoBlockAmendOptions *ret;
+
+    v = qobject_input_visitor_new_flat_confused(opts, errp);
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
 
 static int block_crypto_open_generic(QCryptoBlockFormat format,
                                      QemuOptsList *opts_spec,
diff --git a/block/crypto.h b/block/crypto.h
index b935695e79..06e044c9be 100644
--- a/block/crypto.h
+++ b/block/crypto.h
@@ -91,6 +91,9 @@
 QCryptoBlockCreateOptions *
 block_crypto_create_opts_init(QDict *opts, Error **errp);
 
+QCryptoBlockAmendOptions *
+block_crypto_amend_opts_init(QDict *opts, Error **errp);
+
 QCryptoBlockOpenOptions *
 block_crypto_open_opts_init(QDict *opts, Error **errp);
 
diff --git a/crypto/block.c b/crypto/block.c
index 6f42b32f1e..eb057948b5 100644
--- a/crypto/block.c
+++ b/crypto/block.c
@@ -150,6 +150,35 @@ qcrypto_block_calculate_payload_offset(QCryptoBlockCreateOptions *create_opts,
     return crypto != NULL;
 }
 
+int qcrypto_block_amend_options(QCryptoBlock *block,
+                                QCryptoBlockReadFunc readfunc,
+                                QCryptoBlockWriteFunc writefunc,
+                                void *opaque,
+                                QCryptoBlockAmendOptions *options,
+                                bool force,
+                                Error **errp)
+{
+    if (options->format != block->format) {
+        error_setg(errp,
+                   "Cannot amend encryption format");
+        return -1;
+    }
+
+    if (!block->driver->amend) {
+        error_setg(errp,
+                   "Crypto format %s doesn't support format options amendment",
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
 
 QCryptoBlockInfo *qcrypto_block_get_info(QCryptoBlock *block,
                                          Error **errp)
diff --git a/crypto/blockpriv.h b/crypto/blockpriv.h
index 71c59cb542..3c7ccea504 100644
--- a/crypto/blockpriv.h
+++ b/crypto/blockpriv.h
@@ -62,6 +62,14 @@ struct QCryptoBlockDriver {
                   void *opaque,
                   Error **errp);
 
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
index c77ccaf9c0..d274819791 100644
--- a/include/crypto/block.h
+++ b/include/crypto/block.h
@@ -144,6 +144,28 @@ QCryptoBlock *qcrypto_block_create(QCryptoBlockCreateOptions *options,
                                    void *opaque,
                                    Error **errp);
 
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
 
 /**
  * qcrypto_block_calculate_payload_offset:
diff --git a/qapi/crypto.json b/qapi/crypto.json
index b2a4cff683..aeb6c7ef7b 100644
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
+# when amending encryption settings
+#
+# Since: 5.1
+##
+{ 'union': 'QCryptoBlockAmendOptions',
+  'base': 'QCryptoBlockOptionsBase',
+  'discriminator': 'format',
+  'data': {
+            } }
-- 
2.17.2


