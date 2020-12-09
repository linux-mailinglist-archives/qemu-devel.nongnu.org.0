Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53472D4724
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:51:52 +0100 (CET)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2gv-00079T-Ev
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2aM-0002qq-Ej
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2aG-0003K1-An
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607532295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MGdOSRuaY0jL7WFzslodoODfTjJHh5fpzO4HwJ4MUw=;
 b=YxN7oso8EOGGinmxmcRSCdTkKzKxCJTYCmgEFCgKoGnAy8v5DJwXX94XZbEHjbf+ruMoBA
 qgKYKCm6VrAtaoPupGW3tJZan2oBJj38WBRzhu2cLlW0Nb+w4j6rUyYxMkd4jbxLA871FV
 9Nl2E01YZtyqsX5JSYHnm4tvKHiIZaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-5lylo0e5NHC-_B0wGT1jOg-1; Wed, 09 Dec 2020 11:44:51 -0500
X-MC-Unique: 5lylo0e5NHC-_B0wGT1jOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78FAA1842141;
 Wed,  9 Dec 2020 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9FF1E5;
 Wed,  9 Dec 2020 16:44:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] block: add bdrv_co_delete_file_noerr
Date: Wed,  9 Dec 2020 18:44:39 +0200
Message-Id: <20201209164441.867945-3-mlevitsk@redhat.com>
In-Reply-To: <20201209164441.867945-1-mlevitsk@redhat.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function wraps bdrv_co_delete_file for the common case of removing a file,
which was just created by format driver, on an error condition.

It hides the -ENOTSUPP error, and reports all other errors otherwise.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block.c               | 23 +++++++++++++++++++++++
 include/block/block.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/block.c b/block.c
index f1cedac362..57e6d9750a 100644
--- a/block.c
+++ b/block.c
@@ -704,6 +704,29 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
     return ret;
 }
 
+void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
+{
+    Error *local_err = NULL;
+
+    if (!bs) {
+        return;
+    }
+
+    int ret = bdrv_co_delete_file(bs, &local_err);
+    /*
+     * ENOTSUP will happen if the block driver doesn't support
+     * the 'bdrv_co_delete_file' interface. This is a predictable
+     * scenario and shouldn't be reported back to the user.
+     */
+    if (ret == -ENOTSUP) {
+        error_free(local_err);
+    } else if (ret < 0) {
+        error_report_err(local_err);
+    }
+}
+
+
+
 /**
  * Try to get @bs's logical and physical block size.
  * On success, store them in @bsz struct and return 0.
diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..af03022723 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -428,6 +428,7 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
 int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
+void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
 
 
 typedef struct BdrvCheckResult {
-- 
2.26.2


