Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F4CD99F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:02:37 +0100 (CET)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBK8-0002to-7B
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5v-0005SU-Or
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5q-0007QQ-SE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=529niRuORWC1nesahntoUiNvMsWeBf1VoeMWTAA6nMo=;
 b=bDYZ7moFifKlP6FY2M5ymddUcXmoPDgP5WOGKMdDDYq/pWKwVWzPHa9ZVlVzHwEABaDj1V
 FgVCEyYJ4HJu+gpApKh76UiRucGuXVbBlTvPR9L7CrjrbtBa5drX2WQRBWnH38dVNulb3L
 LKlI9FGIhzEstbH7anf3DYnHwC6/gw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-1doATmVBPz-uIq1ppvk5OA-1; Fri, 04 Mar 2022 11:47:20 -0500
X-MC-Unique: 1doATmVBPz-uIq1ppvk5OA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94021824FA9;
 Fri,  4 Mar 2022 16:47:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 960D383BF9;
 Fri,  4 Mar 2022 16:47:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/50] crypto: distinguish between main loop and I/O in
 block_crypto_amend_options_generic_luks
Date: Fri,  4 Mar 2022 17:46:23 +0100
Message-Id: <20220304164711.474713-3-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

block_crypto_amend_options_generic_luks uses the block layer
permission API, therefore it should be called with the BQL held.

However, the same function is being called by two BlockDriver
callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).

The latter is I/O because it is invoked by block/amend.c's
blockdev_amend_run(), a .run callback of the amend JobDriver.

Therefore we want to change this function to still perform
the permission check, but making sure it is done under BQL regardless
of the caller context.

Remove the permission check in block_crypto_amend_options_generic_luks()
and:
- in block_crypto_amend_options_luks() (BQL case, called by
  .bdrv_amend_options()), reuse helper functions
  block_crypto_amend_{prepare/cleanup} that take care of checking
  permissions.

- for block_crypto_co_amend_luks() (I/O case, called by
  .bdrv_co_amend()), don't check for permissions but delegate
  .bdrv_amend_pre_run() and .bdrv_amend_clean() to do it,
  performing these checks before and after the job runs in its aiocontext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220209105452.1694545-3-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/crypto.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 70b2f07351..9d5fecbef8 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -815,30 +815,17 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         Error **errp)
 {
     BlockCrypto *crypto = bs->opaque;
-    int ret;
 
     assert(crypto);
     assert(crypto->block);
 
-    /* apply for exclusive read/write permissions to the underlying file*/
-    crypto->updating_keys = true;
-    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
-    if (ret) {
-        goto cleanup;
-    }
-
-    ret = qcrypto_block_amend_options(crypto->block,
-                                      block_crypto_read_func,
-                                      block_crypto_write_func,
-                                      bs,
-                                      amend_options,
-                                      force,
-                                      errp);
-cleanup:
-    /* release exclusive read/write permissions to the underlying file*/
-    crypto->updating_keys = false;
-    bdrv_child_refresh_perms(bs, bs->file, errp);
-    return ret;
+    return qcrypto_block_amend_options(crypto->block,
+                                       block_crypto_read_func,
+                                       block_crypto_write_func,
+                                       bs,
+                                       amend_options,
+                                       force,
+                                       errp);
 }
 
 static int
@@ -864,8 +851,16 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
     if (!amend_options) {
         goto cleanup;
     }
+
+    ret = block_crypto_amend_prepare(bs, errp);
+    if (ret) {
+        goto perm_cleanup;
+    }
     ret = block_crypto_amend_options_generic_luks(bs, amend_options,
                                                   force, errp);
+
+perm_cleanup:
+    block_crypto_amend_cleanup(bs);
 cleanup:
     qapi_free_QCryptoBlockAmendOptions(amend_options);
     return ret;
-- 
2.35.1


