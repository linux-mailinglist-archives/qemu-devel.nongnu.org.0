Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990362DE2B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:20:35 +0100 (CET)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEkM-0003bG-Iu
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbL-0002DO-2V
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbA-0001kB-MV
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+JvrztsiNE0o4lp3dJ5S5dpQZJKrmddZv4FOjOzbjY=;
 b=isNB2x9COXyiB5gRNW7f5M4e4sUMwkzXSr3IUObFgqENdI1qg/iYoPrKQJw/6xqh/XlFB8
 hBFsAp9ZJDpUIBdTN/dick5irx9eZZQiRo5gTSBYdaKGlFZ1Ru8B2C9h04iZp4mVGLVIIQ
 QziqYwPqhkmmupXt6qjnl/xJXFCEP44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-fHqzalPmMfqP_M4eZdsJkw-1; Fri, 18 Dec 2020 07:11:01 -0500
X-MC-Unique: fHqzalPmMfqP_M4eZdsJkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD9B8049CD;
 Fri, 18 Dec 2020 12:11:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D966360C15;
 Fri, 18 Dec 2020 12:10:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/17] block/vpc: Don't abuse the footer buffer for dynamic
 header
Date: Fri, 18 Dec 2020 13:10:35 +0100
Message-Id: <20201218121041.299788-12-kwolf@redhat.com>
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

create_dynamic_disk() takes a buffer holding the footer as first
argument.  It writes out the footer (512 bytes), then reuses the
buffer to initialize and write out the dynamic header (1024 bytes).

Works, because the caller passes a buffer that is large enough for
both purposes.  I hate that.

Use a separate buffer for the dynamic header, and adjust the caller's
buffer.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-4-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index d18ecc3da1..34186640ee 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -822,8 +822,9 @@ static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
 static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
                                int64_t total_sectors)
 {
+    uint8_t dyndisk_header_buf[1024];
     VHDDynDiskHeader *dyndisk_header =
-        (VHDDynDiskHeader *) buf;
+        (VHDDynDiskHeader *)dyndisk_header_buf;
     uint8_t bat_sector[512];
     size_t block_size, num_bat_entries;
     int i;
@@ -858,7 +859,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     }
 
     /* Prepare the Dynamic Disk Header */
-    memset(buf, 0, 1024);
+    memset(dyndisk_header_buf, 0, 1024);
 
     memcpy(dyndisk_header->magic, "cxsparse", 8);
 
@@ -872,12 +873,13 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     dyndisk_header->block_size = cpu_to_be32(block_size);
     dyndisk_header->max_table_entries = cpu_to_be32(num_bat_entries);
 
-    dyndisk_header->checksum = cpu_to_be32(vpc_checksum(buf, 1024));
+    dyndisk_header->checksum = cpu_to_be32(vpc_checksum(dyndisk_header_buf,
+                                                        1024));
 
     /* Write the header */
     offset = 512;
 
-    ret = blk_pwrite(blk, offset, buf, 1024, 0);
+    ret = blk_pwrite(blk, offset, dyndisk_header_buf, 1024, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -972,8 +974,8 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     BlockBackend *blk = NULL;
     BlockDriverState *bs = NULL;
 
-    uint8_t buf[1024];
-    VHDFooter *footer = (VHDFooter *) buf;
+    uint8_t footer_buf[HEADER_SIZE];
+    VHDFooter *footer = (VHDFooter *)footer_buf;
     uint16_t cyls = 0;
     uint8_t heads = 0;
     uint8_t secs_per_cyl = 0;
@@ -1036,7 +1038,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     }
 
     /* Prepare the Hard Disk Footer */
-    memset(buf, 0, 1024);
+    memset(footer_buf, 0, HEADER_SIZE);
 
     memcpy(footer->creator, "conectix", 8);
     if (vpc_opts->force_size) {
@@ -1069,15 +1071,15 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     qemu_uuid_generate(&uuid);
     footer->uuid = uuid;
 
-    footer->checksum = cpu_to_be32(vpc_checksum(buf, HEADER_SIZE));
+    footer->checksum = cpu_to_be32(vpc_checksum(footer_buf, HEADER_SIZE));
 
     if (disk_type == VHD_DYNAMIC) {
-        ret = create_dynamic_disk(blk, buf, total_sectors);
+        ret = create_dynamic_disk(blk, footer_buf, total_sectors);
         if (ret < 0) {
             error_setg(errp, "Unable to create or write VHD header");
         }
     } else {
-        ret = create_fixed_disk(blk, buf, total_size, errp);
+        ret = create_fixed_disk(blk, footer_buf, total_size, errp);
     }
 
 out:
-- 
2.29.2


