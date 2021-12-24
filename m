Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AFF47EFDB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:43:55 +0100 (CET)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mja-0005QL-Vx
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:43:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mh6-0003ur-OJ; Fri, 24 Dec 2021 10:41:21 -0500
Received: from mail-eopbgr00127.outbound.protection.outlook.com
 ([40.107.0.127]:21222 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mh4-0001BF-KS; Fri, 24 Dec 2021 10:41:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDZ9G5FWRJhha78a7BkdQHjZY5FKxQ+ykZLe+yoq5h/UgYOW8twCumr483NH52JP51nIjJSY1J3Xf75xfF6gqFQHH9o0Y17OZ7MRZC7obD1Pl11W+lG08tU6PmtId4f7N34Ps8zNzsy9CiROopARD6YzJ0HRZBom+0XeCvHe7OoALkKx+8ZfP6LG4ryuib9F9uKTBBsreQzvrAwB8WJ1tZHlU2Hv1QK71ZEnREcX9Tds4dULLRdgsrD9Ko/j3zj6KaqpsPnF6INyhI6oMrpMCJLOchgrSXH+9oMVQCJd/aHDGS8WF6Sm62bAYmeT4iFqpYXXIITBbu3GLkOo7/TJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfRx+Xxue8dyGvpOVD0IX5uT8BWfh+GIVwvt2Ox68Aw=;
 b=HDxWSoXjGN9NMix+R58CRDAAzThr2Kb/aUINOngial4TvUxmK2WP1g28blhkQw9QJ+v/FVMD3FbxLVrw/k/HDQsJzj7BHCCvE1L670owsWStOrY5JhO3ILWcAdxx2rbLXh/bgMDVMy0cX7h1HdxtoL/yzKhFLF4pAZLpEgT4KXnjBHYu3rM5AMc+6Nfh8ekPo/MQ0MIIRp9pukk30tXV63ve2BcCV50E/6PKonqVHFgpy217Rk4aoizrUXMJodz5F5cqabjuOkoNgp3hsHL5jPYOuP7hfDPe96TK29aHZ7GZJacAfKSIgd2YR5qTCgNfAsQYyn4epE8lwc9/5MiZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfRx+Xxue8dyGvpOVD0IX5uT8BWfh+GIVwvt2Ox68Aw=;
 b=kkv9YGUYAyKtwtEBKHQ8BIhl8DItkASUDi41g3cCEsDJbD0lVuYKZ8LJf6CzUApMZ9A23JjVSOQ/j2q8YQoNx/bOqscGN5cBiJ4mTZ8rfQxXkpebTyliImb1b2at4DjSRdW3f6bb1eQPxVhRSXIrSt2xTWIYni+ALfQDXLOX1Hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6769.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 15:36:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 0/5] block-job: drop BlockJob.blk
Date: Fri, 24 Dec 2021 16:35:47 +0100
Message-Id: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e371905-3b9b-4c97-284c-08d9c6f31e3e
X-MS-TrafficTypeDiagnostic: AM9PR08MB6769:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB67695FD08A5609B36FB84EE9C17F9@AM9PR08MB6769.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/U2NIKeulJsPA4XSf01Ain1mBc+J8MoO7/IFTB7uoUIItrnZMcgQVxhZhZYln0X+2fSA3ouJnM/6AxwoGGb3E+PV4gEdC6szG4Crnydj+gGm+PWGm7t5vG/P1Md8TbW3279mjrlPeGRiXlKZRZdSt1C0H6Cu+fSOCewIkypuTcY3SKSEi5Vvtn5jLDU73TwzpmGbpv03g+8PPHGR0wMFoUATSG2LhwqTcYS2y2C9yuyk1VmOQwYuN0t5RuVmwhZ9izFyn+fUlzZbBzTnGBJjkJLNoOJnJSk/9GWiDzGhLCYOsxUvywbP5EMs8cvDRg2kqYWGvSWZAw37/xXnuS9fdHUvUOdBHak3/GpKvwIuAWBRaUaDOjZzshF0u0HskKlYm8TlnB27O45mQmbLez53WhQxKVhYiu+thaiMrDHr0rcxz/VUMN0zlr4MzIb1X6zCfsRbuVc+4U/hALzfcC2PJL4HKdg7JE+5EyoNIJl1kRCzFqHMoSXxz0mYruNow4TD04h74Mfx9QEFh8J1QNTdO3A+n/OBRnicmE75xrDr0P5JUwkA8JG7gSN4pYA2XtFGMY4Jzz5RgvFzfcyfDrkArJNi0YPDK697sLrvTDmlYxfXlAY6c2jtCSQjDOeZaLAVQ1+/V5djN8PZI1RsQu/AQEbFHkB9IOn3ZWpsuyLo+MnL4ZqI/Br+hQY6n3tKfoEz26jBZ4LnbaggWgb8JMciw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(26005)(8676002)(6486002)(6512007)(5660300002)(1076003)(107886003)(6666004)(4326008)(186003)(2616005)(66476007)(66556008)(83380400001)(38350700002)(36756003)(86362001)(6916009)(66946007)(6506007)(2906002)(508600001)(38100700002)(52116002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6V6uOGW9D5sDEo8f7ECX13yDK3kQV4s+okd1G/xaZ2tVagvOxAP8glKJOblC?=
 =?us-ascii?Q?eHdUis4S4DZpy/0IMH86vKzOvPu2r2POIi+TjBue754kEzDJw/9rGqXBtplL?=
 =?us-ascii?Q?wydBRBRiJoG/bILAe8kzQt4hoXBbzMri2HPsOpynZ49OZLM7UOIlvEzRM3Du?=
 =?us-ascii?Q?j5gmQoPX6/im/hBRo/ejGc7TszPD6r7gY9qTdW7306ZghLTqf3UKoCDLBIvR?=
 =?us-ascii?Q?vAbaRWsQleRBjbIdRmFc3x05BeREc0/b/jxJAfv6V+WpM5oEZfDaFvwKTaFA?=
 =?us-ascii?Q?8mddbZWUMnWflOF7jCoRV8dzT2EiCWQ2ThvEeo1ejForiK310NSt4UNpKCcn?=
 =?us-ascii?Q?AJVYT3Ak1wl1i7akApTRwFem18EHaLJHyUXNWB5mEoXiITFZTt0i3dgoSzIe?=
 =?us-ascii?Q?cCkiUVXzEBYyxx+i26YsoRv9JyS16gttagaSf7kFrJI5w9SKLQPJd2TeM4Fy?=
 =?us-ascii?Q?lkS188plAmJpLempGcVWqI6nyvfU+FCi+3g1Gye9kbMhfCOCPjuEh01Vb0/a?=
 =?us-ascii?Q?apoyMhjcB1BliXgsjEpdhzCMVIVKDgsigcFVJGHHSTFOf1/ivxy7JrWot/Vs?=
 =?us-ascii?Q?BlgJN+KgibD/lFR2++I3VJpAyUqigm2oWsmiqh8M/gOe9A1yhmQjhMQZkgBB?=
 =?us-ascii?Q?VKT9Tzy4n0zXK+2glvctpx8BXuhewD9JK/BRoEtMolUW0N98+/7eYmYciNVD?=
 =?us-ascii?Q?9ekz2X7KwaKFRUt6TZUAngz/KWTHAePgSjkUd/n8V+FEBS/OXB1YxTJw7c0+?=
 =?us-ascii?Q?9JLaRUzdSKCtgTZ18OaOjPPPxDIPgObvgMpcGqajzsKbXpEDOSjj4IumH7Dp?=
 =?us-ascii?Q?ktvLqCOGoPgLt8fMHMtXfD0TehfNt2fte8FvuYTeGppAn9mz5W3qaMDaum+t?=
 =?us-ascii?Q?z0Lq0Ry+9CC5U40xbKx4HkkcQsVAgYhXntxPWocq2CWF8/w9Jd8/TqZN1JdB?=
 =?us-ascii?Q?e9bSSXAnHKtVfNutwCDD5ffj1/L5rv0Cp9gI2zzoqZ/gyfrms4oBeaWcc0Xp?=
 =?us-ascii?Q?MV8ifGtFXYTikwnSx4stsAlHaIIEHUNqO2czcef1jpOiowLBTvibpfYh7Z7x?=
 =?us-ascii?Q?bvqNxGK1PtCoUokqkNYBS5s12kqkS2K1iICBFGoBRmQP3dEneaImcIGonzrQ?=
 =?us-ascii?Q?mQKb9R+rkRUBLmmE1wCRVVyDvcy8G+OVGZCVLtbWgKm9PNxfHnMdOqk7Zbe0?=
 =?us-ascii?Q?u8s7nXDc7Oj2bvPLK3yFPNh7e7QehW2I/agCd3g/Lolijv8EsIWtpfNlpXID?=
 =?us-ascii?Q?gLAKwCWLsf8vxqwamOidHOwwa+q49jIWoZhJwJNPX/F3anM7vhNhUGFaYZI7?=
 =?us-ascii?Q?RT14kshRYTPk6M4T3hXo/58smDtpadhA6u45TSwYuvPI8zD66YawoUSgFH2M?=
 =?us-ascii?Q?mAha4emBj+eEpsDzgAGfDIuYBAmMxilrIZCbN98ncQKSrt+k0jNryDsQ+YV9?=
 =?us-ascii?Q?3L2KyPVTaj3AVH4pI/6nQvv1p6yqh2MWDMcZRn8RfVyJrnuaKAXYi6bMIzRm?=
 =?us-ascii?Q?u91RT8xqfSyXZUS75+b1Od63hBPeYIzLfuFD8RqIhqp0iEU0RxDPluMUhVjC?=
 =?us-ascii?Q?C7DRQ5fwsdLc+kMAF8KdB2aBM5HDe3PrdAyhwGOj9wYzZkWrBITxQs5ecchy?=
 =?us-ascii?Q?DrBOgk3PuhdL7zxNrm52Z9ShQ/3DFlJfqpFqj6gilRtty6/CdBNUAX4Y6B/2?=
 =?us-ascii?Q?QlRGhzcZv5FZZ1yvXD5RiLANw/w=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e371905-3b9b-4c97-284c-08d9c6f31e3e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:13.7641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+E/+EAYkSFeFAfkn7LKuYubObGZpmccDH2xkf4+dsNVtsxqywKHq8m3tB7i0GzKs6nWTj9EpVMcwTfc5nn3Sjc21x7Rh9v5asjf4GoEzZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6769
Received-SPF: pass client-ip=40.107.0.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

v2: rebase on master, fix iostest 283

Block jobs usually operate with several block nodes, and better to
handle them symmetrically, than use one from s->common.blk and one from
s->target (or something like this). Moreover, generic blockjob layer has
no use of BlockJob.blk. And more-moreover, most of block-jobs don't
really use this blk. Actually only block-stream use it.

I've started this thing (unbinding block-job and its main node) long
ago. First step was removing bs->job pointer in b23c580c946644b. Then
block_job_drain was dropped in bb0c94099382b5273.

Now let's finally drop job->blk pointer.

Vladimir Sementsov-Ogievskiy (5):
  blockjob: implement and use block_job_get_aio_context
  test-blockjob-txn: don't abuse job->blk
  block/stream: add own blk
  test-bdrv-drain: don't use BlockJob.blk
  blockjob: drop BlockJob.blk field

 include/block/blockjob.h       | 10 +++++++---
 block/mirror.c                 |  7 -------
 block/stream.c                 | 24 +++++++++++++++++------
 blockdev.c                     |  6 +++---
 blockjob.c                     | 36 ++++++++++++++++------------------
 qemu-img.c                     |  2 +-
 tests/unit/test-bdrv-drain.c   | 12 ++++++++----
 tests/unit/test-blockjob-txn.c | 10 +---------
 tests/qemu-iotests/141.out     |  2 +-
 tests/qemu-iotests/283         |  3 ++-
 tests/qemu-iotests/283.out     |  2 +-
 11 files changed, 59 insertions(+), 55 deletions(-)

-- 
2.31.1


