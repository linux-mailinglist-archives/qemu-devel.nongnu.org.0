Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DD2DE2CC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:26:16 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEpr-0001K3-3o
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbN-0002Io-OV
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbG-0001on-Mp
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkHmyO0iIjgZL0/9EIN1YC5n0Zms/kjiKaU++URa19A=;
 b=b2cI2N3tM1gsj2y6hvjYA9x7Uf/yDjsA/hfCL7FoBM8Nlddi33t9ZWa/UsPyzvZS1jzTFs
 Rh1ZcZ/ACmEd5QWkED02/2bLwcYD8f+9/hPOgGTkjbJ6d0JQiNll9aQpNHPviNllQqKiGZ
 0qSomHsj79jScoHMkAzYhLfH5RSooiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-1Z9uGFXCOYiXVuAcqt_Log-1; Fri, 18 Dec 2020 07:11:07 -0500
X-MC-Unique: 1Z9uGFXCOYiXVuAcqt_Log-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4341081B24;
 Fri, 18 Dec 2020 12:11:06 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4C5160C15;
 Fri, 18 Dec 2020 12:11:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/17] block/vpc: Use sizeof() instead of 1024 for dynamic
 header size
Date: Fri, 18 Dec 2020 13:10:38 +0100
Message-Id: <20201218121041.299788-15-kwolf@redhat.com>
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
Message-Id: <20201217162003.1102738-7-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 08a0f710ad..6cb656ac82 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -344,7 +344,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (disk_type == VHD_DYNAMIC) {
         ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
-                         &dyndisk_header, 1024);
+                         &dyndisk_header, sizeof(dyndisk_header));
         if (ret < 0) {
             error_setg(errp, "Error reading dynamic VHD header");
             goto fail;
@@ -858,7 +858,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     }
 
     /* Prepare the Dynamic Disk Header */
-    memset(&dyndisk_header, 0, 1024);
+    memset(&dyndisk_header, 0, sizeof(dyndisk_header));
 
     memcpy(dyndisk_header.magic, "cxsparse", 8);
 
@@ -872,12 +872,13 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     dyndisk_header.block_size = cpu_to_be32(block_size);
     dyndisk_header.max_table_entries = cpu_to_be32(num_bat_entries);
 
-    dyndisk_header.checksum = cpu_to_be32(vpc_checksum(&dyndisk_header, 1024));
+    dyndisk_header.checksum = cpu_to_be32(
+        vpc_checksum(&dyndisk_header, sizeof(dyndisk_header)));
 
     /* Write the header */
     offset = 512;
 
-    ret = blk_pwrite(blk, offset, &dyndisk_header, 1024, 0);
+    ret = blk_pwrite(blk, offset, &dyndisk_header, sizeof(dyndisk_header), 0);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


