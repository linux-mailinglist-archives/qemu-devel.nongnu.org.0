Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395232DD513
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:21:59 +0100 (CET)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw2Q-00044j-7z
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0i-0002DW-T6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0e-0005O2-Rd
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKtc0m71zqbuxVjvXgik25ZLjeRuMWE5ZhOcCrOTdbI=;
 b=hPE1EJwUnnBic7n5mFxdiSww4fsOLIXBImIjARf9h9tapMCZ8mDlPvHpio4HDW/IwOlQvw
 JVbAcCeiyBc1QAPj0tFnOwJpHzTn/yeXRUWlWPwY8GSpnrFYFv09OPBrPdIbQ6hwFSJUCU
 sCsGYASdVaLQ6g3lP1PDKfYVAtNzMWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-OYBVbXHDPyO3Tz93e_4G4A-1; Thu, 17 Dec 2020 11:20:06 -0500
X-MC-Unique: OYBVbXHDPyO3Tz93e_4G4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1606AB8101;
 Thu, 17 Dec 2020 16:20:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D792E18A50;
 Thu, 17 Dec 2020 16:20:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D1F1114200B; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] block/vpc: Don't abuse the footer buffer for dynamic
 header
Date: Thu, 17 Dec 2020 17:19:57 +0100
Message-Id: <20201217162003.1102738-4-armbru@redhat.com>
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create_dynamic_disk() takes a buffer holding the footer as first
argument.  It writes out the footer (512 bytes), then reuses the
buffer to initialize and write out the dynamic header (1024 bytes).

Works, because the caller passes a buffer that is large enough for
both purposes.  I hate that.

Use a separate buffer for the dynamic header, and adjust the caller's
buffer.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
2.26.2


