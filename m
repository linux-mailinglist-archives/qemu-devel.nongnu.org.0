Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A90248EB97
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:21:56 +0100 (CET)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NSl-0001Bc-Og
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0f-0003IW-4k
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0d-0000Ng-IH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+Cxm0dWgNF1FatP7v9EAri02bBoOs4vzaitqar3HcM=;
 b=F5Q9c4ImAO2PfQauWmMtJ8UEtVRSel4eJtq4UY4x8invZJ1BpkF5ZAK5JZv+xVm5oEdQLW
 p+0E3RnDX9eX8LWgMljPZKyYgAH5zpfY6/IeGMF0JxgW9oBtnL1phUtH48VQfnPADbD/b7
 J2ZQpE4KKxNrvkW3VJ/e0E2tFN0MhIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-GRg2k5J6P-uF1YeiIuhCFw-1; Fri, 14 Jan 2022 08:52:48 -0500
X-MC-Unique: GRg2k5J6P-uF1YeiIuhCFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAEFA760C1;
 Fri, 14 Jan 2022 13:52:46 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4177105B20E;
 Fri, 14 Jan 2022 13:52:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/16] vvfat: Fix vvfat_write() for writes before the root
 directory
Date: Fri, 14 Jan 2022 14:52:22 +0100
Message-Id: <20220114135226.185407-13-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The calculation in sector2cluster() is done relative to the offset of
the root directory. Any writes to blocks before the start of the root
directory (in particular, writes to the FAT) result in negative values,
which are not handled correctly in vvfat_write().

This changes sector2cluster() to return a signed value, and makes sure
that vvfat_write() doesn't try to find mappings for negative cluster
number. It clarifies the code in vvfat_write() to make it more obvious
that the cluster numbers can be negative.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211209152231.23756-1-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 36e73d4c64..b2b58d93b8 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -882,7 +882,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
     return 0;
 }
 
-static inline uint32_t sector2cluster(BDRVVVFATState* s,off_t sector_num)
+static inline int32_t sector2cluster(BDRVVVFATState* s,off_t sector_num)
 {
     return (sector_num - s->offset_to_root_dir) / s->sectors_per_cluster;
 }
@@ -2981,6 +2981,7 @@ static int vvfat_write(BlockDriverState *bs, int64_t sector_num,
 {
     BDRVVVFATState *s = bs->opaque;
     int i, ret;
+    int first_cluster, last_cluster;
 
 DLOG(checkpoint());
 
@@ -2999,9 +3000,20 @@ DLOG(checkpoint());
     if (sector_num < s->offset_to_fat)
         return -1;
 
-    for (i = sector2cluster(s, sector_num);
-            i <= sector2cluster(s, sector_num + nb_sectors - 1);) {
-        mapping_t* mapping = find_mapping_for_cluster(s, i);
+    /*
+     * Values will be negative for writes to the FAT, which is located before
+     * the root directory.
+     */
+    first_cluster = sector2cluster(s, sector_num);
+    last_cluster = sector2cluster(s, sector_num + nb_sectors - 1);
+
+    for (i = first_cluster; i <= last_cluster;) {
+        mapping_t *mapping = NULL;
+
+        if (i >= 0) {
+            mapping = find_mapping_for_cluster(s, i);
+        }
+
         if (mapping) {
             if (mapping->read_only) {
                 fprintf(stderr, "Tried to write to write-protected file %s\n",
@@ -3041,8 +3053,9 @@ DLOG(checkpoint());
                 }
             }
             i = mapping->end;
-        } else
+        } else {
             i++;
+        }
     }
 
     /*
@@ -3056,10 +3069,11 @@ DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sec
         return ret;
     }
 
-    for (i = sector2cluster(s, sector_num);
-            i <= sector2cluster(s, sector_num + nb_sectors - 1); i++)
-        if (i >= 0)
+    for (i = first_cluster; i <= last_cluster; i++) {
+        if (i >= 0) {
             s->used_clusters[i] |= USED_ALLOCATED;
+        }
+    }
 
 DLOG(checkpoint());
     /* TODO: add timeout */
-- 
2.31.1


