Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA5451BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:20:02 +0200 (CEST)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKt7-0004wi-HZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK5C-0008HV-8V
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK59-0000vQ-Gl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RW3XuGKPPurP4qBBArQab09JPLCfz4Xj1Xqas8BuumU=;
 b=FbyRfTouznNh0SZpZiDMIzHbfSR7RYjYIuYNusqOeR/VdixwGRrgiSiwTsvSxuzOnAzYX9
 svbFhRBq1NXq9nnuLiBRvJoJ+Ybw+g2QUFsaGsGc6V+gTV7wWTJ6g38x5fthR9X0wRWdwh
 XjuLbqcG7hdoJbm6gz51nBbxrFZ866A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-fP0TCtdvOlSMVdaVHcB78Q-1; Thu, 09 Jun 2022 11:28:19 -0400
X-MC-Unique: fP0TCtdvOlSMVdaVHcB78Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41751833967;
 Thu,  9 Jun 2022 15:28:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC57492C3B;
 Thu,  9 Jun 2022 15:28:16 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v5 09/10] block: Use bdrv_co_pwrite_sync() when caller is
 coroutine_fn
Date: Thu,  9 Jun 2022 16:27:43 +0100
Message-Id: <20220609152744.3891847-10-afaria@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert uses of bdrv_pwrite_sync() into bdrv_co_pwrite_sync() when the
callers are already coroutine_fn.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/parallels.c      | 2 +-
 block/qcow2-snapshot.c | 6 +++---
 block/qcow2.c          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f22444efff..8b23b9580d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -481,7 +481,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     ret = 0;
     if (flush_bat) {
-        ret = bdrv_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
         if (ret < 0) {
             res->check_errors++;
             goto out;
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 60e0461632..d1d46facbf 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -512,9 +512,9 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
         assert(fix & BDRV_FIX_ERRORS);
 
         snapshot_table_pointer.nb_snapshots = cpu_to_be32(s->nb_snapshots);
-        ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
-                               sizeof(snapshot_table_pointer.nb_snapshots),
-                               &snapshot_table_pointer.nb_snapshots, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
+                                  sizeof(snapshot_table_pointer.nb_snapshots),
+                                  &snapshot_table_pointer.nb_snapshots, 0);
         if (ret < 0) {
             result->check_errors++;
             fprintf(stderr, "ERROR failed to update the snapshot count in the "
diff --git a/block/qcow2.c b/block/qcow2.c
index c43238a006..f2fb54c51f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4551,8 +4551,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
 
     /* write updated header.size */
     offset = cpu_to_be64(offset);
-    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, size),
-                           sizeof(offset), &offset, 0);
+    ret = bdrv_co_pwrite_sync(bs->file, offsetof(QCowHeader, size),
+                              sizeof(offset), &offset, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to update the image size");
         goto fail;
-- 
2.35.3


