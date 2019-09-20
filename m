Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251AB919F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 16:24:38 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBJpt-0006ms-3C
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 10:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmW-0004Z5-8a
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmU-0000tC-MZ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:43818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmQ-0000gH-EY; Fri, 20 Sep 2019 10:21:02 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmM-0006b5-PW; Fri, 20 Sep 2019 17:20:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v13 04/15] block/backup: improve comment about image fleecing
Date: Fri, 20 Sep 2019 17:20:45 +0300
Message-Id: <20190920142056.12778-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920142056.12778-1-vsementsov@virtuozzo.com>
References: <20190920142056.12778-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 98d7f7a905..ae28849660 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -747,9 +747,18 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->bitmap_mode = bitmap_mode;
 
     /*
-     * Set write flags:
-     * 1. Detect image-fleecing (and similar) schemes
-     * 2. Handle compression
+     * If source is in backing chain of target assume that target is going to be
+     * used for "image fleecing", i.e. it should represent a kind of snapshot of
+     * source at backup-start point in time. And target is going to be read by
+     * somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already updated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
      */
     job->write_flags =
         (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
-- 
2.21.0


