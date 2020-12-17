Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35EA2DD515
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:22:34 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw2z-0004xc-QE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0k-0002EX-W8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0g-0005Oi-1e
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edsb0IsHahQxKHu3tHxbObtbRY6hDPgtbxfSrWIXTyY=;
 b=KMOeppy71H2jCOx+ZX6xZtzOh5X2SyTqp9m6xuQ/ujmG+Ynb6ZnG5X9JwBxLDl6QjCpA7I
 I0uLL2Jp6pMCpnDafWacB9xVSs4xxMKwf8IPM9+CDxiEB+MhtxE1GjaN2yZ0ueg0bubEWg
 xnpScCsX9UP80zN26g8Dl+5gqlC5ypg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-mt3oR1vZO_CdbKJbLVeE4w-1; Thu, 17 Dec 2020 11:20:07 -0500
X-MC-Unique: mt3oR1vZO_CdbKJbLVeE4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98AB58042AC;
 Thu, 17 Dec 2020 16:20:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677DF62AF7;
 Thu, 17 Dec 2020 16:20:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 854D411275E4; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] block/vpc: Pass footer buffers as VHDFooter * instead of
 uint8_t *
Date: Thu, 17 Dec 2020 17:20:02 +0100
Message-Id: <20201217162003.1102738-9-armbru@redhat.com>
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/vpc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index f3ea92dcb0..aac13788df 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -819,7 +819,7 @@ static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
     return 0;
 }
 
-static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
+static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
                                int64_t total_sectors)
 {
     VHDDynDiskHeader dyndisk_header;
@@ -833,13 +833,13 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     block_size = 0x200000;
     num_bat_entries = DIV_ROUND_UP(total_sectors, block_size / 512);
 
-    ret = blk_pwrite(blk, offset, buf, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, offset, footer, HEADER_SIZE, 0);
     if (ret < 0) {
         goto fail;
     }
 
     offset = 1536 + ((num_bat_entries * 4 + 511) & ~511);
-    ret = blk_pwrite(blk, offset, buf, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, offset, footer, HEADER_SIZE, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -887,7 +887,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     return ret;
 }
 
-static int create_fixed_disk(BlockBackend *blk, uint8_t *buf,
+static int create_fixed_disk(BlockBackend *blk, VHDFooter *footer,
                              int64_t total_size, Error **errp)
 {
     int ret;
@@ -900,7 +900,7 @@ static int create_fixed_disk(BlockBackend *blk, uint8_t *buf,
         return ret;
     }
 
-    ret = blk_pwrite(blk, total_size - HEADER_SIZE, buf, HEADER_SIZE, 0);
+    ret = blk_pwrite(blk, total_size - HEADER_SIZE, footer, HEADER_SIZE, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Unable to write VHD header");
         return ret;
@@ -1071,12 +1071,12 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     footer.checksum = cpu_to_be32(vpc_checksum(&footer, HEADER_SIZE));
 
     if (disk_type == VHD_DYNAMIC) {
-        ret = create_dynamic_disk(blk, (uint8_t *)&footer, total_sectors);
+        ret = create_dynamic_disk(blk, &footer, total_sectors);
         if (ret < 0) {
             error_setg(errp, "Unable to create or write VHD header");
         }
     } else {
-        ret = create_fixed_disk(blk, (uint8_t *)&footer, total_size, errp);
+        ret = create_fixed_disk(blk, &footer, total_size, errp);
     }
 
 out:
-- 
2.26.2


