Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77252DE2BD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:23:59 +0100 (CET)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEne-0000NG-PA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbN-0002IR-FT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbF-0001no-Qc
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRmMeCcGQMDzkRryMyFzSGEn7nxI1791TXbxIqE+klw=;
 b=JWvfIE1wjYjes6WQMOa87osPdJfABuXbFMawDk1p5ooTJdaMwrVfliUmPesMJlVSkAIjss
 5pdISn3s1m9Wzeb7awD0vDJtlvQH93eysRxYzHX6uL36Ez2KOT5cfHS38E+3PI3rIEdYSX
 /ZeM/JniW1dFdZExjQV71K1OJortHIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-nwY_MFw3OX6VXboK7Ia89w-1; Fri, 18 Dec 2020 07:11:04 -0500
X-MC-Unique: nwY_MFw3OX6VXboK7Ia89w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BECF801817;
 Fri, 18 Dec 2020 12:11:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6506960C15;
 Fri, 18 Dec 2020 12:11:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/17] block/vpc: Pad VHDDynDiskHeader,
 replace uint8_t[] buffers
Date: Fri, 18 Dec 2020 13:10:37 +0100
Message-Id: <20201218121041.299788-14-kwolf@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Pad VHDDynDiskHeader as specified in the "Virtual Hard Disk Image
Format Specification" version 1.0[*].  Change dynamic disk header
buffers from uint8_t[1024] to VHDDynDiskHeader.  Their size remains
the same.

The VHDDynDiskHeader * variables pointing to a VHDDynDiskHeader
variable right next to it are now silly.  Eliminate them.

[*] http://download.microsoft.com/download/f/f/e/ffef50a5-07dd-4cf8-aaa3-442c0673a029/Virtual%20Hard%20Disk%20Format%20Spec_10_18_06.doc

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-6-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 5af9837806..08a0f710ad 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -127,8 +127,11 @@ typedef struct vhd_dyndisk_header {
         uint32_t    reserved;
         uint64_t    data_offset;
     } parent_locator[8];
+    uint8_t     reserved2[256];
 } QEMU_PACKED VHDDynDiskHeader;
 
+QEMU_BUILD_BUG_ON(sizeof(VHDDynDiskHeader) != 1024);
+
 typedef struct BDRVVPCState {
     CoMutex lock;
     uint8_t footer_buf[HEADER_SIZE];
@@ -217,11 +220,10 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVVPCState *s = bs->opaque;
     int i;
     VHDFooter *footer;
-    VHDDynDiskHeader *dyndisk_header;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     bool use_chs;
-    uint8_t dyndisk_header_buf[1024];
+    VHDDynDiskHeader dyndisk_header;
     uint32_t checksum;
     uint64_t computed_size;
     uint64_t pagetable_size;
@@ -342,21 +344,19 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (disk_type == VHD_DYNAMIC) {
         ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
-                         dyndisk_header_buf, 1024);
+                         &dyndisk_header, 1024);
         if (ret < 0) {
             error_setg(errp, "Error reading dynamic VHD header");
             goto fail;
         }
 
-        dyndisk_header = (VHDDynDiskHeader *)dyndisk_header_buf;
-
-        if (strncmp(dyndisk_header->magic, "cxsparse", 8)) {
+        if (strncmp(dyndisk_header.magic, "cxsparse", 8)) {
             error_setg(errp, "Invalid header magic");
             ret = -EINVAL;
             goto fail;
         }
 
-        s->block_size = be32_to_cpu(dyndisk_header->block_size);
+        s->block_size = be32_to_cpu(dyndisk_header.block_size);
         if (!is_power_of_2(s->block_size) || s->block_size < BDRV_SECTOR_SIZE) {
             error_setg(errp, "Invalid block size %" PRIu32, s->block_size);
             ret = -EINVAL;
@@ -364,7 +364,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         }
         s->bitmap_size = ((s->block_size / (8 * 512)) + 511) & ~511;
 
-        s->max_table_entries = be32_to_cpu(dyndisk_header->max_table_entries);
+        s->max_table_entries = be32_to_cpu(dyndisk_header.max_table_entries);
 
         if ((bs->total_sectors * 512) / s->block_size > 0xffffffffU) {
             error_setg(errp, "Too many blocks");
@@ -396,7 +396,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
             goto fail;
         }
 
-        s->bat_offset = be64_to_cpu(dyndisk_header->table_offset);
+        s->bat_offset = be64_to_cpu(dyndisk_header.table_offset);
 
         ret = bdrv_pread(bs->file, s->bat_offset, s->pagetable,
                          pagetable_size);
@@ -823,9 +823,7 @@ static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
 static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
                                int64_t total_sectors)
 {
-    uint8_t dyndisk_header_buf[1024];
-    VHDDynDiskHeader *dyndisk_header =
-        (VHDDynDiskHeader *)dyndisk_header_buf;
+    VHDDynDiskHeader dyndisk_header;
     uint8_t bat_sector[512];
     size_t block_size, num_bat_entries;
     int i;
@@ -860,27 +858,26 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     }
 
     /* Prepare the Dynamic Disk Header */
-    memset(dyndisk_header_buf, 0, 1024);
+    memset(&dyndisk_header, 0, 1024);
 
-    memcpy(dyndisk_header->magic, "cxsparse", 8);
+    memcpy(dyndisk_header.magic, "cxsparse", 8);
 
     /*
      * Note: The spec is actually wrong here for data_offset, it says
      * 0xFFFFFFFF, but MS tools expect all 64 bits to be set.
      */
-    dyndisk_header->data_offset = cpu_to_be64(0xFFFFFFFFFFFFFFFFULL);
-    dyndisk_header->table_offset = cpu_to_be64(3 * 512);
-    dyndisk_header->version = cpu_to_be32(0x00010000);
-    dyndisk_header->block_size = cpu_to_be32(block_size);
-    dyndisk_header->max_table_entries = cpu_to_be32(num_bat_entries);
+    dyndisk_header.data_offset = cpu_to_be64(0xFFFFFFFFFFFFFFFFULL);
+    dyndisk_header.table_offset = cpu_to_be64(3 * 512);
+    dyndisk_header.version = cpu_to_be32(0x00010000);
+    dyndisk_header.block_size = cpu_to_be32(block_size);
+    dyndisk_header.max_table_entries = cpu_to_be32(num_bat_entries);
 
-    dyndisk_header->checksum = cpu_to_be32(vpc_checksum(dyndisk_header_buf,
-                                                        1024));
+    dyndisk_header.checksum = cpu_to_be32(vpc_checksum(&dyndisk_header, 1024));
 
     /* Write the header */
     offset = 512;
 
-    ret = blk_pwrite(blk, offset, dyndisk_header_buf, 1024, 0);
+    ret = blk_pwrite(blk, offset, &dyndisk_header, 1024, 0);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


