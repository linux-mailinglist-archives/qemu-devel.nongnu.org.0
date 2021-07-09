Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338183C23DA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:59:09 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q60-00030v-69
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyC-0002Z1-8Y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyA-0003LI-Gf
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMNWLIiGeR4/AaSyndxXEIIgVoz2v7t75K4HHAzP9yY=;
 b=LVpahvM4RKG7fcLPv/HpEQut+Mp2PQpfIhME2nY+wTRvDcYgTyIxQd/YwIRpRmPGeoWC5T
 M1C9qkzSAGsxKiJGzoSPhnucrjgmkkW4ziY2//YokU/d3fBfESgmTWECo/UQPgPcRM82Fm
 S5KXuqpzk7vMpLWpeSuF2RNrch8Fwio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-AN1O7YisPvOzZEk2q86drg-1; Fri, 09 Jul 2021 08:51:00 -0400
X-MC-Unique: AN1O7YisPvOzZEk2q86drg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 134F48030D7;
 Fri,  9 Jul 2021 12:50:59 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B71960843;
 Fri,  9 Jul 2021 12:50:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/28] block/rbd: store object_size in BDRVRBDState
Date: Fri,  9 Jul 2021 14:50:11 +0200
Message-Id: <20210709125035.191321-5-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Peter Lieven <pl@kamp.de>

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-3-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index b4b928bbb9..1ebf8f7e48 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -102,6 +102,7 @@ typedef struct BDRVRBDState {
     char *snap;
     char *namespace;
     uint64_t image_size;
+    uint64_t object_size;
 } BDRVRBDState;
 
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
@@ -958,6 +959,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     const QDictEntry *e;
     Error *local_err = NULL;
     char *keypairs, *secretid;
+    rbd_image_info_t info;
     int r;
 
     keypairs = g_strdup(qdict_get_try_str(options, "=keyvalue-pairs"));
@@ -1035,12 +1037,14 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 #endif
     }
 
-    r = rbd_get_size(s->image, &s->image_size);
+    r = rbd_stat(s->image, &info, sizeof(info));
     if (r < 0) {
-        error_setg_errno(errp, -r, "error getting image size from %s",
+        error_setg_errno(errp, -r, "error getting image info from %s",
                          s->image_name);
         goto failed_post_open;
     }
+    s->image_size = info.size;
+    s->object_size = info.obj_size;
 
     /* If we are using an rbd snapshot, we must be r/o, otherwise
      * leave as-is */
@@ -1253,15 +1257,7 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
-    int r;
-
-    r = rbd_stat(s->image, &info, sizeof(info));
-    if (r < 0) {
-        return r;
-    }
-
-    bdi->cluster_size = info.obj_size;
+    bdi->cluster_size = s->object_size;
     return 0;
 }
 
-- 
2.31.1


