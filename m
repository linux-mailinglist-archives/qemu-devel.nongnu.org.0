Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06051A23F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:33:03 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG3r-0002bz-0g
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwg-0000pU-Ee
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwe-0007F6-Eu
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3eLwBwv1jVmhyvYs1+wYGmfoQi/Isq1ZlKzAv9M9sw=;
 b=BGvhDozemaFDBhZ3E0J1sMlitzwgkv8sU/SBoEwAaQMVrJy0Y5v5fZludV6RV3nVSVLCX7
 nju/kxXQo4qxShMnXcBAGjVEhILqZ9g1ptZ91j0ms9lHoiaI0aId1BYejZxVxR2Hl9Tyge
 zkY3Iv91b+6tqALSNOAF/e9fHDwhN8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-ZXqK_xdDM-GAqxBZ1riENQ-1; Wed, 04 May 2022 10:25:33 -0400
X-MC-Unique: ZXqK_xdDM-GAqxBZ1riENQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 562EA1014A61;
 Wed,  4 May 2022 14:25:33 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB4A0402189;
 Wed,  4 May 2022 14:25:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/13] block: Classify bdrv_get_flags() as I/O function
Date: Wed,  4 May 2022 16:25:14 +0200
Message-Id: <20220504142522.167506-6-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

This function is safe to call in an I/O context, and qcow2_do_open()
does so (invoked in an I/O context by qcow2_co_invalidate_cache()).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220427114057.36651-2-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h | 1 -
 include/block/block-io.h           | 1 +
 block.c                            | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 25bb69bbef..21265e3966 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -172,7 +172,6 @@ void bdrv_next_cleanup(BdrvNextIterator *it);
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs);
 void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
                          void *opaque, bool read_only);
-int bdrv_get_flags(BlockDriverState *bs);
 char *bdrv_get_full_backing_filename(BlockDriverState *bs, Error **errp);
 char *bdrv_dirname(BlockDriverState *bs, Error **errp);
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5e3f346806..62c84f0519 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -103,6 +103,7 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
 bool bdrv_is_read_only(BlockDriverState *bs);
 bool bdrv_is_writable(BlockDriverState *bs);
 bool bdrv_is_sg(BlockDriverState *bs);
+int bdrv_get_flags(BlockDriverState *bs);
 bool bdrv_is_inserted(BlockDriverState *bs);
 void bdrv_lock_medium(BlockDriverState *bs, bool locked);
 void bdrv_eject(BlockDriverState *bs, bool eject_flag);
diff --git a/block.c b/block.c
index 8cd16e757e..2c00dddd80 100644
--- a/block.c
+++ b/block.c
@@ -6298,7 +6298,7 @@ const char *bdrv_get_device_or_node_name(const BlockDriverState *bs)
 
 int bdrv_get_flags(BlockDriverState *bs)
 {
-    GLOBAL_STATE_CODE();
+    IO_CODE();
     return bs->open_flags;
 }
 
-- 
2.35.1


