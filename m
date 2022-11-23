Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACB635C24
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9I-0002eE-UO; Wed, 23 Nov 2022 06:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9G-0002c1-CZ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9D-00060e-UK
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPfvAxicqjZEdZqZsMILhHeGv+h7HqHaHsq0Ekh/5O4=;
 b=c6/fV6yXVz9iUMJMw3ouGRc2ruorYRNlahZ7YK7pUd7UazvGP3lz6anmU/WhwavUp1vbpg
 TqnYSsdYUjfKFKp0hiajQH2AHwhr5M4x5K6ZboKnJcEtxsc1CsJnobKNxd2PQzzsGtJWCQ
 4ohnZWPn6yBHVFkJh/Xe7dNxDnGkPsU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-vHAi8g9UNRi-z8Jvs7R3dw-1; Wed, 23 Nov 2022 06:42:34 -0500
X-MC-Unique: vHAi8g9UNRi-z8Jvs7R3dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9978F3C0F236;
 Wed, 23 Nov 2022 11:42:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42F6EC2C8CA;
 Wed, 23 Nov 2022 11:42:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 09/15] block: bdrv_create_file is a coroutine_fn
Date: Wed, 23 Nov 2022 06:42:21 -0500
Message-Id: <20221123114227.85757-10-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is always called in coroutine_fn callbacks, therefore
it can directly call bdrv_co_create().

Rename it to bdrv_co_create_file too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 5 +++--
 block/crypto.c                     | 2 +-
 block/parallels.c                  | 2 +-
 block/qcow.c                       | 2 +-
 block/qcow2.c                      | 4 ++--
 block/qed.c                        | 2 +-
 block/raw-format.c                 | 2 +-
 block/vdi.c                        | 2 +-
 block/vhdx.c                       | 2 +-
 block/vmdk.c                       | 2 +-
 block/vpc.c                        | 2 +-
 include/block/block-global-state.h | 3 ++-
 12 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 8a7f87f783..8207f93353 100644
--- a/block.c
+++ b/block.c
@@ -724,7 +724,8 @@ out:
     return ret;
 }
 
-int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
+int coroutine_fn bdrv_co_create_file(const char *filename, QemuOpts *opts,
+                                     Error **errp)
 {
     QemuOpts *protocol_opts;
     BlockDriver *drv;
@@ -765,7 +766,7 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
         goto out;
     }
 
-    ret = bdrv_create(drv, filename, protocol_opts, errp);
+    ret = bdrv_co_create(drv, filename, protocol_opts, errp);
 out:
     qemu_opts_del(protocol_opts);
     qobject_unref(qdict);
diff --git a/block/crypto.c b/block/crypto.c
index 2fb8add458..bbeb9f437c 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -703,7 +703,7 @@ static int coroutine_fn block_crypto_co_create_opts_luks(BlockDriver *drv,
     }
 
     /* Create protocol layer */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/parallels.c b/block/parallels.c
index fa08c1104b..bbea2f2221 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -646,7 +646,7 @@ static int coroutine_fn parallels_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto done;
     }
diff --git a/block/qcow.c b/block/qcow.c
index daa38839ab..18e17a5b12 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -973,7 +973,7 @@ static int coroutine_fn qcow_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index 4d6666d3ff..7cc49a3a6c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3871,7 +3871,7 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto finish;
     }
@@ -3886,7 +3886,7 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
     /* Create and open an external data file (protocol layer) */
     val = qdict_get_try_str(qdict, BLOCK_OPT_DATA_FILE);
     if (val) {
-        ret = bdrv_create_file(val, opts, errp);
+        ret = bdrv_co_create_file(val, opts, errp);
         if (ret < 0) {
             goto finish;
         }
diff --git a/block/qed.c b/block/qed.c
index c2691a85b1..9d54c8eec5 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -778,7 +778,7 @@ static int coroutine_fn bdrv_qed_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/raw-format.c b/block/raw-format.c
index a68014ef0b..28905b09ee 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -433,7 +433,7 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
                                            QemuOpts *opts,
                                            Error **errp)
 {
-    return bdrv_create_file(filename, opts, errp);
+    return bdrv_co_create_file(filename, opts, errp);
 }
 
 static int raw_open(BlockDriverState *bs, QDict *options, int flags,
diff --git a/block/vdi.c b/block/vdi.c
index c0c111c4b9..479bcfe820 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -934,7 +934,7 @@ static int coroutine_fn vdi_co_create_opts(BlockDriver *drv,
     qdict = qemu_opts_to_qdict_filtered(opts, NULL, &vdi_create_opts, true);
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto done;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index bad9ca691b..4c929800fe 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2084,7 +2084,7 @@ static int coroutine_fn vhdx_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 0c32bf2e83..afd3471915 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2294,7 +2294,7 @@ static int coroutine_fn vmdk_create_extent(const char *filename,
     int ret;
     BlockBackend *blk = NULL;
 
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto exit;
     }
diff --git a/block/vpc.c b/block/vpc.c
index 95841f259a..6ee95dcb96 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1111,7 +1111,7 @@ static int coroutine_fn vpc_co_create_opts(BlockDriver *drv,
     }
 
     /* Create and open the file (protocol layer) */
-    ret = bdrv_create_file(filename, opts, errp);
+    ret = bdrv_co_create_file(filename, opts, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 00e0cf8aea..387a7cbb2e 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -57,7 +57,8 @@ BlockDriver *bdrv_find_protocol(const char *filename,
 BlockDriver *bdrv_find_format(const char *format_name);
 int bdrv_create(BlockDriver *drv, const char* filename,
                 QemuOpts *opts, Error **errp);
-int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
+int coroutine_fn bdrv_co_create_file(const char *filename, QemuOpts *opts,
+                                     Error **errp);
 
 BlockDriverState *bdrv_new(void);
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-- 
2.31.1


