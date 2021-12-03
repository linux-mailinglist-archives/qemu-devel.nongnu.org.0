Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298B467ECC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:29:35 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFBW-0004Vc-8i
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8j-0000mQ-KZ; Fri, 03 Dec 2021 15:26:42 -0500
Received: from mail-eopbgr150132.outbound.protection.outlook.com
 ([40.107.15.132]:11453 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8O-0001bp-P9; Fri, 03 Dec 2021 15:26:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRl6zHo6f2fYB9hOGbJ0lUKI+fV+TF5IM0/PRIbFZCk5aqFQ3A4OxtganGfldYecBqGhesSIRfrwjyCcMFg/Olo9eT7CzMVNkCHYkvzCCwhdWjGFEKeomiiwuF8YIUOX59hDi9qJg4PPRG4H4RO34Z1cFctStnj2CdMW0kTz9Or4S2DKx9bfJ23s94wg6dnP9M+WLIvhseCAug+2yfxrxiQxTWl3DL4gS0TlECOh4eF7ZKkJLruOl6wcICGMRz10EaOTnG3X4rAvqjFkChj//0iswL2oLQYCs4FJRQxR7oPgYKPwi9l/BUB/+Gor1VwlsrpRr/5ILZ/NF5gjRrkERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQnnl/ZFMV08fqAs42A10HzSu0oy/3Q1iRC78Kkl05I=;
 b=MJkbhQ/Y6rhMenfJ0gZfy0RkEupo1cKmqO2fdH5y5uDBfPqTgXoXFLJkzrYDQ4TFM3LqqRLvaCXw+pR4dKaDeyUeNdUaMFwkinUZAjiXW/wHyRHe/dXNaANOdPR52+9dhtm0C+747vTvUAh136kQIkagGGugZswI3NIh+AkZmCuuHlrOucugTdPVbZtjCIpTNqxMLQqxeBTzFkvE6w3qquzGWhgKSmzYN4Uz6N3boL+Hvynp6dhErSWg5tb7QDTMEIJa9qUDgoLmiaqXsUpD4HEcAzZoNGfNABRHl7dAxFTVnVOFDLBfalVXSSe0/XCbRvobFbfrZkVhCgF2z/ot1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQnnl/ZFMV08fqAs42A10HzSu0oy/3Q1iRC78Kkl05I=;
 b=hVzNxbdEbdnmTIFs2pNzICox2mBjP3duUNg1lymt1gEdJAzNfVf52NZx8iu6u946+oHJG6ZaT32S3jrcBcFB74+GhcE2yJhr/8al0eMi1DvUPCe+JiBhR5SPLFdHh9SisXaVZRvRFBxp5bW/QYGP3XhJX1BOWk3ysWOzsc9JUC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 00/14] block: cleanup backing and file handling
Date: Fri,  3 Dec 2021 21:25:39 +0100
Message-Id: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7303359-7d76-49eb-73ba-08d9b69b2817
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3841AF6D22C27814ED24562AC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ddwh4CHe35PGWLTUU1kVufaTgAGIUe3rEDzPYcY6w0HLgGCu4IObdceEIZk56O37cXKgpcHVvfubVQ8Lp81ogs4yn3b3XlvUpN2kgJOZzu8PB7jq5eqlbjcc1Yki7WJT9Jum8/Kt3IkxiKrPIe1x1cjh4toyDOzxbKrhToNZsMpRTZSDtSJd3u5VD0VWiJ3/BJm7B9xbCc80GZN33m8oT/we/MWLLPD6LkIhB/v/iy42r7u6GMU3HINioI4AKZYv3yUHHZI6n8oF2NT/7AbX1tmJkkrC3cQ7UTV8klCsxRtXg8JSSB5+Xqs9nLEMlbUbnc7Bm2CRPXohfGK7DOzJecOamrATGslQM47s7+b8Q300yNbpU1bDGtxgWhQ6OxNIWby2iwcISufsp9TkexoE0rcXO3V+UKga5ov66C8yYA4uPkVyU4yLIc3LEZxAtEIuMKnPTfEJvkud8xwhNdB+ak/akWUMiaVOh4lDUtJx23Vn0YnuUwwOmZe5F4P1XGyC+lmeKSTZmEbKKwPewWjEVB5w/ZUyGQRHcDD1sJL2cJdmyf4VxyYLlxEPKqdaQTnjdz8UkLdfNHV8hEntKEIFpE07kbGOrEpkbMUPuPn/bP9aWh2b43O+iY86RFcunakFlqOKzN/Rmgns5PGXkss0WxPXwmKtxZE8UchXgmZ1ydPXEOUu7xwF+RJ3nHTuidvXsbCy5S+suFwBM45H5Qu2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(107886003)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(45080400002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMExFZ9TPC4BgghB9PDhqiPXVvG/RtmqfeHHASmL5s88bKwZp3iA3KUgUEAZ?=
 =?us-ascii?Q?1L9eQ7pq04AnuvX3rnZcx8N1lbrsn6YDLt/MgGOKCnlBHe5243UW8aj8mqIe?=
 =?us-ascii?Q?9zulIDfH6Kb0RrHn/gh1oDx5k+CnUU31QkcMfawwtGaL22G9II7/+SRXu8bc?=
 =?us-ascii?Q?vl/Rx0odidiZ33ABgMa/ZCyE2jqOVqsCelXjx7QQUl69f0LrY5vmJPnmKeft?=
 =?us-ascii?Q?T+o5sS4A/XxleblzLhWa3R2YF/KWkSdtDTbSYbVr7WfZDesL7G/eaflb+Pks?=
 =?us-ascii?Q?z/uqGvBCaG8IVYUBilek7eGhHr7HNfTyAdsE9EvHTwX5g3bu41vLmbPFLKb4?=
 =?us-ascii?Q?U48nS7XrktfpPBDrT0AH2oUySNBRWk5kZBhK74pnuYSFBlUw+qMs7p8MinxT?=
 =?us-ascii?Q?vn1K5TYKnFZlQaFy5yAMslGYZW58GapuHHO1OHLbMRaJQh1+0SW5ftX3IZRa?=
 =?us-ascii?Q?OeS8rhrtzMGw/mMJGvcmOCSv1SPKZdU3LIySpoLvTo7HWd4wZxNUS1DYhzCj?=
 =?us-ascii?Q?0fKqP4D+0RrzVBKmSNtKF8KcDmXmbBQexiSGZVwBF35oYel7o53/lcGgVSWk?=
 =?us-ascii?Q?7RQj6/CLSoiaaJDf32GE47WxMJix7HIFd2h9ogGPcRooGhd1JzZPO66x0RX6?=
 =?us-ascii?Q?ak/CCHqoFhx2awVGYhc6Id5B98fjJXslFWDc87uSGpIyaYjsbe1IFTVj2bl6?=
 =?us-ascii?Q?TH+LFTC3gqPxDryI2olYMljBdW8dJ+oGBJIEKerK7keDgl4Wa1u3ro6HU4qY?=
 =?us-ascii?Q?CO9B+l8hjB0zx7/Np6ICDs0SvtJai6caKTUmyqoqR1X0AnHQI2pjaaVA5lJE?=
 =?us-ascii?Q?F7/DRTQ5Xm3Xq3L0hMVMij0LxsloD2zzfxTx/xFfv1sv5utnb4eMVeKAG5Qr?=
 =?us-ascii?Q?oUqOaB9b/SwgVaGjSkZNa2E9B9JcIfyxGgad++7s0ITUkQGVq7ijK/0RAj0B?=
 =?us-ascii?Q?hhN6edzPhBzSLcwQ06baNOmyXRE+KXByhyOw9pjsfLll9923K5ebj7gUlObt?=
 =?us-ascii?Q?fvPOsIssTnFZT7PnmODsNPzUBKBtVsmniHsdl4tVZx/qQIKHcKpEFuOb8exV?=
 =?us-ascii?Q?4qP1LfnREsZGEIMO+H9b0iX4plODVCaQ0AiRW9oH8WLHFSZ+YYnabC75FXRu?=
 =?us-ascii?Q?ley6imRJkJ0x7FlK7ZxCAh3dDGBSo9yA5aWljhe37DY/dKt3xfpqX79+EVlr?=
 =?us-ascii?Q?eKABYds5pGjO/qhiMAfGLrhCJUcE1sg4FHI/jJ16iQkJZh8/q5rTJUUY1Ijf?=
 =?us-ascii?Q?J5HC4rggO56ea5euKahsVzBD+ZrsxXp++BzfevTmxMqB4xl3nmZZxD8WSIm2?=
 =?us-ascii?Q?IyxsUaIbs/u+IAdAafRpMd/3Gxkgyd+T/VI7Dunr0WuXB6N46h1Ac6ZZKRcZ?=
 =?us-ascii?Q?K5h1l7bUL/XeSJOHYETOXrb5BOlWXvlqHjuaHPvne7IneqzPuHVuwCkYUGNX?=
 =?us-ascii?Q?BJtNfCm5ios0JD1pOU93akabRMDKv4MHIXtN8PvPePe7P6koGEqRPdqzpfL8?=
 =?us-ascii?Q?6cwXvmdvYJsfunXtc8hsz0DNA06NiCYfYyzjEc2p0lc6QhMbkbbo7VeIriXM?=
 =?us-ascii?Q?n6K1bBOlQyhM1zLRWNuUkmOWdxo6dnkyOwPiO6izV1jmJaJ06v0v9FirPBjx?=
 =?us-ascii?Q?11xLMo+x0EpqoXFXG7U39V8ZBaen0qclFuWYf+9VNpG9esbAU1Gd3Y4bOt2f?=
 =?us-ascii?Q?6lIEGOnPwIvk4tkcbPNf7qSzO7A=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7303359-7d76-49eb-73ba-08d9b69b2817
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:16.0269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUoXsxEgvMr3PXYZJUbbYQWGwQJFmBFWf+Iog7DpIZcoBkQqDqaP/VVumqEcaAlDLqVfvCoLHH5363cPdCUgO60HMQmV6o6wvg2YMDkbW0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

I started this as a follow-up to
"block: Attempt on fixing 030-reported errors" by Hanna.

In Hanna's series I really like how bs->children handling moved to
.attach/.detach handlers.

.file and .backing are kind of "shortcuts" or "links" to some elementes
of this list, they duplicate the information. So they should be updated
in the same place to be in sync.

On the way to this target, I do also the following cleanups:

 - establish, which restrictions we have on how much children of
 different roles should node has, and which of the should be linked in
 .file / .backing. Add documentation and assertions.

 - drop all the complicated logic around passing pointer to bs->backing
 / bs->file  (BdrvChild **c), so that the field be automatically
 updated. Now they are natively automatically updated in
 .attach/.detach, so the rest of the code becomes simpler.

 - now .file / .backing are updated ONLY in .attach / .detach, no other
 code modify these fields

Vladimir Sementsov-Ogievskiy (14):
  block: BlockDriver: add .filtered_child_is_backing field
  block: introduce bdrv_open_file_child() helper
  block/blklogwrites: don't care to remove bs->file child on failure
  test-bdrv-graph-mod: update test_parallel_perm_update test case
  tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
  test-bdrv-graph-mod: fix filters to be filters
  block: document connection between child roles and
    bs->backing/bs->file
  block/snapshot: stress that we fallback to primary child
  Revert "block: Let replace_child_noperm free children"
  Revert "block: Let replace_child_tran keep indirect pointer"
  Revert "block: Restructure remove_file_or_backing_child()"
  Revert "block: Pass BdrvChild ** to replace_child_noperm"
  block: Manipulate bs->file / bs->backing pointers in .attach/.detach
  block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr

 include/block/block.h            |  45 +++++
 include/block/block_int.h        |  30 ++-
 block.c                          | 335 ++++++++++---------------------
 block/blkdebug.c                 |   9 +-
 block/blklogwrites.c             |  11 +-
 block/blkreplay.c                |   7 +-
 block/blkverify.c                |   9 +-
 block/bochs.c                    |   7 +-
 block/cloop.c                    |   7 +-
 block/commit.c                   |   1 +
 block/copy-before-write.c        |   9 +-
 block/copy-on-read.c             |   9 +-
 block/crypto.c                   |  11 +-
 block/dmg.c                      |   7 +-
 block/filter-compress.c          |   6 +-
 block/mirror.c                   |   1 +
 block/parallels.c                |   7 +-
 block/preallocate.c              |   9 +-
 block/qcow.c                     |   6 +-
 block/qcow2.c                    |   8 +-
 block/qed.c                      |   8 +-
 block/raw-format.c               |   4 +-
 block/replication.c              |   8 +-
 block/snapshot.c                 |  60 ++----
 block/throttle.c                 |   8 +-
 block/vdi.c                      |   7 +-
 block/vhdx.c                     |   7 +-
 block/vmdk.c                     |   7 +-
 block/vpc.c                      |   7 +-
 tests/unit/test-bdrv-drain.c     |  11 +-
 tests/unit/test-bdrv-graph-mod.c |  94 ++++++---
 31 files changed, 343 insertions(+), 412 deletions(-)

-- 
2.31.1


