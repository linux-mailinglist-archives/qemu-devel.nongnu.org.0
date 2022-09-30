Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5915F1066
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:02:48 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJPT-0001nj-BD
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFn-0006c5-W9
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFm-0006ex-Bw
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvW1OZEkBsIbi0WQ6Q1/6kkcjSLDAcfsPX8jfzcy260=;
 b=gt0Yy37ZgsXOhzDTrnsG4c+EZi4p+IrflyO1bAzAD8/Gq4W2YW2yV6uHEjvt356VusRx+h
 ccdnHSdlgZQF6oqB9eUzonWjhhv+cEgNyGrzjX52NDXlhRfZsl4suh6vDaqzqoFBvsvatb
 MzYYungI7/AeUlYSEiNDN1wNZ6FzQDQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-6LVDHlfcObCANaEY3Jk5VQ-1; Fri, 30 Sep 2022 12:52:44 -0400
X-MC-Unique: 6LVDHlfcObCANaEY3Jk5VQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA6463800C29;
 Fri, 30 Sep 2022 16:52:43 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2654A17582;
 Fri, 30 Sep 2022 16:52:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 10/18] block/qed: Keep auto_backing_file if possible
Date: Fri, 30 Sep 2022 18:52:14 +0200
Message-Id: <20220930165222.249716-11-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Just like qcow2, qed invokes its open function in its
.bdrv_co_invalidate_cache() implementation.  Therefore, just like done
for qcow2 in HEAD^, update auto_backing_file only if the backing file
string in the image header differs from the one we have read before.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220803144446.20723-3-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index 40943e679b..324ca0e95a 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -445,6 +445,8 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
     }
 
     if ((s->header.features & QED_F_BACKING_FILE)) {
+        g_autofree char *backing_file_str = NULL;
+
         if ((uint64_t)s->header.backing_filename_offset +
             s->header.backing_filename_size >
             s->header.cluster_size * s->header.header_size) {
@@ -452,16 +454,21 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
             return -EINVAL;
         }
 
+        backing_file_str = g_malloc(sizeof(bs->backing_file));
         ret = qed_read_string(bs->file, s->header.backing_filename_offset,
                               s->header.backing_filename_size,
-                              bs->auto_backing_file,
-                              sizeof(bs->auto_backing_file));
+                              backing_file_str, sizeof(bs->backing_file));
         if (ret < 0) {
             error_setg(errp, "Failed to read backing filename");
             return ret;
         }
-        pstrcpy(bs->backing_file, sizeof(bs->backing_file),
-                bs->auto_backing_file);
+
+        if (!g_str_equal(backing_file_str, bs->backing_file)) {
+            pstrcpy(bs->backing_file, sizeof(bs->backing_file),
+                    backing_file_str);
+            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
+                    backing_file_str);
+        }
 
         if (s->header.features & QED_F_BACKING_FORMAT_NO_PROBE) {
             pstrcpy(bs->backing_format, sizeof(bs->backing_format), "raw");
-- 
2.37.3


