Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D27209EFB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:57:54 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRRw-0005EX-LG
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joRQP-00030m-Qr
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:56:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54203
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joRQO-0003HU-1D
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593089775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZsdfrZa9AABbOcAVi25FTFLZq4GcjtpS1hXB4cDpkc=;
 b=IxlxAzQF6Uf1msjH7br566wpIuQEBQrO/vSJDyW/Hnwl1tP26wo0xw7+ZCm4kGWiySFS+U
 GGZ+mTHoafF7M3bkaLTEimi6M632kCAcKqlVD9ZhM7gVhvVusdAmEg2tpEdZkzOc11FnXP
 4I2asDuU2fVEXctDELtHOV0gccobZd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-GBKJYLTzNs2MGj8VkdeaFQ-1; Thu, 25 Jun 2020 08:56:13 -0400
X-MC-Unique: GBKJYLTzNs2MGj8VkdeaFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039EA800C64;
 Thu, 25 Jun 2020 12:56:12 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9902379304;
 Thu, 25 Jun 2020 12:56:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 07/19] qcrypto/core: add generic infrastructure for crypto
 options amendment
Date: Thu, 25 Jun 2020 14:55:36 +0200
Message-Id: <20200625125548.870061-8-mreitz@redhat.com>
In-Reply-To: <20200625125548.870061-1-mreitz@redhat.com>
References: <20200625125548.870061-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This will be used first to implement luks keyslot management.

block_crypto_amend_opts_init will be used to convert
qemu-img cmdline to QCryptoBlockAmendOptions

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200608094030.670121-2-mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/crypto.json       | 16 ++++++++++++++++
 block/crypto.h         |  3 +++
 crypto/blockpriv.h     |  8 ++++++++
 include/crypto/block.h | 22 ++++++++++++++++++++++
 block/crypto.c         | 17 +++++++++++++++++
 crypto/block.c         | 29 +++++++++++++++++++++++++++++
 6 files changed, 95 insertions(+)

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
diff --git a/block/crypto.c b/block/crypto.c
index 973b57b3eb..dcf8b42bb2 100644
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
-- 
2.26.2


