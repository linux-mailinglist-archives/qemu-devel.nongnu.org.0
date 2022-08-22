Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76FB59BC69
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:12:49 +0200 (CEST)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3UG-0008V6-Qb
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NO-0005dn-T8; Mon, 22 Aug 2022 05:05:42 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:44801 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NM-0006xe-VV; Mon, 22 Aug 2022 05:05:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRX2Jank3IQaOT3tEvruVKFhrhgb4mBOqVS4RjVd/+xeeZWathbTi6xbDN/Naooy0alKcqODkpxJqwh4wnz3fxYHAeo6J6aG3N5W5Knf3QBaM0lmI1zpWkRpQ7oWs6/aiitd3iaSQIm897hUdiwAPtiqCBHq26Plc7PavTnXUukVf+VN/tfoYNItjYN+4BckG5vvl9oTDUyJmMNFG9BHa96gYE3wBf+Och272Vt7LBRe1OgyhjmvDlaQFGwceWcy2ABhsAVp/FfqNXoNPDjfcfPy2j1zb6VOAn/rmXsGkQCI4JWxyU1WfKzao0dMWauWMpVaHagw/Kr9j96SgZLtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfjCEB1XhsFtO2vnQC5cI2LPQqJ2CsUn3sTDnhFvbmU=;
 b=axvRuGS1dsbtrMVDMT0bsGbmrp3ARDb6lFQ7ZZMSUV6ei6oIy0fON0JgsSW3Lixbc3RhfzUYZJqZwApmxskja713La42dTgD0WBVlIc/Vzsgzbvq6jhmlDePowhAK0JKmZowB2qdbiokz1vbeqyllHeq9Y2J+2z4lCsdNpLhH3KPcjVGZUCf74ubZ0NH1jdwzrgE3UVVm0Hdcajr73p1DvwnnA9+zdi4VXWjGqS9Z3r+6wlQcJt1kQhI2erzXyEfBsJWLrodTR6jFo4dIM9Hp7c9mIOd07WSKGjZpg3JSsFred3I2MVh/vswze/rVYTUPfXNnvZM6nsg+51VZ+GAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfjCEB1XhsFtO2vnQC5cI2LPQqJ2CsUn3sTDnhFvbmU=;
 b=FoGxMbY7CS8D7bmE468uthiA14qLmhpZuVdistBMKWZHgjjr/jDyfoHwuJn5cPbUa0uWX80xZRLTNypeoQgytHLrzS1KsAao4EH4NVkUEY7Iq0LO/Jsryb56LihusYz+XVu2KOgKdqbwXmJ0RGXWGF08HuJ3JV5dPjBfzOJyuB4SwReEmF2LyZ9VLS/CvD589vkqVDslZ06tk34+9DiPjRj6h4C48qeVIRU0I+XKri9daBRU6oolA3DrVc488HgueuxidysGWyyWnxJYqS+GCbsAHX5mtxEXOL/muAnyc/w5ptZ+bq+Y8V+jsPIGyIdcbTmJwFlVl+4IgIZ4hGfdNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to image
 inflation
Date: Mon, 22 Aug 2022 11:05:09 +0200
Message-Id: <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3469d46b-f051-4dcb-97f0-08da841d75aa
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3rTKCXEQZQqVgkftzY3sH2/2Og9CJidx4fjwdCXJmiCBUoWg79HzYvaU7U6PQmV9qGlhW7olGtn8yU7smXjuUGVrlofGeWGWugd1LfaR5bEUJK9nOE+da3eo6EZWErY8Q1ycO0vcikWZP9Hd1LIByr4UqvI41rK1713eZMImmuy20Ig1F5H2ZshihFPxoOUpyMY1OBW37H8Y0YqAXq1hQq6zPLS9RsQc5yr1U1aBY4q+U8yERtTmoqAgkZ+Q0479+GK5CnB/yAXaQti25GVgfyuwr/2d5LUq+ri1wavC90iO0866LrQc/RnbQnvK6zEzmogjfonD2fL35aResA6TGZTVQE/EVAFTNF5NuUkWcn8Qp4C4xraDm/hCtWq8XYEmhJgQKQauC68Yp+pUPM39GRZY5pziaZxJGTt/BCey0INI8Lrpb5Mfibg2Ps9YHItfeHYkEEhBVNL0uhsJIqMweSnLisaaUBOOWDuVO3oQf2AzrPtEsm/1Clmvuec5gYYDunU2LWdCz9P/ZEOnm878Oy3RWK1DFIMqUX3XISBBqp78VQpNchRGAs3TTzkZTnOUiYhdAb7pb5Ao/53JxAhA97nmVCZQVrr6ilBWzBISTAy2pXbyRkott2FaQuxF27QeFjHNZr75vSbvSUuAfDYv05ZiP9u9oXiqfZqqIOUw5WXwoJ0u3qEZ1QhM3GErd2Vxvt7HYpVNP5m0e6K97SY1XROgr4IV3FE1SeoCdqwzcSXB7o1bCPGoCXs0qW9LvPOx597PgnHjHUHbzveT9U2Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cOzUOd11zBR2kfFJCBwT8DVXziOYKaWqkmybY/AtD0MDztDJbr6BxDJfMByx?=
 =?us-ascii?Q?Ompn1iX9DksqcRW8/YFTNvODaEBoyXZkgms2tN3O8t1Izbv8S5k71BzJD7si?=
 =?us-ascii?Q?CEzbcWPzdBd8SkBDXwau7eIYEcrSvKFp6AAipKcEEEpJS6P3ZYmZVQOUMKNf?=
 =?us-ascii?Q?ikPY0Ans/o8292Jt50TxTC5S6VgqS22l94Y/s5eROEjV2OXpI3Nji/SnxpYB?=
 =?us-ascii?Q?kdzbta2o1JRipsQhs1wPkkBz5ORshtcvuz5Jogmab8AxREBhiM0G8KscIEdx?=
 =?us-ascii?Q?Q1mOvaW5SAYbkgD5ohIgq5EMVBVnPLbQEoinJPfR1+Fopw1MCxCYBOgqxQ+m?=
 =?us-ascii?Q?MON+oxjJMoNHpAMiv0S9qJZrGZp78QQLgUQToS0u2opjkPORGzshe8aS5+kg?=
 =?us-ascii?Q?f96QTVFYRlrHvhMucZj2sA3iOrosvBYQBG5fNZRYiZHOT5+WxfvDjV/vH+AL?=
 =?us-ascii?Q?Ud/hgDhHKphUgC+OK3Vupz0NcTIaZ1rBR+Mbmd7GExjYE63UAHOOI7sFLNUs?=
 =?us-ascii?Q?zg6VHpGg4Y5Phj7MJQfJ8lSEefr40rVQJgv0KxsYkwUYpUL0GWV4BpvP/wcC?=
 =?us-ascii?Q?8Zv5yBYdk3V9Qk1cvU0B+ik/4Z0GjPQ+fdY3ahOzR2Ws/PuQBhsCjppiQRPb?=
 =?us-ascii?Q?6Ke/s4ZWJO6Y0EO49nbIW2zYmIaesmdqtbPVUX4NVSDZY9KzMFu5epZ4cIS+?=
 =?us-ascii?Q?PRlYTChWt0zScScKewWzDjez5uQrPzez72Wan5Np4rgtmQu4o8t3m0Hxn5kf?=
 =?us-ascii?Q?oQr+1qz5DuUNJoOSpWgs70FCjgCiUXI0IJYCeFusvrYqdojOEVgdCJ7nIu2r?=
 =?us-ascii?Q?rrmw3BPs8nkOSN/FdUwpBHJgc2EE89DmtfQFQF/t0nXylxafuxeuTTHELXT5?=
 =?us-ascii?Q?J0xqQfkbeJHwhvCMKjDQwjKxnl3MS7Jpj3FYgdfINSSq+S76ZeEcBfIg7XSA?=
 =?us-ascii?Q?/38492ykUgo2GAwEEd7nI+rkoxlts3iae6VsPwb02O/l3dUkWVBY1usMwZMO?=
 =?us-ascii?Q?1fDa7Vkv2Rv278KJVneJDrdRv462YgCLrwIgQ+0NS8PbiUaO7EFTXwaq81tn?=
 =?us-ascii?Q?Tcko3BvrPI42L0PKPCuylzTs6TQom1MHVoXs8/cNmb7vXJqwaYy+4DEPd01L?=
 =?us-ascii?Q?6m5smgI/4eI3PB9v+ibkYC/etGsuvOhER2SXf9PPSdzwJtVE26k6IufMoWIm?=
 =?us-ascii?Q?MUa31V7Y2egwphTscjpkaEGYKY1KgyYCFmbUDs3sOf6qimv5T/4ohgHfhD0O?=
 =?us-ascii?Q?oKA559ygGjBOQpitzUayt3sf88L4Qp3VEbGFpwdulJVsiCdGswt7n9QyPqxR?=
 =?us-ascii?Q?9M+8cpYE5SN3WedMym7C+QWfX2NGezO4+ga4kQrJcHhvIh1zMb0ngJuH4Xig?=
 =?us-ascii?Q?hEQPM/qegS72/u/vdLqsb6wSTS+jFneZ2fGalWBX5eyH7DE/zl3wcdc07LOH?=
 =?us-ascii?Q?DvZRsokGqrGKyrSCm1aIqiVs31vwm03LaWZ5KELCsT41gJii2oJkKNLMQWl0?=
 =?us-ascii?Q?CtsWCJ8xjq2yVSXJY9zEVq2yEyN9mcRVWiYeKBJe1a8gbA13rt8q6DSf0W2l?=
 =?us-ascii?Q?hqUWI1f5f/WldC8LayQmwawDly+5MtWY1QMaQ0Wd9ueIZJb4Bdf6ZeZMZLfX?=
 =?us-ascii?Q?Mii6U/aAou9zigMcuTtAmXA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3469d46b-f051-4dcb-97f0-08da841d75aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:29.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JJcDoJqPXP5iht39AN5LvTsl4k792sMMoLt7LOpH7NkfANzgA4IhINmWsatJuFnD70R40X73uchR2ZwWnnu/GxHD6tf4LeimizJ1cgJwso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will create
the cluster at this offset and/or the image will be truncated to this
offset on close. This is definitely not correct.
Raise an error in parallels_open() if data_end points outside the image and
it is not a check (let the check to repaire the image).

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..c245ca35cd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        ret = file_size;
+        goto fail;
+    }
+
+    file_size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
+        error_setg(errp, "parallels: Offset in BAT is out of image");
+        ret = -EINVAL;
+        goto fail;
+    }
+
     if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
         /* Image was not closed correctly. The check is mandatory */
         s->header_unclean = true;
-- 
2.34.1


