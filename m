Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8154B91CE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:53:25 +0100 (CET)
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQMe-000741-F5
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:53:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG1-0003ib-Nm; Wed, 16 Feb 2022 14:46:33 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQFy-0006Dk-C0; Wed, 16 Feb 2022 14:46:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDm0mDb5LcRpZrrQHYeipxut2ah8yktJNjZimb5tfA3bUVh9lJy6QDHfHiWuazS1H4XtDYSWb0JsqvX1eDwcJRKhrkCpg8zN11njC0LmJaeqNSzxBGdfwZfhEacuE3Jy5qeVXGmH7G32r2oke9CO0lZ/lDauYRdzQuabAa+J1xTmLmRySOYgt1bG56uK81C583baKTbo5kTXADfeqhEwXGqS9Zdwa8yoyVff1ALHX+5ESLT857T6D1Yo8L5OPcga7aSLhm1fHovhmiQZymRgnvnkrimoAqS4Nkfhau8p1f4ucR3NWnSbtnozxYxUmMICe2zH5gwPkqXDf9Yf/L7nzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDbpLqdKipoyAOrSyiYQyXEt/xW89DmnFmTtSg3EkLg=;
 b=bzZIiCaiZHWb6kWI30NivSD4ZTryC1O6Xootrk2OH5uuE4q7gFR2JVDDh7KI9lPIYfH8G4py8rmVAy/523aTK8qnzGKDFh0aNMCjatZhlUEMq7efD4GB7zOyTgz5LKhK7MrrKYTim+dIcY+esTPMlmru/CWS79SxItq20QJmfTvgYbpeAbLscpzh74cNAdCIBqqd9q3G4ErO3VCLLmrFEZTOq/CKIxJRlsxF6YwIkWywOfBif+ZQg0L4iGa2Yb38qeK1WzfFlnymugrRp7uYqlqgNBgWoh+adCV69g04wP1/4mPRiYr0klCIJ+Uzw6/bl1OC+46CJo5nXFLdXJV7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDbpLqdKipoyAOrSyiYQyXEt/xW89DmnFmTtSg3EkLg=;
 b=BtLkmcUqO55hhwbux/v2KUvxduT19VNVN+GGSY1tRCiGzdB2Q/EmNmhwm3SV8iU52ZuiG6p4gl0JOgPStYbCpj1QhbfsfcOnLEYVSHF0J37W9PdUU9l4GDsGgIqvieUxt9Bw7ISiHsLCaojrJgqgBQwSBkrPOxoIJF0IfwBwvQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:26 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 00/18] Make image fleecing more usable
Date: Wed, 16 Feb 2022 20:45:59 +0100
Message-Id: <20220216194617.126484-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 778b7d7f-23a4-4eb3-391c-08d9f18504e6
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851E083D0628FD92B012A3FC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:96;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JK4E+BbBQgFT2tzh650yPXHsnmHbSt1mN2jEZZGkH5XSRE1+23WIFaj9T52JabovQJMr2PqKgVSDGcnpZUGdh/E0WZUyuBwlBHcpFqpM8NJ0AwDL86TpTKTnH3sE7H3LbwiP2w3cq0GH8CPm4r9dqgNvzeWnH0GbGqkHEPokeimNLLEqQ9joPPe7fVV+DIawFlr668H2fb8NoMYBLehZ27inAxtA+888QMxk/W98OiAOB4eeKAqxgxjBmqzNJuo3iTOV8x0GIDByxOCn70XQbdG8xUIA1aOFGJd/Xd4o5Hk5GSxEUVpF5SYozv8qChGuuod3vagdgUEjZresEqmAwAOss1oDqSnRoh+BU7I3KvBH8BZPE7RXjXEtb9LK3NGI0fWDtl++v90wzLOej0mAm70gbcyelAF1hfHZRA0foIw5BLTMB4rJpmYt8zz0Rjw5jhtU15XfepU83mNSH20dk/GgwOwvkqMK268AzcPSc257dEan3o0w6clzu4ObqZuUHYl1GZe71A72yjZySsxNytViwxdo/xVAYp8KtWqLwFEWnxldYhDhI+9dkkVWal1VANwEBkqib0Vl6xf8TzWU6CNkQsguFYPPFCoeQCuYO6KE+zO9SbRgrc6pYIqhFJbbvMosedMhLOk2x6WPCHflMh4QnxTLXI9DVBjrZRRUhoBqvsuzzD26GIf5ZYd79IuxkkXJQ+RQhE0JlMEimK2agw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+HFSn6KsjYHuFvw3dlEUyt/NQYZrp7H2VCSvV5owt8Mi1t/doTNc6dcHerL?=
 =?us-ascii?Q?DzmAufi7+CWnEiXzJ/tTyyB+07VtJkCh+QyeqL8ESBDcZAQRV7+RG03QfW6n?=
 =?us-ascii?Q?kyrLizhyfho0ASsKr+TVaxq7yHAsXUgAbfPlOJdmIHOb1srB6me1s2CaKXEr?=
 =?us-ascii?Q?Jqx302tmCxcSM5t2gXghQaXRe9dJ7oGN+2TsuNR45nn03jUA3DuzxVXUCgch?=
 =?us-ascii?Q?BXjtKyLYpKTVGeDndz6Q0YGQds+rz8fxbNKvoA5PHOv5Sd0ia2FYnseDFi/w?=
 =?us-ascii?Q?V82GuIvDHRXMION2tJV9d6Cc2dcSW0wO8NyfL9czbD9GrwTtzj9mM5rf6eYd?=
 =?us-ascii?Q?AhTAx4VOhYSRW2GQ5CfcdCJ/ie0ArLpJVSV3MELSq0lcCNBONDvfkYwG7dTI?=
 =?us-ascii?Q?rCj9PQ33DvaSAmxGmH1KOx5lMPBfhe9VupJgQmdY1n2E5A5Uh8gCHLMj4bQZ?=
 =?us-ascii?Q?oLwdmUQbiqPGo8LsdkwU/cyLCgOJJcny8K68xrckLE+GAke1xUFgYLJFCA4U?=
 =?us-ascii?Q?EuU2HI6B+7e6yVA4DaV08sQwSVL/OjpsJTUWTTN+UrDy8+Oo5Pfsta6IdFWL?=
 =?us-ascii?Q?f3ZldVBtWrTywlSMXfQ8CaCc00Pt/azE/fXcaWr6Vtex2OrVl8j48LY8VoH0?=
 =?us-ascii?Q?6H4Kbektn/9xpEZYWpjxEXusU8CNiqS5RreF+/fwgZsh9hHmRMwwFoywz4g0?=
 =?us-ascii?Q?R1wS8aYxV0DU4zzyMV7gGJdj+eqFStcA+c4S2lAor2DMkZ8Dror91cPikpMe?=
 =?us-ascii?Q?g9/HLoWQTv/RTpyEvQUA0IVGsJxN2QLsEkCW8bwEIKKBrEAHeTYwCZacaXMp?=
 =?us-ascii?Q?OoMdxGM0aBaOOJmxhUbAONlpXbvzLcLYvgsn1qIZ6n1SxBjIyFm4pZ98ziiX?=
 =?us-ascii?Q?IU2zCzGx5xr8NR2Y94KTXeY4Q/8y4QgaTFYEgllon7QUr8fnBRySY7ITVvCI?=
 =?us-ascii?Q?tl+DE4YllHwiVAXwuD2SOFMYUbTm6oAiaeBoNS3XU2RGeUEGpBkr87SpeAAi?=
 =?us-ascii?Q?qLzHJRWQnh4M9bM+HIe1VFd4F4pSBf90qfprkX2rhuIhHWxmFgcEF4ywVadG?=
 =?us-ascii?Q?6TFzXpr/MD7Hhrw4mRL3IoNDywB+SJv0a4/bJum9QIGb+gJ6JXUlhFu0Losb?=
 =?us-ascii?Q?zIDzI5+GzBBWg+lZbDmWwWxHX0maZvDizGOq2KUoJXwdg/qqvp3fdkZ8TOc7?=
 =?us-ascii?Q?je39GOgTQPr+nClY/UEddbSaA5/Y1h9eGkZ+Y4mzullY9hvwVmjCIj2KFyNG?=
 =?us-ascii?Q?gdiR+CdP7wbZGRPBtvNbPUrLyXC/BKoNe8txwVXKFHS7ji4RFE935QAgHDOD?=
 =?us-ascii?Q?D37a3ikofQJU4hJDAIRF5EPG6RDbRmpNTOB8yFlSuo14N8qtDBcYar45R42q?=
 =?us-ascii?Q?2qfpv4+CaFc1ouoM5oFc7sr6KfDiw3BMkSS3z7YrLHhebFp/d86/IlOuzKoj?=
 =?us-ascii?Q?zgQzNq7zgGEk6tCV819oCGEOxW3WooqFuBYO0hci3M6ffyj0LaWLCMSxpLF+?=
 =?us-ascii?Q?5vSlR/WeiqP8lgMdLU+UP76pbsDoAmB4m8Yas+QarLYVVBPoLoBc/oFRfDxH?=
 =?us-ascii?Q?37Sjzu5kRYEIHFD6vGjLaS/FSRxetGwcTxFj55qXZ165yy2Uw0XI4vSza3b+?=
 =?us-ascii?Q?MrXvs7AqlCb5P7XpGqZynhLHRhpa/rwi4J4okfR1I618/Sy/UiChjOAbk3Jx?=
 =?us-ascii?Q?g1ehmg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778b7d7f-23a4-4eb3-391c-08d9f18504e6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:26.6964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UoV9dkboCj5/BSCdTCbe0fyGUXPnT7MmRs3UTvm5L8j9pBzkDU2ereRE5MLKIFjnVkxUkktddi3bLDEef0FdX2RG9He/V96YvEtPrV68vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

v4: Switch to new fleecing scheme, more native for Qemu's block-layer,
    see new patches 10-12 for details.

01,02: add Hanna's r-b
03: add const, add forgotten bdrv_release_dirty_bitmap()
04: rewrite bitmap parameter parsing
05: add Hanna's r-b
06: tiny wording fixes
07: new
08: fix comments, improve interface of new functions
09: fix grammar, add Hanna's and Nikita's r-bs
10-12: new fleecing scheme
tests: updated to use new fleecing scheme

===

These series brings several improvements to fleecing scheme:

1. support bitmap in copy-before-write filter

2. introduce snapshot-access API and filter, to make a new fleecing
   scheme. See "block: copy-before-write: realize snapshot-access API"
   commit message for details.

3. support "push backup with fleecing" scheme, when backup job is a
   client of common fleecing scheme. That helps when writes to final
   backup target are slow and we don't want guest writes hang waiting
   for copy-before-write operations to final target.

Vladimir Sementsov-Ogievskiy (18):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/reqlist: reqlist_find_conflict(): use ranges_overlap()
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block/io: introduce block driver snapshot-access API
  block: introduce snapshot-access filter
  block: copy-before-write: realize snapshot-access API
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  block: blk_root(): return non-const pointer
  qapi: backup: add immutable-source parameter
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  25 +-
 include/block/block-copy.h                  |   2 +
 include/block/block_int.h                   |  28 +++
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  12 +
 include/sysemu/block-backend.h              |   2 +-
 block/backup.c                              |  61 ++++-
 block/block-backend.c                       |   2 +-
 block/block-copy.c                          | 150 +++++------
 block/copy-before-write.c                   | 265 +++++++++++++++++++-
 block/dirty-bitmap.c                        |  15 +-
 block/io.c                                  |  69 +++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/replication.c                         |   2 +-
 block/reqlist.c                             |  85 +++++++
 block/snapshot-access.c                     | 132 ++++++++++
 blockdev.c                                  |   1 +
 util/hbitmap.c                              |  33 +++
 MAINTAINERS                                 |   5 +-
 block/meson.build                           |   2 +
 tests/qemu-iotests/iotests.py               |   4 +
 tests/qemu-iotests/tests/image-fleecing     | 175 ++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 223 +++++++++++++++-
 24 files changed, 1227 insertions(+), 150 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c
 create mode 100644 block/snapshot-access.c

-- 
2.31.1


