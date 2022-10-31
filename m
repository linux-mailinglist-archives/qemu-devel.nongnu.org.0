Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E6613DD9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZuj-0001kK-LR; Mon, 31 Oct 2022 14:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu8-0001Gc-0K
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu6-0003lF-Eq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQlhnItX9YyJv1NaFthXUfWY9srsADrlsPISjWkQdzc=;
 b=akoiEZQuYpxH9MkxzNlwalOz+2QUGUV48HKiLMdPIbakFXxONFRJq9xK04YIko9pjUuJ1J
 pDi2+Lc+IPSy1jsPL1NykXyUwj5icEr6NgoUuQHr1IvaGftZ+4zbiAn9at1WaXiRhV4rcD
 WElnuygtnX7qaOO7r2GcCWx7YnOvpjo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-Pz3aAVcxPM6jjf5bzcoBqQ-1; Mon, 31 Oct 2022 14:52:56 -0400
X-MC-Unique: Pz3aAVcxPM6jjf5bzcoBqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E09A1101A528;
 Mon, 31 Oct 2022 18:52:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4782B40C2089;
 Mon, 31 Oct 2022 18:52:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PULL 2/3] block/blkio: Tolerate device size changes
Date: Mon, 31 Oct 2022 14:51:05 -0400
Message-Id: <20221031185106.28245-3-stefanha@redhat.com>
In-Reply-To: <20221031185106.28245-1-stefanha@redhat.com>
References: <20221031185106.28245-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Some libblkio drivers may be able to work with regular files (e.g.,
io_uring) or otherwise resizable devices. Conservatively set
BlockDriver::has_variable_length to true to ensure bdrv_nb_sectors()
always gives up-to-date results.

Also implement BlockDriver::bdrv_co_truncate for the case where no
preallocation is needed and the device already has a size compatible
with what was requested.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-id: 20221029122031.975273-1-afaria@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/blkio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/block/blkio.c b/block/blkio.c
index f55eb774b4..d850506acd 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -848,6 +848,31 @@ static int64_t blkio_getlength(BlockDriverState *bs)
     return capacity;
 }
 
+static int coroutine_fn blkio_truncate(BlockDriverState *bs, int64_t offset,
+                                       bool exact, PreallocMode prealloc,
+                                       BdrvRequestFlags flags, Error **errp)
+{
+    int64_t current_length;
+
+    if (prealloc != PREALLOC_MODE_OFF) {
+        error_setg(errp, "Unsupported preallocation mode '%s'",
+                   PreallocMode_str(prealloc));
+        return -ENOTSUP;
+    }
+
+    current_length = blkio_getlength(bs);
+
+    if (offset > current_length) {
+        error_setg(errp, "Cannot grow device");
+        return -EINVAL;
+    } else if (exact && offset != current_length) {
+        error_setg(errp, "Cannot resize device");
+        return -ENOTSUP;
+    }
+
+    return 0;
+}
+
 static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     return 0;
@@ -963,10 +988,12 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
     { \
         .format_name             = name, \
         .protocol_name           = name, \
+        .has_variable_length     = true, \
         .instance_size           = sizeof(BDRVBlkioState), \
         .bdrv_file_open          = blkio_file_open, \
         .bdrv_close              = blkio_close, \
         .bdrv_getlength          = blkio_getlength, \
+        .bdrv_co_truncate        = blkio_truncate, \
         .bdrv_get_info           = blkio_get_info, \
         .bdrv_attach_aio_context = blkio_attach_aio_context, \
         .bdrv_detach_aio_context = blkio_detach_aio_context, \
-- 
2.38.1


