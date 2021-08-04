Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BF3E01D1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:20:25 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGop-0004mV-Nh
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmg-00020J-KI; Wed, 04 Aug 2021 09:18:10 -0400
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:60758 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGme-0005Qa-7R; Wed, 04 Aug 2021 09:18:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObNM8VgSt2aaZe1sX2dJGm9j8Jsm0aJEQle46OCueLLwfBJ+BOvpp7BMkVcwfo9TUVKwV6PhlioSDr4QATjUFtxlKv7z21YXeN1Vn8oElynu80LwF6fm9/8S+bA0wf5QklfOuWgjRPHWtPvr7U/uBpY603oMtTG2tXZNs9PaViCCHTIxqwPUut7z5mO9jDYj7tnTzuJp+C+KmGDxcxjKoQKVd9OT8lyDVEjaBM8fwtBkMVPDDHPLU0LsZgubYAJhkGsQ46FRIa4j9IuRAfcn3CpzbQnOiUmfVbSgA06GEWLIrZNcDPfn+BIwO13xYZHJz2VJSqKvmqe7q0zMvM88ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUeLQxb4JERNMwXCw+dgp3RHQ587OtAmyveb8IHXvNY=;
 b=PYjTtF1CbrAoKHfbXmWPRiAsfW8KM6ttO4LkiE0GndfC281ZN6cJ2M+P0cYslpM94I8sRTbsbz7iRJvNOF4XLkyFLqs2pOU6cN5O9V0Sq2UDs3R7SxlgFrfOXwLsFWzr4BgJvnKy2gytSALBoYfLOuXJsjXjGS+bw8IZNecVUSPECYAq+LjJX8C+iiZGeK17NIRQ/Ay89YujSkRR45K8LIM+8xwawmTnQOZBI+UEjoonwvSQbBPXVvZqFnRQtfibUIwc0uyIocQHk+SRP/LpXkbEAkBVCPsik06eWVjpL6sO+bsOXZ+i5azDJ/IxwV+AwOuqK21tUJd4XubmWQtZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUeLQxb4JERNMwXCw+dgp3RHQ587OtAmyveb8IHXvNY=;
 b=W2kWw9WhudSihUIjUgKAIVuQYLVOcvY/w5cTzWra4OjNF8gFFryfoJc6qcZhlMkJCLs7Jv4E1vsEiWQ/0Z6LaD70cIcHtKJRYrm0uU6hE4Tws1ahdGAh5SQ6NTX84HpP11TTY5IcHOhFNB0sug5QsSgqgD9z/H1SqBrEbkuQbdE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 13:18:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH RFC DRAFT 00/11] Make image fleecing more usable
Date: Wed,  4 Aug 2021 16:17:39 +0300
Message-Id: <20210804131750.127574-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29150540-ae8b-461f-fd46-08d9574a4a8d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2034FE7194697BEE47473FAFC1F19@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmXTuR+wkFKdezhoLVGnJCq+yF7ENMTJ6C+i+jRAWql1DZb8+6rKEBPLOgEa933dM+cyqmSVdXGfL5vLpJzgRf/m6KYQaXITwaBmp4qEW7UP10M65WPyi3YJQVVZ1jWaMCDmmRsSDrjxPVAfq+715FKHohCM9+9/5YkqPDVwQtaqHtB13OrMD37yaqMJRqX8elGjwqk4dwSfNgm14i9+/rA19FM91Skb6Ncj9Cp80nK/63wgXRIq6KPLsuN74wqGWWbg11nUgoyCIf1OndVQNrdvusrG3IZH7nauKXChdCBPI37A4sLHEipHq5iEbdv+tvQo+Ug0wCn61vmwObiMI2D73AkbumsvH7lEq6gTPoxLslu/8Ph7jRCXjOXcvxVOWvC5IMVAaVjeaKUqDAfe4Sjipe+GZYDsqqJbwRSxJj/aufpEYLKD4rMAWMsiIJxECdMyToFOXDQMuwTiBcI0mEezJq37ZxeBcbCOUwVhisTcrgjyGGmDd1ud8VuMWGQ7E4Lf0rgVBKqnpRE5EuNDdU2dNrjPhw5PstnKvcbVwa8PejNb1EE2hWrftqKTxSoyZzWbP37p124wLUSRWV3kSPYGec4LYinduphtcdhDdVoZkt9NiHnu+KqjLn8lTOhMeod4Ap7m6LbIfh4VIb3KhH034y0nhPjkWvxHdQtM8Lr2udPiYK63+be6s9LQm/6IEMoaRP/90lBkzKkqhaXiQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39830400003)(366004)(136003)(346002)(5660300002)(6666004)(6512007)(478600001)(83380400001)(1076003)(4326008)(66946007)(66556008)(66476007)(6506007)(36756003)(38100700002)(186003)(956004)(2906002)(2616005)(38350700002)(316002)(6916009)(8676002)(52116002)(26005)(86362001)(6486002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QMyXdB9Z4cU3G6gyw4JSSAbS/60KQgmyY+w7A25itptPbPCOZdH0F7qGQSTH?=
 =?us-ascii?Q?Lf+CG4AZZayG4IajzvM4ay3G02AW3jRJi6WsULAdgNWKq4SS7fEBynIaWTvY?=
 =?us-ascii?Q?gfHYzSR5ypkTLaNUh/tmmgjRDdVdhWScY+BwM4AAoiIfoXiX4I58EcYV/0HO?=
 =?us-ascii?Q?kBjCLWnlhznlqW7o8je+aVjrY7MVhrdnstZd6c9L+yoxkdKLRqkfZTqKwn93?=
 =?us-ascii?Q?KNKZzoEAzWjxANCXVUHFHwmCwkRxYzJNWWpdhZYWpod4+b25E2foET83I48q?=
 =?us-ascii?Q?H0ZRrZqN1wYzJ+tQRijRED3oXq0D82foBOZvgk5GczOHOpmrcuB+krAfrIhr?=
 =?us-ascii?Q?u9T2KULTmjYoXbQM5qMCNAWIv3K3BLuWSJuVSHokAUtoEKkq6Bi1Q69LCNHs?=
 =?us-ascii?Q?WDyDdBEAnJme8aX7yRU1h1YFueUZhKOQHqmB6fIiaZBeYgFgkhSCxnWM/piQ?=
 =?us-ascii?Q?27AUc7U8ZSldSFA9Ja5QdOrYywCZe+PBCpxJRKRCymBEjhZQYhuHPeQpmCzj?=
 =?us-ascii?Q?FensoKtbTOAcc43TygIW8ihhyFtOqqnMYBCpugx6vGx4z1/FwJ0Sz09F/Z+u?=
 =?us-ascii?Q?2IrB9CoRDn0fkm2PW9fPX9GCkR6bXRFNQDnaXEJXX+XHUg8ZiMgdXq9bNR5u?=
 =?us-ascii?Q?UYKNp+DMrdA75bGNRhcv7JixHuOjbG/8jpYQqDYShllqVDTAQQbETmiQT4Pt?=
 =?us-ascii?Q?Kh0upwcK7U9KOMMFBpvq64XQwv0IPuxzY2ZfV3P2/eurpwKJasj+zYuYF0pq?=
 =?us-ascii?Q?ss1c11rwit2kNoGGiw0dAG8KAjabrWrf9FANV6t29OPixn65JyxbrRgmxQ7/?=
 =?us-ascii?Q?EMyLNNXFqCZ/p2irP33QRwerj8f0mRuTjL7XWr5v2SjaafBz9D/fo+BA7o66?=
 =?us-ascii?Q?Z6S802p9LqnLQNWkm8qKtHyIFaVPSETa4r8nuD53i6d0imVrbcy3/QJkzw5W?=
 =?us-ascii?Q?F8iG0LN9j2ouOR7QSnAdrmMHB6sYccijlfZ2lUzDWsiInTACDkXe5hbMwNNT?=
 =?us-ascii?Q?VhYfrZYQs6rzAch+JFFaIzgzDxaS3TeO0d08SBVxDD7tUMFGz1QQWeGj4NZs?=
 =?us-ascii?Q?oK0YN2ZAv8N4u3EJJJvRJVjk51I/aN60gVWufJ0VVilV0wW5lG4+ZV8ETikr?=
 =?us-ascii?Q?4kpOEwRt5WTN1oHCu/9iBS8fSBRNNptgT6+IlGebl+y7YP6Te+pm/f5Bjt28?=
 =?us-ascii?Q?VLzE/8qGNSRBIZTA4uBgeR+TajAFJ7wwVrY4wXpn7ooe1z1jayKdcoJI/T9V?=
 =?us-ascii?Q?G4oROy+6FYBnmkbrK97/i+lLBbnydpqkdEaaJYghPegdpgpivsMe2N3kU31M?=
 =?us-ascii?Q?8AsU5AjgScGNq7DM0msz3+Wd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29150540-ae8b-461f-fd46-08d9574a4a8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:04.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcsFbDPK9tEsr05BgPGmpCp4X3YZUa7+izODHJzJtg924wF2fRjovVl89TcCNOypW2OW4AiNtaVPK8nVHVkUDaPIu6FRvnfM2aZEfYQNrQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.3.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

That's an untested draft. I'll be on vocation 05-22, so no reason for
this just lay in my hard drive. Any comments are welcome (mostly about
general design), but don't waste time on careful reviewing.

What this series brings to image-fleecing:

1. support for bitmap (patch 04). So, we can do incremental external
backups and not do extra copy-before-write operations for non-dirty
regions.

2. fleecing block driver - see lat patch for details and list of
benefits.

Based-on: <20210804093813.20688-1-vsementsov@virtuozzo.com>
  ([PATCH v7 00/33] block: publish backup-top filter)

Vladimir Sementsov-Ogievskiy (11):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block/copy-before-write: add cbw_snapshot_read_{lock,unlock}()
  block/copy-before-write: add cbw_snapshot_discard()
  block: introduce fleecing block driver

 qapi/block-core.json            |  10 +-
 block/copy-before-write.h       |   6 ++
 include/block/block-copy.h      |   3 +-
 include/block/dirty-bitmap.h    |   4 +-
 include/block/reqlist.h         |  47 ++++++++
 include/qemu/hbitmap.h          |  11 ++
 block/block-copy.c              | 152 +++++++++++---------------
 block/copy-before-write.c       | 143 ++++++++++++++++++++++++-
 block/dirty-bitmap.c            |  14 ++-
 block/fleecing.c                | 183 ++++++++++++++++++++++++++++++++
 block/monitor/bitmap-qmp-cmds.c |   5 +-
 block/reqlist.c                 | 100 +++++++++++++++++
 util/hbitmap.c                  |  36 +++++++
 block/meson.build               |   2 +
 14 files changed, 613 insertions(+), 103 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/fleecing.c
 create mode 100644 block/reqlist.c

-- 
2.29.2


