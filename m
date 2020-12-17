Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873132DD52A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:27:02 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw7J-00039u-Jw
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0m-0002Ei-5k
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0f-0005Oh-VI
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pACxAMuSVyL0Q9r6OciqTPkBBSnoS2TTQgXRl+aqB8w=;
 b=WoYHKyCF020jGumrRzKviaKLUQ/60JlDAR46A2dL5+/yyN5g02QC3+ROShH71Yy985eOCW
 q5z3OdzKrwzfsMcg+8zqNYb7X2/PQlBn8+BuyJAzg0AojeKLqg7/6dLbyLAmfkW3SN9AU3
 exY4zCZpJ5T45S+ozr4VAzXheQJsnac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-dHAFWnG3O6WhtZFu9fy_ZA-1; Thu, 17 Dec 2020 11:20:07 -0500
X-MC-Unique: dHAFWnG3O6WhtZFu9fy_ZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96DCE1842140;
 Thu, 17 Dec 2020 16:20:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 626D810013C0;
 Thu, 17 Dec 2020 16:20:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79F4D11275DA; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] block/vpc: Use sizeof() instead of 1024 for dynamic
 header size
Date: Thu, 17 Dec 2020 17:20:00 +0100
Message-Id: <20201217162003.1102738-7-armbru@redhat.com>
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
2.26.2


