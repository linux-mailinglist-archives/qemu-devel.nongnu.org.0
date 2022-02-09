Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269334AEF9B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:04:02 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHklU-0008Lo-PE
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:04:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkct-00056j-FJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcp-0003v0-Uw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yybFxpgtJlLL6JxGHt1OvneJu99xU4H12V1SQA8hp/o=;
 b=BQGG2O11yK9Rod4EqCToa3692pu7rbKNGg+xteIphBOb6Rypgsvk01hKJOv/4xY8tOJ1+9
 gJN424+5brugWP14YKJWqUmcChwwFZOFRSP0SV+RFyq/EmOEKrFURfud/UA0fP8vrveynf
 hCmdq6lsOPi/clxnKiVfUuHiIFIDPHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-rnOAMuLtMSyIEFZ94dljSA-1; Wed, 09 Feb 2022 05:55:01 -0500
X-MC-Unique: rnOAMuLtMSyIEFZ94dljSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C18351F2E3;
 Wed,  9 Feb 2022 10:54:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE555F6AF;
 Wed,  9 Feb 2022 10:54:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/5] crypto: distinguish between main loop and I/O in
 block_crypto_amend_options_generic_luks
Date: Wed,  9 Feb 2022 05:54:49 -0500
Message-Id: <20220209105452.1694545-3-eesposit@redhat.com>
In-Reply-To: <20220209105452.1694545-1-eesposit@redhat.com>
References: <20220209105452.1694545-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 block/crypto.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 59f768ea8d..c546b96dbd 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -809,30 +809,17 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
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
@@ -858,8 +845,16 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
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
2.31.1


