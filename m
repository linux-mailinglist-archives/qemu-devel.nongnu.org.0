Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2D6DC772
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plruK-0003oT-AH; Mon, 10 Apr 2023 09:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1plru3-0003lQ-1n
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1plrtz-0003fp-Pr
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681134586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=apAUbgcKK0WpKz8zRDNn8pGxRxCKedUxbp+ut+C1m4s=;
 b=YcdCm0fCEnklHB8q/OO//S2b84WBVhi+O15W1eMnHhPyuaaKiwXX+9vZUuvPTM0Qd0Y4dv
 JXTTb1tEH98WHZAyoDi9H2wRBUv7hiarHJTwuQWET4o7Tc5844jho01suCCTX5FbCQ7rKg
 /WJxTR3y5GgQlH4WxZwvy3FvhNPh6Vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-SsZpcKO0N8ylHMB3OOzFWA-1; Mon, 10 Apr 2023 09:49:43 -0400
X-MC-Unique: SsZpcKO0N8ylHMB3OOzFWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A20884EC1;
 Mon, 10 Apr 2023 13:49:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D38FE14171B7;
 Mon, 10 Apr 2023 13:49:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Sam Li <faithilikerun@gmail.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH] block/file-posix: use unsigned int for zones consistently
Date: Mon, 10 Apr 2023 09:49:38 -0400
Message-Id: <20230410134938.907457-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

Avoid mixing int and unsigned int for zone index and count values. This
eliminates the possibility of accidental negative write pointer array
indices. It also makes code review easier because we don't need to worry
about signed/unsigned comparisons.

In practice I don't think zoned devices are likely to exceed MAX_INT
zones any time soon, so this is mostly a code cleanup.

Cc: Sam Li <faithilikerun@gmail.com>
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

This is a cleanup on top of "[PATCH v9 0/4] Add zone append write for
zoned device".

Based-on: <20230407081657.17947-1-faithilikerun@gmail.com>

diff --git a/block/file-posix.c b/block/file-posix.c
index 32b16bc4fb..77fbf9e33e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1338,8 +1338,9 @@ static int get_zones_wp(BlockDriverState *bs, int fd, int64_t offset,
     size_t rep_size;
     uint64_t sector = offset >> BDRV_SECTOR_BITS;
     BlockZoneWps *wps = bs->wps;
-    int j = offset / bs->bl.zone_size;
-    int ret, n = 0, i = 0;
+    unsigned int j = offset / bs->bl.zone_size;
+    int ret;
+    unsigned int n = 0, i = 0;
     rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
     g_autofree struct blk_zone_report *rep = NULL;
 
@@ -2092,7 +2093,8 @@ static int handle_aiocb_zone_report(void *opaque)
     struct blk_zone *blkz;
     size_t rep_size;
     unsigned int nrz;
-    int ret, n = 0, i = 0;
+    int ret;
+    unsigned int n = 0, i = 0;
 
     nrz = *nr_zones;
     rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
@@ -3507,11 +3509,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
             return ret;
         }
     } else if (zo == BLKRESETZONE) {
-        for (int j = 0; j < nrz; ++j) {
+        for (unsigned int j = 0; j < nrz; ++j) {
             wp[j] = offset + j * zone_size;
         }
     } else if (zo == BLKFINISHZONE) {
-        for (int j = 0; j < nrz; ++j) {
+        for (unsigned int j = 0; j < nrz; ++j) {
             /* The zoned device allows the last zone smaller that the
              * zone size. */
             wp[j] = MIN(offset + (j + 1) * zone_size, offset + len);
-- 
2.39.2


