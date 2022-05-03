Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2C519170
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:32:34 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm14G-0000bk-Pd
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlzOo-0006CD-HW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlzOm-0002oo-P1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7wDJuLaRZENfCjd60d/XtBBUfkWEnijAZYM9JaLmro=;
 b=WBDB0dDw7nSihwAHWBRm/LdIkM7qWuI/qwEnGjFEyW9T9vp74dkpaBGh9Bq9Pu3QV9UXvt
 o0S3Y3nJ17fK4DQHcyhoeUcarXzQIvByketpb1WP+i2RkHfemhW1TdbwBeeOmTyx9jtNO1
 X4NQJCiz5Uk40xpke4TQX81OF8jyWYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-rTBeUcrwNGqBQmCMgzVjrw-1; Tue, 03 May 2022 11:05:38 -0400
X-MC-Unique: rTBeUcrwNGqBQmCMgzVjrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3256E2999067;
 Tue,  3 May 2022 14:55:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A61437774;
 Tue,  3 May 2022 14:55:33 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 2/4] block: Add protocol-specific image info
Date: Tue,  3 May 2022 16:55:27 +0200
Message-Id: <20220503145529.37070-3-hreitz@redhat.com>
In-Reply-To: <20220503145529.37070-1-hreitz@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The ImageInfo object currently only contains (optional) format-specific
image information.  However, perhaps the protocol node can provide some
additional information, so add a new field presenting it.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json |  6 +++++-
 block/qapi.c         | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index beeb91952a..e7d6c2e0cc 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -236,6 +236,9 @@
 # @format-specific: structure supplying additional format-specific
 #                   information (since 1.7)
 #
+# @protocol-specific: structure supplying additional protocol-specific
+#                     information (since 7.1)
+#
 # Since: 1.3
 #
 ##
@@ -246,7 +249,8 @@
            '*backing-filename': 'str', '*full-backing-filename': 'str',
            '*backing-filename-format': 'str', '*snapshots': ['SnapshotInfo'],
            '*backing-image': 'ImageInfo',
-           '*format-specific': 'ImageInfoSpecific' } }
+           '*format-specific': 'ImageInfoSpecific',
+           '*protocol-specific': 'ImageInfoSpecific' } }
 
 ##
 # @ImageCheck:
diff --git a/block/qapi.c b/block/qapi.c
index 51202b470a..293983cf82 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -262,6 +262,7 @@ void bdrv_query_image_info(BlockDriverState *bs,
     int64_t size;
     const char *backing_filename;
     BlockDriverInfo bdi;
+    BlockDriverState *protocol_bs;
     int ret;
     Error *err = NULL;
     ImageInfo *info;
@@ -303,6 +304,24 @@ void bdrv_query_image_info(BlockDriverState *bs,
     }
     info->has_format_specific = info->format_specific != NULL;
 
+    /* Try to look for an unambiguous protocol node */
+    protocol_bs = bs;
+    while (protocol_bs && !QLIST_EMPTY(&protocol_bs->children)) {
+        protocol_bs = bdrv_primary_bs(protocol_bs);
+    }
+    if (protocol_bs) {
+        /* Assert that this is a protocol node */
+        assert(QLIST_EMPTY(&protocol_bs->children));
+
+        info->protocol_specific = bdrv_get_specific_info(protocol_bs, &err);
+        if (err) {
+            error_propagate(errp, err);
+            qapi_free_ImageInfo(info);
+            goto out;
+        }
+        info->has_protocol_specific = info->protocol_specific != NULL;
+    }
+
     backing_filename = bs->backing_file;
     if (backing_filename[0] != '\0') {
         char *backing_filename2;
-- 
2.35.1


