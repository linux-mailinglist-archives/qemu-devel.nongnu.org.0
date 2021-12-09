Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D528546EB2A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:28:31 +0100 (CET)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLLS-0006RP-Vl
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvLFp-0006Wp-0R
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvLFm-0000Rw-2P
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639063357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HzYBszSg3MVNf/0Fe+fTHK8ckxr3/OG0Uw/mmgq+oPo=;
 b=Z25DszOIqYeY50YWfLM2Dc115iIYnu0bOhuPqdC6Upd/U7YuYQNY4LhPm2tcxw2RcWAftK
 RQkGm+dQx2Lg7SlYcTgI+6BQxz0jBHUoxqBekpgdiYhF7isxBJf6yAqjmolhy04nHHT7RU
 kXQtMrVY1YQc6Pcg4Fy+HCVIuMpcvm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-B8vG3XHTO92572q4VIUfyQ-1; Thu, 09 Dec 2021 10:22:34 -0500
X-MC-Unique: B8vG3XHTO92572q4VIUfyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CBD1760C0;
 Thu,  9 Dec 2021 15:22:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B2B719D9F;
 Thu,  9 Dec 2021 15:22:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] vvfat: Fix vvfat_write() for writes before the root directory
Date: Thu,  9 Dec 2021 16:22:31 +0100
Message-Id: <20211209152231.23756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
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
---
 block/vvfat.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 9deb552e0e..99a3bc2568 100644
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
@@ -2971,6 +2971,7 @@ static int vvfat_write(BlockDriverState *bs, int64_t sector_num,
 {
     BDRVVVFATState *s = bs->opaque;
     int i, ret;
+    int first_cluster, last_cluster;
 
 DLOG(checkpoint());
 
@@ -2989,9 +2990,20 @@ DLOG(checkpoint());
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
@@ -3031,8 +3043,9 @@ DLOG(checkpoint());
                 }
             }
             i = mapping->end;
-        } else
+        } else {
             i++;
+        }
     }
 
     /*
@@ -3046,10 +3059,11 @@ DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sec
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


