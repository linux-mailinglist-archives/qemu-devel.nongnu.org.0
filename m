Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621B3A2B17
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:07:41 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJTH-0004rb-Gh
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRi-000262-6i; Thu, 10 Jun 2021 08:06:02 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRf-0004D6-Bv; Thu, 10 Jun 2021 08:06:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXVrkkiB1+6C+Mdj3GsB1G7uuVYJMcUxIhhRsG6IjrTAt5i9Q374fGsYUvtUt0FwNhv4cDeVvveNH3PfSI5AC2qTGXjlBMvRMlgzf0sruazjIa4R6rHbg7cr1M68MLOHZPCMB2vaJEJz/dPcJPrjoOMJR0709pdVW2u3r/I2azxU79x7NHPQ6xWpVtLZjyCd2j7BOy5mvuX3K8CUETWkXkPfKsStofTqJ+UtnDqThrmtym2wp4/Z/P+XMb8QDkHN8DxVhD7uvem9HQ9VoMhgDnrkq9J7dTdxuc4h3JpX/wvMM4FKnuZOVbyos/he2uE76DoBBXNbx+UvrTC2HiSr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8CPCqRMOe12wqo1m/8SQgKUJVr6mmJDhqO9DA3ame0=;
 b=hzcSh+pd9VRq3sEHY5KhhoE+NdQD2IavH/TExW30psFQMsRRq7BRIkCbmnC59/GcTKd3po9vHIJn0auejHeQ/2UUjhMmbnWIUFVSIANo0CtZSxgEqJh3uK/4mfZ8rrPZLQNWud5VPmilD9ct+51UbyiPEl0RxI+I6DPZfS0nQ0XptrglLsJU/1ZUCM0+kJ4ERvFf2ZWnOjagA+u5ATulZwhFDaGk+vCQFO/cSgvLTZn8eTWqblKjp7sQaWs8k14mlVQjh8ogfPC+n12pUBTTDyuOXkntc3xckXHvf2r0d9lVwp0p8ryXWjaNG3zkvfmatWf7mKHZmrbbqoPK0Yej+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8CPCqRMOe12wqo1m/8SQgKUJVr6mmJDhqO9DA3ame0=;
 b=PvUjigo0cn57ubA9f4FU1elzLMZyIFMKggya+aJY7LixskBJKDoD0dTOuNCRXk807keiGWoss4zJCRJyO/VJOJZxJIU6bTiEFUBh4BvQ1tRJDOfcdutga4DiotYRiM1ThM+uNYrjbTTChr/ZoOdzubHYtAqakqQw50lywHGq2S8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 0/9] Allow changing bs->file on reopen
Date: Thu, 10 Jun 2021 15:05:28 +0300
Message-Id: <20210610120537.196183-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e08430d-fed9-430b-8e89-08d92c081837
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277AE2947E53C3EA67251B1C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXKRoB4X+poeFLxxKir2jDVyq8wPatuEXm8c+nS70fQXbNBqJgIwH4Ka3TkyDkcOVjn7qiWIf+Yr+KF/pWwL/xwVjLF0D06Tx5/RnOmpezvAZ9WV4Ldn1deAgZ5t8ked0nEcYJnzi7Eh7eOs6qGv6Wb6U/gDEeki+ER//ahEzp2iL/HAD4/L+egGLkC8uoxW1Gz/Kip495ULXqIf6g4aM8mr3dZdiRH3IDbVyo/2Wc5AY2jJt9inDUDspczBxlN3hpkEM96D8RTKMs1MY77GWi/6TtmO2HLKgKEnuExRXt8B6DeVW0G94PkGuPughUY2L8agjR2OmpvMiUz1TnoxzzKjRLoTMtGtrP7W5w3rS/OEuRTn58zEC+QiTlDUpHpPRMx2neogruIEQHXs2Rey9Fv2guIwmfsUIBxnovFgcvdwPVUDoqCHrSnEqE1b9CNJI02l7ZEP1OE/PQpd9/ztaGe8c0m7PjQio8uL1GSNPUbHU5Rf+drtCz+COc/8TdTFsNEOna5sKRGOqraBUULp14RgZiRANCwud2zFbp19EXx8EeldwywJVO7+zsNw9ozSWmTxHzNzO0rMh9x5Lo2Yr8rlmeS0xQF8UU4Dgv4/01zYqLOQ+tIA/T6YT4e5bF3hNJXY9BC8P+kvUbsN9Ek1SAhZPu8j8WYrVa8uztx8QBMPaTXiyatrtKu8s3saBs2D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8UGrcwRnGwfcDOBngLY7sV7nhM5Za4eTP6PyEMHOOuibMxj6mpMNCnkJwrMI?=
 =?us-ascii?Q?7F84M5f9CdoLXEpG1xNJ5Ger7Sz30fw0d5xiB/LmACHu2aJKpVDYLdsGUOwr?=
 =?us-ascii?Q?tFDUcbyUHMb3j0VvYwLvSdpg7KAzNP84d6erACiWt2UNe8dSaofi8PmxcBDK?=
 =?us-ascii?Q?ys+ktnvM3Lrkf+zXwWY0Scm1ToY2/7kv9JykXFccYvNrr4RyWjS/eOWnL8o9?=
 =?us-ascii?Q?DmbnQ9sIENsEOljJkL+5wmLpRRYwh8w3lfQ7mW7Z96L364bgoLfu56f59nTY?=
 =?us-ascii?Q?h1/8szfzEwabhbdkczNlMsjK9Ofp9o+FsklhnwPwfDQsYSMYtx8Ryz1JzWA1?=
 =?us-ascii?Q?SklAkHYKRnhf3k4z9Y4/UfeHE+DDX7GEmGDgWTZEmwQFQAOxk6z0UVrCQfBr?=
 =?us-ascii?Q?AWHBSme0gcKqt3Yj3x7umQIuYKHZVX+gU1WmH+9ImezeOX9RHDuaSid95pN5?=
 =?us-ascii?Q?evxjOOZYSZlUS3ucvu5UFR/7KateKDxXlhPah4OL/KVkkUKwiQ5EhP7RjJwF?=
 =?us-ascii?Q?kH5zc5kX7zGth9YOqd9HulKFJCojkC3wuimEayMaI95X9ZH7g8/B1xsXR686?=
 =?us-ascii?Q?/ZMp2eKDBmTRKatmjYkVaN9SuXpBL/AgowwmhvZeiEB84vyR35h7dfYU6tjI?=
 =?us-ascii?Q?nqAJS5WREcPnUUyy5jQqxPVneepI4k/iQzHWw76A82IMzJSzxS2M5joX0L8O?=
 =?us-ascii?Q?vmECLco1rsWp9HNqV5rhW/cyTrbQ8cM+O4O1gZqBmeAiIC7LR9c2Q3w+3Ejx?=
 =?us-ascii?Q?4ciw03tNWeuQJ9BQIK5OZLt/I7L/aACwqLFI9D/0dCsE+xxb/PNtPTlqsKoN?=
 =?us-ascii?Q?9Z1hOzrMaZ7lCyOwwBWujzUgXnpYDhu0N942JDTYdlJ908dINTbw2ygbAOcD?=
 =?us-ascii?Q?aFM+QXb8lSwdDqV3dPCrEjqB5U6IfwJvLOA4WHYxDv/ik/q2WmZ5S9KMH7nV?=
 =?us-ascii?Q?yogiZDXktc23ezjpFw5MRK9Scb/1v1F2tUyC41i8iGzommaelHbe6xzfXv6Z?=
 =?us-ascii?Q?cA7ZHc8SW1CXYwmUtVnMR32c7aMBCKIFnk9Hy8aDUVjj5fBZ2dQxSWTP+rgc?=
 =?us-ascii?Q?ed8xMs3d14dQORDnYRkIJev3zSoYgTNGOx0hiAX9V6aXtKnwD0YNFb0mh73/?=
 =?us-ascii?Q?OykMYDhKYUcCbcVeyVeHIdzvEaV4Oku006572KNAaFeHsypwr+ltUMz16Y1u?=
 =?us-ascii?Q?ULI999RIKOqv0O18UeSKW0nYZBclW+38Z0ep/hLeRcdwBM7VaOns4sEewCo3?=
 =?us-ascii?Q?krBQUjSWtamnV5eFwBeTXe+VDdetgcSL/I12iSbA4RtBmJEnkuK5G6GJVv2D?=
 =?us-ascii?Q?JEkIRrMzJZf3mj3+fLyJULBl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e08430d-fed9-430b-8e89-08d92c081837
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:52.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mHnZvc59Q7PtD8K4r0aK8WESzpDUNXz87cdxDrdRYchQYhfzlCkREpzt89dUZUXcSSmCU43HbPMhp6x9C77JZ5qo7WnzWop+jLXZXB7WmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Note that this is only "subject" part of original Alberto's
"[PATCH v4 0/6] Allow changing bs->file on reopen" which also included
multiple reopen and dropping x- prefix of reopen together with some
refactoring.

v6: rebased
08: changed error message in test
09: somehow, now '.' are spread in test output

Now, v6 based on two first simple patches of
  "[PATCH v5 00/35] block: publish backup-top filter"
Based-on: <20210610112618.127378-1-vsementsov@virtuozzo.com>

So, if this goes first, just take first two patches of
"[PATCH v5 00/35] block: publish backup-top filter" which are already
reviewed by Max.

v5:
1-7: new
8: changed a lot
9: unchanged

Alberto Garcia (2):
  block: Allow changing bs->file on reopen
  iotests: Test replacing files with x-blockdev-reopen

Vladimir Sementsov-Ogievskiy (7):
  block: introduce bdrv_remove_file_or_backing_child()
  block: introduce bdrv_set_file_or_backing_noperm()
  block: bdrv_reopen_parse_backing(): don't check aio context
  block: bdrv_reopen_parse_backing(): don't check frozen child
  block: bdrv_reopen_parse_backing(): simplify handling implicit filters
  block: move supports_backing check to
    bdrv_set_file_or_backing_noperm()
  block: BDRVReopenState: drop replace_backing_bs field

 include/block/block.h            |   2 +-
 block.c                          | 286 ++++++++++++++++---------------
 tests/unit/test-bdrv-drain.c     |   1 +
 tests/unit/test-bdrv-graph-mod.c |   1 +
 tests/qemu-iotests/245           | 140 +++++++++++++--
 tests/qemu-iotests/245.out       |  11 +-
 6 files changed, 287 insertions(+), 154 deletions(-)

-- 
2.29.2


