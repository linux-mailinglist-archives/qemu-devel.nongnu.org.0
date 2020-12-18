Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794592DE2B7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:21:01 +0100 (CET)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEkm-0004IF-Di
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbc-0002qO-5j
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbL-0001qm-91
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNU9wEdtvAYeHBDT9VOXtRfUDNYB3yonysL8ZLXIECY=;
 b=K3kbSBa8/oAYlJC7vk4DHUnkrHA4mBKrw+MrR31iPkBf5tHWCTmsWJtYsQllOLVTrWdobd
 el/8WWQZn2yxaN/xRSMkjU2/ctREUY2R87/onVdhiPlAlBeQgS2gUOTvx6G7KKrSaX8Q5O
 rcM5IIIgWBpZ9MJ7EsiNjfqN0BtuVe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-aNvyHcNUPkScMfDoSZgOEQ-1; Fri, 18 Dec 2020 07:11:11 -0500
X-MC-Unique: aNvyHcNUPkScMfDoSZgOEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FFC107ACF5;
 Fri, 18 Dec 2020 12:11:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1240F60C47;
 Fri, 18 Dec 2020 12:11:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/17] block/vpc: Pad VHDFooter, replace uint8_t[] buffers
Date: Fri, 18 Dec 2020 13:10:39 +0100
Message-Id: <20201218121041.299788-16-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Pad VHDFooter as specified in the "Virtual Hard Disk Image Format
Specification" version 1.0[*].  Change footer buffers from
uint8_t[HEADER_SIZE] to VHDFooter.  Their size remains the same.

The VHDFooter * variables pointing to a VHDFooter variable right next
to it are now silly.  Eliminate them, and shorten the remaining
variables' names.

Most variables pointing to s->footer are now also silly.  Eliminate
them, too.

[*] http://download.microsoft.com/download/f/f/e/ffef50a5-07dd-4cf8-aaa3-442c0673a029/Virtual%20Hard%20Disk%20Format%20Spec_10_18_06.doc

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-8-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 77 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 6cb656ac82..f3ea92dcb0 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -95,8 +95,11 @@ typedef struct vhd_footer {
     QemuUUID    uuid;
 
     uint8_t     in_saved_state;
+    uint8_t     reserved[427];
 } QEMU_PACKED VHDFooter;
 
+QEMU_BUILD_BUG_ON(sizeof(VHDFooter) != 512);
+
 typedef struct vhd_dyndisk_header {
     char        magic[8]; /* "cxsparse" */
 
@@ -134,7 +137,7 @@ QEMU_BUILD_BUG_ON(sizeof(VHDDynDiskHeader) != 1024);
 
 typedef struct BDRVVPCState {
     CoMutex lock;
-    uint8_t footer_buf[HEADER_SIZE];
+    VHDFooter footer;
     uint64_t free_data_block_offset;
     int max_table_entries;
     uint32_t *pagetable;
@@ -250,13 +253,13 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, 0, s->footer_buf, HEADER_SIZE);
+    ret = bdrv_pread(bs->file, 0, &s->footer, HEADER_SIZE);
     if (ret < 0) {
         error_setg(errp, "Unable to read VHD header");
         goto fail;
     }
 
-    footer = (VHDFooter *) s->footer_buf;
+    footer = &s->footer;
     if (strncmp(footer->creator, "conectix", 8)) {
         int64_t offset = bdrv_getlength(bs->file->bs);
         if (offset < 0) {
@@ -270,7 +273,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         }
 
         /* If a fixed disk, the footer is found only at the end of the file */
-        ret = bdrv_pread(bs->file, offset-HEADER_SIZE, s->footer_buf,
+        ret = bdrv_pread(bs->file, offset - HEADER_SIZE, footer,
                          HEADER_SIZE);
         if (ret < 0) {
             goto fail;
@@ -285,7 +288,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
     checksum = be32_to_cpu(footer->checksum);
     footer->checksum = 0;
-    if (vpc_checksum(s->footer_buf, HEADER_SIZE) != checksum) {
+    if (vpc_checksum(footer, HEADER_SIZE) != checksum) {
         error_setg(errp, "Incorrect header checksum");
         ret = -EINVAL;
         goto fail;
@@ -535,7 +538,7 @@ static int rewrite_footer(BlockDriverState *bs)
     BDRVVPCState *s = bs->opaque;
     int64_t offset = s->free_data_block_offset;
 
-    ret = bdrv_pwrite_sync(bs->file, offset, s->footer_buf, HEADER_SIZE);
+    ret = bdrv_pwrite_sync(bs->file, offset, &s->footer, HEADER_SIZE);
     if (ret < 0)
         return ret;
 
@@ -598,9 +601,8 @@ fail:
 static int vpc_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVVPCState *s = (BDRVVPCState *)bs->opaque;
-    VHDFooter *footer = (VHDFooter *) s->footer_buf;
 
-    if (be32_to_cpu(footer->type) != VHD_FIXED) {
+    if (be32_to_cpu(s->footer.type) != VHD_FIXED) {
         bdi->cluster_size = s->block_size;
     }
 
@@ -616,10 +618,9 @@ vpc_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     int64_t image_offset;
     int64_t n_bytes;
     int64_t bytes_done = 0;
-    VHDFooter *footer = (VHDFooter *) s->footer_buf;
     QEMUIOVector local_qiov;
 
-    if (be32_to_cpu(footer->type) == VHD_FIXED) {
+    if (be32_to_cpu(s->footer.type) == VHD_FIXED) {
         return bdrv_co_preadv(bs->file, offset, bytes, qiov, 0);
     }
 
@@ -667,10 +668,9 @@ vpc_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     int64_t n_bytes;
     int64_t bytes_done = 0;
     int ret = 0;
-    VHDFooter *footer =  (VHDFooter *) s->footer_buf;
     QEMUIOVector local_qiov;
 
-    if (be32_to_cpu(footer->type) == VHD_FIXED) {
+    if (be32_to_cpu(s->footer.type) == VHD_FIXED) {
         return bdrv_co_pwritev(bs->file, offset, bytes, qiov, 0);
     }
 
@@ -724,13 +724,12 @@ static int coroutine_fn vpc_co_block_status(BlockDriverState *bs,
                                             BlockDriverState **file)
 {
     BDRVVPCState *s = bs->opaque;
-    VHDFooter *footer = (VHDFooter*) s->footer_buf;
     int64_t image_offset;
     bool allocated;
     int ret;
     int64_t n;
 
-    if (be32_to_cpu(footer->type) == VHD_FIXED) {
+    if (be32_to_cpu(s->footer.type) == VHD_FIXED) {
         *pnum = bytes;
         *map = offset;
         *file = bs->file->bs;
@@ -973,8 +972,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     BlockBackend *blk = NULL;
     BlockDriverState *bs = NULL;
 
-    uint8_t footer_buf[HEADER_SIZE];
-    VHDFooter *footer = (VHDFooter *)footer_buf;
+    VHDFooter footer;
     uint16_t cyls = 0;
     uint8_t heads = 0;
     uint8_t secs_per_cyl = 0;
@@ -1037,48 +1035,48 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     }
 
     /* Prepare the Hard Disk Footer */
-    memset(footer_buf, 0, HEADER_SIZE);
+    memset(&footer, 0, HEADER_SIZE);
 
-    memcpy(footer->creator, "conectix", 8);
+    memcpy(footer.creator, "conectix", 8);
     if (vpc_opts->force_size) {
-        memcpy(footer->creator_app, "qem2", 4);
+        memcpy(footer.creator_app, "qem2", 4);
     } else {
-        memcpy(footer->creator_app, "qemu", 4);
+        memcpy(footer.creator_app, "qemu", 4);
     }
-    memcpy(footer->creator_os, "Wi2k", 4);
+    memcpy(footer.creator_os, "Wi2k", 4);
 
-    footer->features = cpu_to_be32(0x02);
-    footer->version = cpu_to_be32(0x00010000);
+    footer.features = cpu_to_be32(0x02);
+    footer.version = cpu_to_be32(0x00010000);
     if (disk_type == VHD_DYNAMIC) {
-        footer->data_offset = cpu_to_be64(HEADER_SIZE);
+        footer.data_offset = cpu_to_be64(HEADER_SIZE);
     } else {
-        footer->data_offset = cpu_to_be64(0xFFFFFFFFFFFFFFFFULL);
+        footer.data_offset = cpu_to_be64(0xFFFFFFFFFFFFFFFFULL);
     }
-    footer->timestamp = cpu_to_be32(time(NULL) - VHD_TIMESTAMP_BASE);
+    footer.timestamp = cpu_to_be32(time(NULL) - VHD_TIMESTAMP_BASE);
 
     /* Version of Virtual PC 2007 */
-    footer->major = cpu_to_be16(0x0005);
-    footer->minor = cpu_to_be16(0x0003);
-    footer->orig_size = cpu_to_be64(total_size);
-    footer->current_size = cpu_to_be64(total_size);
-    footer->cyls = cpu_to_be16(cyls);
-    footer->heads = heads;
-    footer->secs_per_cyl = secs_per_cyl;
+    footer.major = cpu_to_be16(0x0005);
+    footer.minor = cpu_to_be16(0x0003);
+    footer.orig_size = cpu_to_be64(total_size);
+    footer.current_size = cpu_to_be64(total_size);
+    footer.cyls = cpu_to_be16(cyls);
+    footer.heads = heads;
+    footer.secs_per_cyl = secs_per_cyl;
 
-    footer->type = cpu_to_be32(disk_type);
+    footer.type = cpu_to_be32(disk_type);
 
     qemu_uuid_generate(&uuid);
-    footer->uuid = uuid;
+    footer.uuid = uuid;
 
-    footer->checksum = cpu_to_be32(vpc_checksum(footer_buf, HEADER_SIZE));
+    footer.checksum = cpu_to_be32(vpc_checksum(&footer, HEADER_SIZE));
 
     if (disk_type == VHD_DYNAMIC) {
-        ret = create_dynamic_disk(blk, footer_buf, total_sectors);
+        ret = create_dynamic_disk(blk, (uint8_t *)&footer, total_sectors);
         if (ret < 0) {
             error_setg(errp, "Unable to create or write VHD header");
         }
     } else {
-        ret = create_fixed_disk(blk, footer_buf, total_size, errp);
+        ret = create_fixed_disk(blk, (uint8_t *)&footer, total_size, errp);
     }
 
 out:
@@ -1172,9 +1170,8 @@ fail:
 static int vpc_has_zero_init(BlockDriverState *bs)
 {
     BDRVVPCState *s = bs->opaque;
-    VHDFooter *footer =  (VHDFooter *) s->footer_buf;
 
-    if (be32_to_cpu(footer->type) == VHD_FIXED) {
+    if (be32_to_cpu(s->footer.type) == VHD_FIXED) {
         return bdrv_has_zero_init(bs->file->bs);
     } else {
         return 1;
-- 
2.29.2


