Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8B375578
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:17:29 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeoi-0005Oj-24
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leele-0003Hs-Eo; Thu, 06 May 2021 10:14:18 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:13665 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelb-0004Fk-14; Thu, 06 May 2021 10:14:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQjSZPTMD+90Rpg1EYqrzMBa/TkqvPXJ+55VVODJ5Gh5Enun6xi0oqS98TPW9wQfyze0tx6wITOXhLOR73au9y7wFOuAYOAub1ZjGaPE2YVGUKOUa9RzpxLjeQXvoQMmNPnxFPpAyyt/YDp1kBSiiE1+7RTDEd37iAYOTTwsY/9kFjtmEkLo+LunqhC4YvhPkOzwHZpb06n77sEEI7vpSCxNqwIku0IndaTCPrpHnTiTgGu3d67fVx/ZRfJnMuritqCBL3wH0qIflwZmFqnQiZXKHJoIb8viFgu3SQllBDL1b/Y9Tks97FJVwzDf+Xj/As+mOM3eIFJpqiY7XUVirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4kla+InQj06egkll8o+xofh/ivUN06ex9xeooCquGw=;
 b=VFFjO6YWENnX0AgPoAP3HsSHlBy8g5prLxUZWzKGt+0ctQWAvfP1njv9p1l+C4PxmupGIzGPMWSJjWDnJp9btGk8HNH/BYOITFQauQlQ+oNL38/N444FYofyR3U3JdqteDfndHOXA62kGR6nrR+mmJXoCgR3lZvy25Kg34/gmbtLlh7ml6nztoLk0m4UqbSG7rl2HbkHzL91EU6F/wROTZyIRkuXspREtU73wFiVREvNyRwHgrMmKLox+hBBye0JFIFgW8rX0puQYokdkPL5AgHLE2M4FiA2pdcNP02+vmt+yaF5PFC6mqIM5JIsTPRqduii4UKUHcRUIn+P/S5wyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4kla+InQj06egkll8o+xofh/ivUN06ex9xeooCquGw=;
 b=U5fyegDcvgkYZJN9pBabnp1oREcMauZFQ4ZwTohMUK1tSc3xCgUt3oXLXfMYA3q/qeuTIEFTDU1wrg4Vi1YHuxE+MauN/gGfPNDg/uZfNObUP9w42FhmZRBSPryhZtaK/WLZ3DURZuHNEiImga/0QAoqvSSgvoUzpYuesyJZp/Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5205.eurprd08.prod.outlook.com (2603:10a6:20b:ee::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 14:14:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 0/5] block-job: drop BlockJob.blk
Date: Thu,  6 May 2021 17:13:52 +0300
Message-Id: <20210506141357.314257-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0501CA0037.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0501CA0037.eurprd05.prod.outlook.com (2603:10a6:3:1a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59d10dd9-e005-46ff-d7c1-08d91099381a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5205C878BCDF5E87D05335B5C1589@AM6PR08MB5205.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag8lwy2BtQ50fUYKzjyr8k9A/TpFt3o5NM1m/kozNgi1qWMUuzndvM8J48u8d7XO27Deyp5+TKns09d9oeUQDwlXkXoM1wl8LnhyzGvoiuec5rcQQAlpqpa87k4XuFc3BmbOgKsrhxFv9+sY0U4TAY6aXXIN6krcf1tPGb8g5XPJbWBkAgKjnaUZTlIjAJxSSRdWrqGJdlXp/JB5EAoz1loqhlajF7t55HHa7TLjGiIwyVkaWQz/dBOdTOyI+4rYJS24cOpBBFN0CXsOvjjlqEoyVfccW6piT9VA9fdtf8ErfDptKC0ipq4VA8sTinV0O2K8zJ/D+A+u86A1ieAPxno02FnEmvyvwFwLWAd/RuM2ORnuZWU/06gIfOslFYHBoNc8om8Yg2Z/Hi3oExKrmWFYKlJ32PAdgA8goVny6RmXhLHNVZBcP9tK0WlSfoM8nCt8cp9Gf0VMAgGBR+fuAdL/p0YpLm+q5XEdpSy7/akeRkkqDh0U9vfGXjN7guqwKLtO1N0qjF8hlEUk2Pb/5H2u8EL3WnmeWfMt7ppVD/3Xju6QDIdaCGdQycv1u/x1InFxDTDW/tRtfu75170dBfn1576W1uUjTAUT5myUB1+0qvRyiA2ySbvYniWaebnNJa5+LlbtpCLUd5HUK1HsEILN0MOe+S478VW89014/YVEjtP99UYc4mJcdz5DIoHj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(66476007)(6666004)(38350700002)(1076003)(16526019)(6512007)(66946007)(478600001)(38100700002)(2616005)(6916009)(956004)(36756003)(2906002)(186003)(4326008)(316002)(86362001)(83380400001)(8676002)(6506007)(5660300002)(8936002)(66556008)(26005)(52116002)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t0WaGSTl9dI4+DBSeSi/FC9xeRL0a7Pi0PhO3FUhGqHu4dpgjwZvpFKTVojN?=
 =?us-ascii?Q?NxPdp64GHBiej8aGUH711qvoErM0WW4yI74IwydeIUWowrZ/hH6mv16wyMQk?=
 =?us-ascii?Q?qQWhwpLIsd3vq2ND6Ql7qyO6kwFAJibS6mRYYZF+zmN8vnl9kTTmGeOIJOYb?=
 =?us-ascii?Q?XSQ7lo80QJonQ+Ee0POU+Xrl8kI/U5x6qSG2LM2Pil8s0EUMRd1jwFi9vLQ/?=
 =?us-ascii?Q?59wPbEwXDf+fK8PLM+EzuSmmCdp3NEVSVsYAkyCHm3Nynljmh5t4VL9JzHnD?=
 =?us-ascii?Q?Un5bfOr7gaqQCJSz7C7Uv3sHJ//EJVMRjqKS4lYX4aNOIrEagWEC6jend3ry?=
 =?us-ascii?Q?9A57Dh0JYwxIylvFqVXs+ESy30S3nJNYI2i66P7rlD9dB0+y6ajaVe5FYfR4?=
 =?us-ascii?Q?fsf4NPOve6DWRf3BwOvsR4ALDiu5L2JektyDZz0FrZKMnymR/OIupevU4Xaf?=
 =?us-ascii?Q?7cnWFV/Z2wMw1W+BhMK2Msf332Ji2/ZVGgRgY2BVbFAQYH8hDuq4WZxtM9uD?=
 =?us-ascii?Q?V2e9PLHFHC2Qu7bDWqlH/R83v+BEkYewPzR+0qftmytP01q9o7ngRexWF2Ov?=
 =?us-ascii?Q?Y6ZWL+85RCU3KdP1usST+KUP8ae/eb2begqWyKuiBr46yPzsl4y2u2yxNN8G?=
 =?us-ascii?Q?cEOxhBRWuAgLepbU+pf2/GEaHJqs8PrvH/h6uKxiShmCUFs4vLWmi7tlTnoP?=
 =?us-ascii?Q?nvScJrMLdTQgmpMNeEHnr0DQQnZ/+TPj1QqUMAO37A06wc7A8TnzOczF0n2h?=
 =?us-ascii?Q?idTJhdYWHdRsSuPvIq8aO2xwqu3n6pMxhrMw2B4qZHwfV182HgtUqTMfOAtG?=
 =?us-ascii?Q?c2T5MxPrmbE98s2G93B7JJH+hTvtp5Enp7hWG1HK1p8dH8Bh0xZoLpZbB73t?=
 =?us-ascii?Q?PvZtyytiaAQjExOgMhsOZpUscJk5Ma/g5nKGjb4sNqEJPPYAtM/yWcczgZAe?=
 =?us-ascii?Q?ST6cSuLYlPVtSNZyp+BzuVFVgcMsMlA2PoWojKkyTUrdxGZbXeHsjxui8qnl?=
 =?us-ascii?Q?rf8xo2kE01n4cpk+ULOzk6FiH/jhSv+jFy6z5RcExinZwfQJOqTLLkh/IWfH?=
 =?us-ascii?Q?Fw4DXVle99XRpXCFxHgnDZUhyP51aSAIyyGUM/TCfUMaLIzRL1pP+xJSKFHU?=
 =?us-ascii?Q?pJaVniZ1BXkXmk4t0Q/HzfIj69xvtjgBl/hZXAasHT+D5zO7mtO/9MFXnFs5?=
 =?us-ascii?Q?KsuOh45HZsJ2Gd5W6plHCAmVEBbmY8gRhoLgJFOmLZEP6x+6hJxynnKlD/C5?=
 =?us-ascii?Q?1hTUE8b/laF5iOwLyPk7JJvhK32AKeLpkX3HRCusX2++1HW59q5BkHfeMjnZ?=
 =?us-ascii?Q?l/Tqem/jWHShHhjXuld9phDe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d10dd9-e005-46ff-d7c1-08d91099381a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:10.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IWY0O4yJ0jyw29V0SQlRrw27arbC3O9zcpT/mtJRTOLOH4nb0SELy1IaZahwMMc+VhecIoba6PGbG/Qy5xEyn08p4hR6BRhP3Uc1DXqBQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5205
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Hi all!

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
 block/stream.c                 | 24 ++++++++++++++++++------
 blockdev.c                     |  6 +++---
 blockjob.c                     | 24 +++++++-----------------
 qemu-img.c                     |  2 +-
 tests/unit/test-bdrv-drain.c   | 12 ++++++++----
 tests/unit/test-blockjob-txn.c | 10 +---------
 tests/qemu-iotests/141.out     |  2 +-
 9 files changed, 46 insertions(+), 51 deletions(-)

-- 
2.29.2


