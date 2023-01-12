Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55959667EDD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG32c-0007Zo-DY; Thu, 12 Jan 2023 14:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32Y-0007Y7-Ox
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32W-00082R-5S
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673550902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUU8VrXA4jUIkYKhKyvhLL9c6PO4miT/0C8AgVa1GZs=;
 b=QitLXHZkXH8NbNfAB5W0zboNvyzZQiA2SXEczrMYMi4XtpnwZjdYiXq2rGAJLD29nFgua6
 zkxDGiezvX0voo/R1YXSIkz35Yvn1Xge628OQUeLFJg3fy7aZSk1Pu4cQ/0lp6ZPz88C2z
 ogNLB3yP78QOHpeeaSLmYYPBVgdrYbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-YITfRap-O5mObSA62tL1Aw-1; Thu, 12 Jan 2023 14:15:01 -0500
X-MC-Unique: YITfRap-O5mObSA62tL1Aw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8E6B857A85;
 Thu, 12 Jan 2023 19:15:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54614492C14;
 Thu, 12 Jan 2023 19:14:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 1/4] qcow2: Fix theoretical corruption in store_bitmap() error
 path
Date: Thu, 12 Jan 2023 20:14:51 +0100
Message-Id: <20230112191454.169353-2-kwolf@redhat.com>
In-Reply-To: <20230112191454.169353-1-kwolf@redhat.com>
References: <20230112191454.169353-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to write the bitmap table to the image file, it is converted to
big endian. If the write fails, it is passed to clear_bitmap_table() to
free all of the clusters it had allocated before. However, if we don't
convert it back to native endianness first, we'll free things at a wrong
offset.

In practical terms, the offsets will be so high that we won't actually
free any allocated clusters, but just run into an error, but in theory
this can cause image corruption.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-bitmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index bcad567c0c..3dff99ba06 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -115,7 +115,7 @@ static int update_header_sync(BlockDriverState *bs)
     return bdrv_flush(bs->file->bs);
 }
 
-static inline void bitmap_table_to_be(uint64_t *bitmap_table, size_t size)
+static inline void bitmap_table_bswap_be(uint64_t *bitmap_table, size_t size)
 {
     size_t i;
 
@@ -1401,9 +1401,10 @@ static int store_bitmap(BlockDriverState *bs, Qcow2Bitmap *bm, Error **errp)
         goto fail;
     }
 
-    bitmap_table_to_be(tb, tb_size);
+    bitmap_table_bswap_be(tb, tb_size);
     ret = bdrv_pwrite(bs->file, tb_offset, tb_size * sizeof(tb[0]), tb, 0);
     if (ret < 0) {
+        bitmap_table_bswap_be(tb, tb_size);
         error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
                          bm_name);
         goto fail;
-- 
2.38.1


