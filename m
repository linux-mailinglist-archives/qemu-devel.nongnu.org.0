Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20B47D5F2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:44:16 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05ev-0003TR-IH
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bV-0000L1-4F; Wed, 22 Dec 2021 12:40:41 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:22241 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bQ-0002WE-UP; Wed, 22 Dec 2021 12:40:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3oYdp44Qp5ikgMNiVuKlYTSVbjnz2bUYYZ7b4lv0gq+hfvxQoD43acfFdKm1motuuSUnHEO7V5BYPl+nZlQWO5PTcg5zHY7C5AoF6spj4ri5X6VpCk4rG4xXWtswmeqDt573TO/qjuCbh23IrruxYNp4gQSobuJyav5iWqdjftERTb/Tko6lKEmxRQqZJ4pqaJjbkHfZUMe2+uDhfoFvuTWAk6VuKEw5egScFQEpdrRl6ixs6DmLnKOraWrAoXf7yIKAicEpVldyZx4Gv5V5Qw1fn41YC8nI2MBrAbZWNla5LWPYJr0CjjiI630CEgxHNj7ZsmqYsDotfmFkCg3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiIeKnyvqtTEh3qbsX0Da+MGIBDJLo/mF4f6iNERExg=;
 b=dyD2pWEgkDnaWZIxnV/5kxUs78yv6jsYL7keM6bjWCkTp2H7kQ543NgfRanUo4a+5TnXHOIFEx20Leo/o3mJ1+MXQmb7QtE+OVx8G8VA6HTUnQqJHYNsOzZK+DnO5FSs8RIe2CBKp1+VpT3dycIH2p7tw5KM78QikraMrPjMt+6rjwM8MBpJ8q48nngg8kCF9+WEzIfbC8DMYsw2YntlI5+ZTOpNidbZkWkiIQgbN2M8HPZlk5QJEtdmKjYCLgdjWYqQQ+HbIw/RngyXN9dK0Ga2hKNyNWFjjcta9o8s5saLvn7TI9JoJLa5pzMZtZ7W40RGoFvCx0dPLhftysgABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiIeKnyvqtTEh3qbsX0Da+MGIBDJLo/mF4f6iNERExg=;
 b=ViCynoteJIajGZkY1eyFH2tBi2EMHttksvBXk/BW0zQytOsL5JM01krthzkPdrW5q0VendJuHEx+T0eRVhORHd+ta9cWP1y3PKhqKujtSMX9VDCe0DK+beubSQvJpk+zO9HNaulMZ7IsIt9kVlEh8jyCf6+YxYmAhSDsElVKtOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:32 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 00/19] Make image fleecing more usable
Date: Wed, 22 Dec 2021 18:39:59 +0100
Message-Id: <20211222174018.257550-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2d9c82d-e727-4a0f-f38c-08d9c57226e1
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB2988713AF9142A8E83B46C06C17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:176;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3mi8+tXvsLE2Kdnnz3AhOmKbXClZZy7G1oIzEJdnODdkLl24HhFM3l/Gro6j1sdTGeloSzUNyZO7i/3oZEdoFBhhBq4wHySUSqUTfWtwoB2z6I0o4xmjOcaWiu48VLtxTfnI5pIhvlAjfPYByOH40FrLpRuTSREwDjLWf4S7x8rP1arkmBZzEDy+fU/ixXHbVV4nYNppfjaB0Yl+lEcnQrmQ5qDqU+4dFopk7PrjhR57vj6ViFuEazYK3wnqk6qu7QA08jVy7cZoDGFzXr056arat5qzNkwj6AAlRAUh+Tb0vRuNbv4tWtg+6uZJ8kC2M6eZcXPa/NFyo3JmQsW40vxtF1DZwyNj2asohnhXtrEv8aQiAqREHLIaLWX6tNvA3CT7+eCiFV8i8mAHkCPLC9rY09fCGbhAU2FKi2kZxK60qPFsgyxL27lHCLX9VMLq8Lr74s09gq8yseo0BTaem8kck9U4s2SVJTMZmkrR2LGAT3tLPd4lsID0+z/XKKpzAf+c8nU5Mbw/1YOQh0bJowCn8cQIo8PdvoCVAOHtoyJK1OBIh0mYIIOUAI2LVhXNEXpjRbxaOBwvF9uUUnK7E0Ye87f3vvJpne5B1W0VMM0s3r9AMByXXqHDAoZz8hADq1rvL9ftLNbMJtSi9XKev5Iury8H2HAWv7qjbraHOXrzZPOUQtYjznbVBOumlFtm9xcJvQKXL2IMW9L/po4+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rUuzMWvPX1hWVi89V9fKfYLPXBUWW6HBDPEnzGe4TRPYMKDMktgV/xxCMc6i?=
 =?us-ascii?Q?Khh4qbrxiHAyZDpC+TTHR9mKfqJyMC9UG+7FETfI1HWgTJpHvhqwAZny9h4Z?=
 =?us-ascii?Q?jUzSqjBbW/MmDM9bE7TiGMxFPBli19Vpz8YPn9EyYWlF0Auxxurj2/Flirai?=
 =?us-ascii?Q?0oLLRhTcIRT5qpOQan/NBemJrpWsgBDcO1WrsL1BCmtHHKjp/WLcAtfZz7do?=
 =?us-ascii?Q?tZJcjTRhZi9AFmWm0DaSIRrUDn4WaqIhwFT/NBDKoTJuKjE/8/qYfBRfRn4S?=
 =?us-ascii?Q?bjfglbzkmzLJaIeQaF58ZWp4/tHFwO18QiPJdwBZlyujE1RIavPu2zzFJcCN?=
 =?us-ascii?Q?jmGVQoobR3DKMtC+Jy//mxWS7+5H1RxXiYCQsQf8/9lpDXcJRqr00WSF6pIV?=
 =?us-ascii?Q?nlMjLRbp2rGsKaCe2N4FMZIUNGoDppEpBMEBJTQDR9OeEZVjPtX/9xR7RWzH?=
 =?us-ascii?Q?gePoi5H13G3AnWfJGZ/cONWvArJfw3R6vP0yqXff1i54d/wUqLziDcyON7Tm?=
 =?us-ascii?Q?4Znan2HORZfdPXvRq+eLqygeFiG519tQBgTspZ/hbgSmUoETo/YxK8S0dNBM?=
 =?us-ascii?Q?C78mIujzUX5aNMqiEjd+uzlZAriRwqNVWBw40yx2ChfqLiPi5xn4wwyTLfk2?=
 =?us-ascii?Q?Aza6ja8hP0jjzgCGJ8IE5cVixFS9YerDcbjoauKFEjUEMyLsvhKuM7Rqjx0E?=
 =?us-ascii?Q?NiLUeJV2j99xwgvUmZ6rWBi75vR5DdJnHmCt5n6pYSLzCsS2Ez1rGlMcckHw?=
 =?us-ascii?Q?zftiFeqmU9PB0RouP5RVHtbFHz5oyDaPRAoyv3yVWHCqSaaxw/f6fELzsz7q?=
 =?us-ascii?Q?vQVluhw1f+X7/QRg6pY61f50WyeVrf3UkxvirohQFnS3/gns7hxLT3ccC2BJ?=
 =?us-ascii?Q?M2UXqjoJ6nIkaHFwzP7cdMHu6cjK1kyH3wShYkw6TpvFZtt5+NV+GEXQvMp4?=
 =?us-ascii?Q?CLkC2af3DWGWcaJ4ZzPv6QSA0BmaSgEVIsiOXKaZIK1o0QcZWlHhWEkcufGI?=
 =?us-ascii?Q?U1LYGQY462LQxiMpEWnYwtFmjoi7RbymtjEeA3uCt8DSLlGYocTpkYLzyLR3?=
 =?us-ascii?Q?K+n/9lxsYnO7Nnn5ZlxYinvhd2i41nApvdLcJNOA9aeXrmQUQ2THqZMaJ6+N?=
 =?us-ascii?Q?VV93CcFRrVkjHiAc8sDPkElqRm+eWidho0CPH2bqYdy2+zzwpciblfL7mN4k?=
 =?us-ascii?Q?rs2DzTeTB57CVJLZnvx93DLHQyMNWGdPe1327wiry7OfkDPb1I15MPYqYChy?=
 =?us-ascii?Q?Dfe7jBadi+VS42Fluo7TImHWq2XGp3N0hui52xVWzor6js65OyrUQaDBS0oc?=
 =?us-ascii?Q?5Clkgq/VYjG94RliQsKoc3ACLmaJqeBszsXSqbCEKsZKYLFSvU2aspey5jGc?=
 =?us-ascii?Q?OuQlwglWYHMpVN8wzKADwfS9J1d6dIA2ZklI0ML77/3eIAzDQhShrjyzrP3v?=
 =?us-ascii?Q?fIdetlY7g4W3Q+3oTOhvCG/Rvb11zt2OrvIvZuafP26XwMvr0nu20gD5tFYi?=
 =?us-ascii?Q?Mj/h7p0GZ+tuWDBC+xHM4ywTNEZKtbggDH0dImAn9+Lv4KtoEUuxd+KgSfyz?=
 =?us-ascii?Q?+3Gmjd6Yi83MNAtFpqTDVnQo1kLm9axPiqrz4YsCogYj1epN0JXQ3QRCQhFu?=
 =?us-ascii?Q?9yrjzmufwA5Ji8TVaxoIfJq1o8t6U1aeqmSVyEMGhWC52sdJctzbkLQuPi/2?=
 =?us-ascii?Q?A4DZNQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d9c82d-e727-4a0f-f38c-08d9c57226e1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:32.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgUtMhvJRsRBKoZh94vOZxEdrjABAiPnu9t7EBjjWjs//gJVA5rP6pd4PnqoW8asgrcqsd9tqPYmNC5tAloq1+4lAxLcZGRVAYyVSfSPIWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

v3: Rebase on master, small qapi docs improvements suggested by Markus

There several improvements to fleecing scheme:

1. support bitmap in copy-before-write filter

2. introduce fleecing block driver, which opens the door for a lot of
   image fleecing improvements.
   See "block: introduce fleecing block driver" commit message for
   details.

3. support "push backup with fleecing" scheme, when backup job is a
   client of common fleecing scheme. That helps when writes to final
   backup target are slow and we don't want guest writes hang waiting
   for copy-before-write operations to final target.

Vladimir Sementsov-Ogievskiy (19):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block: introduce FleecingState class
  block: introduce fleecing block driver
  block/copy-before-write: support fleecing block driver
  block/block-copy: add write-unchanged mode
  block/copy-before-write: use write-unchanged in fleecing mode
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  block: blk_root(): return non-const pointer
  qapi: backup: add immutable-source parameter
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  58 ++++-
 block/fleecing.h                            | 151 +++++++++++
 include/block/block-copy.h                  |   4 +-
 include/block/block_int.h                   |   1 +
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  11 +
 include/sysemu/block-backend.h              |   2 +-
 block/backup.c                              |  61 ++++-
 block/block-backend.c                       |   2 +-
 block/block-copy.c                          | 157 +++++-------
 block/copy-before-write.c                   |  70 +++++-
 block/dirty-bitmap.c                        |  15 +-
 block/fleecing-drv.c                        | 261 ++++++++++++++++++++
 block/fleecing.c                            | 182 ++++++++++++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/replication.c                         |   2 +-
 block/reqlist.c                             |  84 +++++++
 blockdev.c                                  |   1 +
 util/hbitmap.c                              |  36 +++
 MAINTAINERS                                 |   7 +-
 block/meson.build                           |   3 +
 tests/qemu-iotests/iotests.py               |   4 +
 tests/qemu-iotests/tests/image-fleecing     | 178 ++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 223 ++++++++++++++++-
 25 files changed, 1441 insertions(+), 156 deletions(-)
 create mode 100644 block/fleecing.h
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/fleecing-drv.c
 create mode 100644 block/fleecing.c
 create mode 100644 block/reqlist.c

-- 
2.31.1


