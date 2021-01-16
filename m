Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB532F8FA5
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:13:49 +0100 (CET)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tpM-0005L1-Np
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV4-0004MN-9y; Sat, 16 Jan 2021 16:52:51 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV1-0000WU-P7; Sat, 16 Jan 2021 16:52:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntF0xaDU2OYcA8LA5uixvgby5ugsIPP8HbJmNRjvvtHOp0fYw1owkz6uRnQySbZs9RHajZze885tfjNa/mJpffnX95VJ0uRbkfV3fKFvt3dJwX+G1yX+g4dCUUPGl21kwa7T4iIcF0zByg/RtYi9QXBXJUo0HatizbG6dyStNspjuAAnaJyMQTjDD7fhQ9GVjIPt2ycSue2cQ92DFSK/5jLhqX5pJfSo4LAwYc9Hoykp+v4EFsVZPreVroYwrQw2EXAROSYebPF3dVcss7Bnhl/Cawimk+i8Mux5FJxABtk35TjUxAARgEM0USE67sbcVF1bjXwvFhjIeJVP8Im51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FixNTMXoLrl8duMbnudOhc19Pym60DNV3S4T76bhQo=;
 b=aeYNpYfD9pGBm8+gIiGThpnKiOAov5ydZ+JzdoxGVDsdxCvuJHl/qAEhr0Wmd2HCtld4gTyxvSklexvmPLor5ds9jAh8GdYhfRmSu3RL9L+8nfjN9heQXYfkWoSKQBS6qQmiK+rWffz20BeV/9YCDXeXxityf3GPBCimb1e+j1rIi+Hy93Vjh5DQ+4kTgWehwOK/2Uu44LJXbEpVrRLGaYdZMrV+UiD1owQpH3BPhpbOWjI8CzCSIXv5op6j78VkFWvmJK5Ynr1iuoCjiL/9iDv3TwR04+cspZjS2etI+wfmDY+NlisyKjPzz6+YZnC9/Rj3BmT9+xX+s0LoYLOcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FixNTMXoLrl8duMbnudOhc19Pym60DNV3S4T76bhQo=;
 b=VXoDMkCU16hzvIJqfRvZvjcQMcoXCxebHFYLC/hgKUyMTBKrHCocOjiV52VJ3tFEzw2ySHuDwERPnVgylya96dAckdoVgGZSkLL1KDxQNn2SHN7aZNYdWh5aODpRAdSZq2VbQFH03c+cziCN0pFeysjvvtQ8MgpJAuFkTbcvoc4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 00/14] block: deal with errp: part I
Date: Sun, 17 Jan 2021 00:51:55 +0300
Message-Id: <20210116215209.823266-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 398d19e4-5222-4241-a54d-08d8ba690e23
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542F87D491DD35322C55D8EC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fIu3wXQM0SwU2upf48tRsD9CdOT67mWdcts+Be/EIg4yOolYOx59QBNRjLF58WfjPBWl73+V9uSebwQRxZBjmnU5qFmUO0PVZTsxV7SJO5NHNTJN5uCiCEJaC5notkVxmAqH/NPdozeRyz+xO8Majb44TGkKiz3KWr22I9RKdiSYwCGGN3jzCwoiMEc2EOs8VhcFfBj5vSIgItiuB/oOQJ0UbiOdMlwf0CtGY5WwktNn1gE9hAwErOjZRhD5ygWFKcMMd7K9e97CjdsNJjpuvKbe5+lTpIVKBaYDak3lR+M7OQAyO085AaE1iyFfQxOJae+tQ4bpBSfj10J/SMj/lGJOYQDCmL3aoD7Mgj3Zohu2HsFVZqVs2Sk3ZEq4cHiy85+Xbllp/dhOEzGfcQfHvCQkupkQ6+maIZupvBw0bLWnHzXyjetiOi617oonGgImlBeXNTGbC1YTaXgCaGlq3JjAUzmsswugT1ZniVnEKX3C38NydN6XRmZSX9lBcKefoQv9/yFE/87cTdFBxpOTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3+uV6HDj+SLIxIQZ/8yk5CY/yr0oK6QQ0w7m6UvmLx0BTdHLV8TKnTvVPOg+?=
 =?us-ascii?Q?Lvp60kadTwKEHDDesLN+nd90P7pWmtYYn2IDb/wBdlF/w1tegVIkZchbKK2P?=
 =?us-ascii?Q?xEWIo/iXTYrCTMDHAWI1lgaJwYVZjyQaH938QiP6muf1GOuNCcEUJYelYyVj?=
 =?us-ascii?Q?mg123CwNUbtboyn5wzRI1g/qXVe6Dbs6tndIJsii/UMmqnk118/mR6vkhvkJ?=
 =?us-ascii?Q?n/uqB6GFeCfqYhXaS4NCcKGlmMYtjizCdJHE6qNpDXHJyoOwjMK93z9UaO10?=
 =?us-ascii?Q?99lrQrFuwDKcke13PfC6sf6I/IFnqrgVqVKJTe5shAEDoJYqjylFoMuo73nC?=
 =?us-ascii?Q?qNk1iANYl6Do11bHTFtI3KexovzfX6stdC61e+Yg7DFP0zxiblK8vvJ1kEtv?=
 =?us-ascii?Q?smfW/I31T3lmwbZ73bYqRySbRXxHn/pL5g2051shUd5iaUUI5AFQcu364jlU?=
 =?us-ascii?Q?30fmE4ILWYamlRS9bsOPzQCjaEogLhFbv/TczFm8bfxtFEpIdppCHOkdXomh?=
 =?us-ascii?Q?tXXoU4Lfn8mUH/xUZYbGrooaE2qrOm3pNEApEz1HKYHf4ZBX9Z7Lnrk86ClR?=
 =?us-ascii?Q?wphlQqrGGOhA7Mc3lZV50oGN50rY9v7qFH0WO8ZyoIwrdCejOd84h3s3yime?=
 =?us-ascii?Q?h8vXCfX31hk7jw1YghIfh7b82O9NE0skGhJj9h1MPkIEkJvWwDL2LmlHkFNe?=
 =?us-ascii?Q?nXU35LfnzljWT4PREDRlOdGY5S75akIVX/+e7vZGI1L64BmKxINBRPkosb27?=
 =?us-ascii?Q?POQVbM7/7uWsiNWJLIG7E9fbQjWJJbj4eIiaPpeFZlq/Hoyevbec/T4w6hIr?=
 =?us-ascii?Q?n430jZsuwAsLbWIymCUHpRyu+FsO/0+ytKewrX080jAReQ8UBi3n1X8RP6uv?=
 =?us-ascii?Q?xNXJyaEQSfhgjNSP5pkA37PxbgNOJGbf8k7xqD4VakrFjaB1Dj3L9dmME8Aq?=
 =?us-ascii?Q?FXWNdtIP4a1oE/Ii6tRo4yYOYTCqRVOydvRFBLGltTji6DfsoeUJ3NB/6pd6?=
 =?us-ascii?Q?RBC9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398d19e4-5222-4241-a54d-08d8ba690e23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:44.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bpTCkoOo/r4supJZMR1C2/mu339EV0Vj5CYvX+A80EdaJ9BdMvROxrAdBQkIfgLCjvQcZ0HeVjF+9ctRt9PzgfkZ9ZztkKTBvGewhxapy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v6:
01: fix uninitialized ret
02,14: add Alberto's r-b

Vladimir Sementsov-Ogievskiy (14):
  block: return status from bdrv_append and friends
  block: use return status of bdrv_append()
  block: check return value of bdrv_open_child and drop error
    propagation
  blockdev: fix drive_backup_prepare() missed error
  block: drop extra error propagation for bdrv_set_backing_hd
  block/mirror: drop extra error propagation in commit_active_start()
  blockjob: return status from block_job_set_speed()
  block/qcow2: qcow2_get_specific_info(): drop error propagation
  block/qcow2-bitmap: improve qcow2_load_dirty_bitmaps() interface
  block/qcow2-bitmap: return status from
    qcow2_store_persistent_dirty_bitmaps
  block/qcow2: read_cache_sizes: return status value
  block/qcow2: simplify qcow2_co_invalidate_cache()
  block/qed: bdrv_qed_do_open: deal with errp
  block/qcow2: refactor qcow2_update_options_prepare error paths

 block/qcow2.h               |  9 ++---
 include/block/block.h       | 12 +++----
 include/block/blockjob.h    |  2 +-
 block.c                     | 70 ++++++++++++++++++++++---------------
 block/backup-top.c          | 23 ++++++------
 block/blkdebug.c            |  6 ++--
 block/blklogwrites.c        | 10 +++---
 block/blkreplay.c           |  6 ++--
 block/blkverify.c           | 11 +++---
 block/commit.c              |  6 ++--
 block/mirror.c              | 18 ++++------
 block/qcow2-bitmap.c        | 67 ++++++++++++++++++-----------------
 block/qcow2.c               | 64 +++++++++++++++------------------
 block/qed.c                 | 24 ++++++++-----
 block/quorum.c              |  6 ++--
 blockdev.c                  | 10 +++---
 blockjob.c                  | 18 +++++-----
 tests/test-bdrv-graph-mod.c |  6 ++--
 18 files changed, 180 insertions(+), 188 deletions(-)

-- 
2.29.2


