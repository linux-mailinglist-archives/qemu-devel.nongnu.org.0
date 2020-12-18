Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D52DE2BB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:22:33 +0100 (CET)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEmG-0006ru-KA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbP-0002Ng-PY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbN-0001rf-Rh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puxntvppp0T1qFlDEg2+gUZpGGfdzPcyF7BigHe2XyQ=;
 b=iawZ4KRREkQ/Z9ltNkiCikQvBJkND8hGBXaVDoYfwRDYG3GfRW+KC69DWaafxOLYXXxoHR
 Sb+kGSeCpbuyHW0gppltOZHG21c9wGtOX85s04sdGv7L8qIDL3GX1wq3F0fOp9Ra4RAlFp
 NbQfNT4jjIZ7fHwn65nH1Wwd7cPsyrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-2Pl1QptVO-KvSQmntSG1EA-1; Fri, 18 Dec 2020 07:11:13 -0500
X-MC-Unique: 2Pl1QptVO-KvSQmntSG1EA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6B8F107ACE6;
 Fri, 18 Dec 2020 12:11:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF27F60C15;
 Fri, 18 Dec 2020 12:11:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/17] block/vpc: Use sizeof() instead of HEADER_SIZE for
 footer size
Date: Fri, 18 Dec 2020 13:10:41 +0100
Message-Id: <20201218121041.299788-18-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-10-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index aac13788df..17a705b482 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -39,8 +39,6 @@
 
 /**************************************************************/
 
-#define HEADER_SIZE 512
-
 //#define CACHE
 
 enum vhd_type {
@@ -253,7 +251,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, 0, &s->footer, HEADER_SIZE);
+    ret = bdrv_pread(bs->file, 0, &s->footer, sizeof(s->footer));
     if (ret < 0) {
         error_setg(errp, "Unable to read VHD header");
         goto fail;
@@ -266,15 +264,15 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
             ret = offset;
             error_setg(errp, "Invalid file size");
             goto fail;
-        } else if (offset < HEADER_SIZE) {
+        } else if (offset < sizeof(*footer)) {
             ret = -EINVAL;
             error_setg(errp, "File too small for a VHD header");
             goto fail;
         }
 
         /* If a fixed disk, the footer is found only at the end of the file */
-        ret = bdrv_pread(bs->file, offset - HEADER_SIZE, footer,
-                         HEADER_SIZE);
+        ret = bdrv_pread(bs->file, offset - sizeof(*footer),
+                         footer, sizeof(*footer));
         if (ret < 0) {
             goto fail;
         }
@@ -288,7 +286,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
     checksum = be32_to_cpu(footer->checksum);
     footer->checksum = 0;
-    if (vpc_checksum(footer, HEADER_SIZE) != checksum) {
+    if (vpc_checksum(footer, sizeof(*footer)) != checksum) {
         error_setg(errp, "Incorrect header checksum");
         ret = -EINVAL;
         goto fail;
@@ -538,7 +536,7 @@ static int rewrite_footer(BlockDriverState *bs)
     BDRVVPCState *s = bs->opaque;
     int64_t offset = s->free_data_block_offset;
 
-    ret = bdrv_pwrite_sync(bs->file, offset, &s->footer, HEADER_SIZE);
+    ret = bdrv_pwrite_sync(bs->file, offset, &s->footer, sizeof(s->footer));
     if (ret < 0)
         return ret;
 
@@ -833,13 +831,13 @@ static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
     block_size = 0x200000;
     num_bat_entries = DIV_ROUND_UP(total_sectors, block_size / 512);
 
-    ret = blk_pwrite(blk, offset, footer, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, offset, footer, sizeof(*footer), 0);
     if (ret < 0) {
         goto fail;
     }
 
     offset = 1536 + ((num_bat_entries * 4 + 511) & ~511);
-    ret = blk_pwrite(blk, offset, footer, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, offset, footer, sizeof(*footer), 0);
     if (ret < 0) {
         goto fail;
     }
@@ -893,14 +891,15 @@ static int create_fixed_disk(BlockBackend *blk, VHDFooter *footer,
     int ret;
 
     /* Add footer to total size */
-    total_size += HEADER_SIZE;
+    total_size += sizeof(*footer);
 
     ret = blk_truncate(blk, total_size, false, PREALLOC_MODE_OFF, 0, errp);
     if (ret < 0) {
         return ret;
     }
 
-    ret = blk_pwrite(blk, total_size - HEADER_SIZE, footer, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, total_size - sizeof(*footer),
+                     footer, sizeof(*footer), 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Unable to write VHD header");
         return ret;
@@ -1035,7 +1034,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     }
 
     /* Prepare the Hard Disk Footer */
-    memset(&footer, 0, HEADER_SIZE);
+    memset(&footer, 0, sizeof(footer));
 
     memcpy(footer.creator, "conectix", 8);
     if (vpc_opts->force_size) {
@@ -1048,7 +1047,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     footer.features = cpu_to_be32(0x02);
     footer.version = cpu_to_be32(0x00010000);
     if (disk_type == VHD_DYNAMIC) {
-        footer.data_offset = cpu_to_be64(HEADER_SIZE);
+        footer.data_offset = cpu_to_be64(sizeof(footer));
     } else {
         footer.data_offset = cpu_to_be64(0xFFFFFFFFFFFFFFFFULL);
     }
@@ -1068,7 +1067,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     qemu_uuid_generate(&uuid);
     footer.uuid = uuid;
 
-    footer.checksum = cpu_to_be32(vpc_checksum(&footer, HEADER_SIZE));
+    footer.checksum = cpu_to_be32(vpc_checksum(&footer, sizeof(footer)));
 
     if (disk_type == VHD_DYNAMIC) {
         ret = create_dynamic_disk(blk, &footer, total_sectors);
-- 
2.29.2


