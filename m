Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056341A214
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:02:18 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyhV-0003tS-0Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybS-0002XQ-Hh
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybR-0002mm-4t
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHU1nNS3v78i1CuTDSq3suMz9ooy1pEi/CgwaRKAHuw=;
 b=eE1lmdMzOh66Flkcn4i/Y4RuR2yUMMf9+J2kw5EoEOK8NJcsUhe+0wcquV//yQNJwUm3eg
 t+t4VkHgOBOSuhL7LUpO3wb6fQOGv+bWoT0nA4IZSVfwJXU9js9Z1Ig4txtks3RYjFxMAs
 vO/xq9vbTLqRtp49vzMpflta8yUUe0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-S1kkCzM9N9iUNC79vYnNUA-1; Mon, 27 Sep 2021 17:55:58 -0400
X-MC-Unique: S1kkCzM9N9iUNC79vYnNUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA544824FA9;
 Mon, 27 Sep 2021 21:55:57 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC7F5D9D5;
 Mon, 27 Sep 2021 21:55:52 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] block/io: bring request check to bdrv_co_(read,
 write)v_vmstate
Date: Mon, 27 Sep 2021 16:55:27 -0500
Message-Id: <20210927215545.3930309-3-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Only qcow2 driver supports vmstate.
In qcow2 these requests go through .bdrv_co_p{read,write}v_part
handlers.

So, let's do our basic check for the request on vmstate generic
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-2-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 99ee182ca449..58602f84dbf0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2810,7 +2810,12 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
-    int ret = -ENOTSUP;
+    int ret;
+
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }

     if (!drv) {
         return -ENOMEDIUM;
@@ -2822,6 +2827,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }

     bdrv_dec_in_flight(bs);
@@ -2834,7 +2841,12 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
-    int ret = -ENOTSUP;
+    int ret;
+
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }

     if (!drv) {
         return -ENOMEDIUM;
@@ -2846,6 +2858,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }

     bdrv_dec_in_flight(bs);
-- 
2.31.1


