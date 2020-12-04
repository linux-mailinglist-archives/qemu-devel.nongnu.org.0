Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1082CF699
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:10:53 +0100 (CET)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJHw-0004uZ-AB
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFX-0003Gf-VK; Fri, 04 Dec 2020 17:08:24 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFS-00024O-9W; Fri, 04 Dec 2020 17:08:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAGhO8G1ItRgZ5l/L/5rGqyI/+53BQNr3i5/tFsyuXaRTLYNAdx3u+GBz7RBZhcVUpeYQsrnSFlLxUooUvz9yLHnQDa9iM6OnvzE5zjtIHRlL6A3OoqR6K5s0mNnKOF9O/gLlMUfCOfZUhxhhW9f0CrA6P5Zf63eEcK226FU1wV88Py4HsYJjekYTVqAECa8yS/UX+6b/hrbCQIF9QYhTuOK6tv5+142/uf61faBYBeGgNSvFf7na0FlNuqrU79ht4yevNZdY3lPz3bEaY7zhovGNa9I00j4PCthw3zGHUdbhYsUTY3KwrxppxjTk0ZZXr+2BjXWLdY6yniTeihh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABKrXBe0nNkYBV9Jkgjtv1lHHjM5DBeIlChvBRGnp6Y=;
 b=ND0KlPVwR6sv0UHJZKjTWA8hD0oX35chI2sX0nescuCbsUm52UYQCz8KM30qu5nPggz/zqA3eBzbJ0dta3tCidnqbKLmy8m4w2Eho6rfapl1kd5YWd+CM8iaFTYdhlizYZd8CtdJvrjH2p2/E1pNO9pAGjwDKbE2TJon8sMUGxO0ivGkjY+Gm+0LVq89iQy7APdQVPx5uVgp1w03LWUqDQCu+SNBN9lSJ9i1rme9eAg6COZGrZ6A34EQG8cC6l4Nm01sSj2Yhs4ssLItD4zXV8OPhPXT6MpGFIQbzrFGAee4nJUOZ7svhHn5CJ7BTmAWNKHlrNwv9Z+xd6LsOZ8nZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABKrXBe0nNkYBV9Jkgjtv1lHHjM5DBeIlChvBRGnp6Y=;
 b=q1bLnz2nQiqeuaX2EGS/HBZD16a8ra4kYmxzr9pp7NZzZnjCubqDwyKbUGtMuKuvOz5jZXXFcpG4rbSqKwrjM82MKNxTX+fYJHcMgF3alfOx1aioOX69QDj4QW3qlPqSEPtAsWyc0AagYLsY0dMb9BnIVljnkoFEv/jX/GCguKU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 00/13] Apply COR-filter to the block-stream permanently
Date: Sat,  5 Dec 2020 01:07:45 +0300
Message-Id: <20201204220758.2879-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4e9262-6a05-4f8b-1c68-08d898a11804
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072AF8F825F679F234EF3B7C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zC0ByXxckLOjIu7HyjywUhPJQHRWIbQURw3fBTbdAKpjau5h3ATjGbmC5M2+ACtsUKLrEK1sLf0rm2jErUQX3ngvswe4VLBcu7wNkcCQEauyfRJ+LrBXWqgENKLKWHsOMd75Pee/kZE6/SguChYrz7+XLGEpU1WP/VbZ4V2Htdn8h1v3NFzvbdeNlI2U4DbfXxdqRcvzx/buxeDyXlHOSew8vmzVR9lLFgJYyLnR1HRBGKe1WdxdJ3zputyNVS5Kgqs2qHysglZaJ+sUOXMbkrM8hYKohD+Tdf5CmwBmAw4nHj/BKDWAIxzys0k0LTlEQb2S88EwhzvfbjCX/yjNTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aWosuB/6Ddr3JId74+uACyhFcS+OyDIDRv4wfP4vScI5sh1ghMpLV1j18dH7?=
 =?us-ascii?Q?6c9yBdDb/npPnZ5z/wm9RGQ7Q/q2R3b3wlW36nKoaaYrngKSY1gfRxQicvOP?=
 =?us-ascii?Q?ZdqP5Of2M1bVD9EhLIaRWNW2hl/mGJ90XIVx17PId3ShTscDectZbMb3NvOX?=
 =?us-ascii?Q?9NRBxVxxrbQ/4zs18hI83yyvQBENR+TinzbhPwyYDgGT1yp9cIdvaEYpzcmW?=
 =?us-ascii?Q?weYuVcBHCQnLvJZxUfMRKxbz8vnCKnCtLAR2bkbeXVHxooOHe/rE+kNMgaiF?=
 =?us-ascii?Q?J9Y7X7MXt7RQdO6ciUxm/OsquwMwNcQJxPLMPqrwKtjugq+SN5YS6/+RAvFy?=
 =?us-ascii?Q?fKHD2DcQ8eX6r39Yx0z5eAidxDP3KmWQwkPeFUn+P0/Eaue3XGgL3ATCYqhC?=
 =?us-ascii?Q?Q+1S6vQRLwmOQehzsyxOsmrBm3f7YnORquWlQE3YNGZWZ4r9EC5Mtaq5gRRi?=
 =?us-ascii?Q?Fl6ZHwjfIvuVzPlMFzaHdHf/nFb5FZvuXAB5dHfduCd+Kyz5IyfNQqpZTKpT?=
 =?us-ascii?Q?/6+JjtS5K13ZK6YI+ZxYawaQcYk9/uzqvNPUjFhDCqEkrINluPzPFatySZjv?=
 =?us-ascii?Q?3rqX8KUvxSH0qg5FocQFhJ1VzqJFGq5aHhFzlArwB9IpGSYDCkGyW5P4/acZ?=
 =?us-ascii?Q?ej3H3JgB8hknjRUtA39eEtnXd18ghk4gTCsjO3PqKj0BdjOzmeE/cmolpGWS?=
 =?us-ascii?Q?sHFfT1qx9OPFInu7MUUlIOWt9sdS++qqEPp4mJ0Xyyfs0NlPqk5VPveRCoXP?=
 =?us-ascii?Q?KQgeaDjQRwx9phWtFBHsqg6aGe3qizlgYHbQ/JXsI0LiT/VE9BlvEwVTgHrO?=
 =?us-ascii?Q?bHsLH6m3RVGAQP1wlep+1wmjaI9ILv0geeD2RG0EX1kSk49PTvqAnfMHOmjR?=
 =?us-ascii?Q?eJ8m7KrUqArUv5pDSmMCj1jCs1B830DYmV8FkYjPQ+rVQTyBQQB4AnRYptDN?=
 =?us-ascii?Q?ehEn+Hy3cII3YeFH8R9FEV38Wvh+1/TU5kquGVHUpI0are83zPblyairnILb?=
 =?us-ascii?Q?aKoJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4e9262-6a05-4f8b-1c68-08d898a11804
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:13.4706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNvsGY52Wz6z12sXSWixa6zzO1VaIT0paOOR7RGJJ/gvcyapnzYSiLqsz1JXk0Cb+qtvMYW4DVVMePFs0LttvhpLpTszczZDaKyCQKpIHxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

I decided to post v14 myself, to show how to keep the test with parallel
stream jobs.

So, main addition in v14 is "bottom" argument for stream job. Next week
I'll send a follow-up with deprecation for old "base" API.

Also, I already finished my work on updating permissions, so that we
don't need ".active"-like things to add/drop filters, still, as v14 is
a lot bigger than v2, and I believe this this v14 is closer to be
merged, so I'd better resend my
  "[PATCH v2 00/36] block: update graph permissions update", basing on
this v14 (and reworking filter drop/remove).

05: fix bdrv_is_allocated_above() usage
09: merge change from further commit which uses unfiltered_bs for bdrv_find_backing_image
10: new
11: new
12: new, splitted from last commit to simplify it a bit
13: - pass bottom option to filter always (who know, may be base will appear during the job)
    - keep test test_stream_parallel in 30 iotest
    - rework changes in 245 iotest

Andrey Shinkevich (10):
  copy-on-read: support preadv/pwritev_part functions
  block: add API function to insert a node
  copy-on-read: add filter drop function
  qapi: add filter-node-name to block-stream
  qapi: create BlockdevOptionsCor structure for COR driver
  iotests: add #310 to test bottom node in COR driver
  block: include supported_read_flags into BDS structure
  copy-on-read: skip non-guest reads if no copy needed
  stream: skip filters when writing backing file name to QCOW2 header
  block: apply COR-filter to block-stream jobs

Vladimir Sementsov-Ogievskiy (3):
  qapi: block-stream: add "bottom" argument
  iotests: 30: prepare to COR filter insertion by stream job
  block/stream: add s->target_bs

 qapi/block-core.json           |  35 ++++++-
 block/copy-on-read.h           |  32 +++++++
 include/block/block.h          |  10 +-
 include/block/block_int.h      |  12 ++-
 block.c                        |  25 +++++
 block/copy-on-read.c           | 143 ++++++++++++++++++++++++---
 block/io.c                     |  12 ++-
 block/monitor/block-hmp-cmds.c |   7 +-
 block/stream.c                 | 170 +++++++++++++++++++++++----------
 blockdev.c                     |  71 ++++++++++----
 tests/qemu-iotests/030         |  12 ++-
 tests/qemu-iotests/141.out     |   2 +-
 tests/qemu-iotests/245         |  20 ++--
 tests/qemu-iotests/310         | 114 ++++++++++++++++++++++
 tests/qemu-iotests/310.out     |  15 +++
 tests/qemu-iotests/group       |   1 +
 16 files changed, 574 insertions(+), 107 deletions(-)
 create mode 100644 block/copy-on-read.h
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

-- 
2.21.3


