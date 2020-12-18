Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D02DE2D2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:27:42 +0100 (CET)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqErF-0002Vo-Ve
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbR-0002RX-6p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbO-0001sG-Cj
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtv681FiifTGkIk6FqX0mYBECn5c7ppLd1/TuguWmpM=;
 b=Ss15jLyVuCN0cBMVv7uPqNXN1ISHBLr/DC8KN+Yh9NL53mB8DlkWSntd+dI08BBoQsRCHH
 K6yS+TChANLA9EWZpXjw98tZ2WgEkFSgIe4sXfsEEKEu0m5G4z6PvjHkGHjMU5tZTBM+Rh
 Am8H186TYyWdBke9wv8S/f1hqSIhVTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Kkq1eWliMICHcJA4b23jyg-1; Fri, 18 Dec 2020 07:11:12 -0500
X-MC-Unique: Kkq1eWliMICHcJA4b23jyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E9A100C604;
 Fri, 18 Dec 2020 12:11:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E62B60C15;
 Fri, 18 Dec 2020 12:11:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/17] block/vpc: Pass footer buffers as VHDFooter * instead of
 uint8_t *
Date: Fri, 18 Dec 2020 13:10:40 +0100
Message-Id: <20201218121041.299788-17-kwolf@redhat.com>
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-9-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.29.2


