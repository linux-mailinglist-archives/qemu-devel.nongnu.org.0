Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18120A1EA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:28:21 +0200 (CEST)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTnY-0002iD-WD
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTiD-0005aA-Q6
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:22:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTiC-0000kM-5M
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUoDCTeAaWcF19+6TO8/N66itLLoNICuvHGOrgyI6zE=;
 b=RrPAzH4pkOkRntzoyPBBMam3ZFOqjoh6Yw7mEhemXDCTI7AU2yoHPhjfgYfHD1LatgOrDu
 prME3KOHCHjP27SToX7/6JjSENKoFUVzO0RPA+QQLZHZejU/G7UqBMYUrLXPenrxFigeUI
 PBV5NGI8q9FSF0bzyDipwCIOTX4yl6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-l1n4uSVEMjaskU0bt4cwjg-1; Thu, 25 Jun 2020 11:22:44 -0400
X-MC-Unique: l1n4uSVEMjaskU0bt4cwjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBD88015FB;
 Thu, 25 Jun 2020 15:22:43 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D330579A3;
 Thu, 25 Jun 2020 15:22:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 11/47] backup-top: Support compressed writes
Date: Thu, 25 Jun 2020 17:21:39 +0200
Message-Id: <20200625152215.941773-12-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup-top.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/backup-top.c b/block/backup-top.c
index af2f20f346..f304df8f26 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -99,6 +99,15 @@ static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
 }
 
+static coroutine_fn int backup_top_co_pwritev_compressed(BlockDriverState *bs,
+                                                         uint64_t offset,
+                                                         uint64_t bytes,
+                                                         QEMUIOVector *qiov)
+{
+    return backup_top_co_pwritev(bs, offset, bytes, qiov,
+                                 BDRV_REQ_WRITE_COMPRESSED);
+}
+
 static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
 {
     if (!bs->backing) {
@@ -173,6 +182,7 @@ BlockDriver bdrv_backup_top_filter = {
     .bdrv_co_pwritev            = backup_top_co_pwritev,
     .bdrv_co_pwrite_zeroes      = backup_top_co_pwrite_zeroes,
     .bdrv_co_pdiscard           = backup_top_co_pdiscard,
+    .bdrv_co_pwritev_compressed = backup_top_co_pwritev_compressed,
     .bdrv_co_flush              = backup_top_co_flush,
 
     .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
-- 
2.26.2


