Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D820A1F5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:31:07 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTqE-0006Z0-7w
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTi5-0005SP-59
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:22:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47042
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTi3-0000f1-Cc
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQ1KDRkftLMp1tf7K4zPy2rG4hYbZcHYtRHVLRa3hLA=;
 b=iNx14grJ5qBaKp3MPo/g5nZEHjxOb86gzRD5RIms2dQqaknjuOkQhdgJnD4WqEYaXvnqA0
 RSkC1AAR+AZEI0VUiop1unqCfNNDGHLTLpTIAMc7i+mOKcKve5rCYVnzdcHXJYOAiqSiFM
 wBgenp7Uye6yYgMwdseFpP1OAWfTIUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-6LIvz5PNMuqtItEi_F13lw-1; Thu, 25 Jun 2020 11:22:36 -0400
X-MC-Unique: 6LIvz5PNMuqtItEi_F13lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C957910059A5;
 Thu, 25 Jun 2020 15:22:34 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70EC379303;
 Thu, 25 Jun 2020 15:22:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 07/47] block: Add bdrv_supports_compressed_writes()
Date: Thu, 25 Jun 2020 17:21:35 +0200
Message-Id: <20200625152215.941773-8-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Filters cannot compress data themselves but they have to implement
.bdrv_co_pwritev_compressed() still (or they cannot forward compressed
writes).  Therefore, checking whether
bs->drv->bdrv_co_pwritev_compressed is non-NULL is not sufficient to
know whether the node can actually handle compressed writes.  This
function looks down the filter chain to see whether there is a
non-filter that can actually convert the compressed writes into
compressed data (and thus normal writes).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 0080fe1311..a905a5ec05 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -538,6 +538,7 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it);
 void bdrv_next_cleanup(BdrvNextIterator *it);
 
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs);
+bool bdrv_supports_compressed_writes(BlockDriverState *bs);
 void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
                          void *opaque, bool read_only);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
diff --git a/block.c b/block.c
index 76277ea4e0..6449f3a11d 100644
--- a/block.c
+++ b/block.c
@@ -5044,6 +5044,29 @@ bool bdrv_is_sg(BlockDriverState *bs)
     return bs->sg;
 }
 
+/**
+ * Return whether the given node supports compressed writes.
+ */
+bool bdrv_supports_compressed_writes(BlockDriverState *bs)
+{
+    BlockDriverState *filtered;
+
+    if (!bs->drv || !block_driver_can_compress(bs->drv)) {
+        return false;
+    }
+
+    filtered = bdrv_filter_bs(bs);
+    if (filtered) {
+        /*
+         * Filters can only forward compressed writes, so we have to
+         * check the child.
+         */
+        return bdrv_supports_compressed_writes(filtered);
+    }
+
+    return true;
+}
+
 const char *bdrv_get_format_name(BlockDriverState *bs)
 {
     return bs->drv ? bs->drv->format_name : NULL;
-- 
2.26.2


