Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC31D78A8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 14:31:52 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaevv-000250-TN
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 08:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaels-0005Id-NO
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51684
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaelr-0007ML-U7
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589804487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oR6W2LNs+z+FDCHQl2sWFN/guDM1mvSAdTKT3OW+2tk=;
 b=BNfB4/SNzTFAi+O7dL/XQi7Gz3AwY0CtbbJ/jCln1Vfn4KNQ+Dbn1ObKKsVauGdV4XWw1y
 YcLiBMYRWeKX7aRaAAspL6Sr0w5ehQdhv4uFb5FlgViokPsEh9YizyvcvBTlb2yk8KL0A1
 NG8vABErpfSSk2tLFqzA4TtxY4S86N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-8wNg1vrkOAKV4vi_sW2YJA-1; Mon, 18 May 2020 08:21:23 -0400
X-MC-Unique: 8wNg1vrkOAKV4vi_sW2YJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96464835B5E;
 Mon, 18 May 2020 12:21:22 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BCFD60BF1;
 Mon, 18 May 2020 12:21:20 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/14] block/qcow2: implement blockdev-amend
Date: Mon, 18 May 2020 15:20:40 +0300
Message-Id: <20200518122041.10694-14-mlevitsk@redhat.com>
In-Reply-To: <20200518122041.10694-1-mlevitsk@redhat.com>
References: <20200518122041.10694-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the implementation only supports amending the encryption
options, unlike the qemu-img version

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c        | 39 +++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json | 16 +++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 9b2154c58e..c61ba1f145 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5570,6 +5570,44 @@ static int qcow2_amend_options(BlockDriverState *bs, QemuOpts *opts,
     return 0;
 }
 
+static int coroutine_fn qcow2_co_amend(BlockDriverState *bs,
+                                       BlockdevAmendOptions *opts,
+                                       bool force,
+                                       Error **errp)
+{
+    BlockdevAmendOptionsQcow2 *qopts = &opts->u.qcow2;
+    BDRVQcow2State *s = bs->opaque;
+    int ret = 0;
+
+    if (qopts->has_encrypt) {
+        if (!s->crypto) {
+            error_setg(errp, "image is not encrypted, can't amend");
+            return -EOPNOTSUPP;
+        }
+
+        if (qopts->encrypt->format != Q_CRYPTO_BLOCK_FORMAT_LUKS) {
+            error_setg(errp,
+                       "Amend can't be used to change the qcow2 encryption format");
+            return -EOPNOTSUPP;
+        }
+
+        if (s->crypt_method_header != QCOW_CRYPT_LUKS) {
+            error_setg(errp,
+                       "Only LUKS encryption options can be amended for qcow2 with blockdev-amend");
+            return -EOPNOTSUPP;
+        }
+
+        ret = qcrypto_block_amend_options(s->crypto,
+                                          qcow2_crypto_hdr_read_func,
+                                          qcow2_crypto_hdr_write_func,
+                                          bs,
+                                          qopts->encrypt,
+                                          force,
+                                          errp);
+    }
+    return ret;
+}
+
 /*
  * If offset or size are negative, respectively, they will not be included in
  * the BLOCK_IMAGE_CORRUPTED event emitted.
@@ -5786,6 +5824,7 @@ BlockDriver bdrv_qcow2 = {
     .mutable_opts        = mutable_opts,
     .bdrv_co_check       = qcow2_co_check,
     .bdrv_amend_options  = qcow2_amend_options,
+    .bdrv_co_amend       = qcow2_co_amend,
 
     .bdrv_detach_aio_context  = qcow2_detach_aio_context,
     .bdrv_attach_aio_context  = qcow2_attach_aio_context,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 94b5233077..bf16dd6bfc 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4680,6 +4680,19 @@
   'data': { }
 }
 
+##
+# @BlockdevAmendOptionsQcow2:
+#
+# Driver specific image amend options for qcow2.
+# For now, only encryption options can be amended
+#
+# @encrypt          Encryption options to be amended
+#
+# Since: 5.1
+##
+{ 'struct': 'BlockdevAmendOptionsQcow2',
+  'data': { '*encrypt':         'QCryptoBlockAmendOptions' } }
+
 ##
 # @BlockdevAmendOptions:
 #
@@ -4694,7 +4707,8 @@
       'driver':         'BlockdevDriver' },
   'discriminator': 'driver',
   'data': {
-      'luks':           'BlockdevAmendOptionsLUKS' } }
+      'luks':           'BlockdevAmendOptionsLUKS',
+      'qcow2':          'BlockdevAmendOptionsQcow2' } }
 
 ##
 # @x-blockdev-amend:
-- 
2.17.2


