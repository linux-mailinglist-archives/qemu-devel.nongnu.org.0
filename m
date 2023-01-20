Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD7675469
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUG-0003Dk-2y; Fri, 20 Jan 2023 07:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUA-0002vR-Ag
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU8-0000Pw-Dy
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93adnjgKYizxxWIHM3Ev/xwGHJ89kzbhZAMEU/mPplQ=;
 b=VRHNY0VpZ/SC7XCBT9Tja52FuiO5GKHhHKjMjZelOXoBcvp2IlUlqBPR0XJ1Bi5I7MjfE1
 4WgFz3qgYgXnZ0TmjAION/SSRzpvE8SIUd5EroyguHVUhbs6sX4RlJyMZAn04o2D7d7Vb4
 WtV3NNDzF+3MdALLq7vojlXgcZZVaDc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-QphVg3uTPUmtCWig9i3lyg-1; Fri, 20 Jan 2023 07:27:04 -0500
X-MC-Unique: QphVg3uTPUmtCWig9i3lyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BF923C16E95;
 Fri, 20 Jan 2023 12:27:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61E2C40C6EC4;
 Fri, 20 Jan 2023 12:27:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 25/38] block: Rename bdrv_load/save_vmstate() to
 bdrv_co_load/save_vmstate()
Date: Fri, 20 Jan 2023 13:26:20 +0100
Message-Id: <20230120122633.84983-26-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Since these functions always run in coroutine context, adjust
their name to include "_co_", just like all other BlockDriver callbacks.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230113204212.359076-15-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  4 ++--
 block/io.c                       |  8 ++++----
 block/qcow2.c                    | 12 ++++++------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 93d4350f24..fd8ccaefee 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -704,10 +704,10 @@ struct BlockDriver {
                                                  Error **errp);
     BlockStatsSpecific *(*bdrv_get_specific_stats)(BlockDriverState *bs);
 
-    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_save_vmstate)(
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_save_vmstate)(
         BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
-    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_load_vmstate)(
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_load_vmstate)(
         BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
     /* removable device specific */
diff --git a/block/io.c b/block/io.c
index cd1cea2515..445c757c2a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2719,8 +2719,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 
     bdrv_inc_in_flight(bs);
 
-    if (drv->bdrv_load_vmstate) {
-        ret = drv->bdrv_load_vmstate(bs, qiov, pos);
+    if (drv->bdrv_co_load_vmstate) {
+        ret = drv->bdrv_co_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
     } else {
@@ -2752,8 +2752,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 
     bdrv_inc_in_flight(bs);
 
-    if (drv->bdrv_save_vmstate) {
-        ret = drv->bdrv_save_vmstate(bs, qiov, pos);
+    if (drv->bdrv_co_save_vmstate) {
+        ret = drv->bdrv_co_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
     } else {
diff --git a/block/qcow2.c b/block/qcow2.c
index 460579b70a..ce644dfc59 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5286,8 +5286,8 @@ static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
     return pos;
 }
 
-static coroutine_fn int qcow2_save_vmstate(BlockDriverState *bs,
-                                           QEMUIOVector *qiov, int64_t pos)
+static coroutine_fn int qcow2_co_save_vmstate(BlockDriverState *bs,
+                                              QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
@@ -5298,8 +5298,8 @@ static coroutine_fn int qcow2_save_vmstate(BlockDriverState *bs,
     return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
-static coroutine_fn int qcow2_load_vmstate(BlockDriverState *bs,
-                                           QEMUIOVector *qiov, int64_t pos)
+static coroutine_fn int qcow2_co_load_vmstate(BlockDriverState *bs,
+                                              QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
@@ -6080,8 +6080,8 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_co_get_info       = qcow2_co_get_info,
     .bdrv_get_specific_info = qcow2_get_specific_info,
 
-    .bdrv_save_vmstate    = qcow2_save_vmstate,
-    .bdrv_load_vmstate    = qcow2_load_vmstate,
+    .bdrv_co_save_vmstate   = qcow2_co_save_vmstate,
+    .bdrv_co_load_vmstate   = qcow2_co_load_vmstate,
 
     .is_format                  = true,
     .supports_backing           = true,
-- 
2.38.1


