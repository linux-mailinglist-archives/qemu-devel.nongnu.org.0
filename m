Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6414CC16A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:34:44 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnTX-0007L1-Pt
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDd-0006Zm-Gj
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDZ-0004ez-9K
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QObwVlXFbR/MRV2rmg3tfciLcnt8OqVWa4NvKLET5Oo=;
 b=UiQswU45mKTwryEm2BfdS9h1bSG+eZgIzCbVrv9rEr/2DkscbPV2sB+/D5ha/tmThaS3pV
 HC1YoRev0b1228vsqyg8UpJhWoz2ZFdusqU3a3uRBtTxaQ+DIskfsFJTcub+cZ6Oz+i1Gh
 erUxMzceDLG3bEKdolE7EaIRX2R+rS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-WxkLYmy4NHa6buqAZhQycQ-1; Thu, 03 Mar 2022 10:18:03 -0500
X-MC-Unique: WxkLYmy4NHa6buqAZhQycQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2086351DF;
 Thu,  3 Mar 2022 15:18:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7557BCD7;
 Thu,  3 Mar 2022 15:18:00 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 06/31] block/export/fuse.c: allow writable exports to take
 RESIZE permission
Date: Thu,  3 Mar 2022 10:15:51 -0500
Message-Id: <20220303151616.325444-7-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow writable exports to get BLK_PERM_RESIZE permission
from creation, in fuse_export_create().
In this way, there is no need to give the permission in
fuse_do_truncate(), which might be run in an iothread.

Permissions should be set only in the main thread, so
in any case if an iothread tries to set RESIZE, it will
be blocked.

Also assert in fuse_do_truncate that if we give the
RESIZE permission we can then restore the original ones.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/export/fuse.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index fdda8e3c81..5029e70f84 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -86,8 +86,8 @@ static int fuse_export_create(BlockExport *blk_exp,
 
     assert(blk_exp_args->type == BLOCK_EXPORT_TYPE_FUSE);
 
-    /* For growable exports, take the RESIZE permission */
-    if (args->growable) {
+    /* For growable and writable exports, take the RESIZE permission */
+    if (args->growable || blk_exp_args->writable) {
         uint64_t blk_perm, blk_shared_perm;
 
         blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
@@ -392,14 +392,23 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
 {
     uint64_t blk_perm, blk_shared_perm;
     BdrvRequestFlags truncate_flags = 0;
-    int ret;
+    bool add_resize_perm;
+    int ret, ret_check;
+
+    /* Growable and writable exports have a permanent RESIZE permission */
+    add_resize_perm = !exp->growable && !exp->writable;
 
     if (req_zero_write) {
         truncate_flags |= BDRV_REQ_ZERO_WRITE;
     }
 
-    /* Growable exports have a permanent RESIZE permission */
-    if (!exp->growable) {
+    if (add_resize_perm) {
+
+        if (!qemu_in_main_thread()) {
+            /* Changing permissions like below only works in the main thread */
+            return -EPERM;
+        }
+
         blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
 
         ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
@@ -412,9 +421,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
     ret = blk_truncate(exp->common.blk, size, true, prealloc,
                        truncate_flags, NULL);
 
-    if (!exp->growable) {
+    if (add_resize_perm) {
         /* Must succeed, because we are only giving up the RESIZE permission */
-        blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
+        ret_check = blk_set_perm(exp->common.blk, blk_perm,
+                                 blk_shared_perm, &error_abort);
+        assert(ret_check == 0);
     }
 
     return ret;
-- 
2.31.1


