Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE04423EA4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:23:29 +0200 (CEST)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6tM-0005Iv-Pi
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nu-0004v0-Ka; Wed, 06 Oct 2021 09:17:50 -0400
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:17182 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nr-0004EY-9c; Wed, 06 Oct 2021 09:17:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKcNiS22NdR1hg8vzNZ6ON3vFmlo6UVqZvCAt3Pv+QT7KTg06CgFUPE5OVTETi4PTzRBxO0BzJBoFODV56hn6GK/WkU47nqi61cy8iRufPd1yQGOyuo/2CdSMe8qRwU2OQpLxf+J4pu8abVcY2S1oTGnO40BaYPKcB+fn8GIMQ/SG8EaJnlm5Xw6fEuDSe2R0YVcdkfGiq4GuWRijvaDV3FWISd9IcROKp8IWl3O/s80CjBLtAYAQp9AN9HS5BmwCOVtIBxbv8RUOqyT9xfjUbn7cGd4M3bzP6vu0shRQEqr6GqdF6SLXY+R3rXTn08o4tqH6ATaV3bfzPhVlL7TOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gtdcjl4L9AZonwEVh51UCnTwzZRxZrPN0x4LhA7gw7s=;
 b=meV8vBpkQ/4O8h6O8Vcljh7hsExVqL+AFX0AMCtG0pQ9CAa3y0/P6rU+rqZULAFeihq8f2ChI1vGTKDO/Jgj+uLBBMWmRSbxuseV1j0WngVN0BUjkP9LCnZSy6FHXzoi9mm5vIWNQFtk/CbgvQxQBUCBjZ6WE1GzGCmcGzAyQj4GuABXbP1sNyKxPcGm8oQ/qngdK0G1PiX0d9XlkXYmlpGJ8r1uiPhp/LpmzHCZcVLOIqry10v3NBmgtH/2vu/BW5k4fZSYn7u52xPFFfNKz0DIAcib7jUifTajXs/EAQMKBRKJUzaNj6U3crMNfwTyv30m6cvNXM9DvJG5tszXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtdcjl4L9AZonwEVh51UCnTwzZRxZrPN0x4LhA7gw7s=;
 b=JQXn+z1BILejiuKKJEG4ZE/eA3YOiVTAszclb4yUw2BT8KVZYfmyylBxdqGArL1oGtdrXvqrIMN2d9gHZ4hMxM96ErDuWnrHcbdY5OgF4Xt2DZLk5M0mVai52+6eLmjBdDIeoXBUskdKxjQhq4nPCzuJNALCVgOfu1bhVKDhxIA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 02/12] block-backend: make blk_co_preadv() 64bit
Date: Wed,  6 Oct 2021 15:17:08 +0200
Message-Id: <20211006131718.214235-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68b4e4c0-8cf4-495c-dd9b-08d988cba82e
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981C8B378440E1FDBF570D1C1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QPVPWQ6uI2YsghyIq9OMpo2gZl2xdMmMxGyqlly3uIWDtZGjgv2r/frnCcg9uL5j6iuvG60Om7tNkVNrnS8hoWkjMv3tBFfirrOpzqOuzSCnL2C+6HevKliRIwXEwHKzCfxCy/2tHjjqB3CyyqVzrcvq+Zhqk5l56FRYZDmBF9ldgh2tjoAOHD8vjgKyO1shqQxuOug4r3l/P+qH/4lTopRWlKUb8hPJSc8vknZ2MNxACFhp4dGn+4fNrE9Deng5NlXd9EwhP6TYKFpddV9R6OpeBHp7tCzDjmIuR15BOCcxO/GlWtD09jHRBI5juJJmLI1Sk2ZB/Ge5xprtN6VtIIkZzOswG6bH8ZcpNb5261GroywNJEoRlQOrg9pBP1RiAwj60MiE4uOwMG2SPRAG1+GE2TGzmWSdXYR8LldimpK91WpY+74PQEqpMrgXbKziF+rmBQ+64jlKzbNZwAqpCXKLydA1XyWeK8w9HKd6Dd3YDFTOKXPhu593qIyIlnu2IzivgT3mjpdohaE1bRqmS2+toZtVnF/dhPxRDSHgdnI7ywaGFvWFt3kiuI57WESJzhOp1ckEi/Lbh4doemTUwIkFjBgewAemXBBCBHpgLa51pjchPvFNKdIAPX+EJXZcGkNQR6V/YU4Pz78HfeihkSpEWX8pzYKZmQYRc/K6red2G/PMVcknNtbcYXYRdZ551vberpQ/EiGLSGSS4Q/TIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 459LrXmES3JGni0uAvtTpHsFd+gnZU/cIYIkPmZio65/1AS5hl/cu1GhsXqt1iE5P01DfTsjPHQiQlrO39JSFbbxenbunDRmRjzsQMrnFahqDSeGBlojwGfE5qUycZPiP8zdreGQJpejvgrLrUzIvY+kuDBPlAO/YJy4wXhIJIP13LiEAr1FXev93kpu3Ugqat828uKfJ6XJFJjWkhiQAFCruRkL7DHkfoX/39VXJUZEXNS4gHVV4CYFEw2rREOI2s9dTeJBu5vZ4PzKBsedHnnH2hsT07RTo2/PAXgyrCBSwctIMYfC2i7sXwdcwi1JCb7jC6+XYWUCrU7iXznXTyZN0r8tpRJyx8av/YLanKYf5vnONzC8qK5XhgRSwbCwT0oV+aNOQtbJ3RXW29/N1Mn41q+IUnK0q9V2m952jAbiOa4NKcfglPpdEV6iQAjWl+H82AyLxxv1hIRuCL9q3Smp81VQ00Moxyn+0bSp2HMD/3e740deNn2/PNxjn8epIhx+wjrl6GsQGB+Lcpzk1p5FnFgMpeg8c9AvlwCoxKXjNMlQqYOk3jWIgEz6UtFs/56EkKNQTyNKpPKLybCyiQDSXMT5TsbIySU/V8BXNWdUCqYAtjsV0OWS4C9GB9O4HIZks3ipLDB9JUzkw0OpjBGFJKC9sHNalCiC9JxP3IK3J/LWIVv32OSghAGxHeiLMDF7ZLMgmYQd+m2kx4uvnMzpiJoYXkIoLtIGyUcx2p4SmxgjHMOPe4f79gyD68q+
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b4e4c0-8cf4-495c-dd9b-08d988cba82e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:33.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8AC1QOprNbejFZ5iuT50PJmHM3y/rWcaTys827k5YBn56s48YH2spEb9YiI7cu7Xmld3NvS7fychzi0X43SCAtN8LfyzGhoXXitAID5Vr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For both updated functions type of bytes becomes wider, so all callers
should be OK with it.

blk_co_preadv() only pass its arguments to blk_do_preadv().

blk_do_preadv() pass bytes to:

 - trace_blk_co_preadv, which is updated too
 - blk_check_byte_request, throttle_group_co_io_limits_intercept,
   bdrv_co_preadv, which are already int64_t.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 4 ++--
 block/trace-events             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 29d4fdbf63..32a88878bb 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -126,7 +126,7 @@ BlockBackend *blk_by_dev(void *dev);
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
-                               unsigned int bytes, QEMUIOVector *qiov,
+                               int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      unsigned int bytes,
diff --git a/block/block-backend.c b/block/block-backend.c
index d121ca3868..be5a7fb5fb 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1205,7 +1205,7 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_preadv(BlockBackend *blk, int64_t offset, unsigned int bytes,
+blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
@@ -1236,7 +1236,7 @@ blk_do_preadv(BlockBackend *blk, int64_t offset, unsigned int bytes,
 }
 
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
-                               unsigned int bytes, QEMUIOVector *qiov,
+                               int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags)
 {
     int ret;
diff --git a/block/trace-events b/block/trace-events
index f2d0a9b62a..ff397ffff4 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -5,7 +5,7 @@ bdrv_open_common(void *bs, const char *filename, int flags, const char *format_n
 bdrv_lock_medium(void *bs, bool locked) "bs %p locked %d"
 
 # block-backend.c
-blk_co_preadv(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
+blk_co_preadv(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
 blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
-- 
2.31.1


