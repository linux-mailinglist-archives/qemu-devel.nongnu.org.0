Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF147D4D8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:07:57 +0100 (CET)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n049l-0008Qu-3t
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045G-0004ye-VR; Wed, 22 Dec 2021 11:03:19 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:2823 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045B-00043n-MM; Wed, 22 Dec 2021 11:03:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekuWPtVsGjK19E1BCGqz4PGKvo0o4P93JZHO7qXZUDuZzwh8hnWSSYlag38odlXQjJqi9OzMcfX7+RGfTce4z+MjN2U40naLzDcQUYweTMct82uJ9TbB938Yde2TImRSIVJET935Ay5H4D80qs33+GZgsKteVkSsE0v6pt/UNFio4zlJO+Mhg1lGCJDObT2aQBcmwYbdyqzhiH1KyqkK7Uqut6JDMHh0Je+w1gXpICtCGRA23R10VIVjG77taYRhirULQu/7ZzxoyjN+1miSfVHLEvu+DIRIbmxM00dgPO+6liDaPMvsfpjQve5ud4H26bCeBcfyRmQ6LAYHD92vHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm5H2DcPNbBfwWrzOBnUoIwBYaV4AXDadllbLshFpdE=;
 b=cqdoNt2en63sq91HT59MBq0HsnYwsQU86tsjKMzywuOhpvFFdkEC4kpJF5dFlyxTTE9AIwRzPH6qZsGMxbttaWAuUNxDZBB1Sf78uUlXUA4TVfZsz8r6Vodi7YqxYV41kwCU46AfEi1ewfFSK3qUtYGZszyzYz1CmfuBCCk0tOoq/tiZUOGNu2UfvVeL+Mo5gjsURSHC9cZc/49ktU/0RbVJE/ic/P2bC+ZlPshaTSAJ70+yqKMzl9Fb1vfQBQFO/O0p/M6gi1YK9wfyglZRlw6UdzTVaGPMZTCjYRqhFbcxg3i6Bw7PrTlxvnbvCzRLIQplkHTOUAhMzQ6V2Xrl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm5H2DcPNbBfwWrzOBnUoIwBYaV4AXDadllbLshFpdE=;
 b=toOCuOL2Iuw74VKn4SlPc2ObmO+FK9qVcs6mTGklzoSfwsag8SuhJM9OT9yOXdisKhM5+CdplkbryIUIy2o2GjfUg41mYjVSpp67leauQu0snCxICY7k4Xopd+SZL9RqETcucaqwT6PmM8FIxztk2pBvNdF6XmFGr18U6dGlL8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 16:03:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Wed, 22 Dec 2021
 16:03:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH RFC v2 0/4] blockdev-replace
Date: Wed, 22 Dec 2021 17:02:50 +0100
Message-Id: <20211222160254.226909-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 500d6826-6c95-4ebb-530c-08d9c5648c87
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148E18F8036BFF701B94421C17D9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1J8QujB51f+hCoEwiDVAIDxhCJ19HHOPcW96GymrMctOIKk5IGT0P1AcH1A2rqLG52Sfj4TwFHcg/8A++MGOV/s9Rj4N7A5pl2O99cSQaxddsFwwwJh4+huyiMyd66/k9BJynX5s7wkBiGtST5kvm2PpxA6oamGNE8iqxUq0F+MpQJKYpbcW7I9vOQixN3VWFcolcBWms3i9cumV77SyHsyf6+w7zkbvMW/jvljcMNApuf4FR4Eq5YN7K9lbr4ewBK+yzFzrqtJ/ZRMYe+v7EsDIH9pm18ezHGWT2uW6WdKq/94PNa5uTnB1l2Ys3Y2UAO0gvRJim5Bf5rRqrVUCLtTFrb7O8xTjPFeyvW6ju+Sz/QSX1Og6wqZ/aaoFfJoOaIl2nlVKDy5R2tuHyEMN0HEkDAomRy9PQevFaa4GfgDt1au9FJAT16y5STvB26G15mFpQbaHUk8/o0KFtiFKsoMNjfpMu7nkb+xw5gizDBof/uW5jBde8kAmx0sy2gxKZksGW6S+n0FwxD/6LBDYvbGCDIlTA1Jn1w6akQbHHbD7iXZWJj5N6NRMJubeWLUas89Jx+EncZd3GiErj85JR8WgBHX2v8rDb5NsagG/Y4ONQCQKx1m4eTuju+/Yjfr6ca0QtpaIiKJeLd0tL9bNf6srFp4Y8reZdvKoRzkx6CHXzdx3l0WYxo9/YM80YF3VnUqspdlqSDc9XwDDAb4FQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(6506007)(316002)(2906002)(6916009)(2616005)(1076003)(5660300002)(83380400001)(6666004)(86362001)(8936002)(6512007)(66476007)(36756003)(6486002)(186003)(26005)(4326008)(8676002)(66556008)(508600001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6IXKWY5rWKevIvxfIzQOTuls7tnUTJWkC7gGFMrVjphJvcoKBvGvCnZCxV4?=
 =?us-ascii?Q?zYeG58ibQxF4I/INue2QGFc/LEoDT2cQSqZCTdwbOclFGDKlgzILx69XZvNV?=
 =?us-ascii?Q?pEpTsUPbPrGNOlzdh6SG4PGssz7Hh6ej1AZPtWosck8k1PYRf9X0sghsmh0y?=
 =?us-ascii?Q?sgRbllFny2C0YMupQ9SIImPtIVVSXUj3jEkefRQfAR0ZYPjclREIguDI2pXm?=
 =?us-ascii?Q?T4wXHknLXO32oa8HyXUK10jXichxgDsLNT8cs1APTRBDhoxaelLWEi8um/xI?=
 =?us-ascii?Q?bIt8hdjsK2XTb2PbjcJfML+vWlIYrHXpX8U40Di8ToE7kJaapcvnbRje8+N6?=
 =?us-ascii?Q?E3WFwpQ6vZvakdAhqHkwHGv+cf/srBbJZ+sms4uH1pdvv7HTEm7ShSReHPJM?=
 =?us-ascii?Q?UVayp6+Dj6PRRDJRmfERGNnVlxztwO77MV+oy9vXCUxD3XicabzDBg3GNjQF?=
 =?us-ascii?Q?MGimzZ8RfiXcKYQ6FLffULhXi9HrnBtk7RE+bNRtB3Ym4auYRSz+JuoUYBUT?=
 =?us-ascii?Q?LFGlR+oGTUJwEJrtsiWCE1mopfCz9dBXvfLEH5zd2TZyaXJuW64wdvQ6yPLN?=
 =?us-ascii?Q?MlHtqgVuXkCcpLHms4l7tfo9r9HuKy+XWp2Cg/8eqiP+Kb0s2XQWZZ31diHl?=
 =?us-ascii?Q?PmNrOmeRp+WG4ZN+30j1k/Y/2u+WW6ygIwMjPgTVRivxF6mUm/chGu7yDo1n?=
 =?us-ascii?Q?89fSnUlFi4FEmQ4OZSfQgElJNlHLXuzr0apFDWvFCRqI2UUFEjo6iT0bH7jq?=
 =?us-ascii?Q?xRMOY0wLZYihuhFrzI9+3xwrj81wrYgdfkxjGBcPDxFwyBaw99U67WuDKbij?=
 =?us-ascii?Q?ZQWK7IX5GtRVhZgJND0jsmbCEI1zqRKBMiSEeDVJc6Ble9cjzPgEIGMtQvSr?=
 =?us-ascii?Q?+YhvLVSEqrnGDXFS1fGUK5kioSU6t09ZQztz48NFyYL2fcWXoq+u6sQknvFi?=
 =?us-ascii?Q?kYbJzXOrmNbQEXVQPehhUhCnJ8lBTDFH5YisuaJbnuGbrcdhQ1MVoJLhU4nd?=
 =?us-ascii?Q?/HZNOT9sfU/ZMsjHj+dAXKnHHWcEnoswi2uzc6FF9eVYxHjHe12Dmoj0uaux?=
 =?us-ascii?Q?dkG5Vh0VdLgVSYX+LSa9up6ULkcgElZmilY2c0QXE2ysf8JZ76NbVSGqMRu7?=
 =?us-ascii?Q?SniRu0oA7M+/demtT2v4OJ6+qdUNg078iKI18i8Lh4PEbzdymlKXvhcKNr2S?=
 =?us-ascii?Q?oG9Fgt3tZGQ2d778Ve1AzrZbGflHNmI3Q7K4NlTJ6nhtJ/sNuFudm0M9ceEW?=
 =?us-ascii?Q?LPbAqZWe3RpdtMUTpCxN2qy7S5PFBINp3GH+NbjoZPhv9d4Ws+Uxut5B9obk?=
 =?us-ascii?Q?Sj2YJL6flR9jpx0NOmxu1dvw3+P5cKOytWLpquwmbGP4kC1u1YxiAHcgMHL8?=
 =?us-ascii?Q?2eBMAl/OmHFzsCUOG0G1kEjtEZI5lWeRNUsJ/6XmT7TbBgV2bUz9KlUvGDHT?=
 =?us-ascii?Q?bp3NP/VVODSU7j3u7pQNFSs4FgRRLQBhCf5ij2zmHSzKDUAh0917x+XVLzC7?=
 =?us-ascii?Q?qRinGQezt4ffQdK2H6h5I+81AMQKtuSw6aJH6V6QYsyw28NphDua91CU9GGE?=
 =?us-ascii?Q?7ffZYPz3CIXHx1RDHkG/9sPJeg+0TmKyELpLFTGFWf34ZhtCY7Fv/4EWCHz9?=
 =?us-ascii?Q?lBMKZ0seBYqVzya1vF/Me/l/Q1zUVM1B3YXgL7XmgfhzR8vtDAZZdUew88sN?=
 =?us-ascii?Q?ekpnaA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500d6826-6c95-4ebb-530c-08d9c5648c87
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 16:03:09.8621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqBl96R3pFUmO7H6I+U/nXCOp2L9JLKWfsJJrBrXpPIZJ6z/YuR1pLZdIjHZ1XRR/d9qnZB9AfwzdYGBOc1ptfmYoU8oqgIiceXk1PZiPR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
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

Hi all!

v2:

1. Let's start with minimal functionality: replace only one specific
child.

2. Explicit type of parent: qdev / export / driver

Hmm, 'driver' is for BlockDriverState.. Any better idea? I don't want to
call it "node" or even "block-node", as finally, devices and exports are
kind of nodes too in the whole block graph..

3. I think it's better to start with x- prefix

Plans for v3:

- add tests of filter insertion and removing
- add qmp transaction support

Vladimir Sementsov-Ogievskiy (4):
  block-backend: blk_root(): drop const specifier on return type
  block/export: add blk_by_export_id()
  block: make bdrv_find_child() function public
  qapi: add blockdev-replace command

 qapi/block.json                | 61 ++++++++++++++++++++++++++++++++++
 include/block/block_int.h      |  1 +
 include/sysemu/block-backend.h |  3 +-
 block.c                        | 13 ++++++++
 block/block-backend.c          |  2 +-
 block/export/export.c          | 18 ++++++++++
 block/qapi-sysemu.c            | 56 +++++++++++++++++++++++++++++++
 blockdev.c                     | 14 --------
 8 files changed, 152 insertions(+), 16 deletions(-)

-- 
2.31.1


