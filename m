Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089E259196
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:53:16 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7et-0001Jv-JZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Nf-0000b4-Mf
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:35:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60183
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Ne-0007GT-12
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXt2MFYa9yWzNA3K/qT6CdMrIi9tO+WUhUeDU0tW060=;
 b=dnDpjFLZfRwo9xaLriE8y55D3UsFwq2PF4NkGCJr7k4jEA2tRvrDvesYfGi7vAqNGR8LZh
 UmrLF3Dp4M8GGSqpI6q7bGPps6jSajmMkDaO46yFAxjoNNY5ho3t7ZStcsD/8XCkhineaE
 GB/pdy/4WFkTFVsULt93J8FpXN37jIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-BRog0jc7Nziz-761eNyPiw-1; Tue, 01 Sep 2020 10:35:21 -0400
X-MC-Unique: BRog0jc7Nziz-761eNyPiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 208FC8015A8;
 Tue,  1 Sep 2020 14:35:20 +0000 (UTC)
Received: from localhost (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B87521002D4E;
 Tue,  1 Sep 2020 14:35:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 23/43] block: Improve get_allocated_file_size's default
Date: Tue,  1 Sep 2020 16:34:04 +0200
Message-Id: <20200901143424.884735-24-mreitz@redhat.com>
In-Reply-To: <20200901143424.884735-1-mreitz@redhat.com>
References: <20200901143424.884735-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two practical problems with bdrv_get_allocated_file_size()'s
default right now:
(1) For drivers with children, we should generally sum all their sizes
    instead of just passing the request through to bs->file.  The latter
    is good for filters, but not so much for format drivers.

(2) Filters need not have bs->file, so we should actually go to the
    filtered child instead of hard-coding bs->file.

Fix this by splitting the default implementation into three branches:
(1) For filter drivers: Return the size of the filtered child
(2) For protocol drivers: Return -ENOTSUP, because the default
    implementation cannot make a guess
(3) For other drivers: Sum all data-bearing children's sizes

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index ac4ab07f07..63c7d9b1a7 100644
--- a/block.c
+++ b/block.c
@@ -5005,6 +5005,31 @@ exit:
     return ret;
 }
 
+/**
+ * Implementation of BlockDriver.bdrv_get_allocated_file_size() that
+ * sums the size of all data-bearing children.  (This excludes backing
+ * children.)
+ */
+static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
+{
+    BdrvChild *child;
+    int64_t child_size, sum = 0;
+
+    QLIST_FOREACH(child, &bs->children, next) {
+        if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
+                           BDRV_CHILD_FILTERED))
+        {
+            child_size = bdrv_get_allocated_file_size(child->bs);
+            if (child_size < 0) {
+                return child_size;
+            }
+            sum += child_size;
+        }
+    }
+
+    return sum;
+}
+
 /**
  * Length of a allocated file in bytes. Sparse files are counted by actual
  * allocated space. Return < 0 if error or unknown.
@@ -5018,10 +5043,21 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
     if (drv->bdrv_get_allocated_file_size) {
         return drv->bdrv_get_allocated_file_size(bs);
     }
-    if (bs->file) {
-        return bdrv_get_allocated_file_size(bs->file->bs);
+
+    if (drv->bdrv_file_open) {
+        /*
+         * Protocol drivers default to -ENOTSUP (most of their data is
+         * not stored in any of their children (if they even have any),
+         * so there is no generic way to figure it out).
+         */
+        return -ENOTSUP;
+    } else if (drv->is_filter) {
+        /* Filter drivers default to the size of their filtered child */
+        return bdrv_get_allocated_file_size(bdrv_filter_bs(bs));
+    } else {
+        /* Other drivers default to summing their children's sizes */
+        return bdrv_sum_allocated_file_size(bs);
     }
-    return -ENOTSUP;
 }
 
 /*
-- 
2.26.2


